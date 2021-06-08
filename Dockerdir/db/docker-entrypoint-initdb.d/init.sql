DROP TABLE IF EXISTS libraries;
CREATE TABLE libraries (
    library_id INT(10) NOT NULL AUTO_INCREMENT,
    library_location VARCHAR(50),
    PRIMARY KEY (library_id)
);

INSERT INTO libraries (library_location) VALUES ('Berlin');
INSERT INTO libraries (library_location) VALUES ('Dresden');

DROP TABLE IF EXISTS books;
CREATE TABLE books (
    book_id INT(10) NOT NULL AUTO_INCREMENT,
    book_name VARCHAR(50),
    PRIMARY KEY (book_id),
    library_id INT(10) NOT NULL,
    CONSTRAINT fk_library_id FOREIGN KEY (library_id) REFERENCES libraries (library_id)
);

INSERT INTO books (book_name, library_id) VALUES ('Max und Moritz', 1);
INSERT INTO books (book_name, library_id) VALUES ('Tom und Jerry', 2);
