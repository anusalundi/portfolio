// Teenuste funktsioonid, mis suhtlevad 'andmebaasiga' ja tagastavad vastavad andmed
const db = require('../db');

// Funktsioon, mis tagastab kõik postitused
const getAll = async () => {
        const [result] = await db.query('SELECT * FROM posts WHERE deleted_at IS NULL;');
        return result;
};

// Funktsioon, mis tagastab postituse vastavalt id-le
const getById = async (id) => {
        const [result] = await db.query('SELECT * FROM posts WHERE id = ? AND deleted_at IS NULL;', [id]);
        return result[0];
    };

// Funktsioon, mis loob uue postituse vastavalt saadud andmetele
const create = async (newPost) => {
        const [result] = await db.query('INSERT INTO posts SET ?;', [newPost]);
        return result.insertId;
};

  const getByuserId = (userId) => {
    const postsByUserId = posts.filter((post) => {
        return post.userId >= userId;
    });
    return postsByUserId;
  };

  const deleteById = async (id) => {
        await db.query('UPDATE posts SET deleted_at = NOW() WHERE id = ?;', [id]);
        return true;
  };

  const update = async (id, post) => {
    await db.query('UPDATE posts SET ? WHERE id = ?;', [post, id]);
    return true;
  };

module.exports = { getAll, getById, create, getByuserId, deleteById, update };
