create database management_library;

CREATE TABLE Category (
    category_number INT NOT NULL auto_increment PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE Book (
    category_number INT NOT NULL,
    FOREIGN KEY (category_number)
        REFERENCES Category (category_number),
    book_number INT NOT NULL PRIMARY KEY,
    book_name VARCHAR(50) NOT NULL,
    publisher VARCHAR(50) NOT NULL,
    author VARCHAR(50) NOT NULL,
    publisher_year INT NOT NULL
);

CREATE TABLE Student (
    student_number VARCHAR(10) NOT NULL PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    address_line VARCHAR(100) NOT NULL,
    city VARCHAR(50) ,
    state VARCHAR(50),
    postcode VARCHAR(10) NOT NULL,
    email VARCHAR(15) NOT NULL,
    image VARBINARY(1000)
);

CREATE TABLE BorrowOrder (
    borrow_number VARCHAR(10) NOT NULL PRIMARY KEY,
    student_number VARCHAR(10) NOT NULL,
    FOREIGN KEY (student_number)
        REFERENCES Student (student_number),
    book_number INT NOT NULL,
    FOREIGN KEY (book_number)
        REFERENCES Book (book_number),
    borrow_date DATETIME NOT NULL,
    return_date DATE NOT NULL
);





