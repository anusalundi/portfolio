-- Andmete pärimine
-- Tagasta kõik kirjed kõikide veergudega
SELECT * FROM users;
SELECT * FROM posts;
SELECT * FROM categories;
SELECT * FROM comments;
-- Tagasta kõikide kasutajate id ja email
SELECT id, email FROM users;

--Tagastab kasutaja andmed emaili alusel
SELECT * FROM users WHERE email = 'jane@doe.ee';

-- Tagastab kasutaja email ja parool id alusel
SELECT email, password FROM users WHERE id = 2;

-- Tagastab ühe kasutaja kommentaarid
SELECT * FROM comments WHERE user_id = 3;

-- Andmete muutmine
-- UPDATE users SET password = 'Jane' WHERE id = 1 AND email = 'jane@doe.ee';

-- Andmete kustutamine
-- DELETE FROM users; -- kogu tabeli andmete kustutamine
-- DELETE FROM users WHERE id = 2 AND email = 'john@doe.ee';
