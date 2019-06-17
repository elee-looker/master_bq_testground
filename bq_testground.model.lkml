connection: "bigquery_test_db_connection"

# include all the views
include: "*.view"

datagroup: bq_testground_default_datagroup {
  sql_trigger: EXTRACT(DAY FROM CURRENT_TIMESTAMP);;
  max_cache_age: "1 hour"
}

persist_with: bq_testground_default_datagroup

explore: all_types {}

explore: fake_scratch__connection_reg_r3 {}

explore: looker_scratch__tst_reg_963fdcc02655d76f67 {}

explore: looker_scratch__tst_reg_ebffc1deed5d25a581 {}

explore: nested_and_repeated {
  join: nested_and_repeated__nested_field {
    view_label: "Nested And Repeated: Nested Field"
    sql: LEFT JOIN UNNEST([${nested_and_repeated.nested_field}]) as nested_and_repeated__nested_field ;;
    relationship: one_to_one
  }

  join: nested_and_repeated__doubly_nested_and_repeated {
    view_label: "Nested And Repeated: Doubly Nested And Repeated"
    sql: LEFT JOIN UNNEST(${nested_and_repeated.doubly_nested_and_repeated}) as nested_and_repeated__doubly_nested_and_repeated ;;
    relationship: one_to_many
  }
}

explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
  join: order_items {
    type: left_outer
    sql_on: ${orders.id} = ${order_items.order_id} ;;
    relationship: one_to_many
  }
}

explore: some_junk {}

explore: testing_table {}

explore: testing_table_one {}

explore: users {}
