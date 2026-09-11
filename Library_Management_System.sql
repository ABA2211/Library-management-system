create database library ;
GO
use library;
GO

create table authors (
author_id int identity(1,1) ,
author_name varchar(255) ,
nationality varchar(255) ,
primary key (author_id)
);

create table categories (
cat_id int not null ,
cat_name varchar(255) not null ,
shelf_num varchar(255) ,
primary key(cat_id)
);

create table books (
book_id int unique ,
title varchar(255) not null ,
publish_year int ,
price decimal(10,2) ,
cat_id int ,
author_id int ,
primary key (book_id),
foreign key (cat_id) references categories (cat_id),
foreign key (author_id) references authors (author_id)
);

create table members (
member_id int unique ,
member_name varchar(255) ,
phone varchar(255) ,
join_date date ,
primary key(member_id)
);

create table borrow_records (
record_id int not null ,
borrow_date date ,
return_date date ,
primary key(record_id),
member_id int ,
book_id int ,
foreign key(member_id) references members (member_id),
foreign key(book_id) references books (book_id)
);

insert into authors (author_name, nationality)
values ('Naguib Mahfouz','Egyptian'),
       ('J.K. Rowling','British'),
       ('Paulo Coelho','Brazilian'),
       ('Agatha Christie','British'),
       ('Taha Hussein','Egyptian');

insert into categories (cat_id, cat_name, shelf_num)
values (1,'Novels','A1'),
       (2,'Fantasy','A2'),
       (3,'Self-Development','B1'),
       (4,'Mystery','B2'),
       (5,'History','C1');

insert into books (book_id, title, publish_year, price, cat_id, author_id)
values (201,'Palace Walk',1956,120,1,1),
       (202,'Harry Potter and the Philosopher''s Stone',1997,200,2,2),
       (203,'The Alchemist',1988,150,3,3),
       (204,'Murder on the Orient Express',1934,140,4,4),
       (205,'The Days',1929,90,5,5),
       (206,'Sugar Street',1957,130,1,1),
       (207,'Harry Potter and the Chamber of Secrets',1998,210,2,2);

insert into members (member_id, member_name, phone, join_date)
values (1,'Mostafa Kamal','01011122233','2025-01-10'),
       (2,'Nour El Din','01122233344','2025-03-05'),
       (3,'Salma Adel','01233344455','2025-06-20'),
       (4,'Hany Fathy','01344455566','2025-08-15'),
       (5,'Rana Emad','01455566677','2025-09-01');

insert into borrow_records (record_id, borrow_date, return_date, member_id, book_id)
values (1,'2026-01-05','2026-01-20',1,201),
       (2,'2026-01-10',null,2,202),
       (3,'2026-02-01','2026-02-15',3,203),
       (4,'2026-02-10',null,4,204),
       (5,'2026-03-01','2026-03-10',5,205),
       (6,'2026-03-05',null,1,206);

select * from authors ;
select * from categories ;
select * from books ;
select * from members ;
select * from borrow_records ;

update books set price = 220 where book_id = 202 ;
update members set phone = '01099998877' where member_id = 1 ;

delete from borrow_records where record_id = 6 ;

select * from books where price > 130 ;
select * from books where title like '%Harry%' ;
select * from books order by price desc ;

select cat_id , count(book_id) as number_books from books group by cat_id ;

select books.title , authors.author_name
from books
inner join authors on books.author_id = authors.author_id ;

select members.member_name , books.title , borrow_records.borrow_date , borrow_records.return_date
from borrow_records
join members on borrow_records.member_id = members.member_id
join books on borrow_records.book_id = books.book_id ;

select * from borrow_records where return_date is null ;

select author_name , count(book_id) as total_books
from authors
join books on authors.author_id = books.author_id
group by author_name
order by total_books desc ;
