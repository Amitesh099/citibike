select * from {{ source('demo_source', 'bike') }}

limit 10