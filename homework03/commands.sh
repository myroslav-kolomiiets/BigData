docker cp ./create_keyspace_and_tables.cql cassandra-1:/
docker exec -i cassandra-1 cqlsh -f ./create_keyspace_and_tables.cql

docker cp ./insert_data.cql cassandra-1:/
docker exec -i cassandra-1 cqlsh -f ./insert_data.cql

#docker exec -it cassandra-1 cqlsh
#SELECT * FROM hw2_myroslav_kolomiiets.favorite_songs;
#SELECT * FROM hw2_myroslav_kolomiiets.favorite_movies;
