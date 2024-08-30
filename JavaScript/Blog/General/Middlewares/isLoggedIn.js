const jwtService = require('../services/jwtService');

const isLoggedIn = (req, res, next) => {
  const token = req.headers.authorization?.split(' ')[1];
  if (!token) {
    const error = new Error('Token is not provided');
    error.code = 401;
    return next(error);
  }
  const payload = jwtService.verify(token);
  res.locals = payload;
  return next();
};

module.exports = isLoggedIn;
