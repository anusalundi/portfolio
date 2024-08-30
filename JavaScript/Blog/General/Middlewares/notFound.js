const notFound = (req, res, next) => res.status(404).json({
        success: false,
        message: `Not found`,
        resources: {
            ping: 'GET /ping',
            posts: {
            'All posts': 'GET / posts',
            'Post by ID': 'GET /posts/:id',
            'Create post': 'POST /posts',

            'All users': 'GET / users',
            'User by ID': 'GET /users/:id',
            'Create user': 'POST /users',
            
            'All comments': 'GET / comments',
            'Comment by ID': 'GET /comments/:id',
            'Create comment': 'POST /comments',
            },
    },
});

module.exports = notFound;
