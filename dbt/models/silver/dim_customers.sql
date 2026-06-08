-- Silver Layer: Customer dimension with SCD Type 2
{{ config(materialized='table', partition_by={"field": "updated_at", "data_type": "timestamp"},
          cluster_by=["customer_id", "country_code"]) }}

WITH source AS (
    SELECT * FROM {{ ref('bronze_crm_customers') }}
    WHERE _dlt_load_id = (SELECT MAX(_dlt_load_id) FROM {{ ref('bronze_crm_customers') }})
),
deduped AS (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY updated_at DESC) AS rn
    FROM source
),
quality_checked AS (
    SELECT *,
        CASE WHEN email LIKE '%@%.%' AND LENGTH(email) > 5 THEN TRUE ELSE FALSE END AS email_valid,
        CASE WHEN customer_id IS NOT NULL AND LENGTH(customer_id) > 0 THEN TRUE ELSE FALSE END AS id_valid
    FROM deduped WHERE rn = 1
)
SELECT
    customer_id, full_name, email, phone, country_code,
    segment, lifetime_value, created_at, updated_at,
    email_valid AND id_valid AS is_quality_record,
    CURRENT_TIMESTAMP() AS _silver_loaded_at
FROM quality_checked
WHERE id_valid = TRUE
