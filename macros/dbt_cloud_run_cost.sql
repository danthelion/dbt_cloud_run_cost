{% macro calculate_run_cost(results, dbt_cloud_only=False) %}

    {% set is_dbt_cloud = env_var('DBT_ENV', '') %}
    {% set calculate = not dbt_cloud_only or is_dbt_cloud %}

    {% if calculate and execute %}

        {% set successful_model_count = namespace(value=0) %}

            {% for result in results %}

                {% if result.status == 'success' %}

                    {% set successful_model_count.value = successful_model_count.value + 1 %}

                {% endif %}

            {% endfor %}

        {% set cost = 0.01 * successful_model_count.value %}

        {{ print("This run cost $" ~ cost ~ " based on " ~ successful_model_count.value ~ " successfully run models.") }}

    {% endif %}

{% endmacro %}
