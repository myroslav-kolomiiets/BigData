from pyspark.sql import SparkSession
from pyspark.sql.streaming import *

spark = SparkSession.builder.appName("Spark Kafka Streaming").getOrCreate()

kafka_bootstrap_servers = "kafka-server:9092"
input_topic = "input"
output_topic = "processed"

df = spark.readStream.format("kafka") \
    .option("kafka.bootstrap.servers", kafka_bootstrap_servers) \
    .option("subscribe", input_topic) \
    .load()

processed_df = df.selectExpr("CAST(value AS STRING)")
processed_query = processed_df.writeStream \
    .outputMode("append") \
    .format("console") \
    .start()

processed_query.awaitTermination()
