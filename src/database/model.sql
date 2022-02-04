create database  master_class;

create table users (
    id serial not null primary key,
    name varchar(50) not null,
    surname varchar(50) not null,
    phone varchar(15) not null,
    category int not null references categories(id)
);

create table admin (
    id serial not null primary key,
    username varchar(25) not null,
    password varchar(25) not null,
    avatar TEXT
    
);

create table cards (
    id serial not null primary key,
    user_id int not null references users(id),
    title varchar(200) not null,
    sap_category_id int not null references sap_categories(id),
    views int not null default 0,
    card_image text not null,
    date timestamp not null,
    short_info text not null,
    long_info text not null,
    status boolean not null,
    location text,
    confirmation_number smallint not null DEFAULT 1,
    card_created_at timestamptz not null,
    card_deleted_at timestamptz
);

create table categories(
    id serial not null primary key,
    category varchar(100) not null
);

create table sap_categories(
    id serial not null primary key,
    category_id int not null references categories(id),
    name varchar(100) not null
);

drop table if exists users ; -- cascade
drop table if exists categories ; -- cascade
drop table if exists sap_categories ; -- cascade
drop table if exists cards ; -- cascade

select * from users;
select * from cards;
select * from categories;
select * from sap_categories;


insert into users (name, surname, phone) values ('Doreen', 'Glitherow', '9589441734');
insert into users (name, surname, phone) values ('Devland', 'Aubrey', '3065155816');
insert into users (name, surname, phone) values ('Atalanta', 'Sowood', '9965472836');
insert into users (name, surname, phone) values ('Ricky', 'Meadway', '8141258276');
insert into users (name, surname, phone) values ('Daune', 'Larrat', '6026700498');
insert into users (name, surname, phone) values ('Cherianne', 'Galloway', '5703327903');
insert into users (name, surname, phone) values ('Ellene', 'Dederick', '3047481977');
insert into users (name, surname, phone) values ('Lanna', 'Reichartz', '3301299276');
insert into users (name, surname, phone) values ('Sib', 'Chrystie', '1182875559');


insert into categories (category) values ('IT');
insert into categories (category) values ('Ta`lim');
insert into categories (category) values ('Business');
insert into categories (category) values ('Marketing');


insert into cards ( user_id, title, sap_category_id, views, card_image, date, short_info, long_info, status, location, confirmation_number) values (1,  'Common grenadier', 1, 734, 'independent.co.uk/ultrices/erat/tortor/sollicitudin/mi/sit.aspx', '2021-09-05 15:24:55', 'Uraeginthus granatina', 'Motacilla aguimp', true,'Clemons', 1);
insert into cards ( user_id, title, sap_category_id, views, card_image, date, short_info, long_info, status, location, confirmation_number) values (2, 'Alligator, american', 1, 378, 'newsvine.com/suspendisse/potenti/in/eleifend/quam/a/odio.jpg', '2021-11-22 18:05:55', 'Alligator mississippiensis', 'Spermophilus tridecemlineatus', false,'Nobel', 1);
insert into cards ( user_id, title, sap_category_id, views, card_image, date, short_info, long_info, status, location, confirmation_number) values (3, 'European red squirrel', 1, 461, 'netlog.com/nulla/eget/eros.js', '2021-12-17 19:12:57', 'Sciurus vulgaris', 'Odocoileus hemionus', true,'Delaware', 1);
insert into cards ( user_id, title, sap_category_id, views, card_image, date, short_info, long_info, status, location, confirmation_number) values (4, 'Sheep, red', 2, 497, 'aol.com/rhoncus/dui/vel/sem/sed/sagittis.xml', '2021-10-08 08:39:35', 'Ovis ammon', 'Neotis denhami', true,'Bartillon', 1);
insert into cards ( user_id, title, sap_category_id, views, card_image, date, short_info, long_info, status, location, confirmation_number) values (5,  'Lizard, frilled', 2, 781, 'ovh.net/sodales.aspx', '2021-10-06 14:22:52', 'Chlamydosaurus kingii', 'Ceratotherium simum', true,'Duke', 1);
insert into cards ( user_id, title, sap_category_id, views, card_image, date, short_info, long_info, status, location, confirmation_number) values (6,  'Trotter, lily', 3, 399, 'blogger.com/donec/ut/dolor/morbi.jsp', '2021-03-20 04:23:55', 'Actophilornis africanus', 'Cebus nigrivittatus', false,'Schmedeman', 1);
insert into cards ( user_id, title, sap_category_id, views, card_image, date, short_info, long_info, status, location, confirmation_number) values (7, 'White-rumped vulture', 3, 546, 'pen.io/lectus/vestibulum/quam/sapien.html', '2021-02-24 03:00:08', 'Gyps bengalensis', 'Corvus albicollis', false,'Thompson', 1);
insert into cards ( user_id, title, sap_category_id, views, card_image, date, short_info, long_info, status, location, confirmation_number) values (8,  'Snake, eastern indigo', 4, 385, 'php.net/dapibus/dolor/vel/est/donec/odio.jsp', '2021-12-13 06:11:14', 'Drymarchon corias couperi', 'Cynomys ludovicianus', true,'Lighthouse Bay', 1);
insert into cards ( user_id, title, sap_category_id, views, card_image, date, short_info, long_info, status, location, confirmation_number) values (9,  'African buffalo', 4, 599, 'wix.com/eget/tempus/vel/pede/morbi.html', '2021-05-28 14:29:16', 'Snycerus caffer', 'Cacatua tenuirostris', true,'Forster', 1);
insert into cards ( user_id, title, sap_category_id, views, card_image, date, short_info, long_info, status, location, confirmation_number) values (1,  'White-rumped vulture', 5, 633, 'businessinsider.com/habitasse/platea/dictumst/morbi/vestibulum/velit/id.aspx', '2021-08-08 01:28:27', 'Gyps bengalensis', 'Pitangus sulphuratus', true,'Canary', 1);


insert into sap_categories (category_id, name) values (1, 'Javascript');
insert into sap_categories (category_id, name) values (1, 'Golang');
insert into sap_categories (category_id, name) values (2, 'Matematika');
insert into sap_categories (category_id, name) values (3, 'Pullarni boshqarish');
insert into sap_categories (category_id, name) values (3, 'Moliyalashtirish');
insert into sap_categories (category_id, name) values (3, 'Kursni kotarish');



-- 

select 
    u.id,
    concat(u.name, ' ', u.surname) as fullname
from users u;


select 
    c.id,
    c.user_id,
    c.category_id
from cards c;


select 
    ct.*
from categories ct;

select 
    *
from sap_categories sp;

-- 


-- bolimlarni chiqarib berish.
select 
    c.*,
    json_agg(sc.*)
from categories c
left join sap_categories sc on c.id = sc.category_id
group by c.id
order by c.id;


-- cards larni chiqarib berish.
select 
    c.id,
    c.user_id,
    concat(u.name, ' ', u.surname) as fullname,
    c.card_image,
    c.title,
    c.date,
    sp.name as category_name,
    case status 
        when true then 'Online'
        when false then 'Offline'
    end as status
from cards c
left join sap_categories sp on c.sap_category_id = sp.id
left join users u on u.id = c.user_id
order by c.id
limit 6
offset 1;

-- avtor nomlari
select 
    u.id,
    concat(u.name, ' ', u.surname)
from users u;

-- single page

select 
    c.id,
    concat(u.name, ' ', u.surname) as fullname,
    c.card_image,
    c.title,
    c.date,
    c.short_info,
    c.long_info,
    c.views,
    sp.id as category_id,
    sp.name as category_name,
    case status 
        when true then 'Online'
        when false then 'Offline'
    end as status
from cards c
left join sap_categories sp on c.sap_category_id = sp.id
left join users u on u.id = c.user_id
where c.id = 3;


select 
    c.id,
    c.user_id,
    concat(u.name, ' ', u.surname) as fullname,
    c.card_image,
    c.title,
    c.date,
    sp.name as category_name,
    case status 
        when true then 'Online'
        when false then 'Offline'
    end as status
from cards c
left join sap_categories sp on c.sap_category_id = sp.id
left join users u on u.id = c.user_id
where c.sap_category_id = 1    -- catgory_id 
order by c.id;