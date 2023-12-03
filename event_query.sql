WITH before_yesterday AS (
SELECT  event_date,geo.country,COUNT(*) FROM `{your bigquery workspace}.events_*`  -- all tables
WHERE event_name = 'first_visit'
AND _TABLE_SUFFIX BETWEEN 
  FORMAT_DATE("%Y%m%d", DATE_SUB(CURRENT_DATE(), INTERVAL 60 DAY)) AND --  60 days old
  FORMAT_DATE("%Y%m%d", DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)) -- till before yesterday
AND geo.country IN ('United States','Russia','United Kingdom','Canada','India','Singapore','Australia','Germany','France','Iran','Netherlands','China','Indonesia','Philippines','Bangladesh','Ukraine','Nigeria','Pakistan','Italy','Sweden','Spain','Taiwan','Malaysia','Brazil','Türkiye','Hong Kong','New Zealand','South Africa','Poland','Vietnam','Japan','Thailand','Romania','Mexico','Latvia','South Korea','Portugal','Greece','Belgium','Ireland','Norway','Switzerland','Austria','Denmark','Israel','Morocco','Belarus','Cambodia','Myanmar (Burma)')
GROUP BY 1,2
ORDER BY 2,1
),
--join data for yesterday
yesterday AS (
SELECT  event_date,geo.country,COUNT(*) FROM `{your bigquery workspace}.events_intraday_*`
WHERE event_name = 'first_visit'
AND _TABLE_SUFFIX BETWEEN 
  FORMAT_DATE("%Y%m%d", DATE_SUB(CURRENT_DATE(), INTERVAL 3 DAY)) AND
  FORMAT_DATE("%Y%m%d", DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY))
AND geo.country IN ('United States','Russia','United Kingdom','Canada','India','Singapore','Australia','Germany','France','Iran','Netherlands','China','Indonesia','Philippines','Bangladesh','Ukraine','Nigeria','Pakistan','Italy','Sweden','Spain','Taiwan','Malaysia','Brazil','Türkiye','Hong Kong','New Zealand','South Africa','Poland','Vietnam','Japan','Thailand','Romania','Mexico','Latvia','South Korea','Portugal','Greece','Belgium','Ireland','Norway','Switzerland','Austria','Denmark','Israel','Morocco','Belarus','Cambodia','Myanmar (Burma)')
GROUP BY 1,2
ORDER BY 2,1)

SELECT * FROM before_yesterday
UNION ALL
SELECT * FROM yesterday
ORDER BY event_date


