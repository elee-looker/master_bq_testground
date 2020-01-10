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

  dimension: Day_week_number {
    type: number
    sql: mod(DATE_DIFF(${created_date}, date(2008,01,01), DAY) + 1, 7) ;;
  }


  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

#### DX-1857
  dimension: Customer_byparking_tmp {
    label: "Customer parking bucket tmp"
    type: number
#     hidden: yes
    sql: case when ${Day_week_number} = 0 then '0'
                when ${Day_week_number} = 1 then '1'
                when ${Day_week_number}  = 2 then '2'
                when ${Day_week_number} = 3 then '6'
                when ${Day_week_number}  = 4 then '11'
                when ${Day_week_number}  = 5 then '21'
                when ${Day_week_number}  = 6 then '51'
                when ${Day_week_number} = 7 then '100'
                else 'null'
                end;;
  }

  dimension: Customer_byparking {
#     alpha_sort: yes
  label: "Customer parking bucket"
  type: string
  sql: case when ${Customer_byparking_tmp} ='0' then '0 Parking'
                when ${Customer_byparking_tmp} ='1' then '1 Parking'
                when ${Customer_byparking_tmp}='2' then '2-5 Parkings'
                when ${Customer_byparking_tmp}='6'  then '6-10 Parkings'
                when ${Customer_byparking_tmp}='11'  then '11-20 Parkings'
                when ${Customer_byparking_tmp}='21'  then '21-50 Parkings'
                when ${Customer_byparking_tmp}='51'  then '51-100 Parkings'
                when ${Customer_byparking_tmp}='100' then '>100 Parkings'
                else 'null'
                end;;
  order_by_field: Customer_byparking_tmp
}

  measure: count {
    type: count
    drill_fields: [id, users.name, users.id, order_items.count]
  }
}
