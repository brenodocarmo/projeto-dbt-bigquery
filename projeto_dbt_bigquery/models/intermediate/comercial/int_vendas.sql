{{
  config(
    tags = ['comercial'],
    )
}}

WITH orders AS (
    SELECT        
        EXTRACT(MONTH FROM order_date) AS mes,
        EXTRACT(YEAR FROM order_date) AS ANO,
        freight AS total_frete

    FROM {{ ref('stg_orders') }} 

),

vendas AS (
    SELECT
        mes,
        ano,
        SUM(total_frete) AS total_frete
    FROM orders

    GROUP BY mes, ano
)

SELECT * FROM vendas