--Tạo CSDL và bảng
--Tạo Database
CREATE DATABASE QL_CHUONGTRINH_NHAC
GO
USE QL_CHUONGTRINH_NHAC
--Tạo bảng MUABIEUDIEN
CREATE TABLE MUABIEUDIEN (
    MAMUA CHAR(10) PRIMARY KEY,
    TENMUA VARCHAR(100),
    NGAYBATDAU DATE,
    NGAYKT DATE)
--Tạo bảng NHACTRUONG
CREATE TABLE NHACTRUONG (
    MANT CHAR(10) PRIMARY KEY,
    TENNT VARCHAR(100))
--Tạo bảng CHUONGTRINH
CREATE TABLE CHUONGTRINH (
    SOCT CHAR(10) PRIMARY KEY,
    TENCT VARCHAR(100),
    NGAYBIEUDIEN DATETIME,
    MAMUA CHAR(10),
    MANT CHAR(10),
    FOREIGN KEY (MAMUA) REFERENCES MUABIEUDIEN(MAMUA),
    FOREIGN KEY (MANT) REFERENCES NHACTRUONG(MANT)) 
--Tạo bảng TACPHAM
CREATE TABLE TACPHAM (
    MATP CHAR(10) PRIMARY KEY,
    TENTG VARCHAR(100),
    TENTP VARCHAR(100))
--Tạo bảng PHANDOAN
CREATE TABLE PHANDOAN (
    MAPD CHAR(10) PRIMARY KEY,
    SOPD INT,
    TENPD VARCHAR(100),
    MATP CHAR(10),
FOREIGN KEY (MATP) REFERENCES TACPHAM(MATP))
--Tạo bảng BIEUDIEN
CREATE TABLE BIEUDIEN (
    SOCT CHAR(10),
    MATP CHAR(10),
    PRIMARY KEY (SOCT, MATP),
    FOREIGN KEY (SOCT) REFERENCES CHUONGTRINH(SOCT),
    FOREIGN KEY (MATP) REFERENCES TACPHAM(MATP))
--Tạo bảng NGUOIHATSOLO
CREATE TABLE NGUOIHATSOLO (
    MANH CHAR(10) PRIMARY KEY,
    TENNH VARCHAR(100))
--Tạo bảng HAT
CREATE TABLE HAT (
    MANH CHAR(10),
    MATP CHAR(10),
    NGAYCUOICUNG DATETIME,
    PRIMARY KEY (MANH, MATP),
    FOREIGN KEY (MANH) REFERENCES NGUOIHATSOLO(MANH),
    FOREIGN KEY (MATP) REFERENCES TACPHAM(MATP))
--Nhập dữ liệu
--Nhập dữ liệu MUABIEUDIEN
INSERT INTO MUABIEUDIEN VALUES
('MUA01', 'Mua He Xanh', '2025-06-01', '2025-08-31'),
('MUA02', 'Mua Thu Vang', '2025-09-01', '2025-11-30'),
('MUA03', 'Mua Dong Trang', '2025-12-01', '2026-02-28'),
('MUA04', 'Mua Xuan Hy Vong', '2025-03-01', '2025-05-31'),
('MUA05', 'Mua Giao Huong', '2025-04-01', '2025-06-15');
GO
--Nhập dữ liệu NHACTRUONG
INSERT INTO NHACTRUONG VALUES
('NT01', 'Nhac truong Son Tung'),
('NT02', 'Nhac truong My Linh'),
('NT03', 'Nhac truong Quoc Trung'),
('NT04', 'Nhac truong Trinh Cong Son'),
('NT05', 'Nhac truong Huy Tuan'),
('NT06', 'Nhac truong Dang Thai Son')
GO
--Nhập dữ liệu TACPHAM
INSERT INTO TACPHAM VALUES
('TP01', 'Trinh Cong Son', 'Bien nho'),
('TP02', 'Trinh Cong Son', 'Diem xua'),
('TP03', 'Pham Duy', 'Ngay xua Hoang Thi'),
('TP04', 'Pham Duy', 'Con duong tinh ta di'),
('TP05', 'Van Cao', 'Tien quan ca'),
('TP06', 'Van Cao', 'Buon tan thu'),
('TP07', 'Quoc Trung', 'Gio mua ve'),
('TP08', 'Quoc Trung', 'Loi ru'),
('TP09', 'Huy Tuan', 'Giac mo trua'),
('TP10', 'Huy Tuan', 'Pho khuya');
GO

--Nhập dữ liệu PHANDOAN 
INSERT INTO PHANDOAN VALUES
('PD01', 1, 'Khuc dao', 'TP01'),
('PD02', 2, 'Diep khuc', 'TP01'),
('PD03', 3, 'Ket bai', 'TP01'),
('PD04', 1, 'Mo dau', 'TP02'),
('PD05', 2, 'Phien khuc', 'TP02'),
('PD06', 1, 'Dan nhap', 'TP03'),
('PD07', 2, 'Cao trao', 'TP03'),
('PD08', 1, 'Khuc mo', 'TP04'),
('PD09', 2, 'Hung ca', 'TP04'),
('PD10', 1, 'Dao dau', 'TP05'),
('PD11', 2, 'Diep khuc', 'TP05'),
('PD12', 1, 'Gioi thieu', 'TP06'),
('PD13', 2, 'Phat trien', 'TP06'),
('PD14', 1, 'Mo bai', 'TP07'),
('PD15', 2, 'Ket thuc', 'TP07');
GO
--Nhập dữ liệu NGUOIHATSOLO
INSERT INTO NGUOIHATSOLO VALUES
('NH01', 'My Tam'),
('NH02', 'Hong Nhung'),
('NH03', 'Tran Thu Ha'),
('NH04', 'Tung Duong'),
('NH05', 'Uyen Linh'),
('NH06', 'Duc Tuan'),
('NH07', 'My Linh'),
('NH08', 'Thanh Lam');
GO
--Nhập dữ liệu HAT
INSERT INTO HAT VALUES
('NH01', 'TP01', '2025-06-15'), 
('NH01', 'TP03', '2025-07-20'),
('NH02', 'TP02', '2025-08-10'), 
('NH02', 'TP05', '2025-09-05'),
('NH03', 'TP04', '2025-07-01'), 
('NH04', 'TP06', '2025-08-15'), 
('NH05', 'TP07', '2025-09-20'), 
('NH06', 'TP01', '2025-10-10'), 
('NH07', 'TP02', '2025-11-15'), 
('NH08', 'TP04', '2025-12-20')
GO
--Nhập dữ liệu CHUONGTRINH
INSERT INTO CHUONGTRINH VALUES
('CT01', 'Hoa nhac he', '2025-06-10', 'MUA01', 'NT01'),
('CT02', 'Dem nhac Trinh', '2025-07-15', 'MUA01', 'NT04'),
('CT03', 'Thang Chin yeu thuong', '2025-09-15', 'MUA02', 'NT02'),
('CT04', 'Tinh khuc Pham Duy', '2025-10-20', 'MUA02', 'NT03'),
('CT05', 'Dem dong huyen ao', '2025-12-05', 'MUA03', 'NT03'),
('CT06', 'Giao huong mua dong', '2026-01-10', 'MUA03', 'NT06'),
('CT07', 'Giai dieu mua xuan', '2025-03-20', 'MUA04', 'NT04'),
('CT08', 'Hoi xuan am nhac', '2025-04-25', 'MUA04', 'NT05');
GO
--Nhập dữ liệu BIEUDIEN
INSERT INTO BIEUDIEN (SOCT, MATP) VALUES
('CT01', 'TP01'),
('CT01', 'TP06'),
('CT02', 'TP01'),
('CT02', 'TP02'),
('CT03', 'TP03'),
('CT03', 'TP05'),
('CT04', 'TP03'),
('CT05', 'TP04'),
('CT05', 'TP07'),
('CT06', 'TP05'),
('CT07', 'TP02'),
('CT08', 'TP01'),
('CT08', 'TP04')
GO 
--12 CÂU TRUY VẤN
--TRUY VẤN UPDATE
--Liệt kê tên ca sĩ đã hát tác phẩm “Bien nho” vào ngày cuối cùng là '2025-06-15' (Nhi)
SELECT S.MANH, S.TENNH
FROM NGUOIHATSOLO S
JOIN HAT H ON S.MANH = H.MANH
JOIN TACPHAM T ON H.MATP = T.MATP
WHERE T.TENTP = 'Bien nho'
  AND H.NGAYCUOICUNG = '2025-06-15'
--Liên kết nhiều bảng: Hãy liệt kê tên chương trình, tên tác phẩm, tên người hát solo, tên nhạc trưởng, 
--và tên mùa biểu diễn cho các trường hợp mà người hát solo thể hiện tác phẩm sau ngày chương trình biểu diễn tác phẩm đó.
SELECT 
    CT.TENCT AS 'TenChuongTrinh',
    TP.TENTP AS 'TenTacPham',
    NHS.TENNH AS 'TenNguoiHatSolo',
    NT.TENNT AS 'NhacTruong',
    MBD.TENMUA AS 'TenMuaBieuDien'
FROM CHUONGTRINH CT
JOIN BIEUDIEN BD ON CT.SOCT = BD.SOCT
JOIN TACPHAM TP ON BD.MATP = TP.MATP
JOIN HAT H ON TP.MATP = H.MATP
JOIN NGUOIHATSOLO NHS ON H.MANH = NHS.MANH
JOIN NHACTRUONG NT ON CT.MANT = NT.MANT
JOIN MUABIEUDIEN MBD ON CT.MAMUA = MBD.MAMUA
WHERE H.NGAYCUOICUNG > CT.NGAYBIEUDIEN
--TRUY VẤN GROUP BY
--Hãy thống kê số lượng chương trình biểu diễn do mỗi nhạc trưởng chỉ huy và chỉ hiển thị những nhạc trưởng đã chỉ huy ít nhất 1 chương trình (Nhi)
SELECT 
    TENNT AS 'TenNhacTruong',
    COUNT(CT.SOCT) AS 'SoLuongChuongTrinh'
FROM CHUONGTRINH CT
JOIN NHACTRUONG NT ON CT.MANT = NT.MANT
GROUP BY TENNT
HAVING COUNT(CT.SOCT) >= 1;
--Liệt kê tên các ca sĩ solo đã từng hát ít nhất 2 tác phẩm khác nhau, trong đó các tác phẩm này phải thuộc về các nhạc sĩ khác nhau và được hát vào các ngày khác nhau.(Mai)
SELECT NHS.MANH, NHS.TENNH
FROM NGUOIHATSOLO NHS
JOIN HAT H ON NHS.MANH = H.MANH
JOIN TACPHAM TP ON H.MATP = TP.MATP
GROUP BY NHS.MANH, NHS.TENNH
HAVING COUNT(DISTINCT TP.MATP) >= 2
   AND COUNT(DISTINCT TP.TENTG) >= 2
   AND COUNT(DISTINCT H.NGAYCUOICUNG) >= 2;
--DELETE
--Xóa ca sĩ có mã 'NH08' và toàn bộ thông tin trình bày liên quan (Ngọc)
DELETE FROM HAT
WHERE MANH = 'NH08';
DELETE FROM NGUOIHATSOLO
WHERE MANH = 'NH08';
--Xóa tất cả các phân đoạn (PHANDOAN) thuộc tác phẩm "TP01"(Hoa)
DELETE FROM PHANDOAN 
WHERE MATP = 'TP01';
--UPDATE
--Đổi tên nhạc trưởng “Nhac truong Son Tung” thành “Son Tung M-TP” 
UPDATE NHACTRUONG
SET TENNT = 'Son Tung M-TP'
WHERE MANT = 'NT01';
--Cập nhật tên phần đoạn cho các tác phẩm có ca sĩ hát solo là NH01, NH02 hoặc NH06, và có số thứ tự phần đoạn từ 2 trở lên.
UPDATE PHANDOAN
SET TENPD = 'Bien tau moi'
WHERE MATP IN (
    SELECT MATP FROM HAT 
    WHERE MANH IN ('NH01', 'NH02', 'NH06'))
	AND SOPD >= 2
--SUBQUERY
--Tìm các nhạc trưởng chưa từng chỉ huy chương trình nào có tác phẩm của "Van Cao" (Nhàn)
SELECT TENNT
FROM NHACTRUONG
WHERE MANT NOT IN (
    SELECT DISTINCT CT.MANT
    FROM CHUONGTRINH CT
    JOIN BIEUDIEN BD ON CT.SOCT = BD.SOCT
    JOIN TACPHAM TP ON BD.MATP = TP.MATP
    WHERE TP.TENTG = 'Van Cao'
);
--Liệt kê tên các nhạc trưởng chưa từng điều khiển bất kỳ chương trình nào có biểu diễn tác phẩm của nhạc sĩ 'Pham Duy', 
--trong đó các tác phẩm đó cũng đã từng được ít nhất một ca sĩ solo thể hiện.
SELECT TENNT
FROM NHACTRUONG NT
WHERE MANT NOT IN (
    SELECT DISTINCT CT.MANT
    FROM CHUONGTRINH CT
    JOIN BIEUDIEN BD ON CT.SOCT = BD.SOCT
    JOIN TACPHAM TP ON BD.MATP = TP.MATP
    WHERE TP.TENTG = 'Pham Duy'
      AND TP.MATP IN (
          SELECT DISTINCT MATP
          FROM HAT
      )
);
--TRUY VẤN BẤT KÌ
--Tìm tên các chương trình biểu diễn có ít nhất một tác phẩm của "Pham Duy". (Nhàn)
SELECT TENCT
FROM CHUONGTRINH
WHERE SOCT IN (
    SELECT DISTINCT B.SOCT
    FROM BIEUDIEN B
    JOIN TACPHAM TP ON B.MATP = TP.MATP
    WHERE TP.TENTG = 'Pham Duy'
);
--Đếm số tác phẩm của nhạc sĩ 'Pham Duy' đã được ít nhất 2 ca sĩ solo thể hiện, và các lần thể hiện đó phải diễn ra vào các ngày khác nhau.(Mai)
SELECT COUNT(*) AS 'SoTacPhamPhamDuy'
FROM (
    SELECT H.MATP
    FROM HAT H
    JOIN TACPHAM TP ON H.MATP = TP.MATP
    WHERE TP.TENTG = 'Pham Duy'
    GROUP BY H.MATP
    HAVING COUNT(DISTINCT H.MANH) >= 2
       AND COUNT(DISTINCT H.NGAYCUOICUNG) >= 2
) AS DS;
----TRUY VẤN CÁ NHÂN
--I.	23677661 - NGUYỄN THANH NHÀN
--1.	UPDATE: Cập nhật tên nhạc trưởng thành 'Nhac truong ky cuu' cho những người đã chỉ huy từ 2 chương trình biểu diễn trở lên.
UPDATE NHACTRUONG
SET TENNT = 'Nhac truong ky cuu'
WHERE MANT IN (
    SELECT MANT
    FROM CHUONGTRINH
    GROUP BY MANT
    HAVING COUNT(*) >= 2
);
--2.	DELETE: Xóa tất cả các phân đoạn có số phân đoạn là 3
DELETE FROM PHANDOAN
WHERE SOPD = 3;
--3.	GROUP BY: Liệt kê tên các ca sĩ solo đã từng biểu diễn ít nhất 2 tác phẩm khác nhau.
SELECT NH.TENNH, COUNT(DISTINCT TP.MATP) AS SoLuongTacPham
FROM NGUOIHATSOLO NH
JOIN HAT H ON NH.MANH = H.MANH
JOIN TACPHAM TP ON H.MATP = TP.MATP
GROUP BY NH.TENNH
HAVING COUNT(DISTINCT TP.MATP) >= 2;
--4.SUBQUERY: Tìm tên những người đã từng hát tác phẩm thuộc chương trình “CT01”
SELECT DISTINCT TENNH
FROM NGUOIHATSOLO
WHERE MANH IN (
    SELECT H.MANH
    FROM HAT H
    JOIN BIEUDIEN BD ON H.MATP = BD.MATP
    WHERE BD.SOCT = 'CT01'
);
--5. JOIN: Tìm các tác phẩm được hát bởi ca sĩ "Hong Nhung" trong các chương trình của mùa "Mua Thu Vang"
SELECT DISTINCT TP.TENTP
FROM HAT H
JOIN TACPHAM TP ON H.MATP = TP.MATP
JOIN BIEUDIEN BD ON TP.MATP = BD.MATP
JOIN CHUONGTRINH CT ON BD.SOCT = CT.SOCT
JOIN MUABIEUDIEN MB ON CT.MAMUA = MB.MAMUA
JOIN NGUOIHATSOLO NH ON H.MANH = NH.MANH
WHERE NH.TENNH = 'Hong Nhung' AND MB.TENMUA = 'Mua Thu Vang';
--6.	Liệt kê tên các ca sĩ solo chưa từng hát bất kỳ tác phẩm nào của các nhạc sĩ có hơn 2 tác phẩm đã được biểu diễn.
SELECT TENNH
FROM NGUOIHATSOLO
WHERE MANH NOT IN (
    SELECT DISTINCT H.MANH
    FROM HAT H
    JOIN TACPHAM TP ON H.MATP = TP.MATP
    WHERE TP.TENTG IN (
        SELECT TENTG
        FROM TACPHAM TP
        JOIN BIEUDIEN BD ON TP.MATP = BD.MATP
        GROUP BY TENTG
        HAVING COUNT(DISTINCT TP.MATP) > 2
    )
);
--II.	23688501 - KIỀU PHAN TUYẾT NHI
--1.	UPDATE: Cập nhật ngày bắt đầu của mùa biểu diễn chứa chương trình có nhạc trưởng Trịnh Công Sơn thành '2025-03-01'.
UPDATE MUABIEUDIEN
SET NGAYBATDAU = '2025-03-01'
WHERE MAMUA IN (
    SELECT MAMUA
    FROM CHUONGTRINH
    WHERE MANT IN (
        SELECT MANT
        FROM NHACTRUONG
        WHERE TENNT = 'Nhac truong Trinh Cong Son'
    )
) ;
--2.	DELETE: Xóa những bản ghi trong bảng HAT mà ngày cuối cùng biểu diễn trước ngày 01/08/2025.
DELETE FROM HAT
WHERE NGAYCUOICUNG < '2025-08-01'
--3.	KẾT NỐI NHIỀU BẢNG (JOIN): Liệt kê chương trình do “Nhac truong Trinh Cong Son” chỉ huy có biểu diễn tác phẩm “Diem xua”
SELECT C.SOCT, C.TENCT
FROM CHUONGTRINH C
JOIN NHACTRUONG N ON C.MANT = N.MANT
JOIN BIEUDIEN B ON C.SOCT = B.SOCT
JOIN TACPHAM T ON B.MATP = T.MATP
WHERE N.TENNT = 'Nhac truong Trinh Cong Son'
  AND T.TENTP = 'Diem xua'
--4.	GROUP BY: Đếm số lần mỗi tác phẩm được biểu diễn, chỉ liệt kê các tác phẩm được biểu diễn từ 2 lần trở lên.
SELECT TP.TENTP, COUNT(B.SOCT) AS 'SOLANBD'
FROM TACPHAM TP
JOIN BIEUDIEN B ON TP.MATP = B.MATP
GROUP BY TP.TENTP
HAVING COUNT(B.SOCT) >= 2
--5.	SUBQUERY: Liệt kê tên các ca sĩ solo đã từng biểu diễn ít nhất một tác phẩm mà nhạc sĩ “Pham Duy” sáng tác.
SELECT S.TENNH
FROM NGUOIHATSOLO S
WHERE S.MANH IN (
    SELECT DISTINCT H.MANH
    FROM HAT H
    JOIN TACPHAM T ON H.MATP = T.MATP
    WHERE T.TENTG = 'Pham Duy'
)
--6.	KẾT NỐI NHIỀU BẢNG (JOIN): Liệt kê ca sĩ đã hát trong các chương trình thuộc mùa biểu diễn “Mua He Xanh”
SELECT DISTINCT S.TENNH
FROM NGUOIHATSOLO S
JOIN HAT H ON S.MANH = H.MANH
JOIN TACPHAM T ON H.MATP = T.MATP
JOIN BIEUDIEN B ON T.MATP = B.MATP
JOIN CHUONGTRINH C ON B.SOCT = C.SOCT
JOIN MUABIEUDIEN M ON C.MAMUA = M.MAMUA
WHERE M.TENMUA = 'Mua He Xanh'
--III.	23697741 - QUÁCH THU HOA
--1. Cập nhật tên ca sĩ trong bảng NGUOIHATSOLO dựa trên một điều kiện những ca sĩ tham gia vào các chương trình trong mùa "Mua Thu Vang" 
UPDATE NGUOIHATSOLO
SET TENNH = 'Ca si tham gia mua thu'
WHERE MANH IN (
    SELECT H.MANH
    FROM HAT H
    JOIN BIEUDIEN B ON H.MATP = B.MATP
    JOIN CHUONGTRINH C ON B.SOCT = C.SOCT
    WHERE C.MAMUA = 'MUA02'
);
--2. Xóa tác phẩm có mã là 'TP10' khỏi bảng TACPHAM
DELETE FROM TACPHAM
WHERE MATP = 'TP10';
--3. Thống kê số lượng tác phẩm mà mỗi nhạc trưởng từng chỉ huy 
SELECT NT.TENNT, CT.TENCT, COUNT(DISTINCT BD.MATP) AS 'SoLuongTacPham'
FROM NHACTRUONG NT
JOIN CHUONGTRINH CT ON NT.MANT = CT.MANT
JOIN BIEUDIEN BD ON CT.SOCT = BD.SOCT
JOIN TACPHAM TP ON BD.MATP = TP.MATP
GROUP BY NT.TENNT, CT.TENCT
--4. Liệt kê tên các ca sĩ solo và số lần họ đã tham gia hát
SELECT N.TENNH, COUNT(*) AS 'SoLanHat'
FROM HAT H
JOIN NGUOIHATSOLO N ON H.MANH = N.MANH
GROUP BY N.TENNH;
--5. Liệt kê tên người hát solo, tên tác phẩm họ thể hiện, và tên mùa biểu diễn nếu ngày cuối cùng họ hát nằm trong khoảng thời gian của mùa biểu diễn đó.
SELECT DISTINCT NH.TENNH, TP.TENTP, MB.TENMUA
FROM NGUOIHATSOLO NH
JOIN HAT H ON NH.MANH = H.MANH
JOIN TACPHAM TP ON H.MATP = TP.MATP
JOIN BIEUDIEN BD ON TP.MATP = BD.MATP
JOIN CHUONGTRINH CT ON BD.SOCT = CT.SOCT
JOIN MUABIEUDIEN MB ON CT.MAMUA = MB.MAMUA
WHERE MB.NGAYBATDAU <= H.NGAYCUOICUNG AND MB.NGAYKT >= H.NGAYCUOICUNG
--6. Liệt kê tên các nhạc trưởng đã chỉ huy ít nhất 2 chương trình mà mỗi chương trình có biểu diễn tác phẩm của ít nhất 2 tác giả khác nhau
SELECT DISTINCT NT.TENNT
FROM NHACTRUONG NT
JOIN CHUONGTRINH CT ON NT.MANT = CT.MANT
JOIN BIEUDIEN BD ON CT.SOCT = BD.SOCT
WHERE BD.MATP IN (
    SELECT MATP
    FROM TACPHAM
    WHERE MATP NOT IN (
        SELECT H.MATP
        FROM HAT H
        JOIN NGUOIHATSOLO NHS ON H.MANH = NHS.MANH
        WHERE NHS.TENNH = 'Ha Tran'
    )
);
--IV.	23728341 - NGUYỄN HUỲNH ÁNH MAI
--1.	UPDATE : Cập nhật tên ca sĩ thành "Uyen Linh Idol" nếu cô là người hát gần nhất cho tác phẩm "Giac mo trua"
UPDATE NGUOIHATSOLO
SET TENNH = 'Uyen Linh Idol'
WHERE MANH = (
    SELECT TOP 1 H.MANH
    FROM HAT H
    JOIN TACPHAM TP ON H.MATP = TP.MATP
    WHERE TP.TENTP = 'Giac mo trua'
    ORDER BY H.NGAYCUOICUNG DESC
);
--2.	DELETE: Xóa tất cả các bản ghi trong bảng HAT của những ca sĩ đã hát hơn 3 tác phẩm.
DELETE FROM HAT
WHERE MANH IN (
    SELECT MANH
    FROM HAT
    GROUP BY MANH
    HAVING COUNT(DISTINCT MATP) > 3
);
--3.GROUP BY: Thống kê mỗi ca sĩ solo đã hát bao nhiêu tác phẩm của từng nhạc sĩ trong mùa biểu diễn "Mua He Xanh".
SELECT 
    NHS.TENNH AS 'TenCaSi',
    TP.TENTG AS 'TenNhacSi',
    COUNT(DISTINCT H.MATP) AS 'SoTacPham'
FROM NGUOIHATSOLO NHS
JOIN HAT H ON NHS.MANH = H.MANH
JOIN TACPHAM TP ON H.MATP = TP.MATP
JOIN BIEUDIEN BD ON TP.MATP = BD.MATP
JOIN CHUONGTRINH CT ON BD.SOCT = CT.SOCT
JOIN MUABIEUDIEN MB ON CT.MAMUA = MB.MAMUA
WHERE MB.TENMUA = 'Mua He Xanh'
GROUP BY NHS.TENNH, TP.TENTG
HAVING COUNT(DISTINCT H.MATP) >= 1;
--4.	SUBQUERY: Liệt kê tên các nhạc trưởng đã từng chỉ huy ít nhất một chương trình mà trong đó tất cả các tác phẩm biểu diễn đều đã được ca sĩ solo thể hiện.
SELECT DISTINCT NT.TENNT
FROM NHACTRUONG NT
JOIN CHUONGTRINH CT ON NT.MANT = CT.MANT
WHERE NOT EXISTS (
    SELECT *
    FROM BIEUDIEN BD
    WHERE BD.SOCT = CT.SOCT
      AND BD.MATP NOT IN (
          SELECT DISTINCT MATP FROM HAT
      )
);
--5.	JOIN: Liệt kê tên các chương trình, mùa biểu diễn, tên tác phẩm và tên người hát solo nếu có.
SELECT 
    CT.TENCT,
    MB.TENMUA,
    TP.TENTP,
    NHS.TENNH
FROM CHUONGTRINH CT
JOIN MUABIEUDIEN MB ON CT.MAMUA = MB.MAMUA
JOIN BIEUDIEN BD ON CT.SOCT = BD.SOCT
JOIN TACPHAM TP ON BD.MATP = TP.MATP
LEFT JOIN HAT H ON TP.MATP = H.MATP
LEFT JOIN NGUOIHATSOLO NHS ON H.MANH = NHS.MANH;
--6.	Liệt kê tên các tác phẩm đã từng được biểu diễn bởi nhiều hơn một nhạc trưởng, và mỗi nhạc trưởng phải biểu diễn vào những chương trình khác nhau.
SELECT TP.TENTP
FROM TACPHAM TP
JOIN BIEUDIEN BD ON TP.MATP = BD.MATP
JOIN CHUONGTRINH CT ON BD.SOCT = CT.SOCT
GROUP BY TP.TENTP, TP.MATP
HAVING COUNT(DISTINCT CT.MANT + CT.SOCT) > 1;
--V.	23692181 - HUỲNH THANH NGỌC
--1.	Liệt kê các tác phẩm mà chỉ có 1 ca sĩ hát, kèm tên tác phẩm và tên ca sĩ.
SELECT TP.TENTP, NHS.TENNH
FROM TACPHAM TP
JOIN HAT H ON TP.MATP = H.MATP
JOIN NGUOIHATSOLO NHS ON H.MANH = NHS.MANH
WHERE TP.MATP IN (
    SELECT MATP
    FROM HAT
    GROUP BY MATP
    HAVING COUNT(DISTINCT MANH) = 1)
--2.	Liệt kê mã và tên các ca sĩ đã từng hát từ 2 tác phẩm khác nhau trở lên.
SELECT NHS.MANH, NHS.TENNH, COUNT(DISTINCT H.MATP) AS 'SoTacPham'
FROM NGUOIHATSOLO NHS
JOIN HAT H ON NHS.MANH = H.MANH
GROUP BY NHS.MANH, NHS.TENNH
HAVING COUNT(DISTINCT H.MATP) >= 2;
--3.	Cập nhật tên phân đoạn thành "Giai điệu đặc biệt" cho các phân đoạn thuộc các tác phẩm có từ 3 phân đoạn trở lên
UPDATE PHANDOAN
SET TENPD = 'Giai dieu dac biet'
WHERE MATP IN (
    SELECT MATP
    FROM PHANDOAN
    GROUP BY MATP
    HAVING COUNT(*) >= 3)

--4.	GROUP BY: Tìm tác phẩm có từ 2 phân đoạn trở lên, cùng với tên tác giả
SELECT TP.TENTP, TP.TENTG, COUNT(PD.MAPD) AS 'SoPhanDoan'
FROM TACPHAM TP
JOIN PHANDOAN PD ON TP.MATP = PD.MATP
GROUP BY TP.TENTP, TP.TENTG
HAVING COUNT(PD.MAPD) >= 2;
--5.	JOIN: Danh sách chương trình biểu diễn và các tác phẩm liên quan
SELECT 
    CT.TENCT AS 'TenChuongTrinh',
    CT.NGAYBIEUDIEN AS 'NgayBieuDien',
    NT.TENNT AS 'TenNhacTruong',
    TP.TENTP AS 'TenTacPham'
FROM CHUONGTRINH CT
JOIN NHACTRUONG NT ON CT.MANT = NT.MANT
JOIN BIEUDIEN BD ON CT.SOCT = BD.SOCT
JOIN TACPHAM TP ON BD.MATP = TP.MATP;
--6.	DELETE : Xóa chương trình CT01 và các bản ghi liên quan

DELETE FROM BIEUDIEN 
WHERE SOCT = 'CT01';

DELETE FROM HAT
WHERE MATP IN (SELECT MATP FROM BIEUDIEN WHERE SOCT = 'CT01');

DELETE FROM CHUONGTRINH 
WHERE SOCT = 'CT01';


 
