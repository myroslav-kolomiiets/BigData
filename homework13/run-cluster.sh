#!/bin/bash
docker network create test-network

#docker run -d --name zookeeper-server --network test-network -e ALLOW_ANONYMOUS_LOGIN=yes bitnami/zookeeper:latest
#
#docker run -d --name kafka-server --network test-network -e ALLOW_PLAINTEXT_LISTENER=yes -e KAFKA_CFG_ZOOKEEPER_CONNECT=zookeeper-server:2181 bitnami/kafka:latest
#
#docker run -it --rm --network test-network -e KAFKA_CFG_ZOOKEEPER_CONNECT=zookeeper-server:2181 bitnami/kafka:latest kafka-topics.sh --create  --bootstrap-server kafka-server:9092 --replication-factor 1 --partitions 3 --topic input
#
#docker run -it --rm --network test-network -e KAFKA_CFG_ZOOKEEPER_CONNECT=zookeeper-server:2181 bitnami/kafka:latest kafka-topics.sh --create  --bootstrap-server kafka-server:9092 --replication-factor 1 --partitions 3 --topic processed

docker-compose up --build
