Go
USE sv_tnut;---thông tin này chính là em 
INSERT INTO SV (masv, hodem, ten, ns, lop, sdt)
VALUES ('k225480106062', 'Vũ Đức', 'Tú', '2004-10-23', 'K58KTP.K01', '0813424299');


---3 Tìm Người trùng ns
SELECT *  
FROM SV  
WHERE ns = '2004-10-23';

--4 nhập sql để tìm xem có những sv nào trùng ngày và tháng sinh với em?
SELECT *
FROM SV
WHERE DAY(ns) =23 AND MONTH(ns) = 10;

--5 nhập sql để tìm xem có những sv nào trùng tháng và năm sinh với em?
SELECT *
FROM SV
WHERE MONTH(ns) = 10 AND YEAR(ns) = 2004;


--6 nhập sql để tìm xem có những sv nào trùng tên với em?
SELECT *
FROM SV
WHERE ten = N'Tú';


---7 nhập sql để tìm xem có những sv nào trùng họ và tên đệm với em.
SELECT *
FROM SV
WHERE hodem = N'Vũ Đức';

---8  nhập sql để tìm xem có những sv nào có sđt sai khác chỉ 1 số so với sđt của em.
SELECT *
FROM SV
WHERE LEN(sdt) = LEN('0813424299')
AND (
    SELECT COUNT(*) 
    FROM (
        SELECT number
        FROM master..spt_values
        WHERE type = 'P' AND number BETWEEN 1 AND LEN(sdt)
    ) AS nums
    WHERE SUBSTRING(sdt, nums.number, 1) <> SUBSTRING('0813424299', nums.number, 1)
) = 1;

---9 BẢNG SV CÓ HƠN 9000 ROWS, HÃY LIỆT KÊ TẤT CẢ CÁC SV NGÀNH KMT, SẮP XẾP THEO TÊN VÀ HỌ ĐỆM, KIỂU TIẾNG  VIỆT, GIẢI THÍCH.
SELECT * 
FROM SV
WHERE lop LIKE '%KMT%'
ORDER BY 
    ten COLLATE Vietnamese_CI_AS,
    hodem COLLATE Vietnamese_CI_AS;


--10 HÃY NHẬP SQL ĐỂ LIỆT KÊ CÁC SV NỮ NGÀNH KMT CÓ TRONG BẢNG SV (TRÌNH BÀY QUÁ TRÌNH SUY NGHĨ VÀ GIẢI NHỮNG VỨNG MẮC)
SELECT masv, hodem, ten, ns, lop
FROM SV
WHERE lop LIKE '%KMT%'  
  AND ten IN (
    N'Linh', N'Trang', N'Thảo', N'Hương', N'Mai', 
    N'Lan', N'Vân', N'Nhung', N'Thu', N'Tuyết',
    N'Ngọc', N'Yến', N'Anh', N'Hà', N'Phương',
    N'Quỳnh', N'Giang', N'Chi', N'Tâm', N'Tiên',
    N'Cúc', N'Diệp', N'Ly', N'Hạnh', N'Loan',
    N'Thúy', N'Đào', N'Sơn Ca', N'Mộng', N'Thanh'
  )
ORDER BY 
    MONTH(ns), 
    DAY(ns),  
    ten COLLATE Vietnamese_CI_AS,
    hodem COLLATE Vietnamese_CI_AS;


	  SELECT masv, hodem, ten, ns, lop
FROM SV
WHERE lop LIKE '%KMT%'  
  AND ten IN (
    N'Linh', N'Trang', N'Thảo', N'Hương', N'Mai', 
    N'Lan', N'Vân', N'Nhung', N'Thu', N'Tuyết',
    N'Ngọc', N'Yến', N'Hà', N'Phương',
    N'Quỳnh', N'Giang', N'Chi', N'Tâm', N'Tiên',
    N'Cúc', N'Diệp', N'Ly', N'Hạnh', N'Loan',
    N'Thúy', N'Đào', N'Thanh', N'Sơn Ca'
  )
ORDER BY 
    MONTH(ns), DAY(ns),  -- Sắp xếp theo ngày sinh
    ten COLLATE Vietnamese_CI_AS,
    hodem COLLATE Vietnamese_CI_AS;


