DROP SCHEMA test;

CREATE SCHEMA test;

USE test;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(10) DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL
);

CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Users andmed

INSERT INTO users (firstName, lastName, email, password, role) VALUES
('Admin', 'Admin', 'admin@admin.ee', '$2b$10$YtX0jAxzwouT37mydNHwjOs5.qzc.s5lrMMYrOHZgVosal1bYpXBC', 'admin'),
('User', 'User', 'user@user.ee', '$2b$10$J7xTk5m97yK4agISAYBTxe2VVVVM6rP7kEhl679IW8/OBYYRCl/sq', 'user');


-- POSTS andmed

INSERT INTO posts (user_id, title, content, category_id) VALUES
    (1, 'Minust endast', 'Siin on mingi ilgelt pikk tekst, mis kirjeldab sisu', 3),
    (4, 'Esimene reis', 'Siin on mingi ilgelt pikk tekst, mis kirjeldab sisu', 2),
    (4, 'Kreeka saared', 'Siin on mingi ilgelt pikk tekst, mis kirjeldab sisu', 2),
    (5, 'Lihtne suvine salat', 'Siin on mingi ilgelt pikk tekst, mis kirjeldab sisu', 1);
    
