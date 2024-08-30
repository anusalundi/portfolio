const categoriesService = require('./categoriesService');

const getAll = (req, res) => {
  const categories = categoriesService.getAll();
  return res.status(200).json({
    success: true,
    categories,
  });
};

const getById = (req, res) => {
  const id = Number(req.params.id);
  if(isNaN(id)) {
    return res.status(400).json({
      success: false,
      message: 'Id must be a number',
    });
  };

  const category = categoriesService.getById(id);
  if (!category) {
    return res.status(404).json({
      success: false,
      message: `Category with id: ${id}`,
    });
  };

  return res.status(200).json({
    success: true,
    message: `Category id: ${id}`,
    category,
  });
};

module.exports = { getAll, getById };
