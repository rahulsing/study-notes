{% macro cleanup_all() %}
  {% set cleanup_queries = [
    "DROP VIEW IF EXISTS " ~ target.schema ~ ".stg_customer_address",
    "DROP TABLE IF EXISTS " ~ target.schema ~ ".address_summary",
    "DROP TABLE IF EXISTS " ~ target.schema ~ ".customer_address",
    "DROP DATABASE IF EXISTS " ~ target.schema ~ " CASCADE"
  ] %}
  
  {% for query in cleanup_queries %}
    {% do log("Executing: " ~ query, info=True) %}
    {% do run_query(query) %}
  {% endfor %}
  
  {% do log("Cleanup completed!", info=True) %}
{% endmacro %}