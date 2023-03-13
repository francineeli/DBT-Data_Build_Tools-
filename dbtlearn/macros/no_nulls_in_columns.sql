{% macro no_nulls_in_columns(model) %} /*model here are the single parameter for the created macro no_nulls_in_columns.*/
    SELECT * FROM {{ model }} WHERE
    /*here below we have an iteration throught every column in the model*/
    {% for col in adapter.get_columns_in_relation(model) -%} /*the adapter.get... it's a built-in-functionality in dbt*/
        {{ col.column }} IS NULL OR
    {% endfor %}
    FALSE /*the false statement terminates the rule OR above. So, the full rule IS NULL OR FALSE.*/
{% endmacro %}