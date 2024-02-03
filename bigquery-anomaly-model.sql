
CREATE OR REPLACE MODEL `schema_name.model_name`
OPTIONS(
    model_type='arima_plus', -- arima plus model
    TIME_SERIES_DATA_COL='CT', -- event count
    TIME_SERIES_TIMESTAMP_COL='event_date_ts', --time/date
    TIME_SERIES_ID_COL = 'country', -- select dimension column you need anomaly tection
    DECOMPOSE_TIME_SERIES=TRUE
)
AS (
SELECT  

PARSE_TIMESTAMP("%Y%m%d", event_date) AS event_date_ts,geo.country,COUNT(*) as CT FROM `{ga4schema}.events_*` 
WHERE event_name = 'first_visit'
AND _TABLE_SUFFIX BETWEEN 
  FORMAT_DATE("%Y%m%d", DATE_SUB(CURRENT_DATE(), INTERVAL 60 DAY)) AND
  FORMAT_DATE("%Y%m%d", DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY))
AND geo.country IN ('New Zealand','South Africa') -- filter countries
GROUP BY 1,2
ORDER BY 2,1
);

