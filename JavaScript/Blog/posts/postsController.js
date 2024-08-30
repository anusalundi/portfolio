const postsService = require('./postsService');

// Kontrolleri funktsioon, mis küsib postituste nimekirja vastavast teenusest
// ja tagastab selle vastusena
const getAll = async (req, res, next) => {
  try {
    const userId = Number(req.query.userId);
  if(userId) {
    const posts = await postsService.getByuserId(userId);
    return res.status(200).json({
      success: true,
      message: 'List of posts by user id',
      posts,
  });
  };
    const posts = await postsService.getAll();
    return res.status(200).json({
        success: true,
        message: 'List of all posts',
        posts,
    });
  } catch (error) {
    return next(error);
  }
};

// Kontrolleri funktsioon, mis küsib postituse id alusel vastavast teenusest
// ja tagastab selle vastusena
const getById = async (req, res, next) => {
  try {
    const id = Number(req.params.id);
    const post = await postsService.getById(id);
    if (!post) {
      const error = new Error(`Post with id: ${id} does not exists`);
      error.code = 404;
      throw error;
    };
    if (post.user_id !== res.locals.id) {
      const error = new Error('You are not authorized to do this operation');
      error.code = 403;
      throw error;
    }
  
    return res.status(200).json({
      success: true,
      message: `Post with id: ${id} `,
      post,
      info: res.locals.message,
    });
  } catch (error) {
    return next(error);
  }
};
  
  // Kontrolleri funktsioon, mis loob uue postituse vastavalt saadud andmetele
  // ja tagastab vastusena eduka teate
  const create = async (req, res, next) => {
    try {
      const { title, content, categoryId } = req.body;
    if (!title || !content || !categoryId) {
      const error = new Error('Title, content or categoryId is missing');
      error.code = 400;
      throw error;
      };
      const newPost = {
      user_id: res.locals.id,
      title,
      content,
      categoryId,
    };
    const id = await postsService.create(newPost);
    if (!id) {
      throw new Error();
    }
    return res.status(201).json({
      success: true,
      message: 'New post is created',
      id,
    });
    } catch (error) {
      return next(error);
    }
  };

const deleteById = async (req, res, next) => {
  try {
    const id = Number(req.params.id);
    const post = await postsService.getById(id);
    if (!post) {
        const error = new Error(`Post with id: ${id} does not exist`);
        error.code = 404;
        throw error;
    }
    if (post.user_id !== res.locals.id) {
        const error = new Error('You are not authorized to do this operation');
        error.code = 403;
        throw error;
    }
    const deleted = await postsService.deleteById(id);
    if (!deleted) {
        throw new Error();
    }
    return res.status(200).json({
        success: true,
        message: `Post with id ${id} deleted`,
    });
  } catch (error) {
    return next(error);
  }
};

const update = async (req, res, next) => {
  try {
    const id = Number(req.params.id);
    const { title, content, categoryId } = req.body;
    const post = await postsService.getById(id);
    if (!post) {
        const error = new Error(`Post with id: ${id} does not exist`);
        error.code = 404;
        throw error;
    }
    if (post.user_id !== res.locals.id) {
        const error = new Error('You are not authorized to do this operation');
        error.code = 403;
        throw error;
    }
    const postToUpdate = {
      title: title || post.title,
      content: content || post.content,
      categoryId: categoryId || post.categoryId,
    };
    const result = await postsService.update(id, postToUpdate);
    if (!result) {
      throw new Error();
  }
  return res.status(200).json({
      success: true,
      message: `Post with id ${id} updated`,
  });
  } catch (error) {
    return next(error);
  }
};

module.exports = { getAll, getById, create, deleteById, update };
