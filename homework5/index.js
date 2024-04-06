const express = require('express');
const bodyParser = require('body-parser');
const cassandra = require('cassandra-driver');

const app = express();
const port = 8080;

// Підключення до Cassandra
const client = new cassandra.Client({
    contactPoints: ['localhost'], // Замініть на реальні адреси ваших вузлів Cassandra
    localDataCenter: 'datacenter1', // Замініть на ваш назву датацентру
    keyspace: 'ваш_keyspace', // Замініть на ваш keyspace
});

// Middleware для обробки JSON даних
app.use(bodyParser.json());

// Запит 1: Return all reviews for specified product_id
app.get('/reviews/:product_id', async (req, res) => {
    const product_id = req.params.product_id;
    const query = `SELECT * FROM reviews WHERE product_id = ?`;
    try {
        const result = await client.execute(query, [product_id], { prepare: true });
        res.json(result.rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// Запит 2: Return all reviews for specified product_id with given star_rating
app.get('/reviews/:product_id/:star_rating', async (req, res) => {
    const product_id = req.params.product_id;
    const star_rating = parseInt(req.params.star_rating);
    const query = `SELECT * FROM reviews WHERE product_id = ? AND star_rating = ?`;
    try {
        const result = await client.execute(query, [product_id, star_rating], { prepare: true });
        res.json(result.rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// Запит 3: Return all reviews for specified customer_id
app.get('/reviews/customer/:customer_id', async (req, res) => {
    const customer_id = parseInt(req.params.customer_id);
    const query = `SELECT * FROM reviews WHERE customer_id = ?`;
    try {
        const result = await client.execute(query, [customer_id], { prepare: true });
        res.json(result.rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// Запуск сервера
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
