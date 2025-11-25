--a

update SP_DonHang
set ThanhTien = sp.SoLuong * s.DonGia
from SP_DonHang sp
join SanPham s on sp.IDSanPham = s.IDSanPham

--b

update DonHang
set TongTien = tongtiensp.tongtien
from DonHang dh
join (
    select sp.IDDonHang, sum(ThanhTien) as tongtien
    from SP_DonHang sp
    group by sp.IDDonHang
) as tongtiensp on dh.IDDonHang = tongtiensp.IDDonHang

select * from DonHang

select * from SP_DonHang

--c

select
    HoTen,
    iif (charindex(' ', HoTen) = 0,
        HoTen,
        RIGHT(HoTen, CHARINDEX(' ', REVERSE(HoTen)))
    ) as ten
from KhachHang

--c

