{% macro calculate_run_cost(results) %}

    {% set successful_model_count = namespace(value=0) %}

        {% for result in results %}

            {% if result.status == 'success' %}

                {% set successful_model_count.value = successful_model_count.value + 1 %}

            {% endif %}

        {% endfor %}

    {% set cost = 0.01 * successful_model_count.value %}

    {{ log("This run cost you $" ~ cost ~ " based on " ~ successful_model_count.value ~ " successully run models.", info=True) }}

{% endmacro %}