// Отримати всі відгуки за заданим product_id:
SELECT * FROM reviews WHERE product_id = ?;

// Отримати всі відгуки за заданим product_id та обраним star_rating:
SELECT * FROM reviews WHERE product_id = ? AND star_rating = ?;

// Отримати всі відгуки за заданим customer_id:
SELECT * FROM reviews WHERE customer_id = ?;

// Отримати користувачів (customer_id), які залишили більше ніж N відгуків на платформі і які
// також залишили відгук для продукту product_id (N та product_id повинні задаватися в запиті):
SELECT DISTINCT customer_id FROM user_product_reviews WHERE product_id = ? AND COUNT(review_id) > ?;

// Дізнатися скільки позитивних відгуків (4 або 5 зірок) залишив вказаний користувач customer_id:
SELECT COUNT(*) FROM reviews WHERE customer_id = ? AND star_rating IN (4, 5);
