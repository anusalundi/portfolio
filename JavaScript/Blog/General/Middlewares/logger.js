// Logimise middleware
const logger = (req, res, next) => {
    const now = new Date();
    console.log(req.url, req.method, now.toLocaleDateString(), now.toLocaleTimeString());
    return next();
  };

  module.exports = logger;
