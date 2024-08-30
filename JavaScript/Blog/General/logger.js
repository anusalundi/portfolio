const { createLogger, format, transports } = require('winston');
const { combine, timestamp, printf, errors } = format;

// Kohandatud logi formaat
const logFormat = printf(({
  // eslint-disable-next-line no-shadow
  level, message, timestamp, stack,
}) => `${timestamp} ${level}: ${stack || message}`);

const logger = createLogger({
  level: 'info', // Logi tase - info, error, warn, debug
  format: combine(
    timestamp(),
    errors({ stack: true }), // Logi veateated koos stack trace'iga
    logFormat // Kohandatud logi formaat
  ),
  transports: [ // Transpordid - kuhu logitakse
    new transports.Console(), // Logi konsooli
    new transports.File({ filename: './logs/combined.log' }), // Salvesta kõik logid faili nimega 'combined.log'
    new transports.File({ filename: './logs/errors.log', level: 'error' }), // Salvesta ainult veateated faili nimega 'errors.log'
  ],
});

module.exports = logger;
