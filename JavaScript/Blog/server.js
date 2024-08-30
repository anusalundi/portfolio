const logger = require('./General/logger');
const app = require('./app');
const port = 3000;

app.listen(port, () => {
    logger.info(`Server is running on http://localhost:${port}/ping`);
});
