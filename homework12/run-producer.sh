#!/bin/bash
docker run -it --rm --network test-network -e KAFKA_CFG_ZOOKEEPER_CONNECT=zookeeper-server:2181 bitnami/kafka:latest kafka-console-producer.sh --broker-list kafka-server:9092 --topic input_stream
