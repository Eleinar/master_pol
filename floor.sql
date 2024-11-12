create table producttypes(
id serial primary key,
type_name varchar(30),
coefficient float
);

create table Products(
id serial primary key,
product_type_id int references producttypes(id),
product_name varchar(100),
scu varchar(10),
min_partner_price float
);

create table saleslocations(
id serial primary key,
location_name varchar(100)
);

create table companytype(
id serial primary key,
company_type varchar(5)
);

create table partners(
id serial primary key,
type_id int references companytype(id),
company_name varchar(50),
legal_address varchar(100),
inn varchar(10),
director_name varchar(50),
phone varchar(50),
email varchar(50),
rating int 
);

create table partner_products(
id serial primary key,
partner_id int references partners(id),
product_id int references products(id),
quantity int,
sale_date date
);

create table healthstatuses(
id serial primary key,
status varchar(20)
);

create table familystatuses(
id serial primary key,
status varchar(20)
);

create table roles(
id serial primary key,
role_name varchar(20)
);

create table employees(
id serial primary key,
employee_name varchar(50),
passport varchar,
bank_account varchar(50),
family_status_id int references familystatuses(id),
health_status_id int references sealthstatuses(id),
role_id int references Roles(id)
);

create table accessrecords(
id serial primary key,
entry_time timestamp,
exit_time timestamp,
employee_id int references employees(id)
);

create table materialtypes(
id serial primary key,
type_name varchar(30),
defect_percent float
);

create table unittypes(
id serial primary key,
unit_name varchar(30)
);

create table materials(
id serial primary key,
material_type_id int references materialtypes(id),
material_name varchar(50),
package_quantity int,
unit_id int references unittypes(id),
description varchar,
material_cost float,
stock_quantity int,
min_quantity int
);

create table warehouses(
id serial primary key,
warehouse_name varchar(30)
);

create table operationtype(
id serial primary key,
operation_type varchar(30)
);

create table materialhistory(
id serial primary key,
material_id int references materials(id),
operation_date date,
operation_type_id int references operationtype(id),
quantity int,
warehouse_id int references warehouses(id)
);
