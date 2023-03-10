{{
  config(
    materialized = 'incremental',
    on_schema_change='fail'
    )
}}
WITH src_reviews AS (
  SELECT * FROM {{ ref('src_reviews') }}
)
SELECT * FROM src_reviews
WHERE review_text is not null
{% if is_incremental() %} /*if the incremetal load*/
  AND review_date > (select max(review_date) from {{ this }}) /* then abandoned this condition. 'this' refers to this model ftc_reviews*/
{% endif %}
