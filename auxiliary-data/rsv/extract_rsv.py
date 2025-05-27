import io
import requests
from datetime import date
import pandas as pd


def request_get_link(link, output_dtype=None):
    df = None
    try:
        result = requests.get(link, timeout=30)
        if result.status_code == 200:
            df = pd.read_csv(io.StringIO(result.text), dtype=output_dtype)
        else:
            print("Error getting page; HTTP status " + str(result.status_code))
    except Exception as e:
        print("Error for link: " + link)
        print(e)
    return df


# Weekly Rates of Laboratory-Confirmed RSV Hospitalizations - Respiratory Syncytial Virus
# Hospitalization Surveillance Network (RSV-NET)
df_rsvnet = (
    request_get_link("https://data.cdc.gov/api/views/29hc-w46k/rows.csv?accessType=DOWNLOAD",
                     output_dtype={'State': "string", 'Season': "string", 'MMWR Week': "string",
                                   'Week ending date': "string", 'Age Category': "string",
                                   'Sex': "string", 'Race': "string", 'Rate': "float",
                                   'Cumulative Rate': "float"}))
print("RSV-NET Downloaded")
df_rsvnet.to_parquet("auxiliary-data/rsv/rsv-net/" + str(date.today()) +
                     "_weekly_rates_lab_confirmed_rsv_hosp.parquet")

# Weekly Respiratory Virus Vaccination Data, Children 6 Months-17 Years and Adults 18 Years and 
# Older, National Immunization Survey
df_rsvvax = request_get_link("https://data.cdc.gov/resource/5c6r-xi2t.csv")
print("RSV Vax Downloaded")
df_rsvvax.to_parquet("auxiliary-data/rsv/rsv-vax/weekly_respiratory_virus_vaccination_data.parquet")


# Percent Positivity of Respiratory Syncytial Virus Nucleic Acid Amplification 
# Tests by HHS Region, National Respiratory and Enteric Virus Surveillance System
df_pos = request_get_link("https://data.cdc.gov/api/views/3cxc-4k8q/rows.csv?accessType=DOWNLOAD")
print("RSV NREVSS Downloaded")
df_pos.to_parquet("auxiliary-data/rsv/nrevss/weekly_positivity.parquet")

# 2023 Respiratory Virus Response - NSSP Emergency Department Visits - COVID-19,
# Flu, RSV, Combined
df_edstate = (
    request_get_link("https://data.cdc.gov//api/views/rdmq-nq56/rows.csv?accessType=DOWNLOAD"))
print("RSV NSSP - State Downloaded")
df_edstate.to_parquet("auxiliary-data/rsv/nssp/ed_state.parquet")

df_eddemo = (
    request_get_link("https://data.cdc.gov//api/views/7xva-uux8/rows.csv?accessType=DOWNLOAD"))
print("RSV NSSP - Demographics Downloaded")
df_eddemo.to_parquet("auxiliary-data/rsv/nssp/ed_demo.parquet")
