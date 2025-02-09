
with source as (

    select * from {{ source('airline', 'aircrafts_data') }}

),

renamed as (

    select
        aircraft_code,
        (model->>'en') AS model_en,
        (model->>'ru') AS model_ru,
        range
    from source

)

select * from renamed

