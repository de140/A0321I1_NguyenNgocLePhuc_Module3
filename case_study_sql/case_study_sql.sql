create database case_study_sql;

CREATE TABLE vitri (
    idViTri INT AUTO_INCREMENT NOT NULL,
    tenViTri VARCHAR(45) NOT NULL,
    PRIMARY KEY (idViTri)
);
CREATE TABLE trinhdo (
    idTrinhDo INT AUTO_INCREMENT NOT NULL,
    trinhDo VARCHAR(45) NOT NULL,
    PRIMARY KEY (idTrinhDo)
);
CREATE TABLE bophan (
    idBoPhan INT AUTO_INCREMENT NOT NULL,
    tenBoPhan VARCHAR(45) NOT NULL,
    PRIMARY KEY (idBoPhan)
);
CREATE TABLE nhanvien (
    idNhanVien INT AUTO_INCREMENT,
    hoTen VARCHAR(50) NOT NULL,
    idViTri INT NOT NULL,
    idTrinhDo INT NOT NULL,
    idBoPhan INT NOT NULL,
    ngaySinh DATE,
    soCMTND VARCHAR(15),
    luong DOUBLE,
    sdt CHAR(10),
    email VARCHAR(45),
    diaChi VARCHAR(45),
    PRIMARY KEY (idNhanVien),
    FOREIGN KEY (idViTri)
        REFERENCES vitri (idViTri),
    FOREIGN KEY (idTrinhDo)
        REFERENCES trinhdo (idTrinhDo),
    FOREIGN KEY (idBoPhan)
        REFERENCES bophan (idBoPhan)
);
CREATE TABLE loaikhach (
    idLoaiKhach INT AUTO_INCREMENT NOT NULL,
    tenLoaiKhach VARCHAR(45) NOT NULL,
    PRIMARY KEY (idLoaiKhach)
);
CREATE TABLE khachhang (
    idKhachHang INT AUTO_INCREMENT NOT NULL,
    idLoaiKhach INT NOT NULL,
    hoTen VARCHAR(45) NOT NULL,
    ngaySinh DATE,
    soCMTND VARCHAR(15),
    sdt CHAR(10),
    email VARCHAR(45),
    diaChi VARCHAR(45),
    PRIMARY KEY (idKhachHang),
    FOREIGN KEY (idLoaiKhach)
        REFERENCES loaikhach (idLoaiKhach)
);
CREATE TABLE kieuthue (
    idKieuThue INT AUTO_INCREMENT NOT NULL,
    tenKieuThue VARCHAR(45) NOT NULL,
    gia INT NOT NULL,
    PRIMARY KEY (idKieuThue)
);
CREATE TABLE loaidichvu (
    idLoaiDichVu INT AUTO_INCREMENT NOT NULL,
    tenLoaiDichVu VARCHAR(45) NOT NULL,
    PRIMARY KEY (idLoaiDichVu)
);
CREATE TABLE dichvu (
    idDichVu INT AUTO_INCREMENT NOT NULL,
    tenDichVu VARCHAR(45) NOT NULL,
    dienTich INT,
    sotang INT,
    soNguoiToiDa INT,
    chiPhiThue DOUBLE,
    idKieuThue INT NOT NULL,
    idLoaiDichVu INT NOT NULL,
    trangThai VARCHAR(45),
    PRIMARY KEY (idDichVu),
    FOREIGN KEY (idKieuThue)
        REFERENCES kieuthue (idKieuThue),
    FOREIGN KEY (idLoaiDichVu)
        REFERENCES loaidichvu (idLoaiDichVu)
);
CREATE TABLE dichvudikem (
    idDichVuDiKem INT AUTO_INCREMENT NOT NULL,
    tenDichVuDiKem VARCHAR(45) NOT NULL,
    gia INT NOT NULL,
    donVi VARCHAR(15) NOT NULL,
    trangThaiKhaDung VARCHAR(45),
    PRIMARY KEY (idDichVuDiKem)
);
CREATE TABLE hopdong (
    idHopDong INT AUTO_INCREMENT NOT NULL,
    idNhanvien INT NOT NULL,
    idKhachHang INT NOT NULL,
    idDichVu INT NOT NULL,
    ngayLamHopDong DATE NOT NULL,
    ngayKetThuc DATE NOT NULL,
    tienDatCoc DOUBLE,
    tongtien DOUBLE,
    PRIMARY KEY (idHopDong),
    FOREIGN KEY (idNhanvien)
        REFERENCES nhanvien (idNhanvien),
    FOREIGN KEY (idKhachHang)
        REFERENCES khachhang (idKhachHang),
    FOREIGN KEY (idDichVu)
        REFERENCES dichvu (idDichVu)
);
CREATE TABLE hopdongchitiet (
    idHopDongChiTiet INT AUTO_INCREMENT NOT NULL,
    idHopDong INT NOT NULL,
    idDichVuDiKem INT NOT NULL,
    soLuong INT NOT NULL,
    PRIMARY KEY (idHopDongChiTiet),
    FOREIGN KEY (idHopDong)
        REFERENCES hopdong (idHopDong),
    FOREIGN KEY (idDichVuDiKem)
        REFERENCES dichvudikem (idDichVuDiKem)
);

-- Ch??n d??? li???u
insert into vitri(tenViTri) values
('le tan'),
('phuc vu'),
('chuyen vien'),
('giam sat'),
('quan ly'),
('giam doc');
insert into trinhdo(trinhDo) values
('trung cap'),
('cao dang'),
('dai hoc');
insert into bophan(tenBoPhan) values
('sale ??? marketing'),
('hanh chinh'),
('phuc vu'),
('quan ly');
insert into nhanvien(hoTen,idViTri,idTrinhDo,idBoPhan,ngaySinh,soCMTND,luong,sdt,email,diaChi) values
('Nguyen Ngoc Le Phuc',4,3,1,'2000-10-04','044200000875',10000000,'0972412811','phucnnlde140045@fpt.edu.vn','Da Nang'),
('Ho Quoc Kien',5,3,2,'1999-06-15','044200000214',10000000,'0377945122','kienh@gmail.com','Quang Nam'),
('Nguyen Minh Anh Tuan',6,3,4,'2000-01-06','044200000217',8000000,'0972111541','tuannma@gmail.com','Quang Nam'),
('Nguyen Huu Quan',6,3,4,'2000-03-06','044200000123',8000000,'0378546124','quannh@gmail.com','Da Nang');
insert into loaikhach(tenLoaiKhach) values
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member');
insert into khachhang(idLoaiKhach,hoTen,ngaySinh,soCMTND,sdt,email,diaChi) values
(1,'Bui Tien Dung','1997-12-02','011241212451','0975646259','dungbui@gmail.com','Vinh'),
(2,'Nguyen Tien Dung','1998-03-04','45612313854','0974878888','dungnguyen@gmail.com','Quang Ngai'),
(3,'Doan Van Hau','1998-02-21','123451622450','0372222648','haungao@gmail.com','Ha Noi'),
(4,'Phan Van Tai Em','1982-07-18','453145612','0374444555','empro@gmail.com','Long An');
insert into kieuthue(tenKieuThue, gia) values
('Year', 1050000000), 
('Month', 25000000), 
('Day', 250000),
('Hour', 25000);
insert into loaidichvu(tenLoaiDichVu) values 
('Villa'), 
('House'), 
('Room');

insert into dichvu(tenDichVu,dienTich,sotang,soNguoiToiDa,chiPhiThue,idKieuThue,idLoaiDichVu,trangThai) values 
('Villa', 45, 3, 10, 1000000, 1, 1,'booked'),
('House', 50, 1, 6, 500000, 2, 2,'booked'),
('House', 40, 1, 4, 4500000, 3, 2,'booked'),
('Room', 25, 1, 2, 250000, 4, 3, 'booked'),
('Room', 30, 1, 3, 300000, 4, 3, 'booked'),
('Villa', 50, 2, 12, 12000000, 3, 1, 'booked'),
('Villa', 60, 3, 15, 15000000, 2, 1,'booked');
insert into dichvudikem (tenDichVuDiKem, gia, donVi, trangThaiKhaDung) values
('massage', 500000, 'VND', 'full'),
('karaoke', 500000, 'VND', 'full'),
('thuc an', 500000, 'VND', 'full'),
('nuoc uong', 500000, 'VND', 'full'),
('thue xe', 500000, 'VND', 'still');

insert into hopdong (idNhanvien, idKhachHang, idDichVu,ngayLamHopDong, ngayKetThuc, tienDatCoc,tongtien) values
(5, 9, 22,'2021-02-06', '2021-02-24', 5000000,10000000),
(6, 10, 23,'2021-02-06', '2021-02-24', 5000000,10000000),
(7, 11, 24,'2020-02-06', '2020-02-24', 5000000,10000000),
(8, 12, 25,'2021-04-06', '2021-05-18', 5000000,10000000);
insert into hopdongchitiet(idHopDong,idDichVuDiKem,soLuong) values
(25,5,2),
(26,1,5);
-- Requirement
-- c??u 2.Hi???n th??? th??ng tin c???a t???t c??? nh??n vi??n c?? trong h??? th???ng c?? t??n b???t ?????u l?? m???t trong c??c k?? t??? ???H???, ???T??? ho???c ???K??? 
-- v?? c?? t???i ??a 15 k?? t???.
select * ,length(hoTen) as soluongkituten
from nhanvien
where (hoten like 'H%') or  (hoten like 'T%') or (hoten like 'K%')
having soluongkituten<=15;
-- c??u 3.Hi???n th??? th??ng tin c???a t???t c??? kh??ch h??ng c?? ????? tu???i t??? 18 ?????n 50 tu???i v?? c?? ?????a ch??? ??? ??????? N???ng??? ho???c ???Qu???ng Tr??????.
select * from khachhang;
select *, year(curdate())- year(ngaySinh) as tuoi
from khachhang
where (diaChi = 'Da Nang') or (diaChi = 'Quang Tri')
having tuoi between 18 and 50;
-- c??u 4.?????m xem t????ng ???ng v???i m???i kh??ch h??ng ???? t???ng ?????t ph??ng bao nhi??u l???n. 
-- K???t qu??? hi???n th??? ???????c s???p x???p t??ng d???n theo s??? l???n ?????t ph??ng c???a kh??ch h??ng. 
-- Ch??? ?????m nh???ng kh??ch h??ng n??o c?? T??n lo???i kh??ch h??ng l?? ???Diamond???.
select count(hopdong.idKhachHang) as soluongdatphong,khachhang.idLoaiKhach,khachhang.hoTen,loaikhach.tenLoaiKhach
from khachhang inner join loaikhach on khachhang.idLoaiKhach = loaikhach.idLoaiKhach
			inner join hopdong on khachhang.idKhachHang=hopdong.idKhachHang
where loaikhach.tenLoaiKhach = 'Diamond'
group by khachhang.idKhachHang
order by soluongdatphong;
-- c??u 5.Hi???n th??? IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc,
-- TongTien (V???i TongTien ???????c t??nh theo c??ng th???c nh?? sau: ChiPhiThue + SoLuong*Gia, v???i SoLuong v?? Gi?? l?? t??? b???ng DichVuDiKem) 
-- cho t???t c??? c??c Kh??ch h??ng ???? t???ng ?????t ph??ng.(Nh???ng Kh??ch h??ng n??o ch??a t???ng ?????t ph??ng c??ng ph???i hi???n th??? ra).
select khachhang.idKhachHang,khachhang.hoTen,loaikhach.tenLoaiKhach,hopdong.idHopDong,
		dichvu.tenDichVu,hopdong.ngayLamHopDong,hopdong.ngayKetThuc,
        sum(dichvu.chiPhiThue + hopdongchitiet.soLuong*dichvudikem.gia) as TongTien
from khachhang
left join loaikhach on khachhang.idLoaiKhach=loaikhach.idLoaiKhach
left join hopdong on khachhang.idKhachHang=hopdong.idKhachHang
left join hopdongchitiet on hopdong.idHopDong=hopdongchitiet.idHopDong
left join dichvudikem on dichvudikem.idDichVuDiKem=hopdongchitiet.idDichVuDiKem
left join dichvu on dichvu.idDichVu=hopdong.idDichVu
group by khachhang.hoTen;
-- c??u 6.Hi???n th??? IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu c???a t???t c??? c??c lo???i D???ch v??? 
-- ch??a t???ng ???????c Kh??ch h??ng th???c hi???n ?????t t??? qu?? 1 c???a n??m 2021 (Qu?? 1 l?? th??ng 1, 2, 3).
select dichvu.idDichVu,dichvu.tenDichVu,dichvu.dienTich,dichvu.chiPhiThue,loaidichvu.tenLoaiDichVu,temp.ngayLamHopDong
from dichvu
left join (select * from hopdong where hopdong.ngayLamHopDong between '2021-01-01' and '2021-03-31') as temp 
			on dichvu.idDichVu= temp.idDichVu
inner join loaidichvu on dichvu.idLoaiDichVu= loaidichvu.idLoaiDichVu
group by dichvu.tenDichVu
having temp.ngayLamHopDong is null;
-- c??u 7.Hi???n th??? th??ng tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu 
-- c???a t???t c??? c??c lo???i d???ch v??? ???? t???ng ???????c Kh??ch h??ng ?????t ph??ng trong n??m 2021
-- nh??ng ch??a t???ng ???????c Kh??ch h??ng ?????t ph??ng trong n??m 2020.
select dichvu.idDichVu,dichvu.tenDichVu,dichvu.dienTich,dichvu.soNguoiToiDa,dichvu.chiPhiThue,loaidichvu.tenLoaiDichVu
from dichvu
inner join loaidichvu on dichvu.idLoaiDichVu=loaidichvu.idLoaiDichVu
left join (select * from hopdong where year(ngayLamHopDong)=2021) as temp1
	on dichvu.idDichVu=temp1.idDichVu
left join (select * from hopdong where year(ngayLamHopDong)=2020) as temp2
	on dichvu.idDichVu=temp2.idDichVu
where temp1.idDichVu is null;
-- c??u 8.Hi???n th??? th??ng tin HoTenKhachHang c?? trong h??? th???ng, v???i y??u c???u HoTenKhachHang kh??ng tr??ng nhau.
-- s??? d???ng theo 3 c??ch kh??c nhau ????? th???c hi???n y??u c???u tr??n
select distinct khachhang.hoTen from khachhang;
select khachhang.hoTen from khachhang group by khachhang.hoTen;
select hoTen from khachhang union select hoTen from khachhang;
-- c??u 9.Th???c hi???n th???ng k?? doanh thu theo th??ng, 
-- ngh??a l?? t????ng ???ng v???i m???i th??ng trong n??m 2021 th?? s??? c?? bao nhi??u kh??ch h??ng th???c hi???n ?????t ph??ng
select temp.month,count( month(hopdong.ngayLamHopDong)) as 'thang',sum((dichvu.chiPhiThue + hopdongchitiet.soLuong*dichvudikem.gia)) as TongTien from
(select 1 as month 
union select 1 as month 
union select 2 as month
union select 3 as month
union select 4 as month
union select 5 as month
union select 6 as month
union select 7 as month
union select 8 as month
union select 9 as month
union select 10 as month
union select 11 as month
union select 12 as month) as temp
left join hopdong on month(hopdong.ngayLamHopDong)=temp.month
left join khachhang on hopdong.idKhachHang=khachhang.idKhachHang
left join dichvu on dichvu.idDichVu=hopdong.idDichVu
left join hopdongchitiet on hopdongchitiet.idHopDong=hopdong.idHopDong
left join dichvudikem on dichvudikem.idDichVuDiKem=hopdongchitiet.idDichVuDiKem
where year(hopdong.ngayLamHopDong)=2021 or year(hopdong.ngayLamHopDong) is null or month(hopdong.ngayLamHopDong) is null
group by temp.month
order by temp.month;
-- c??u 10.Hi???n th??? th??ng tin t????ng ???ng v???i t???ng H???p ?????ng th?? ???? s??? d???ng bao nhi??u D???ch v??? ??i k??m. 
-- K???t qu??? hi???n th??? bao g???m IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem 
-- (???????c t??nh d???a tr??n vi???c count c??c IDHopDongChiTiet).
select hopdong.idHopDong,hopdong.ngayLamHopDong,hopdong.ngayKetThuc,hopdong.tienDatCoc,
		count(hopdongchitiet.idHopDongChiTiet) as 'SoLuongDichVuDiKem'
from hopdong
join hopdongchitiet on hopdong.idHopDong=hopdongchitiet.idHopDong
join dichvudikem on hopdongchitiet.idDichVuDiKem=dichvudikem.idDichVuDiKem
group by hopdong.idHopDong
order by hopdong.idHopDong;
-- c??u 11.Hi???n th??? th??ng tin c??c D???ch v??? ??i k??m ???? ???????c s??? d???ng b???i nh???ng Kh??ch h??ng c?? TenLoaiKhachHang l?? ???Diamond??? 
-- v?? c?? ?????a ch??? l?? ???Vinh??? ho???c ???Qu???ng Ng??i???.
select dichvudikem.*,khachhang.idKhachHang,khachhang.hoTen,loaikhach.tenLoaiKhach,khachhang.diaChi
from dichvudikem
inner join hopdongchitiet on hopdongchitiet.idDichVuDiKem=dichvudikem.idDichVuDiKem
inner join hopdong on hopdong.idHopDong=hopdongchitiet.idHopDong
inner join khachhang on khachhang.idKhachHang=hopdong.idKhachHang
inner join loaikhach on loaikhach.idLoaiKhach=khachhang.idLoaiKhach
where loaikhach.tenLoaiKhach='Diamond' and (khachhang.diaChi='Vinh' or khachhang.diaChi='Quang Ngai')
group by dichvudikem.idDichVuDiKem,khachhang.idKhachHang;
-- c??u 12.Hi???n th??? th??ng tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem 
-- (???????c t??nh d???a tr??n t???ng H???p ?????ng chi ti???t), TienDatCoc c???a t???t c??? c??c d???ch v??? ???? t???ng ???????c kh??ch h??ng ?????t v??o 3 th??ng cu???i 
-- n??m 2021 nh??ng ch??a t???ng ???????c kh??ch h??ng ?????t v??o 6 th??ng ?????u n??m 2021.
-- c??ch t???o b???ng t???m
-- create temporary table temp1(
-- 	select distinct hopdong.idHopDong from hopdong where hopdong.ngayLamHopDong between '2021-10-01' and '2021-12-31'
-- );
select temp1.idHopDong,nhanvien.hoTen,khachhang.hoTen,khachhang.sdt,dichvu.tenDichVu,count(dichvudikem.idDichVuDiKem) as SoLuongDichVuDikem
from (select * from hopdong where hopdong.ngayLamHopDong between '2021-10-01' and '2021-12-31') as temp1
left join (select * from hopdong where hopdong.ngayLamHopDong between '2021-01-01' and '2021-06-01') as temp2
on temp1.idHopDong = temp2.idHopDong
left join nhanvien on temp1.idNhanVien=nhanvien.idNhanVien
left join khachhang on temp1.idKhachHang= khachhang.idKhachHang
left join dichvu on temp1.idDichVu = dichvu.idDichVu
left join hopdongchitiet on temp1.idHopDong= hopdongchitiet.idHopDong
left join dichvudikem on hopdongchitiet.idDichVuDiKem= dichvudikem.idDichVuDiKem
where temp2.idHopDong is null;
-- c??u 13.Hi???n th??? th??ng tin c??c D???ch v??? ??i k??m ???????c s??? d???ng nhi???u nh???t b???i c??c Kh??ch h??ng ???? ?????t ph??ng. 
-- (L??u ?? l?? c?? th??? c?? nhi???u d???ch v??? c?? s??? l???n s??? d???ng nhi???u nh?? nhau).
select dichvudikem.*, count(hopdongchitiet.idDichVuDiKem) as soluong
from dichvudikem
inner join hopdongchitiet on dichvudikem.idDichVuDiKem=hopdongchitiet.idDichVuDiKem
group by dichvudikem.idDichVuDiKem
order by soluong desc;
-- c??u 14.Hi???n th??? th??ng tin t???t c??? c??c D???ch v??? ??i k??m ch??? m???i ???????c s??? d???ng m???t l???n duy nh???t. 
-- Th??ng tin hi???n th??? bao g???m IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.
select hopdong.idHopDong,loaidichvu.tenLoaiDichVu,dichvudikem.tenDichVuDiKem,count(hopdongchitiet.idDichVuDiKem) as SoLanSuDung
from dichvudikem
inner join hopdongchitiet on dichvudikem.idDichVuDiKem=hopdongchitiet.idDichVuDiKem
inner join hopdong on hopdongchitiet.idHopDong=hopdong.idHopDong
inner join dichvu on hopdong.idDichVu=dichvu.idDichVu
inner join loaidichvu on dichvu.idLoaiDichVu=loaidichvu.idLoaiDichVu
group by dichvudikem.idDichVuDiKem
having SoLanSuDung=1;
-- c??u 15.Hi???n thi th??ng tin c???a t???t c??? nh??n vi??n bao g???m IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi 
-- m???i ch??? l???p ???????c t???i ??a 3 h???p ?????ng t??? n??m 2020 ?????n 2021.
select nhanvien.idNhanVien,nhanvien.hoTen,trinhdo.trinhDo,bophan.tenBoPhan,nhanvien.sdt,nhanvien.diaChi,
count(hopdong.idNhanVien) as soluonghopdong, year(hopdong.ngaylamHopDong) as nam
from nhanvien
left join trinhdo on nhanvien.idTrinhDo=trinhdo.idTrinhDo
left join bophan on nhanvien.idBoPhan=bophan.idBoPhan
inner join hopdong on nhanvien.idNhanVien = hopdong.idNhanVien
group by nhanvien.idNhanVien
having soluonghopdong<=3 and (nam between '2020' and '2021');
-- c??u 16. X??a nh???ng Nh??n vi??n ch??a t???ng l???p ???????c h???p ?????ng n??o t??? n??m 2017 ?????n n??m 2020.
SET SQL_SAFE_UPDATES = 0;
delete from nhanvien
where nhanvien.idNhanVien not in (select hopdong.idNhanVien from hopdong where year(hopdong.ngayLamHopDong) between '2017' and '2020');
-- c??u 17.C???p nh???t th??ng tin nh???ng kh??ch h??ng c?? TenLoaiKhachHang t??? Platinium l??n Diamond, 
-- ch??? c???p nh???t nh???ng kh??ch h??ng ???? t???ng ?????t ph??ng v???i t???ng Ti???n thanh to??n trong n??m 2021 l?? l???n h??n 10.000.000 VN??.
 update khachhang
 set khachhang.idLoaiKhach = 1
 where khachhang.idLoaiKhach = 2 and khachhang.idLoaiKhach in (select hopdong.idKhachHang from hopdong
where hopdong.tongtien >=10000000 and year(hopdong.ngayLamHopDong) = 2021);
-- c??u 18.X??a nh???ng kh??ch h??ng c?? h???p ?????ng tr?????c n??m 2020 (ch?? ?? r??ngbu???c gi???a c??c b???ng).
SET SQL_SAFE_UPDATES = 0;
delete from khachhang
where khachhang.idKhachHang in (select hopdong.idKhachHang from hopdong where year(hopdong.ngayLamHopDong) < 2020);
-- c??u 19.C???p nh???t gi?? cho c??c D???ch v??? ??i k??m ???????c s??? d???ng tr??n 2 l???n trong n??m 2021 l??n g???p ????i.
update dichvudikem,
(select hopdongchitiet.idDichVuDiKem, count(hopdongchitiet.idHopDongChiTiet) as SoLanSuDung 
from hopdong
inner join hopdongchitiet on hopdong.idHopDong = hopdongchitiet.idHopDong
where year(hopdong.ngayLamHopDong) = 2021
group by hopdongchitiet.idDichVuDiKem) as temp
set dichvudikem.gia = dichvudikem.gia * 2
where dichvudikem.idDichVuDiKem = temp.idDichVuDiKem and SoLanSuDung > 2;
-- c??u 20.Hi???n th??? th??ng tin c???a t???t c??? c??c Nh??n vi??n v?? Kh??ch h??ng c?? trong h??? th???ng, 
--  th??ng tin hi???n th??? bao g???m ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi 
select idNhanVien as 'id',hoTen as 'ten',email as 'email',sdt as 'sdt',ngaySinh as 'ngay_sinh',
		diaChi as 'dia_chi', 'nhanvien' as 'role' from nhanvien 
union all
select idKhachHang as 'id',hoTen as 'ten',email as 'email', sdt as 'sdt',ngaySinh as 'ngay_sinh',
		diaChi as 'dia_chi','khachhang' as 'role' from khachhang;
