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

declare ttdonhang cursor dynamic scroll
for
    select dh.IDDonHang, dh.NgayDatHang, dh.TongTien
    from DonHang dh
    join KhachHang kh on dh.IDKhachHang = kh.IDKhachHang
    where kh.HoTen = N'Nguyễn Văn An'
open ttdonhang

declare @iddh int, @ngaydh datetime, @tongtien float
fetch first from ttdonhang into @iddh, @ngaydh, @tongtien
while (@@fetch_status = 0)
Begin
    print cast(@iddh as varchar(10)) + '    ' + CONVERT(varchar(15), @ngaydh, 103) + '    ' + FORMAT(@tongtien, 'N2')
    fetch next from ttdonhang into @iddh, @ngaydh, @tongtien
end

close ttdonhang
deallocate ttdonhang




