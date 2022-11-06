-- 1. Tampilkan nama restoran dan cabangnya yang berlokasi di Provinsi Yogyakarta dengan rating > 4.5.
select Rname "Nama Restoran", Rbranch "Cabang Restoran"
from restaurant
where Province = 'Yogyakarta' and rating > 4.5;

-- 2. Tampilkan nama makanan apa saja yang dijual oleh restoran-restoran yang bekerja sama dengan PT. Gurmanas yang memiliki harga dengan rentang Rp 10.000,00 - Rp 50.000,00.
select FoodName "Nama Makanan" from Food
where price between 10000 and 50000; 

-- 3. Tampilkan semua nama makanan yang dijual oleh Restoran ABX yang mengandung bahan makanan kacang. Petunjuk: Anda harus membuat nested query menggunakan keyword IN dengan benar
select foodname "Nama Makanan"
from food_ingredient f 
join ingredient i on f.ingredient = i.id
where f.rname = 'ABX'and i.name in (
    select name from ingredient
    where LOWER(name) = 'kacang');
);

-- 4. Pelanggan yang membeli makanan memiliki opsi untuk menambahkan note/keterangan terkait pesanan yang dilakukan. Tampilkan nama makanan yang dipesan oleh pelanggan bernama Carissa Magnolia yang memiliki note atau keterangan tambahan. Petunjuk: Anda harus membuat nested query menggunakan keyword EXISTS dengan benar
select distinct foodname "Nama Makanan"
from transaction_food tf
where exists (
    select * from user u
    where tf.email = u.email
    and u.fname = 'Carissa' and u.lname = 'Magnolia' ) 
and note is not null;
-------------------------------atau-----------------------------
select distinct foodname "Nama Makanan"
from transaction_food tf
where exists (
    select * from user_ u
    where tf.email = u.email
    and u.fname = 'Carissa' u.lname = 'Magnolia' and note is not null
);

-- 5. Tampilkan nama dari kurir yang pernah mengantar makanan yang dipesan dari restoran "KFC" cabang "Margonda", tetapi belum pernah mengantar makanan dari restoran "KFC" cabang "Lenteng Agung".
select fname "Nama Depan", lname "Nama Belakang"
from user u
join courier c on u.email = c.email
where exists (
    select * from transaction t
    join transaction_food tf on t.email = tf.email
    where t.CourierId = c.email and tf.rname = 'KFC' and tf.rbranch = 'Margonda'
) AND NOT EXISTS (
    select * from transaction t
    join transaction_food tf on t.email = tf.email
    where t.CourierId = c.email and tf.rname = 'KFC' and tf.rbranch = 'Lenteng Agung'
);
-------------------------------atau-----------------------------
SELECT DISTINCT u.FName, u.LName
FROM user u JOIN courier c
 ON u.email = c.email
 JOIN transaction t
 ON c.email = t.courierid
 JOIN transaction_food tf
 ON t.email = tf.email
 AND t.datetime = tf.datetime
WHERE rname = 'KFC'
 AND rbranch = 'Margonda'
EXCEPT 
SELECT DISTINCT u.FName, u.LName
FROM user u JOIN courier c
 ON u.email = c.email
 JOIN transaction t
 ON c.email = t.courierid
 JOIN transaction_food tf
 ON t.email = tf.email
 AND t.datetime = tf.datetime
WHERE rname = 'KFC'
 AND rbranch = 'Lenteng Agung';

-- 6. Tampilkan nama dan email pelanggan yang belum pernah memesan makanan pada aplikasi SIREST.
select fname "Nama Depan", lname "Nama Belakang", email "Email"
from user u
where not exists (
    select * from transaction t
    where u.email = t.email
);

-- 7. Tampilkan nama dan email pelanggan yang sudah pernah menggunakan semua metode pembayaran yang disediakan oleh aplikasi SIREST.
select fname, lname, email
from (
    select distinct fname, lname, u.email email, pmid
    from user u
    join transaction t on u.email = t.email
    ) as user_acc_transaction_distinct
group by fname, lname, email
having count(pmid) = (SELECT COUNT(*) FROM payment_method);
-------------------------------atau-----------------------------
select distinct fname, lname, u.email email
from user u
join transaction t on u.email = t.email
group by fname, lname, u.email 
having count(distinct pmid) = (SELECT COUNT(*) FROM payment_method);

-- 8. Tampilkan nama dan harga makanan untuk makanan yang paling laku (memiliki jumlah pembelian item terbanyak) di restoran "KFC" cabang "Margonda".
select f.foodname "Nama Makanan", f.price "Harga Makanan"
from food f, transaction_food tf
where tf.rname = f.rname and tf.rbranch = f.rbranch and tf.foodname = f.foodname 
and tf.rname = 'KFC' and tf.rbranch = 'Margonda'
group by f.foodname, f.price
order by sum(tf.amount) desc
limit 1; -- menampilkan hanya 1
-------------------------------atau-----------------------------
select tf.foodname, price
from transaction_food tf, food f
where tf.rname = f.rname and tf.rbranch = f.rbranch and tf.foodname = f.foodname and tf.rname = 'KFC' and tf.rbranch = 'Margonda'
group by tf.rname, tf.rbranch, tf.foodname, price
having sum(amount) = (
    (select max(total_terjual)
    from (
        select sum(amount) total_terjual
        from transaction_food tf
        where tf.rname = 'KFC' and tf.rbranch = 'Margonda'
        group by tf.rname, tf.rbranch, foodname
        ) total_terjual_by_food)
); -- menampilkan semua yang memiliki jumlah pembelian terbanyak

-- 9. Untuk setiap restoran, tampilkan jumlah menu, harga minimum menu dan harga maksimum menu yang ditawarkan di restoran tersebut.
select rname "Nama Restoran", rbranch "Nama Cabang", count(foodname) "Jumlah Menu", min(price) "Harga Terendah", max(price) "Harga Tertinggi"
from food
group by rname, rbranch;

-- 10.Tampilkan nama promo yang saat ini masih berlaku / digunakan oleh sekurang-kurangnya 10 restoran (perhatikan bahwa promo yang sudah lewat dianggap tidak valid / tidak diperhitungkan). Petunjuk: Anda dapat menggunakan keyword current_timestamp untuk mendapatkan nilai timestamp saat ini.
select p.promoname as Nama_Promo
from promo p 
where exists (
    select * from restaurant_promo rp
    where p.id = rp.pid and current_timestamp between rp.start and rp.end
) and exists (
    select * from restaurant_promo rp
    where p.id = rp.pid
    group by pid
    having count(pid) >= 10
);
-------------------------------atau-----------------------------
select p.promoname as Nama_Promo
from promo p 
where p.id in (
    select pid
    from restaurant_promo
    group by pid
    having count(pid) >= 10
) and p.id in (
    select pid
    from restaurant_promo rp
    where current_timestamp between rp.start and rp.end
);
-------------------------------atau-----------------------------
select p.promoname "Nama Promo"
from promo p 
where p.id in (
    select pid
    from restaurant_promo rp
    where rp.start <= current_timestamp and rp.end >= current_timestamp
) and p.id in (
    select pid
    from restaurant_promo
    group by pid
    having count(pid) >= 10
);