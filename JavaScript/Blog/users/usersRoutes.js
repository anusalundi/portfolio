const express = require('express');
const usersController = require('./usersController');
const checkIfIdIsNumber = require('../General/middlewares/checkIfIdIsNumber');
const isLoggedIn = require('../General/middlewares/isLoggedIn');
const isAdmin = require('../General/middlewares/isAdmin');

const usersRouter = express.Router();

// Kasutajatega seotud endpoindid 
usersRouter.post('/login', usersController.login);
usersRouter.post('/', usersController.create);
usersRouter.use(isLoggedIn);
usersRouter.use(isAdmin);
usersRouter.get('/', usersController.getAll);
usersRouter.get('/:id', checkIfIdIsNumber, usersController.getById);

module.exports = usersRouter;
