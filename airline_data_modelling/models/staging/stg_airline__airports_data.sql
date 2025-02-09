
with source as (

    select * from {{ source('airline', 'airports_data') }}

),

renamed as (

    select
        airport_code,
        (airport_name->>'en') AS airport_name_en,
        (airport_name->>'ru') AS airport_name_ru,
        (city->>'en') AS city_en,
        (city->>'ru') AS city_ru,
        (POINT(coordinates::TEXT))[0] AS latitude,
        (POINT(coordinates::TEXT))[1] AS longitude,
        split_part(timezone, '/', 1) AS timezone_region,
        split_part(timezone, '/', 2) AS timezone_city
    from source

)

select * from renamed

