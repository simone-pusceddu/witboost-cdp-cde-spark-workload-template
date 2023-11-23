package com.agilelab.bigdata.workload.spark.app

import org.apache.spark.sql.SparkSession

object SparkApp {

  def main(args: Array[String]): Unit = {
    val spark = SparkSession.builder().appName("App Name").getOrCreate()
    import spark.implicits._
    spark.createDataset(Seq("1","2")).show()
    spark.stop()
  }
}
