CREATE DATABASE library;
USE library;

CREATE TABLE categories (
	id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE producer (
	id INT AUTO_INCREMENT PRIMARY KEY,
    producer_name VARCHAR(50) NOT NULL,
    produce_year YEAR,
    author_name VARCHAR(50),
    publish_times INT NOT NULL
);

CREATE TABLE address (
	id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(40) NOT NULL,
    ward VARCHAR(40) NOT NULL,
    district VARCHAR(40),
    city_or_province VARCHAR(40) NOT NULL
);

CREATE TABLE student (
	id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    birth_of_date DATE NOT NULL,
    book_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    image VARCHAR(255),
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES address(id)
);

CREATE TABLE library_card (
	id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES student(id)
);

CREATE TABLE book (
	id INT AUTO_INCREMENT PRIMARY KEY,
    price DOUBLE NOT NULL,
    producer_id INT,
    category_id INT,
    FOREIGN KEY (producer_id) REFERENCES producer(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE librarian (
	id INT AUTO_INCREMENT PRIMARY KEY,
    librarian_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES address(id)
);

CREATE TABLE register_to_borrow (
	id INT AUTO_INCREMENT PRIMARY KEY,
    register_date DATE NOT NULL,
    book_id INT,
    student_id INT,
    FOREIGN KEY (book_id) REFERENCES book(id),
    FOREIGN KEY (student_id) REFERENCES student(id)
);

CREATE TABLE slip_borrow (
	id INT AUTO_INCREMENT PRIMARY KEY,
    date_borrow DATE NOT NULL,
    book_return_date DATE NOT NULL, 
    CHECK (book_return_date >= date_borrow),
    actual_return_date DATE NOT NULL,
    CHECK (actual_return_date <= book_return_date),
    student_id INT,
    book_id INT,
    librarian_id INT,
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (book_id) REFERENCES book(id),
    FOREIGN KEY (librarian_id) REFERENCES librarian(id)
);




