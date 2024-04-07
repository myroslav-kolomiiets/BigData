import express from 'express';
import bodyParser from 'body-parser';

import {books} from './books.mjs';

const app = express();
const PORT = 3000;


app.use(bodyParser.json());

app.get('/books', (req, res) => {
    let result = [...books];

    if (req.query.author) {
        result = result.filter(book => book.author === req.query.author);
    }

    if (req.query.year) {
        result = result.filter(book => book.year === req.query.year);
    }

    if (req.query.genre) {
        result = result.filter(book => book.genre === req.query.genre);
    }

    res.json(result);
});

app.get('/books/:id', (req, res) => {
    const book = books.find(book => book.id === parseInt(req.params.id));
    if (book) {
        res.json(book);
    } else {
        res.status(404).json({error: 'Book not found'});
    }
});

app.post('/books', (req, res) => {
    const newBook = {
        id: books.length + 1,
        title: req.body.title,
        author: req.body.author,
        year: req.body.year,
        genre: req.body.genre
    };

    books.push(newBook);

    res.json(newBook);
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
