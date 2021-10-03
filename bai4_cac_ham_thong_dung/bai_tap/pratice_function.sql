create database pratice_functionSQL;

CREATE TABLE sinhvien (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    TEN VARCHAR(20) NOT NULL,
    TUOI INT NOT NULL,
    KHOAHOC VARCHAR(20) NOT NULL,
    SOTIEN DOUBLE
);

insert into sinhvien (TEN,TUOI,KHOAHOC,SOTIEN) values
('Hoang', 21, 'CNTT',400000),
('Viet', 19, 'DTVT', 320000),
('Thanh', 18,'KTDN',400000),
('Nhan', 19, 'CK',450000),
('Huong',20,'TCNH',500000),
('Huong',20,'TCNH',200000);
-- Hiển thị các dòng có tên Huong
SELECT 
    *
FROM
    sinhvien
WHERE
    TEN = 'Huong';
-- Tính tổng tiền của Huong
SELECT 
    TEN, SUM(SOTIEN) AS amount
FROM
    sinhvien
WHERE
    TEN = 'Huong';
-- Lấy ra dsach của tất cả sinh viên
-- c1
SELECT DISTINCT
    (TEN)
FROM
    sinhvien;
-- c2
SELECT 
    TEN
FROM
    sinhvien
GROUP BY TEN;
