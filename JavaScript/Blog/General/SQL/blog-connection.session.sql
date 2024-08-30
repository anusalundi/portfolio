DROP SCHEMA blog;

CREATE SCHEMA blog;

USE blog;

-- Kasutajate tabel
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabeli muutmine - veeru lisamine
ALTER TABLE users ADD COLUMN password VARCHAR(255);
ALTER TABLE users ADD COLUMN firstName VARCHAR(50);
ALTER TABLE users ADD COLUMN lastName VARCHAR(50);

-- Kategooriate tabel
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50)
);

-- Blogi postituste tabel
CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(50),
    content TEXT,
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Kommentaaride tabel
CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    post_id INT,
    content TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (post_id) REFERENCES posts(id)
);

-- Andmete sisestamine users tabelisse
INSERT INTO users (email, password) VALUES ('jane@doe.ee', 'jane');
INSERT INTO users (email, password) VALUES ('john@doe.ee', 'john');
INSERT INTO users (email, password, firstName, lastName) VALUES ('john@doe.ee', 'john', 'John', 'Doe');
INSERT INTO users (email, password, firstName, lastName) VALUES ('admin@admin.ee', '$2b$10$9kYE7hDc488F85j/l0TUwOQOW5ZOJ9vPaUkG0KhP9chKRBkq49O.y', 'Ad', 'Min');
INSERT INTO users (email, password, firstName, lastName) VALUES ('mari@mail.ee', 'mari123', 'Mari', 'Maasikas');
INSERT INTO users (email, password, firstName, lastName) VALUES ('jyri@mail.ee', 'jyri123', 'Jüri', 'Juurikas');

-- Andmete sisestamine postituste tabelisse
INSERT INTO posts (user_id, title, content, category_id) VALUES (1, 'Minust endast', 'Siin on mingi ilgelt pikk tekst, mis kirjeldab sisu', 3);
INSERT INTO posts (user_id, title, content, category_id) VALUES (4, 'Esimene reis', 'Siin on mingi ilgelt pikk tekst, mis kirjeldab sisu', 2);
INSERT INTO posts (user_id, title, content, category_id) VALUES (4, 'Kreeka saared', 'Siin on mingi ilgelt pikk tekst, mis kirjeldab sisu', 2);
INSERT INTO posts (user_id, title, content, category_id) VALUES (5, 'Lihtne suvine salat', 'Siin on mingi ilgelt pikk tekst, mis kirjeldab sisu', 1);

-- Andmete sisestamine kategooriate tabelisse
INSERT INTO categories (title) VALUES ('Kokandus');
INSERT INTO categories (title) VALUES ('Reisikirjad');
INSERT INTO categories (title) VALUES ('Sisekujundus');

-- Andmete sisestamine kommentaaride tabelisse
INSERT INTO comments (user_id, post_id, content) VALUES (3, 1, 'See on kindlasti blogi, mida ma jälgima hakkan!');
INSERT INTO comments (user_id, post_id, content) VALUES (3, 2, 'Ma olen ka seal käinud, väga äge riik tõesti');
INSERT INTO comments (user_id, post_id, content) VALUES (4, 3, 'Tekkis täiega isu ka samasugune trip ette võtta');
INSERT INTO comments (user_id, post_id, content) VALUES (3, 4, 'proovisin, tõesti maitsev');
INSERT INTO comments (user_id, post_id, content) VALUES (1, 2, 'nii ilusti kirjeldad');
