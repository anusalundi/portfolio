const request = require('supertest');
const { describe, it } = require('mocha');
const { expect } = require('chai');
const app = require('../app');
const { setupTestDatabase } = require('../testDbSetup'); 

let userToken;
let adminToken;
const nonexistentId = 999999;

const user = {
    email: 'user@user.ee',
    password: 'user',
};

const admin = {
    email: 'admin@admin.ee',
    password: 'admin',
};

const testPost = {
  title: 'Test Post',
  description: 'This is a test post',
  user_id: 2
};

let createdPostId;

before(async () => {
    await setupTestDatabase();
    const responseUser = await request(app).post('/users/login').send(user);
    userToken = responseUser.body.token;
    const responseAdmin = await request(app).post('/users/login').send(admin);
    adminToken = responseAdmin.body.token;
});


describe('Posts endpoint', async () => {
  describe('POST /posts', () => {
    it('should create a new post', async () => {
      const response = await request(app)
        .post('/posts')
        .send(testPost)
        .set('Authorization', `Bearer ${userToken}`);

      expect(response.status).to.equal(201);
      expect(response.body.success).to.be.true;
      expect(response.body.message).to.equal('New post is created');
      expect(response.body.id).to.be.a('number');
      createdPostId = response.body.id;
    });

    it('should return 400 if title is missing', async () => {
      const response = await request(app)
        .post('/posts')
        .send({ description: 'Description without title' })
        .set('Authorization', `Bearer ${userToken}`);

      expect(response.status).to.equal(400);
      expect(response.body.success).to.be.false;
      expect(response.body.message).to.equal('Title is required');
    });
  });

  describe('GET /posts', () => {
    it('should return all posts', async () => {
      const response = await request(app)
        .get('/posts')
        .set('Authorization', `Bearer ${userToken}`);

      expect(response.status).to.equal(200);
      expect(response.body.success).to.be.true;
      expect(response.body.message).to.equal('List of all posts');
      expect(response.body.posts).to.be.an('array');
      expect(response.body.posts.length).to.be.at.least(1);
    });
  });

  describe('GET /posts/:id', () => {
    it('should return a specific post', async () => {
      const response = await request(app)
        .get(`/posts/${createdPostId}`)
        .set('Authorization', `Bearer ${userToken}`);

      expect(response.status).to.equal(200);
      expect(response.body.success).to.be.true;
      expect(response.body.message).to.equal(`Post with id: ${createdPostId}`);
      expect(response.body.post).to.include(testPost);
    });
    it('should return 404 if post not found', async () => {
      const response = await request(app)
        .get(`/posts/${nonexistentId}`)
        .set('Authorization', `Bearer ${userToken}`);

      expect(response.status).to.equal(404);
      expect(response.body.success).to.be.false;
      expect(response.body.message).to.equal(`Post with id: ${nonexistentId} does not exist`);
    });
    it('should return 403 if user is not the owner of the post', async () => {
      const response = await request(app)
        .get('/posts/5')
        .set('Authorization', `Bearer ${userToken}`);
      expect(response.status).to.equal(403);
      expect(response.body.success).to.be.false;
      expect(response.body.message).to.equal('You are not authorized to do this operation');
    });
  });

  describe('PATCH /posts/:id', () => {
    it('should update a post', async () => {
      const updateData = { title: 'Updated Test Post' };
      const response = await request(app)
        .patch(`/posts/${createdPostId}`)
        .send(updateData)
        .set('Authorization', `Bearer ${userToken}`);
      expect(response.status).to.equal(200);
      expect(response.body.success).to.be.true;
      expect(response.body.message).to.equal(`Post with id: ${createdPostId} updated`);

      const updatedPost = await request(app)
        .get(`/posts/${createdPostId}`)
        .set('Authorization', `Bearer ${userToken}`);
      expect(updatedPost.body.post.title).to.equal(updateData.title);
    });
    it('should return 404 if post not found', async () => {
      const response = await request(app)
        .patch(`/posts/${nonexistentId}`)
        .send({ title: 'This should fail' })
        .set('Authorization', `Bearer ${userToken}`);
      expect(response.status).to.equal(404);
      expect(response.body.success).to.be.false;
      expect(response.body.message).to.equal(`Post with id: ${nonexistentId} does not exist`);
    });
    it('should return 403 if user is not the owner of the post', async () => {
      const response = await request(app)
        .patch('/posts/5')
        .send({ title: 'This should fail' })
        .set('Authorization', `Bearer ${userToken}`);
      expect(response.status).to.equal(403);
      expect(response.body.success).to.be.false;
      expect(response.body.message).to.equal('You are not authorized to do this operation');
    });
  });

  describe('DELETE /posts/:id', () => {
    it('should delete a post', async () => {
      const response = await request(app)
        .delete(`/posts/${createdPostId}`)
        .set('Authorization', `Bearer ${userToken}`);

      expect(response.status).to.equal(200);
      expect(response.body.success).to.be.true;
      expect(response.body.message).to.equal(`Post with id: ${createdPostId} deleted`);

      // Verify the deletion
      const deletedPost = await request(app)
        .get(`/posts/${createdPostId}`)
        .set('Authorization', `Bearer ${userToken}`);
      expect(deletedPost.status).to.equal(404);
    });

    it('should return 403 if user is not the owner of the post', async () => {
      const response = await request(app)
        .delete('/posts/5')
        .set('Authorization', `Bearer ${userToken}`);
      expect(response.status).to.equal(403);
      expect(response.body.success).to.be.false;
      expect(response.body.message).to.equal('You are not authorized to do this operation');
    });

    it('should return 404 if post not found', async () => {
      const response = await request(app)
        .delete(`/posts/${nonexistentId}`)
        .set('Authorization', `Bearer ${userToken}`);
      expect(response.status).to.equal(404);
      expect(response.body.success).to.be.false;
      expect(response.body.message).to.equal(`Post with id: ${nonexistentId} does not exist`);
    });
  });
});
