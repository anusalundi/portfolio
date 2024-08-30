const express = require('express');
const categoriesController = require('./categoriesController');
const checkIfIdIsNumber = require('../General/middlewares/checkIfIdIsNumber');

const categoriesRouter = express.Router();

// Kategooriatega seotud endpoindid
categoriesRouter.get('/', categoriesController.getAll);
categoriesRouter.get('/:id', checkIfIdIsNumber, categoriesController.getById);

module.exports = categoriesRouter;
