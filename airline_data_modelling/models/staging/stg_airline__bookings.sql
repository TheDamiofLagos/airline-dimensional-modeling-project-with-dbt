
with source as (

    select * from {{ source('airline', 'bookings') }}

),

renamed as (

    select
        book_ref,
        book_date,
        DATE(book_date) as book_dt,
        (book_date::time) as book_tm,
        total_amount
    from source

)

select * from renamed

