const logger = require('../logger');
const errorHandler = (err, req, res, next) => {
    logger.error(err.message, { stack: err.stack });
    if (!err.code || !Number(err.code)) {
        err.code = 500,
        err.message = 'Server error';
    }

    return res.status(err.code).json({
        success: false,
        message: err.message,
    });
};

module.exports = errorHandler;
