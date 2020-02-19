# If necessary, uncomment the line below to include explore_source.
include: "bq_testground.model.lkml"

view: random_pdt {
  derived_table: {
    explore_source: orders {
      column: id {}
      column: created_date {}
      column: count {}

    }
    datagroup_trigger: bq_testground_default_datagroup
  }
  dimension: id {
    type: number
  }
  dimension: created_date {
    type: date
  }
  dimension: count {
    type: number
  }
}
