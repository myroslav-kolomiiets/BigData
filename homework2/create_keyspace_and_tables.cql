CREATE KEYSPACE IF NOT EXISTS hw2_myroslav_kolomiiets WITH REPLICATION = {
  'class' : 'SimpleStrategy',
  'replication_factor' : '3'
};

CREATE TABLE IF NOT EXISTS hw2_myroslav_kolomiiets.favorite_songs (
  id int PRIMARY KEY,
  author text,
  song_name text,
  release_year int,
);

CREATE TABLE IF NOT EXISTS hw2_myroslav_kolomiiets.favorite_movies (
  id int PRIMARY KEY,
  name text,
  producer text,
  release_year int,
);
