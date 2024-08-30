const endpointsList = (req, res) => res.status(200).json({
    success: true,
    message: 'API is running',
    endpoints: {
      posts: {
        comment: 'Posts endpoints',
        getAll: '/posts',
        getById: '/posts/:id',
      },
      users: {
        comment: 'Users endpoints',
        getAll: '/users',
        getById: '/users/:id',
      },
      statuses: {
        comment: 'Comments endpoints',
        getAll: '/comments',
        getById: '/comments/:id',
      },
      categories: {
        comment: 'Categories endpoints',
        getAll: '/categories',
        getById: '/categories/:id',
      },
      },
  });
  
  module.exports = { endpointsList };
