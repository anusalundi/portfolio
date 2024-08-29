require('dotenv').config();
const express = require('express');
const morgan = require('morgan');
const generalController = require('./general/generalController');
const logger = require('./General/logger');
const notFound = require('./General/middlewares/notFound');
const postsRouter = require('./posts/postsRoutes');
const usersRouter = require('./users/usersRoutes');
const commentsRouter = require('./comments/commentsRoutes');
const categoriesRouter = require('./categories/categoriesRoutes');
const pingRouter = require('./General/services/pingRoutes');
const isLoggedIn = require('./General/middlewares/isLoggedIn');
const errorHandler = require('./General/middlewares/errorHandler');

const app = express();

if (process.env.NODE_ENV !== 'test') {
  app.use(morgan('combined', { stream: { write: (message) => logger.info(message.trim()) } }));
}

// Middleware
app.use(express.json());

// Ping teekonna registreerimine
app.use('/ping', pingRouter);

app.use('/users', usersRouter);

app.use(isLoggedIn);

app.use('/posts', postsRouter);
app.use('/comments', commentsRouter);
app.use('/categories', categoriesRouter);

// '/' endpoint, mis tagastab API endpointide nimekirja
app.get('/', generalController.endpointsList);

//nn lõpp-peatus
app.use('*', notFound);

// Veahalduse vahevara
app.use(errorHandler);

module.exports = app;
