const usersService = require('./usersService');
const hashService = require('../General/services/hashService');
const jwtService = require('../General/services/jwtService');

const getAll = async (req, res, next) => {
  try {
    const users = await usersService.getAll();
    return res.status(200).json({
      success: true,
      message: 'List of users',
      users,
    });
  } catch (error) {
    return next(error);
  }
};

const getById = async (req, res, next) => {
  try {
    const id = Number(req.params.id);
    const user = await usersService.getById(id);
    if (!user) {
      const error = new Error('User not found');
      error.code = 404;
      throw error;
    }
    return res.status(200).json({
      success: true,
      message: 'User by id',
      user,
    });
  } catch (error) {
    return next(error);
  }
};

const create = async (req, res, next) => {
  try {
    const {
      firstName, lastName, email, password,
    } = req.body;
    if (!firstName || !lastName || !email || !password) {
      const error = new Error('All fields are required');
      error.code = 400;
      throw error;
    }
    const user = await usersService.getByEmail(email);
    if (user) {
      const error = new Error('E-mail is already in use');
      error.code = 400;
      throw error;
    }
    const id = await usersService.create({
      firstName,
      lastName,
      email,
      password,
    });
    return res.status(201).json({
      success: true,
      message: 'User created',
      id,
    });
  } catch (error) {
    return next(error);
  }
};

const login = async (req, res, next) => {
  try {
    const { email, password } = req.body;
    if (!email || !password) {
      const error = new Error('E-mail and password are required');
      error.code = 401;
      throw error;
    }
    const user = await usersService.getByEmail(email);
    if (!user) {
      const error = new Error('Wrong e-mail or password');
      error.code = 401;
      throw error;
    }
    const match = await hashService.match(password, user.password);
    if (!match) {
      const error = new Error('Wrong e-mail or password');
      error.code = 401;
      throw error;
    }
    const token = jwtService.sign(user);
    return res.status(200).json({
      success: true,
      message: 'Logged in',
      token,
    });
  } catch (error) {
    return next(error);
  }
};

module.exports = { getAll, getById, create, login };
