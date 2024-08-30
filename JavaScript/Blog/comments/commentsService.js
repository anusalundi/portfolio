// Teenuste funktsioonid, mis suhtlevad 'andmebaasiga' ja tagastavad vastavad andmed
const comments = require('./comments');

// Funktsioon, mis tagastab kõik tegevused
function getAll() {
    return comments;
}

// Funktsioon, mis tagastab tegevuse vastavalt id-le
function getById(id) {
    let comment = null; 
    for (let i = 0; i < comments.length; i += 1) {
        if (comments[i].id === id) {
            comment = comments[i];
            break;
        }
    }
    return comment;
}

// Funktsioon, mis loob uue tegevuse vastavalt saadud andmetele
function create(newComment) {
    // eslint-disable-next-line no-param-reassign
    newComment.isDone = false;
    comments.push(newComment); // Lisame uue tegevuse "andmebaasi"
    return true;
  }

module.exports = { getAll, getById, create };
