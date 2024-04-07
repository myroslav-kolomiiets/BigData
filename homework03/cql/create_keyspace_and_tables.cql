// Створюємо keyspace для нашої бази даних
CREATE KEYSPACE IF NOT EXISTS reviews_keyspace
WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor': 3};

// Використовуємо наш keyspace
USE reviews_keyspace;

// Таблиця для зберігання відгуків
CREATE TABLE IF NOT EXISTS reviews (
review_id TEXT PRIMARY KEY,
product_id TEXT,
customer_id BIGINT,
star_rating INT,
helpful_votes INT,
total_votes INT,
vine BOOLEAN,
verified_purchase BOOLEAN,
review_headline TEXT,
review_body TEXT,
review_date DATE
);

// Індекс для швидкого отримання відгуків за product_id
CREATE INDEX IF NOT EXISTS ON reviews (product_id);

// Індекс для швидкого отримання відгуків за star_rating
CREATE INDEX IF NOT EXISTS ON reviews (star_rating);

// Індекс для швидкого отримання відгуків за customer_id
CREATE INDEX IF NOT EXISTS ON reviews (customer_id);

// Таблиця для відстеження кількості відгуків та їх рейтингів за користувачем
CREATE TABLE IF NOT EXISTS user_reviews_count (
customer_id BIGINT PRIMARY KEY,
total_reviews INT,
positive_reviews INT
);

// Індекси для швидкого отримання інформації з user_reviews_count
CREATE INDEX IF NOT EXISTS ON user_reviews_count (total_reviews);
CREATE INDEX IF NOT EXISTS ON user_reviews_count (positive_reviews);

// Таблиця для відстеження кількості відгуків користувача для кожного продукту
CREATE TABLE IF NOT EXISTS user_product_reviews (
customer_id BIGINT,
product_id TEXT,
review_id TEXT,
PRIMARY KEY (customer_id, product_id)
);

// Таблиця для відгуків за продуктом та рейтингом
CREATE TABLE IF NOT EXISTS product_reviews_by_rating (
product_id TEXT,
star_rating INT,
review_id TEXT,
PRIMARY KEY ((product_id, star_rating), review_id)
);
