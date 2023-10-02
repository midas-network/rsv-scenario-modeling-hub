
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


today = date.today()
today_str = today.strftime("%Y-%m-%d")

url_bases = [
    "https://www.cdc.gov/surveillance/nrevss/images/rsvstate/RSV1PPCent3AVG_State",
    "https://www.cdc.gov/surveillance/nrevss/images/rsvstate/RSV4PPCent3AVG_State",
    "https://www.cdc.gov/surveillance/nrevss/images/rsvstate/RSV14NumCent5AVG_State"]
url_ext = ".htm"

locations = pd.read_csv("data-locations/locations.csv")
states = list(locations["abbreviation"])
to_remove = ["AS", "GU", "MP", "PR", "UM", "VI", "US"]
for i in to_remove:
    states.remove(i)

for u in url_bases:
    headers = []
    rows = []
    filename = ""

    for state in states:
        try:
            r = requests.get(u + state + url_ext)
            if r.status_code == 200:

                # parse the html
                soup = BeautifulSoup(r.text, 'html.parser')

                # search for the <table> tags
                tables = soup.find_all("table")

                for t in tables:
                    filename = (t.caption.text.strip().replace("for " + state, "").
                                replace("Insufficient Antigen Data:  ", "").
                                replace("Insufficient Data:  ", "").lower().
                                replace(" ", "_").replace("(", "").replace(")", "") + ".csv")
                    headers = get_table_headers(t)
                    state_rows = get_table_rows(t)
                    rows.extend(state_rows)

            else:
                print("Error getting page; HTTP status " + str(r.status_code))

        except Exception as e:
            print("Error for state " + state + " and URL " + u + state + url_ext)
            print(e)

    df = pd.DataFrame(rows)
    df = df.rename(columns=dict(zip(range(len(headers)), headers)))
    df["repweekdate"] = pd.to_datetime(df["repweekdate"]).dt.strftime("%Y-%m-%d")
    # write the csv file
    df.to_csv("auxiliary-data/nrevss" + filename, index=False)
