/*Structure: type, name of the type and its parameters.*/
/*Curiosity: the name of the test doesn't need to be the smae as the name of the file. Actually the test name matters more"*/
{% test positive_value(model, column_name) %} 
SELECT
    *
FROM
    {{ model }}
WHERE
    {{ column_name}} < 1
{% endtest %}