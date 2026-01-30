{% macro get_season(x) %}

case 
when month(to_timestamp({{x}})) in (12, 1, 2) then 'WINTER'
when MONTH(to_timestamp({{x}})) IN (3, 4, 5) THEN 'SPRING'
WHEN MONTH(to_timestamp({{x}})) IN (6, 7, 8) THEN 'SUMMER'
ELSE 'AUTUMN' END

{% endmacro %}


{% macro daytype(x) %}

case when dayname(to_timestamp({{x}}))
     in ('Sat', 'Sun') then 'WEEKEND'
      else 'BUSINESSDAY' END

{% endmacro %}