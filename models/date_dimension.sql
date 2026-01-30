with cte as (
    select 
    started_at,
    date(to_timestamp(started_at)) date_started_at,
    hour(to_timestamp(started_at)) hour_started_at,
    
    {{daytype('started_at')}} DAY_TYPE,
    

   {{get_season('STARTED_AT')}} as STATION_OF_YEAR
    
    from {{ source ('demo_source', 'bike') }}
)
select * from cte where started_at != 'started_at'

