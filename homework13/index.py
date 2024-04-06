from pyspark.sql import SparkSession
from pyspark.sql.streaming import *
from pyspark.sql.functions import length, upper, current_timestamp, col

spark = SparkSession \
    .builder \
    .appName("Spark Kafka Streaming") \
    .config("spark.jars.packages", "org.apache.spark:spark-sql-kafka-0-10_2.12:3.2.0") \
    .config("spark.sql.streaming.checkpointLocation", "/opt/app/spark-checkpoint") \
    .getOrCreate()

kafka_bootstrap_servers = "kafka-server:9092"
input = "input"
processed = "processed"

df = spark \
    .readStream \
    .format("kafka") \
    .option("kafka.bootstrap.servers", kafka_bootstrap_servers) \
    .option("subscribe", input) \
    .option("failOnDataLoss", "false") \
    .option("startingOffsets", "earliest") \
    .load() \
    .selectExpr("CAST(value AS STRING)")

result_df = df.withColumn("message_length", length(col("value"))) \
    .withColumn("processing_time", current_timestamp()) \
    .withColumn("original_message", col("value"))

result_df.selectExpr(
    "CAST(message_length AS STRING) as key",
    "CAST(concat('Message_length: ', message_length, '; Time of processing: ', processing_time, '; Original message: ', value) AS STRING) as value"
).writeStream \
    .format("kafka") \
    .option("kafka.bootstrap.servers", kafka_bootstrap_servers) \
    .option("topic", processed) \
    .option("checkpointLocation", "/opt/app/kafka_checkpoint") \
    .start() \
    .awaitTermination()
