-- Untuk setiap movie, tampilkan id movie, judul movie, tahun rilis, dan jumlah episode nya,
-- lalu urutkan dari tahun rilis terbaru hingga terlama. Untuk movie yang tidak memiliki
-- episode tidak perlu ditampilkan.
SELECT id "ID Movie", title "Judul Movie", ReleasedYear "Tahun
Rilis", COUNT(episode.Mid) "Jumlah Episode"
FROM movie
JOIN episode ON movie.id = episode.MId
GROUP BY id, title, ReleasedYear
ORDER BY ReleasedYear DESC;

-- Tampilkan jumlah episode dari movie “Cells at Work” yang telah ditonton oleh user bernama
-- “Andrew”. Jika Andrew menonton episode yang sama lebih dari sekali maka tetap dihitung
-- 1.
select count(distinct episode.ETitle) "Jumlah Episode"
from episode, watch_history, users, movie
where episode.Mid = watch_history.Mid
and episode.Episodenum = watch_history.Episodenum
and episode.season = watch_history.Season
and watch_history.uid = users.email
and episode.Mid = movie.id
and users.name = 'Andrew'
and movie.title = 'Cells at Work';

-- Tampilkan semua judul movie, dimana memiliki episode yang telah ditonton lebih dari 1 kali.
-- Contoh: movie “Cells at Work” memiliki episode yang telah ditonton lebih dari 1 kali (pada
-- season 2 episode 1).
select distinct "Judul Movie"
from (
    select title "Judul Movie", ETitle, count( episode.ETitle)
    from episode, watch_history, movie, users
    where episode.Mid = watch_history.Mid
    and episode.Episodenum = watch_history.Episodenum
    and episode.season = watch_history.Season
    and watch_history.uid = users.email
    and episode.Mid = movie.id
    group by title, etitle
    having count( episode.ETitle) > 1
) as total_episodes_watched;

-- Tampilkan nama dan email dari user yang yang durasi menontonnya selalu lebih dari 1 jam.
select name, email
from watch_history wh1, users
where wh1.uid = users.email
and wh1.duration > '1:00:00'
except
select name, email
from watch_history wh2, users
where wh2.uid = users.email
and wh2.duration < '1:00:00';

-- Tampilkan semua informasi movie (judul movie, judul episode, nama genre) mana saja yang
-- dapat ditonton oleh user bernama 'Andrew', 'Nobita', dan 'Monalisa' sesuai usia mereka.
-- Perhatikan bahwa movie yang tidak memiliki episode yang memenuhi requirement ini juga
-- tetap ditampilkan, dengan judul episode nya bernilai NULL Petunjuk Anda dapat
-- menggunakan fungsi date_part(‘year’, TANGGAL) untuk mendapatkan tahun dari suatu
-- variabel TANGGAL yang bertipe date.
select distinct type "Genre", title "Judul Movie", etitle "Judul
Episode"
from movie
left join genre on movie.gid = genre.id
left join episode on movie.id = episode.Mid
and ViewerAgeLimit <= (
    select min(date_part('year', now()) - Birthyear)
    from users
    where name = 'Andrew' or
    name = 'Nobita' or
    name = 'Monalisa'
);

-- Buatlah stored procedure countNumberOfViewers untuk menghitung jumlah user yang telah
-- menonton movie untuk suatu season dan episode tertentu. Stored procedure ini menerima
-- 3 buah argumen, yaitu: judul movie, nomor season, dan nomor episode. Asumsi nilai judul
-- movie, nomor season dan nomor episode yang diinputkan pada fungsi ini pasti bukan NULL.
-- Contoh: jumlah viewer (user yang telah menonton) film Kungfu Panda The Dragon Knight
-- season 1 episode 2 adalah 3 orang. Perhatikan bahwa jika seorang user yang sama
-- menonton suatu episode berkali-kali maka akan tetap dihitung sebagai 1 viewer. Setelah
-- stored procedure dibuat, lakukan pengetesan dengan memanggil: SELECT
-- countNumberOfViewers(‘Kungfu Panda the Dragon Knight’, 1, 2);
create or replace function countNumberOfViewers(
    title_par varchar,
    season_par int,
    episode_par int
)
returns int as $$
declare
    result int;
    begin
    select count(distinct uid)
    into result
    from watch_history
    where Mid = (
        select id
        from movie
        where title = title_par
    )
    and season = season_par
    and episodenum = episode_par;
    return result;
end;
$$ language plpgsql;

-- Buatlah stored procedure recommendedMoviePercentage untuk menghitung persentase
-- jumlah movie direkomendasikan (recommended=”YES”) oleh user yang sudah menonton
-- movie tertentu. Stored procedure ini menerima 1 buah argumen, yaitu judul movie. Contoh:
-- pemanggilan recommendedMoviePercentage(‘Cells at Work’) akan mengembalikan nilai 66
-- karena ada 2 nilai rekomendasi ”YES” dari total 3 nilai rekomendasi yang diberikan untuk
-- movie “Cells at Work”, sehingga hasilnya menjadi 100% * (⅔) = 66%. Setelah stored
-- procedure dibuat, lakukan pengetesan dengan memanggil: SELECT
-- recommendedMoviePercentage(‘Cells at Work’);
create or replace function recommendedMoviePercentage(title_par varchar)
returns int as $$
declare
    result int;
begin
    select round(100 * (
        select count(*)
        from watch_history
        where Mid = (
            select id
            from movie
            where title = title_par
        )
        and recommended = 'YES'
    ) / (
        select count(*)
        from watch_history
        where Mid = (
            select id
            from movie
            where title = title_par
        )
    ))
    into result;
    return result;
end;
$$ language plpgsql;

-- Buatlah stored procedure & trigger checkWatchingDuration untuk memastikan bahwa durasi
-- menonton suatu episode movie dari seorang pengguna tidak mungkin lebih besar dari durasi
-- episode itu sendiri. Perhatikan event apa saja yang perlu mengaktifkan trigger yang Anda
-- buat. Setelah stored procedure & trigger dibuat, lakukan pengetesan untuk satu perintah
-- SQL berikut ini: insert into watch_history values (11, 'mipo@gmail.com', 10, 1, 3, '2020-10-
-- 28 10:00', '03:00:00', 'YES');
create or replace function checkWatchingDuration()
returns trigger as $$
begin
    if new.duration > (
        select eduration
        from episode
        where Mid = new.Mid
        and season = new.season
        and episodenum = new.episodenum
    ) then
        raise exception 'Duration is longer than the episode';
    end if;
    return new;
end;
$$ language plpgsql;

create trigger checkWatchingDuration
before insert or update
on watch_history
for each row
execute procedure checkWatchingDuration();
drop trigger checkWatchingDuration on watch_history;

