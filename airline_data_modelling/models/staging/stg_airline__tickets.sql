
with source as (

    select * from {{ source('airline', 'tickets') }}

),

renamed as (

    select
        ticket_no,
        book_ref,
        passenger_id,
        passenger_name,
        {# contact_data, #}
        (contact_data->>'email')::text as email,
        (contact_data->>'phone')::text as phone
    from source

)

select * from renamed

