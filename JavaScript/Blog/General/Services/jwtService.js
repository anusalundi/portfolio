const jwt = require('jsonwebtoken');

const config = require('../../config');

const sign = (user) => {
    const payload = {
        id: user.id,
        role: user.role,
    };
    const token = jwt.sign(payload, config.jwtSecret, { expiresIn: '1h' });
    return token;
};

const verify = (token) => {
    try {
        const payload = jwt.verify(token, config.jwtSecret);
        return payload;
    } catch (error) {
        error.message = 'Token is not valid';
        error.code = 401;
        throw error;
    }
};

module.exports = { sign, verify };
