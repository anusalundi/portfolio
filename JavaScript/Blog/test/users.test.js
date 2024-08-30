const request = require('supertest');
const { describe, it, before } = require('mocha');
const { expect } = require('chai');
const app = require('../app');
const { setupTestDatabase } = require('../testDbSetup');

describe('Users Controller', function() {
  let userToken;
  let adminToken;

  const user = {
    email: 'user@user.ee',
    password: 'user',
  };

  const admin = {
    email: 'admin@admin.ee',
    password: 'admin',
  };

  before(async () => {
    await setupTestDatabase();
    const responseUser = await request(app).post('/users/login').send(user);
    userToken = responseUser.body.token;
    const responseAdmin = await request(app).post('/users/login').send(admin);
    adminToken = responseAdmin.body.token;
  });

  describe('GET /users', () => {
    it('Should response 401 and error message because user is not logged in', async () => {
      const response = await request(app).get('/users');
      expect(response.statusCode).equal(401);
      expect(response.body.message).equal('Token is not provided');
    });

    it('Should response 403 and error message because user is not admin', async () => {
      const response = await request(app)
        .get('/users')
        .set('Authorization', `Bearer ${userToken}`);
      expect(response.statusCode).equal(403);
      expect(response.body.message).equal('You have to be admin to access this resource');
    });

    it('Should response 200 and array of users', async () => {
      const response = await request(app)
        .get('/users')
        .set('Authorization', `Bearer ${adminToken}`);
      expect(response.statusCode).equal(200);
      expect(response.body.users).to.be.an('array');
      expect(response.body.users.length).equal(2);
    });
  });

  describe('GET /users/:id', () => {
    it('Should response 200 and user object', async () => {
      const response = await request(app)
        .get('/users/1')
        .set('Authorization', `Bearer ${adminToken}`);
      expect(response.statusCode).equal(200);
      expect(response.body.user).to.be.an('object');
      expect(response.body.user.id).equal(1);
    });

    it('Should response 404 and error message because user not found', async () => {
      const response = await request(app)
        .get('/users/3')
        .set('Authorization', `Bearer ${adminToken}`);
      expect(response.statusCode).equal(404);
      expect(response.body.message).equal('User not found');
    });

    it('Should response 400 and error message because user id is not a number', async () => {
      const response = await request(app)
        .get('/users/abc')
        .set('Authorization', `Bearer ${adminToken}`);
      expect(response.statusCode).equal(400);
      expect(response.body.message).equal('Id must be a number');
    });
  });

  describe('POST /users', () => {
    it('Should response 201 and user id', async () => {
      const response = await request(app)
        .post('/users')
        .send({
          firstName: 'Test',
          lastName: 'User',
          email: 'test@user.ee',
          password: 'test',
        });
      expect(response.statusCode).equal(201);
      expect(response.body.id).equal(3);
    });

    it('Created user should have user role', async () => {
      const response = await request(app)
        .get('/users/3')
        .set('Authorization', `Bearer ${adminToken}`);
      expect(response.statusCode).equal(200);
      expect(response.body.user.role).equal('user');
    });

    it('Should response 400 and error message because all fields are required (missing password)', async () => {
      const response = await request(app)
        .post('/users')
        .send({
          firstName: 'Test',
          lastName: 'User',
          email: 'test@user.ee',
        });
      expect(response.statusCode).equal(400);
      expect(response.body.message).equal('All fields are required');
    });

    it('Should response 400 and error message because all fields are required (missing email)', async () => {
      const response = await request(app)
        .post('/users')
        .send({
          firstName: 'Test',
          lastName: 'User',
          password: 'test',
        });
      expect(response.statusCode).equal(400);
      expect(response.body.message).equal('All fields are required');
    });

    it('Should response 400 and error message because all fields are required (missing firstName)', async () => {
      const response = await request(app)
        .post('/users')
        .send({
          lastName: 'User',
          email: 'test@user.ee',
          password: 'test',
        });
      expect(response.statusCode).equal(400);
      expect(response.body.message).equal('All fields are required');
    });

    it('Should response 400 and error message because all fields are required (missing lastName)', async () => {
      const response = await request(app)
        .post('/users')
        .send({
          firstName: 'Test',
          email: 'test@user.ee',
          password: 'test',
        });
      expect(response.statusCode).equal(400);
      expect(response.body.message).equal('All fields are required');
    });

    it('Should response 400 and error message because email is already in use', async () => {
      const response = await request(app)
        .post('/users')
        .send({
          firstName: 'Test',
          lastName: 'User',
          email: 'test@user.ee',
          password: 'test',
        });
      expect(response.statusCode).equal(400);
      expect(response.body.message).equal('E-mail is already in use');
    });
  });

  describe('Authentication', () => {
    it('Should response 401 and error message because of invalid token', async () => {
      const response = await request(app)
        .get('/users')
        .set('Authorization', 'Bearer klajsdflksajdfkljsadflkjslkdfj');
      expect(response.statusCode).equal(401);
      expect(response.body.message).equal('Token is not valid');
    });
  });
});
