#!/bin/bash

# Запуск Docker Compose
docker-compose up -d

# Очікування на запуск Spark
sleep 30

# Вивід URL майстра Spark для використання у коді програми
docker run -it --rm --network=container:spark-master -v $(pwd):/app -e JAVA_HOME=/usr/lib/jvm/default-java python:3.8 /bin/bash -c "apt-get update && apt-get install -y default-jdk && pip install pyspark && python /app/index.py"
