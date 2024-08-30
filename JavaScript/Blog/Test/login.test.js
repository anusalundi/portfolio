const request = require('supertest');
const { describe, it } = require('mocha');
const { expect } = require('chai');
const app = require('../app');

describe('Login endpoint', () => {
  const user = {
    email: 'user@user.ee',
    password: 'user',
  };

  const wrongUser = {
    email: 'non@existing.ee',
    password: 'password',
  };

  const wrongUserResponse = {
    success: false,
    message: 'Wrong e-mail or password',
  };

  describe('Input validation', () => {
    it('Should respond with 401 and error message because of no password', async () => {
      const response = await request(app).post('/users/login').send({ email: user.email });
      expect(response.statusCode).equal(401);
      expect(response.body.message).equal('E-mail and password are required');
    });

    it('Should respond with 401 and error message because of no email', async () => {
      const response = await request(app).post('/users/login').send({ password: user.password });
      expect(response.statusCode).equal(401);
      expect(response.body.message).equal('E-mail and password are required');
    });

    it('Should respond with 401 and error message because of no email and password', async () => {
      const response = await request(app).post('/users/login').send({});
      expect(response.statusCode).equal(401);
      expect(response.body.message).equal('E-mail and password are required');
    });
  });

  describe('Authentication', () => {
    it('Should respond with 401 and error message because of nonexisting user', async () => {
      const response = await request(app).post('/users/login').send(wrongUser);
      expect(response.statusCode).equal(401);
      expect(response.body).deep.equal(wrongUserResponse);
    });

    it('Should respond with 401 and error message because of wrong password', async () => {
      const response = await request(app).post('/users/login').send({ email: user.email, password: 'wrong' });
      expect(response.statusCode).equal(401);
      expect(response.body.message).equal('Wrong e-mail or password');
    });

    it('Should respond with 200 and with token for valid credentials', async () => {
      const response = await request(app).post('/users/login').send(user);
      expect(response.statusCode).equal(200);
      expect(response.body).to.have.property('token');
      expect(response.body.token).to.be.a('string');
    });
  });
});
