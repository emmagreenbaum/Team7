{{
    config(
         materialized='table'
    )
}}

WITH RECURSIVE date_cte AS (
    SELECT '2023-10-01 00:00:00'::timestamp AS date_value
    UNION ALL
     SELECT DATEADD(hour, 1, date_value)
    FROM  date_cte
    WHERE date_value < '2023-10-31 23:00:00'
)


SELECT
  {{ datetime_to_yyyymmddhh('date_value') }} AS date_id,
  date_value AS date_iso,
  CAST(EXTRACT(YEAR FROM date_value) AS INTEGER) AS year_number,
  CAST(EXTRACT(MONTH FROM date_value) AS INTEGER)  AS month_number,
  CAST(EXTRACT(DAY FROM date_value) AS INTEGER)  AS day_number,
  CAST(EXTRACT(HOUR FROM date_value) AS INTEGER)  AS hour_number,
  CAST(EXTRACT(QUARTER FROM date_value) AS INTEGER)  AS quarter_number,
  TO_CHAR(date_value, 'Month') AS monthName,
  
 
  TO_CHAR(date_value, 'Day') AS dayName,
  
FROM date_cte