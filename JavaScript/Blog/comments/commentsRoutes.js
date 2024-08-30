const express = require('express');
const commentsController = require('./commentsController');
const checkIfIdIsNumber = require('../General/middlewares/checkIfIdIsNumber');

const commentsRouter = express.Router();

// Kommentaaridega seotud endpoindid 
commentsRouter.get('/', commentsController.getAll);
commentsRouter.get('/:id', checkIfIdIsNumber, commentsController.getById);
commentsRouter.post('/', commentsController.create);

module.exports = commentsRouter;
