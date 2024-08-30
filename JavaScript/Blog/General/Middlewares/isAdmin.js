const isAdmin = (req, res, next) => {
if (res.locals.role !== 'admin') {
        const error = new Error('You have to be admin to access this resource');
        error.code = 403;
        return next(error);
        }
    return next();
};

module.exports = isAdmin;
