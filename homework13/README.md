# big-data-kolomiiets

## Task 13

## Getting started

### Run scripts
```
run-cluster.sh
run-producer.sh
run-consumer.sh
spark-streaming.sh
```
### After spark-streaming.sh in the same terminal print
```
cd /opt/app
spark-submit --conf spark.jars.ivy=/opt/app --packages "org.apache.spark:spark-sql-kafka-0-10_2.12:3.2.0" --master spark://*your master container name*:7077 --deploy-mode client index.py

```
