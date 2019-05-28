view: orders {
  sql_table_name: looker_test.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;

}

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      hour,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: order_amount {
    type: number
    sql: ${TABLE}.order_amount ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    suggestions:
    [" backspace","%08",
      "tab","%09",
      "linefeed",       "%0A",
      "return",        "%0D",
      "space",         "%20",
      "!",              "%21",
      "%22",
      "#",              "%23,",
      "$",              "%24",
      "%",              "%25",
      "&" ,             "%26",
      "'"  ,            "%27",
      "("   ,           "%28",
      ")"    ,          "%29",
      "+"     ,         "%2B",
      ","      ,        "%2C",
      "-"       ,       "%2D",
      "."        ,      "%2E",
      "/"         ,     "%2F",
      ":"          ,    "%3A",
      ";"           ,   "%3B",
      "<"            ,  "%3C",
      "="           ,   "%3D",
      ">" ,             "%3E",
      "?"  ,            "%3F",
      "@"   ,           "%40",
      "'\'"    ,          "%5C",
      "]"     ,         "%5D",
      "^"      ,        "%5E",
      "/^"      ,        "^%5E",
      "_"       ,       "%5F",
      "`"        ,      "%60",
      "{"         ,     "%7B",
      "|" ,             "%7C",
      "}"  ,            "%7D",
      "~"   ,           "%7E",
      "¢"    ,          "%A2",
      "£"     ,         "%A3",
      "¥"      ,        "%A5",
      "|"       ,       "%A6",
      "§"        ,      "%A7",
      "«"         ,     "%AB",
      "¬"          ,    "%AC",
      "¯"           ,   "%AD",
      "º"            ,  "%B0",
      "±"             , "%B1",
      "ª" ,             "%B2",
      ","  ,            "%B4",
      "µ"   ,           "%B5",
      "»"    ,          "%BB",
      "¼"     ,         "%BC",
      "½"      ,        "%BD",
      "¿", "%BF",
      "ü", "%FC",
      "ý",  "%FD",
      "þ" ,"%FE",
      "ÿ" ,"%FF"
    ]
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.name, users.id, order_items.count]
  }
}
