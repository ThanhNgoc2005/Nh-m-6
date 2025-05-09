CREATE DATABASE QL_CHUONGTRINH_NHAC
GO

USE QL_CHUONGTRINH_NHAC

CREATE TABLE MUABIEUDIEN (
    MAMUA CHAR(10) PRIMARY KEY,
    TENMUA NVARCHAR(100),
    NGAYBATDAU DATE,
    NGAYKT DATE)

	CREATE TABLE NHACTRUONG (
    MANT CHAR(10) PRIMARY KEY,
    TENNT NVARCHAR(100))

	CREATE TABLE CHUONGTRINH (
    SOCT CHAR(10) PRIMARY KEY,
    TENCT NVARCHAR(100),
    NGAYBIEUDIEN DATETIME,
    MAMUA CHAR(10),
    MANT CHAR(10),
    FOREIGN KEY (MAMUA) REFERENCES MUABIEUDIEN(MAMUA),
    FOREIGN KEY (MANT) REFERENCES NHACTRUONG(MANT))

	CREATE TABLE TACPHAM (
    MATP CHAR(10) PRIMARY KEY,
    TENTG NVARCHAR(100),
    TENTP NVARCHAR(100))

	CREATE TABLE PHANDOAN (
    MAPD CHAR(10) PRIMARY KEY,
    SOPD INT,
    TENPD NVARCHAR(100),
    MATP CHAR(10),
    FOREIGN KEY (MATP) REFERENCES TACPHAM(MATP))

	CREATE TABLE BIEUDIEN (
    SOCT CHAR(10),
    MATP CHAR(10),
    PRIMARY KEY (SOCT, MATP),
    FOREIGN KEY (SOCT) REFERENCES CHUONGTRINH(SOCT),
    FOREIGN KEY (MATP) REFERENCES TACPHAM(MATP))

	CREATE TABLE NGUOIHATSOLO (
    MANH CHAR(10) PRIMARY KEY,
    TENNH NVARCHAR(100))

	CREATE TABLE HAT (
    MANH CHAR(10),
    MATP CHAR(10),
    NGAYCUOICUNG DATETIME,
    PRIMARY KEY (MANH, MATP),
    FOREIGN KEY (MANH) REFERENCES NGUOIHATSOLO(MANH),
    FOREIGN KEY (MATP) REFERENCES TACPHAM(MATP))
--2.1.	Bảng MUABIENDIEN 
INSERT INTO MUABIEUDIEN VALUES
('MUA01', N'Mùa Hè Xanh', '2025-06-01', '2025-08-31'),
('MUA02', N'Mùa Thu Vàng', '2025-09-01', '2025-11-30'),
('MUA03', N'Mùa Đông Trắng', '2025-12-01', '2026-02-28'),
('MUA04', N'Mùa Xuân Hy Vọng', '2025-03-01', '2025-05-31'),
('MUA05', N'Mùa Giao Hưởng', '2025-04-01', '2025-06-15');
go
--2.2	Bảng NHACTRUONG 
INSERT INTO NHACTRUONG VALUES
('NT01', N'Nhạc trưởng Sơn Tùng'),
('NT02', N'Nhạc trưởng Mỹ Linh'),
('NT03', N'Nhạc trưởng Quốc Trung'),
('NT04', N'Nhạc trưởng Trịnh Công Sơn'),
('NT05', N'Nhạc trưởng Huy Tuấn'),
('NT06', N'Nhạc trưởng Đặng Thái Sơn');
go
--2.3.	Bảng TACPHAM
INSERT INTO TACPHAM VALUES
('TP01', N'Trịnh Công Sơn', N'Biển nhớ'),
('TP02', N'Trịnh Công Sơn', N'Diễm xưa'),
('TP03', N'Phạm Duy', N'Ngày xưa Hoàng Thị'),
('TP04', N'Phạm Duy', N'Con đường tình ta đi'),
('TP05', N'Văn Cao', N'Tiến quân ca'),
('TP06', N'Văn Cao', N'Buồn tàn thu'),
('TP07', N'Quốc Trung', N'Gió mùa về'),
('TP08', N'Quốc Trung', N'Lời ru'),
('TP09', N'Huy Tuấn', N'Giấc mơ trưa'),
('TP10', N'Huy Tuấn', N'Phố khuya');
go
-- 2.4. Bảng PHANDOAN 
INSERT INTO PHANDOAN VALUES
('PD01', 1, N'Khúc dạo', 'TP01'),
('PD02', 2, N'Điệp khúc', 'TP01'),
('PD03', 3, N'Kết bài', 'TP01'),
('PD04', 1, N'Mở đầu', 'TP02'),
('PD05', 2, N'Phiên khúc', 'TP02'),
('PD06', 1, N'Dẫn nhập', 'TP03'),
('PD07', 2, N'Cao trào', 'TP03'),
('PD08', 1, N'Khúc mở', 'TP04'),
('PD09', 2, N'Hùng ca', 'TP04'),
('PD10', 1, N'Dạo đầu', 'TP05'),
('PD11', 2, N'Điệp khúc', 'TP05'),
('PD12', 1, N'Giới thiệu', 'TP06'),
('PD13', 2, N'Phát triển', 'TP06'),
('PD14', 1, N'Mở bài', 'TP07'),
('PD15', 2, N'Kết thúc', 'TP07')
go
--2.5.	Bảng NGUOIHATSOLO 
INSERT INTO NGUOIHATSOLO VALUES
('NH01', N'Mỹ Tâm'),
('NH02', N'Hồng Nhung'),
('NH03', N'Trần Thu Hà'),
('NH04', N'Tùng Dương'),
('NH05', N'Uyên Linh'),
('NH06', N'Đức Tuấn'),
('NH07', N'Mỹ Linh'),
('NH08', N'Thanh Lam')
go
--2.6.	Bảng HAT
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
go
--2.7.	Bảng CHUONGTRINH
INSERT INTO CHUONGTRINH VALUES
('CT01', N'Hòa nhạc hè', '2025-06-10', 'MUA01', 'NT01'),
('CT02', N'Đêm nhạc Trịnh', '2025-07-15', 'MUA01', 'NT04'),
('CT03', N'Tháng Chín yêu thương', '2025-09-15', 'MUA02', 'NT02'),
('CT04', N'Tình khúc Phạm Duy', '2025-10-20', 'MUA02', 'NT03'),
('CT05', N'Đêm đông huyền ảo', '2025-12-05', 'MUA03', 'NT03'),
('CT06', N'Giao hưởng mùa đông', '2026-01-10', 'MUA03', 'NT06'),
('CT07', N'Giai điệu mùa xuân', '2025-03-20', 'MUA04', 'NT04'),
('CT08', N'Hội xuân âm nhạc', '2025-04-25', 'MUA04', 'NT05')
go
--2.8.	Bảng BIEUDIEN
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
go
--	TRUY VẤN UPDATE
--Cập nhật tên phần đoạn cho các tác phẩm có ca sĩ hát solo là NH01, NH02 hoặc NH06, và có số thứ tự phần đoạn từ 2 trở lên.(Ngọc)
UPDATE PHANDOAN
SET TENPD = N'Biến tấu mới'
WHERE MATP IN (
    SELECT MATP FROM HAT 
    WHERE MANH IN ('NH01', 'NH02', 'NH06'))
	AND SOPD >= 2
--Đổi tên nhạc trưởng “Nhạc trưởng Sơn Tùng” thành “Sơn Tùng M-TP”(Nhàn)
UPDATE NhacTruong
SET TenNT = N'Sơn Tùng M-TP'
WHERE MaNT = 'NT01'
--TRUY VẤN DELETE
--Xóa các phân đoạn của những tác phẩm có tác giả là Văn Cao.(Ngọc)
DELETE FROM PHANDOAN
WHERE MATP IN (
    SELECT MATP
    FROM TACPHAM
    WHERE TENTG = N'Văn Cao')
--Xóa tất cả phần biểu diễn (BIEUDIEN) liên quan đến tác phẩm chưa bao giờ được ca sĩ solo nào hát (Hoa)
DELETE FROM BIEUDIEN
WHERE MATP NOT IN (
    SELECT DISTINCT MATP FROM HAT)
-- kết nối nhiều bảng
--Liệt kê tên ca sĩ solo, tác phẩm họ biểu diễn và ngày biểu diễn cuối cùng.(Nhi)
SELECT 
    NHS.TENNH AS TenCaSi,
    TP.TENTP AS TenTacPham,
    H.NGAYCUOICUNG
FROM NGUOIHATSOLO NHS
JOIN HAT H ON NHS.MANH = H.MANH
JOIN TACPHAM TP ON H.MATP = TP.MATP
go
--Liệt kê các chương trình biểu diễn cùng tên tác phẩm và tên nhạc trưởng chỉ huy chương trình đó(Hoa)
SELECT CT.TENCT, TP.TENTP, NT.TENNT
FROM CHUONGTRINH CT
JOIN BIEUDIEN BD ON CT.SOCT = BD.SOCT
JOIN TACPHAM TP ON BD.MATP = TP.MATP
JOIN NHACTRUONG NT ON CT.MANT = NT.MANT
--GROUP BY
--Hãy thống kê số lượng chương trình biểu diễn do mỗi nhạc trưởng chỉ huy.(Nhi)
SELECT 
    TENNT AS TenNhacTruong,
    COUNT(CT.SOCT) AS SoLuongChuongTrinh
FROM CHUONGTRINH CT
JOIN NHACTRUONG NT ON CT.MANT = NT.MANT
GROUP BY TENNT
--Liệt kê tên các người hát solo đã từng hát ít nhất 2 tác phẩm khác nhau.(Mai)
SELECT 
    NH.TENNH,
    COUNT(DISTINCT H.MATP) AS SoLuongTacPham
FROM NGUOIHATSOLO NH
JOIN HAT H ON NH.MANH = H.MANH
GROUP BY NH.TENNH
HAVING COUNT(DISTINCT H.MATP) >= 2

--Subquery
--Liệt kê tên các nhạc trưởng chưa từng điều khiển chương trình hòa nhạc nào.(Mai)
SELECT TENNT
FROM NHACTRUONG
WHERE MANT NOT IN (
    SELECT DISTINCT MANT
    FROM CHUONGTRINH)
--Tìm các nhạc trưởng chưa từng chỉ huy chương trình nào có tác phẩm của "Văn Cao"(Nhàn)
SELECT TenNT
FROM NhacTruong
WHERE MaNT NOT IN (
    SELECT DISTINCT CT.MaNT
    FROM ChuongTrinh CT
    JOIN BieuDien BD ON CT.SoCT = BD.SoCT
    JOIN TacPham TP ON BD.MaTP = TP.MaTP
    WHERE TP.TenTG = N'Văn Cao')
--Truy vấn bất kì
--Tìm tên các chương trình biểu diễn có ít nhất một tác phẩm của "Phạm Duy"(Nhàn)
SELECT TenCT
FROM ChuongTrinh
WHERE SoCT IN (
    SELECT DISTINCT B.SoCT
    FROM BieuDien B
    JOIN TacPham TP ON B.MaTP = TP.MaTP
    WHERE TP.TenTG = N'Phạm Duy')
--Cho biết tổng số tác phẩm của nhạc sĩ "Phạm Duy" đã được biểu diễn bởi ít nhất 2 ca sĩ solo khác nhau. (Mai)
SELECT COUNT(*) AS 'TongSoTacPhamPhamDuyDuocNhieuCaSiBieuDien'
FROM (
    SELECT H.MATP
    FROM HAT H
    JOIN TACPHAM TP ON H.MATP = TP.MATP
    WHERE TP.TENTG = N'Phạm Duy'
    GROUP BY H.MATP
    HAVING COUNT(DISTINCT H.MANH) >= 2
) AS DS;

--TRUY VẤN THÊM CỦA MAI
--UPDATE
--Cập nhật tên ca sĩ "Uyên Linh" thành "Uyên Linh Idol" nếu cô đã từng hát tác phẩm “Giấc mơ trưa”.
UPDATE NGUOIHATSOLO
SET TENNH = N'Uyên Linh Idol'
WHERE MANH IN (
    SELECT MANH
    FROM HAT
    WHERE MATP = (SELECT MATP FROM TACPHAM WHERE TENTP = N'Giấc mơ trưa')
);
--2. DELETE
--Xóa tất cả các bản ghi trong bảng HAT của những ca sĩ đã hát hơn 3 tác phẩm. 
DELETE FROM HAT
WHERE MANH IN (
    SELECT MANH
    FROM HAT
    GROUP BY MANH
    HAVING COUNT(DISTINCT MATP) > 3
);
--3. GROUP BY
--Thống kê số phân đoạn của mỗi tác phẩm, chỉ hiển thị các tác phẩm có nhiều hơn 1 phân đoạn.
SELECT TP.TENTP, COUNT(PD.MAPD) AS SoPhanDoan
FROM TACPHAM TP
JOIN PHANDOAN PD ON TP.MATP = PD.MATP
GROUP BY TP.TENTP
HAVING COUNT(PD.MAPD) > 1;
--4. SUBQUERY
--Liệt kê các tác phẩm đã từng được biểu diễn nhưng không có ca sĩ nào từng hát.
SELECT TENTP
FROM TACPHAM
WHERE MATP IN (
    SELECT DISTINCT MATP FROM BIEUDIEN
    WHERE MATP NOT IN (
        SELECT DISTINCT MATP FROM HAT
    )
);
--5. Kết nối nhiều bảng (JOIN)
--Liệt kê tên các chương trình, mùa biểu diễn, tên tác phẩm và tên người hát solo nếu có.
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
--6. Câu truy vấn bất kỳ
--Liệt kê tên các ca sĩ solo có tên bắt đầu bằng chữ "M".
SELECT TENNH
FROM NGUOIHATSOLO
WHERE TENNH LIKE N'M%';
--TRUY VẤN THÊM CỦA NGỌC
--SUBQUERY
-- Liệt kê các tác phẩm mà chỉ có 1 ca sĩ hát, kèm tên tác phẩm và tên ca sĩ.
SELECT TP.TENTP, NHS.TENNH
FROM TACPHAM TP
JOIN HAT H ON TP.MATP = H.MATP
JOIN NGUOIHATSOLO NHS ON H.MANH = NHS.MANH
WHERE TP.MATP IN (
    SELECT MATP
    FROM HAT
    GROUP BY MATP
    HAVING COUNT(DISTINCT MANH) = 1)
--kq: 4 rows
--GROUP BY
--Thống kê số tác phẩm được hát bởi mỗi ca sĩ.
SELECT NHS.TENNH, COUNT(DISTINCT H.MATP) AS 'SoTacPham'
FROM NGUOIHATSOLO NHS
JOIN HAT H ON NHS.MANH = H.MANH
GROUP BY NHS.TENNH
--kq: 8 rows
--Tìm tác phẩm có từ 2 phân đoạn trở lên, cùng với tên tác giả
SELECT TP.TENTP, TP.TENTG, COUNT(PD.MAPD) AS SoPhanDoan
FROM TACPHAM TP
JOIN PHANDOAN PD ON TP.MATP = PD.MATP
GROUP BY TP.TENTP, TP.TENTG
HAVING COUNT(PD.MAPD) >= 2;
--UPDATE
--Cập nhật tên phân đoạn thành "Giai điệu đặc biệt" cho các phân đoạn thuộc các tác phẩm có từ 3 phân đoạn trở lên
UPDATE PHANDOAN
SET TENPD = N'Giai điệu đặc biệt'
WHERE MATP IN (
    SELECT MATP
    FROM PHANDOAN
    GROUP BY MATP
    HAVING COUNT(*) >= 3)
-- kq: 3 rows
--JOIN
--Danh sách chương trình biểu diễn và các tác phẩm liên quan
SELECT 
    CT.TENCT AS TenChuongTrinh,
    CT.NGAYBIEUDIEN AS NgayBieuDien,
    NT.TENNT AS TenNhacTruong,
    TP.TENTP AS TenTacPham
FROM 
    CHUONGTRINH CT
JOIN 
    NHACTRUONG NT ON CT.MANT = NT.MANT
JOIN 
    BIEUDIEN BD ON CT.SOCT = BD.SOCT
JOIN 
    TACPHAM TP ON BD.MATP = TP.MATP;
--DELETE
--Xóa chương trình CT01 và các bản ghi liên quan
DELETE FROM BIEUDIEN 
WHERE SOCT = 'CT01';

DELETE FROM HAT
WHERE MATP IN (SELECT MATP FROM BIEUDIEN WHERE SOCT = 'CT01');

DELETE FROM CHUONGTRINH 
WHERE SOCT = 'CT01';

--TRUY VẤN THÊM CỦA HOA
--1. UPDATE: Cập nhật tên chương trình biểu diễn đầu tiên của mùa “Mùa Thu 2023” thành “Chương trình khai mạc”
UPDATE CHUONGTRINH
SET TENCT = N'Chương trình khai mạc'
WHERE SOCT = (
    SELECT TOP 1 CT.SOCT
    FROM CHUONGTRINH CT
    JOIN MUABIEUDIEN MB ON CT.MAMUA = MB.MAMUA
    WHERE MB.TENMUA = N'Mùa Thu 2023'
    ORDER BY CT.NGAYBIEUDIEN ASC
);
--2. DELETE: Xóa tất cả phân đoạn không thuộc bất kỳ tác phẩm nào đã từng được hát
DELETE FROM PHANDOAN
WHERE MATP NOT IN (
    SELECT DISTINCT MATP FROM HAT
);
--3. GROUP BY: Thống kê số lượng tác phẩm mà mỗi nhạc trưởng từng chỉ huy
SELECT NT.TENNT, COUNT(DISTINCT BD.MATP) AS 'SoTacPhamChiHuy'
FROM NHACTRUONG NT
JOIN CHUONGTRINH CT ON NT.MANT = CT.MANT
JOIN BIEUDIEN BD ON CT.SOCT = BD.SOCT
GROUP BY NT.TENNT;
--4. GROUP BY: Liệt kê các ca sĩ và số lượng tác phẩm họ đã hát nhiều hơn 1 lần
SELECT NHS.TENNH, COUNT(*) AS 'SoLanHat'
FROM NGUOIHATSOLO NHS
JOIN HAT H ON NHS.MANH = H.MANH
GROUP BY NHS.TENNH, H.MATP
HAVING COUNT(*) > 1;
--5. SUBQUERY: Liệt kê tên ca sĩ đã hát ít nhất một tác phẩm mà chưa từng được biểu diễn trong bất kỳ chương trình nào
SELECT DISTINCT NHS.TENNH
FROM NGUOIHATSOLO NHS
JOIN HAT H ON NHS.MANH = H.MANH
WHERE H.MATP IN (
    SELECT MATP
    FROM TACPHAM
    WHERE MATP NOT IN (
        SELECT DISTINCT MATP FROM BIEUDIEN
    )
);
--6. SUBQUERY: Liệt kê tên các nhạc trưởng đã từng chỉ huy chương trình có ít nhất 1 tác phẩm mà ca sĩ "Hà Trần" chưa từng hát
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
        WHERE NHS.TENNH = N'Hà Trần'
    )
);

--TRUY VẤN THÊM CỦA NHÀN 
--1.	Đổi tên người có mã 'NH03' thành 'Hà Trần'
UPDATE NGUOIHATSOLO
SET TENNH = N'Hà Trần'
WHERE MANH = 'NH03';
--2. Xóa các dòng biểu diễn các tác phẩm của Trịnh Công Sơn
DELETE FROM BIEUDIEN
WHERE MATP IN (
    SELECT MATP FROM TACPHAM WHERE TENTG = N'Trịnh Công Sơn'
);
--3.	Liệt kê các chương trình có ít nhất 2 tác phẩm của cùng một tác giả
SELECT BD.SOCT, TP.TENTG, COUNT(*) AS SoTacPhamTG
FROM BIEUDIEN BD
JOIN TACPHAM TP ON BD.MATP = TP.MATP
GROUP BY BD.SOCT, TP.TENTG
HAVING COUNT(*) >= 2;
--4.	Tìm ca sĩ đã hát tất cả các tác phẩm của Trịnh Công Sơn
SELECT TenNH
FROM NguoiHatSolo
WHERE MaNH IN (
    SELECT H.MaNH
    FROM Hat H
    WHERE NOT EXISTS (
        SELECT TP.MaTP
        FROM TacPham TP
        WHERE TP.TenTG = N'Trịnh Công Sơn'
        EXCEPT
        SELECT MaTP
        FROM Hat H2
        WHERE H2.MaNH = H.MaNH
    )
);
--5.	Liệt kê tên chương trình, mùa biểu diễn, nhạc trưởng và tổng số tác phẩm biểu diễn trong chương trình đó
SELECT 
    CT.TENCT,
    MB.TENMUA,
    NT.TENNT,
    COUNT(BD.MATP) AS SoTacPham
FROM CHUONGTRINH CT
JOIN MUABIEUDIEN MB ON CT.MAMUA = MB.MAMUA
JOIN NHACTRUONG NT ON CT.MANT = NT.MANT
JOIN BIEUDIEN BD ON CT.SOCT = BD.SOCT
GROUP BY CT.TENCT, MB.TENMUA, NT.TENNT;
--6.	Tìm tên người hát solo đã hát nhiều tác phẩm nhất
SELECT TenNH
FROM NguoiHatSolo
WHERE MaNH = (
    SELECT TOP 1 MaNH
    FROM Hat
    GROUP BY MaNH
    ORDER BY COUNT(DISTINCT MaTP) DESC
);

--TRUY VẤN THÊM CỦA NHI
--1. UPDATE: Cập nhật ngày bắt đầu của mùa biểu diễn chứa chương trình có nhạc trưởng Trịnh Công Sơn thành '2025-03-01'.
UPDATE MUABIEUDIEN
SET NGAYBATDAU = '2025-03-01'
WHERE MAMUA IN (
    SELECT MAMUA
    FROM CHUONGTRINH
    WHERE MANT IN (
        SELECT MANT
        FROM NHACTRUONG
        WHERE TENNT = N'Nhạc trưởng Trịnh Công Sơn'
    )
) 
--2. DELETE: Xóa những bản ghi trong bảng HAT mà ngày cuối cùng biểu diễn trước ngày 01/08/2025.
DELETE FROM HAT
WHERE NGAYCUOICUNG < '2025-08-01'
--3. KẾT NỐI NHIỀU BẢNG (JOIN): Liệt kê tên chương trình, tên tác phẩm được biểu diễn và tên nhạc trưởng.
SELECT CT.TENCT, TP.TENTP, NT.TENNT
FROM CHUONGTRINH CT
JOIN BIEUDIEN BD ON CT.SOCT = BD.SOCT
JOIN TACPHAM TP ON BD.MATP = TP.MATP
JOIN NHACTRUONG NT ON CT.MANT = NT.MANT
--4. GROUP BY: Hãy thống kê số lần mỗi tác phẩm được biểu diễn.
SELECT 
    TP.TENTP AS TenTacPham,
    COUNT(BD.SOCT) AS SoLanBieuDien
FROM BIEUDIEN BD
JOIN TACPHAM TP ON BD.MATP = TP.MATP
GROUP BY TP.TENTP;
--5. SUBQUERY: Liệt kê tên các ca sĩ solo đã từng biểu diễn ít nhất một tác phẩm mà nhạc sĩ “Phạm Duy” sáng tác.
SELECT TENNH
FROM NGUOIHATSOLO
WHERE MANH IN (
    SELECT DISTINCT MANH
    FROM HAT
    WHERE MATP IN (
        SELECT MATP
        FROM TACPHAM
        WHERE TENTG = N'Phạm Duy'
    )
)
--6. KẾT NỐI NHIỀU BẢNG (JOIN): Liệt kê tên chương trình, tên tác phẩm và tên ca sĩ solo đã biểu diễn trong chương trình đó. 
SELECT 
    CT.TENCT, 
    TP.TENTP, 
    NHS.TENNH
FROM CHUONGTRINH CT
JOIN BIEUDIEN BD ON CT.SOCT = BD.SOCT
JOIN TACPHAM TP ON BD.MATP = TP.MATP
JOIN HAT H ON TP.MATP = H.MATP
JOIN NGUOIHATSOLO NHS ON H.MANH = NHS.MANH






