DROP TABLE IF EXISTS books;
CREATE TABLE books (
    book_id INT(10) NOT NULL AUTO_INCREMENT,
    book_name VARCHAR(50),
    library_name VARCHAR(50),
    PRIMARY KEY (book_id)
);

INSERT INTO books (book_name, library_name) VALUES ('Max und Moritz', 'Berlin');
INSERT INTO books (book_name, library_name) VALUES ('Tom und Jerry', 'Berlin');

DROP TABLE IF EXISTS libraries;
CREATE TABLE libraries (
    library_id INT(10) NOT NULL AUTO_INCREMENT,
    library_location VARCHAR(50),
    PRIMARY KEY (library_id),
    fk_book_id INT(10) NOT NULL,
    CONSTRAINT fk_book_id FOREIGN KEY (fk_book_id) REFERENCES books (book_id)
);

INSERT INTO libraries (library_location, fk_book_id) VALUES ('Berlin', 1);
INSERT INTO libraries (library_location, fk_book_id) VALUES ('Berlin', 2);
INSERT INTO libraries (library_location, fk_book_id) VALUES ('Dresden', 2);
