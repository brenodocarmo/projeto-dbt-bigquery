{{
  config(
    tags = ['comercial'],
    docs = {'node_color': 'red'}
    )
}}


WITH vendas AS (

    SELECT 
        *
    FROM {{ ref('int_vendas') }}

)

SELECT * FROM vendas