import os
import io
import requests
from bs4 import BeautifulSoup
from datetime import date
import pandas as pd

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


