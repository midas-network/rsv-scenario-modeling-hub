import os
import io
import requests
from bs4 import BeautifulSoup
from datetime import date
import pandas as pd


def get_table_headers(table):
    table_headers = []
    # the first tr contain the column headers
    # skip the first "column header" because it's blank and for the row ids we are not keeping
    for th in table.find("tr").find_all("th")[1:]:
        table_headers.append(th.text.strip().lower().replace(" ", "_"))
    return table_headers


def get_table_rows(table):
    table_rows = []
    # skip the first tr as that was the column header
    for tr in table.find_all("tr")[1:]:
        # skip the first column in each row as it is a row number
        tds = tr.find_all("td")[1:]
        cells = []
        for td in tds:
            cells.append(td.text.strip())
        table_rows.append(cells)
    return table_rows


def historical_date(df, file_dir, date_colname):
    today = date.today()
    today_str = today.strftime("%Y-%m-%d")
    df[date_colname] = pd.to_datetime(df[date_colname]).dt.strftime("%Y-%m-%d")
    df["as_of"] = today_str

    if os.path.isfile(file_dir):
        df0 = pd.read_csv(file_dir)
        df_ts = set(list(df[date_colname].drop_duplicates())).intersection(
            list(df0[date_colname].drop_duplicates()))
        df0 = df0[~df0[date_colname].isin(df_ts)]
        df_all = pd.concat([df0, df], ignore_index=True)
    else:
        df_all = df
    return df_all


def get_nrevss_data(url_bases, url_ext, locations, location_name=None, folder_path="auxiliary-data/rsv/nrevss/"):

    for u in url_bases:
        headers = []
        rows = []
        filename = ""

        for location in locations:
            if location_name is None:
                loc_name = location
            else:
                loc_name = location_name
            try:
                r = requests.get(u + location + url_ext)
                if r.status_code == 200:

                    # parse the html
                    soup = BeautifulSoup(r.text, 'html.parser')

                    # search for the <table> tags
                    tables = soup.find_all("table")

                    for t in tables:
                        filename = (t.caption.text.strip().replace("for " + loc_name, "").
                                    replace("Insufficient Antigen Data:  ", "").
                                    replace("Insufficient Data:  ", "").lower().
                                    replace(" ", "_").replace("(", "").replace(")", "") + ".csv")
                        headers = get_table_headers(t)
                        state_rows = get_table_rows(t)
                        rows.extend(state_rows)

                else:
                    print("Error getting page; HTTP status " + str(r.status_code))

            except Exception as e:
                print("Error for state " + location + " and URL " + u + location + url_ext)
                print(e)

        # Add date information
        df = pd.DataFrame(rows)
        df = df.rename(columns=dict(zip(range(len(headers)), headers)))
        df["repweekdate"] = pd.to_datetime(df["repweekdate"]).dt.strftime("%Y-%m-%d")
        file_dir = folder_path + filename
        df_all = historical_date(df, file_dir, "repweekdate")
        # write the csv file
        df_all.to_csv(file_dir, index=False)


def get_nssp_data(req_res, file_name, folder_path="auxiliary-data/rsv/nssp/", date_colname="End Date of MMWR Week"):
    df_res = pd.read_csv(io.StringIO(req_res.text))
    df_res["as_of"] = date.today().strftime("%Y-%m-%d")
    df_res[date_colname] = pd.to_datetime(
        df_res[date_colname]).dt.strftime("%Y-%m-%d")
    file_dir = folder_path + file_name
    df_res_all = historical_date(df_res, file_dir, date_colname)
    df_res_all.to_csv(file_dir, index=False)


# RSV State Trends - The National Respiratory and Enteric Virus Surveillance System (NREVSS)
state_bases = [
    "https://www.cdc.gov/surveillance/nrevss/images/rsvstate/RSV1PPCent3AVG_State",
    "https://www.cdc.gov/surveillance/nrevss/images/rsvstate/RSV4PPCent3AVG_State",
    "https://www.cdc.gov/surveillance/nrevss/images/rsvstate/RSV14NumCent5AVG_State"]
hub_locations = pd.read_csv("auxiliary-data/location_census/locations.csv")
states = list(hub_locations["abbreviation"])
to_remove = ["AS", "GU", "MP", "PR", "UM", "VI", "US"]
for i in to_remove:
    states.remove(i)
get_nrevss_data(state_bases, ".htm", states)

# RSV National Trends - The National Respiratory and Enteric Virus Surveillance System (NREVSS)
nat_bases = {"https://www.cdc.gov/surveillance/nrevss/images/trend_images/RSV124PP_",
             "https://www.cdc.gov/surveillance/nrevss/images/trend_images/RSV14Num_"}
get_nrevss_data(nat_bases, ".htm", ["Nat"], location_name="the ")

# Weekly Rates of Laboratory-Confirmed RSV Hospitalizations - Respiratory Syncytial Virus Hospitalization
# Surveillance Network (RSV-NET)
res = requests.get("https://data.cdc.gov/api/views/29hc-w46k/rows.csv?accessType=DOWNLOAD")
df_rsvnet = pd.read_csv(io.StringIO(res.text),
                        dtype={'State': "string", 'Season': "string", 'MMWR Week': "string",
                               'Week ending date': "string", 'Age Category': "string",
                               'Sex': "string", 'Race': "string", 'Rate': "float",
                               'Cumulative Rate': "float"})
df_rsvnet.to_parquet("auxiliary-data/rsv/rsv-net/" + str(date.today()) + 
    "_weekly_rates_lab_confirmed_rsv_hosp.parquet")

# Weekly Respiratory Virus Vaccination Data, Children 6 Months-17 Years and Adults 18 Years and 
# Older, National Immunization Survey
res = requests.get("https://data.cdc.gov/resource/5c6r-xi2t.csv")
df_rsvvax = pd.read_csv(io.StringIO(res.text))
df_rsvvax.to_parquet("auxiliary-data/rsv/rsv-vax/weekly_respiratory_virus_vaccination_data.parquet")

# National Emergency Department Visits for COVID-19, Influenza, and Respiratory Syncytial Virus
# Weekly Emergency Department Visits by Age Group
res = requests.get("https://www.cdc.gov/wcms/vizdata/live/CSELS_DHIS_NSSP/Resp_ED_Count_Weekly_National.csv")
get_nssp_data(res, "Resp_ED_Count_Weekly_National.csv".lower())

res = requests.get("https://www.cdc.gov/wcms/vizdata/live/CSELS_DHIS_NSSP/Resp_ED_Percent_Weekly_National.csv")
get_nssp_data(res, "Resp_ED_Percent_Weekly_National.csv".lower())

res = requests.get("https://data.cdc.gov/api/views/vutn-jzwm/rows.csv?accessType=DOWNLOAD")
get_nssp_data(res, "Resp_ED_Percent_Weekly_state.csv".lower(), date_colname="week_end")
