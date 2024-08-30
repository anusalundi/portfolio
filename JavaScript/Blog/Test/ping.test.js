const request = require('supertest');
const { describe, it } = require('mocha');
const { expect } = require('chai');
const app = require('../app');

const pong = {
    success: true,
    message: 'Pong',
};

describe('Ping endpoint', async () => {
    it('Should return 200 with message', async () => {
        const response = await request(app).get('/ping');
        expect(response.statusCode).equal(200);
        expect(response.body).deep.equal(pong);
    });
});
