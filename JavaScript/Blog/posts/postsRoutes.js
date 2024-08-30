const express = require('express');
const postsController = require('./postsController');
const checkIfIdIsNumber = require('../General/middlewares/checkIfIdIsNumber');

const postsRouter = express.Router();

// Postitamistega seotud endpoindid - vastava endpunkti jaoks kasutame vastavat controllerit
postsRouter.get('/', postsController.getAll);
postsRouter.get('/:id', checkIfIdIsNumber, postsController.getById);
postsRouter.post('/', postsController.create);
postsRouter.delete('/:id', checkIfIdIsNumber, postsController.deleteById);
postsRouter.patch('/:id', checkIfIdIsNumber, postsController.update);

module.exports = postsRouter;
