
with source as (

    select * from {{ source('airline', 'flights') }}

),

renamed as (

    select
        flight_id,
        flight_no,
        scheduled_departure AS scheduled_departure_ts,
        DATE(scheduled_departure) as scheduled_departure_dt,
        (scheduled_departure::time) as scheduled_departure_tm,
        scheduled_arrival AS scheduled_arrival_ts,
        DATE(scheduled_arrival) as scheduled_arrival_dt,
        (scheduled_arrival::time) as scheduled_arrival_tm,
        departure_airport,
        arrival_airport,
        status,
        aircraft_code,
        actual_departure,
        actual_arrival

    from source

)

select * from renamed

