const commentsService = require('./commentsService');

// Kontrolleri funktsioon, mis küsib kommentaaride nimekirja vastavast teenusest
// ja tagastab selle vastusena
const getAll = (req, res) => {
  const comments = commentsService.getAll();
  return res.status(200).json({
    success: true,
    comments,
  });
};

// Kontrolleri funktsioon, mis küsib kommentaari id alusel vastavast teenusest
// ja tagastab selle vastusena
const getById = (req, res) => {
  const id = Number(req.params.id);
  if(isNaN(id)) {
    return res.status(400).json({
      success: false,
      message: 'Id must be a number',
    });
  };

  const comment = commentsService.getById(id);
  if (!comment) {
    return res.status(404).json({
      success: false,
      message: `Comment with id: ${id} does not exists`,
    });
  };

  return res.status(200).json({
    success: true,
    message: `Comment with id: ${id}`,
    comment,
  });
};

// Kontrolleri funktsioon, mis loob uue kommentaari vastavalt saadud andmetele
// ja tagastab vastusena eduka teate
const create = (req, res) => {
  const newComment = req.body;
  commentsService.create(newComment);

  return res.status(200).json({
    success: true,
    message: 'Response to POST method',
  });
};

module.exports = { getAll, getById, create };
