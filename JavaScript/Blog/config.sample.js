require('dotenv').config();

const config = {
  test: {
    jwtSecret: 'secret-password',
    db: {
      database: 'test',
      user: 'test',
      password: 'test',
      port: 3307,
      connectTimeout: 5000, // timeout, kui andmebaasiga ühendust ei saa
    },
  },
  development: {
    jwtSecret: 'secret-password',
    db: {
      database: 'todos',
      user: 'mrt',
      password: 'secret',
      port: 3306,
      connectTimeout: 5000, // timeout, kui andmebaasiga ühendust ei saa
    },
  },
};

const env = process.env.NODE_ENV || 'development';

module.exports = config[env];
