with cte as (
    select 
    started_at,
    date(to_timestamp(started_at)) date_started_at,
    hour(to_timestamp(started_at)) hour_started_at,
    case when dayname(to_timestamp(started_at))
     in ('Sat', 'Sun') then 'WEEKEND'
      else 'BUSINESSDAY' END AS DAY_TYPE,
    CASE WHEN MONTH(to_timestamp(started_at)) IN (12, 1, 2) THEN 'WINTER'
    WHEN MONTH(to_timestamp(started_at)) IN (3, 4, 5) THEN 'SPRING'
    WHEN MONTH(to_timestamp(started_at)) IN (6, 7, 8) THEN 'SUMMER'
    ELSE 'AUTUMN' END AS STATION_OF_YEAR 
    
    from {{ source ('demo_source', 'bike') }}
)
select * from cte where started_at != 'started_at'

