{% macro create_customer_address_table() %}
  CREATE EXTERNAL TABLE IF NOT EXISTS {{ target.schema }}.customer_address (
    ca_address_sk bigint,
    ca_address_id string,
    ca_street_number string,
    ca_street_name string,
    ca_street_type string,
    ca_suite_number string,
    ca_city string,
    ca_county string,
    ca_state string,
    ca_zip string,
    ca_country string,
    ca_gmt_offset decimal(5,2),
    ca_location_type string
  )
  STORED AS TEXTFILE
  LOCATION 's3://redshift-downloads/TPC-DS/2.13/10GB/customer_address/'
  TBLPROPERTIES (
    'field.delim'='|',
    'skip.header.line.count'='0'
  )
{% endmacro %}