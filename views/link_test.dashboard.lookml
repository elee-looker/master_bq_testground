- dashboard: test
  title: Test
  layout: newspaper
  elements:
  - name: blank_schedule_test_copy
    title: blank_schedule_test_copy
    model: the_look
    explore: order_items
    type: looker_pie
    fields: [products.count, products.category]
    filters:
      products.category: Jeans,Pant,Shorts,Accessories
    sorts: [products.count desc]
    limit: 500
    value_labels: legend
    label_type: labPer
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_nil_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    colors: ['palette: Mixed Neutrals']
    series_colors: {}
    hidden_fields: []
    y_axes: []
    listen:
      datefilter: orders.created_month
    row: 3
    col: 0
    width: 8
    height: 6
  - title: string sorting
    name: string sorting
    model: bq_testground
    explore: orders
    type: looker_column
    fields: [users.id_string, orders.count]
    pivots: [users.id_string]
    filters:
      users.id_string: "< 30,37,44,91,43,88,31,49,42"
    sorts: [orders.count desc 0, users.id_string]
    limit: 500
    query_timezone: UTC
    hidden_fields: []
    y_axes: []
    row: 3
    col: 8
    width: 8
    height: 6
  - title: non-pivot string sort
    name: non-pivot string sort
    model: bq_testground
    explore: orders
    type: looker_column
    fields: [users.id_string, orders.count]
    filters:
      users.id_string: "< 30,37,44,91,43,88,31,49,42"
    sorts: [users.id_string]
    limit: 500
    query_timezone: UTC
    hidden_fields: []
    y_axes: []
    row: 3
    col: 16
    width: 8
    height: 6
  - name: ''
    type: text
    title_text: ''
    body_text: |-
      <div class="somethingelse">
      <div class="test">
      <font color="#5A2FC2" size="6" ><center><b>Tour Sales Production Overview </b></font>
      </div>
      </div>
    row: 0
    col: 0
    width: 24
    height: 3
  filters:
  - name: Untitled Filter
    title: Untitled Filter
    type: number_filter
    default_value: "(5, 6)"
    allow_multiple_values: true
    required: false
  # - name: datefilter
  #   title: datefilter
  #   type: field_filter
  #   default_value: 3 months
  #   allow_multiple_values: true
  #   required: false
  #   model: the_look
  #   explore: orders
  #   listens_to_filters: []
  #   field: orders.created_month
