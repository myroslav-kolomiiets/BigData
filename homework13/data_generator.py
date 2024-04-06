from kafka import KafkaProducer
import requests
import json
import time

kafka_server = 'kafka-server:9092'
kafka_topic = 'input'
producer = KafkaProducer(bootstrap_servers=kafka_server,
                         value_serializer=lambda v: json.dumps(v).encode('utf-8'))

stream_url = "https://stream.wikimedia.org/v2/stream/page-create"

while True:
    try:
        response = requests.get(stream_url, stream=True)
        for line in response.iter_lines():
            if line:
                print(line)
                producer.send(kafka_topic, value=line)
                producer.flush()
    except Exception as e:
        print(f"Error: {e}")

    time.sleep(1)
