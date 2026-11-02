# Raw data sources

All files were downloaded on 29–30 October 2026 and are kept here unchanged. TÜİK data is published on the [TÜİK Data Portal](https://veriportali.tuik.gov.tr); EPDK data on the [EPDK website](https://www.epdk.gov.tr).

## TÜİK (Turkish Statistical Institute) – `tuik/`

CSV files come from the portal's [bulk dataset download](https://veriportali.tuik.gov.tr/tr/bulk-download) (semicolon-separated, UTF-8, decimal comma). JSON files are JSON-stat exports of the same portal's data browser, used for the two tables that are not offered as bulk downloads. The file name contains the TÜİK dataflow ID.

| File | Description | Period |
| --- | --- | --- |
| `tuik_DF_MOTORLU_KARA_TASIT_YAKIT_CINSI_V4.csv` | Registered cars by fuel type (petrol, diesel, LPG, hybrid, electric, unknown), monthly. **Türkiye total only** | 2005-01 to 2026-09 |
| `tuik_DF_MOTORLU_KARA_TASIT_ILLER_V3.csv` | Registered road motor vehicles by province and vehicle type, monthly. No fuel type | 2005-01 to 2026-09 |
| `tuik_DF_MOTORLU_KARA_TASIT_KAYDI_YAPILAN_IL_V2.csv` | Vehicles registered for the first time, by province and vehicle type, monthly and year-to-date | 2005-01 to 2026-09 |
| `tuik_DF_MOTORLU_KARA_TASIT_YAKIT_TURU_V3.csv` | All road motor vehicles by fuel type, annual, Türkiye total | 2005 to 2025 |
| `tuik_DF_MOTORLU_KARA_TASIT_IBBS_YIL_V2.csv` | Road motor vehicles by vehicle type and SR Level 1 region, annual | 2005 to 2025 |
| `tuik_DF_ADNKS_T35.csv` | Province population by broad age group (Address Based Population Registration System) | 2007 to 2025 |
| `tuik_DF_ADNKS_T20.csv` | Population density by province (people per km²) | 2007 to 2025 |
| `tuik_DF_ADNKS_T37.csv` | Province population by urban-rural classification (dense urban, medium urban, rural) | 2022 to 2025 |
| `tuik_DF_ADNKS_T25.csv` | Average household size by province | 2008 to 2025 |
| `tuik_DF_UH_BH_KISI_BASI.json` | GDP per capita by province (TRY and USD), JSON-stat | 2004 to 2024 |
| `tuik_DF_BESERI_KALKINMA_ENDEKS.json` | Human Development Index by province, with education, income and life expectancy sub-indices, JSON-stat | 2018 to 2022 |
| `tuik_bkna2021_il_otopark.xls` | Households by province and whether their building has a car park. Building and Dwelling Characteristics Survey 2021 ([press release 45870](https://veriportali.tuik.gov.tr/tr/press/45870)) | 2021 |
| `tuik_bkna2021_il_kat_sayisi.xls` | Households by province and number of floors of their building. Same survey | 2021 |

## EPDK (Energy Market Regulatory Authority)

| File | Description | Source |
| --- | --- | --- |
| `epdk_sarj_hizmeti_aylik_istatistikleri_2026-09.pdf` | Charging Service Market Monthly Statistics, September 2026. National EV count, charging sockets (AC/DC) and power classes, installed capacity, energy consumption, operator shares, top 10 provinces by consumption | [EPDK announcement](https://www.epdk.gov.tr/Detay/Icerik/4-16463/sarj-hizmeti-piyasasi-aylik-istatistikleri-eylul-) |
| `epdk_sarj_istasyonlari_2026-10-30.csv` | List of licensed charging stations: station number, name, service type (public/private), brand, operators and address (district / province). 16,613 stations. No socket counts | [EPDK charging station list](https://lisans.epdk.gov.tr/epvys-web/faces/pages/lisans/elektrikSarjAgiIsletmeci/sarjIstasyonuOzetSorgula.xhtml) |

## Notes

- **No province-level EV data.** TÜİK publishes cars by fuel type only for Türkiye as a whole, and vehicles by province only by vehicle type. Province-level analysis therefore uses charging stations per car or per person, not EVs per charger. A request for province × fuel type data was sent to TÜİK on 30 October 2026 (CİMER application 2606018679).
- **Electric vehicles in the annual fuel table are not only cars (most likely electric motorcycles and scooters).** `YAKIT_TURU_V3` shows 1.2 million electric vehicles in 2025, while the car table shows 370,591 electric cars. EV counts in this project come from the car table only.
- **How the station list was collected.** The EPDK page shows at most 500 rows per page and has no export of the full list. The table was read page by page in the browser on 30 October 2026. The page reports 17,113 records, but repeated passes over all pages returned 16,613 unique station numbers, so the difference is most likely duplicate records in the page's count.
- **Province is the join key.** TÜİK CSV files contain province names only; the JSON-stat files also contain SR (NUTS) codes. Names are standardised in notebook 02.
