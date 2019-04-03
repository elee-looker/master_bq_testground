view: order_items {
  sql_table_name: looker_test.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
#     link: {
#       label: "testing label"
#       url: "https://www.google.com/search?q={{ value }}"
#     }
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: sku_num {
    type: number
    sql: ${TABLE}.sku_num ;;
  }

  dimension: pivot_yesno {
    type: yesno
    sql: ${amount} > 50 ;;
  }

  measure: count {
    type: count
    drill_fields: [id, orders.id]
  }
}
