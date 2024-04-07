#!/bin/bash
docker run --rm -it --network test-network --name spark-submit -v /Users/miroslav/Desktop/Learn/SET/Big_Data/big-data-kolomiiets:/opt/app bitnami/spark:3 /bin/bash

# cd /opt/app
# spark-submit --conf spark.jars.ivy=/opt/app --packages "org.apache.spark:spark-sql-kafka-0-10_2.12:3.2.0" --master spark://big-data-kolomiiets-spark-1:7077 --deploy-mode client index.py
