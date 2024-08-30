const categories = require('./categories');

function getAll() {
  return categories;
}

function getById(id) {
  let category = null;
  for (let i = 0; i < categories.length; i += 1) {
    if (categories[i].id === id) {
      category = categories[i];
      break;
    }
  }
  return category;
}

module.exports = { getAll, getById };
