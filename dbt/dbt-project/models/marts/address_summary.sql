{{ config(materialized='table') }}

-- Customer address summary by state
select
    ca_state,
    ca_country,
    count(*) as total_addresses,
    count(distinct ca_city) as unique_cities,
    count(distinct ca_county) as unique_counties
from {{ ref('stg_customer_address') }}
group by ca_state, ca_country
order by total_addresses desc