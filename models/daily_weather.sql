with daily_weather as (
    select date(time) as daily_weather,
    weather,
    temp,
    pressure,
    humidity,
    clouds
    
    
    
     from {{ source ('demo_source', 'weather' )}}
),

 daily_weather_agg as (

    select daily_weather, 
    weather,
    round(avg(temp)) avg_temp,
    round(avg(pressure)) avg_pressure,
    round(avg(humidity)) avg_humidity,
    round(avg(clouds)) avg_clouds
    from daily_weather
    group by daily_weather, weather
    qualify row_number() over (partition by daily_weather order by count(weather) desc) = 1
)

select * from daily_weather_agg