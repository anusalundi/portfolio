// ID kontrollimise middleware
const checkIfIdIsNumber = (req, res, next) => {
  try {
    const id = Number(req.params.id);
    if (Number.isNaN(id)) {
      const error = new Error('Id must be a number');
      error.code = 400;
      throw error;
    }
    return next();
  } catch (error) {
    return next(error);
  }
};

module.exports = checkIfIdIsNumber;
