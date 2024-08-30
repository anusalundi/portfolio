const express = require('express');
const ping = require('./pingController');

const pingRouter = express.Router();

pingRouter.get('/', ping);

module.exports = pingRouter;
