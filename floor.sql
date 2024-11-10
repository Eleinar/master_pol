create table ProductTypes(
id serial primary key,
type_name varchar(30),
coefficient float
);

create table Products(
id serial primary key,
product_type_id int references ProductTypes(id),
product_name varchar(100),
scu varchar(10),
min_partner_price float
);

create table SalesLocations(
id serial primary key,
location_name varchar(100)
);

create table CompanyType(
id serial primary key,
company_type varchar(5)
);

create table Partners(
id serial primary key,
type_id int references CompanyType(id),
company_name varchar(50),
legal_address varchar(100),
inn varchar(10),
director_name varchar(50),
phone varchar(50),
email varchar(50),
rating int 
);

create table Partner_Products(
id serial primary key,
partner_id int references Partners(id),
product_id int references Products(id),
quantity int,
delivery_date date
);

create table HealthStatuses(
id serial primary key,
status varchar(20)
);

create table FamilyStatuses(
id serial primary key,
status varchar(20)
);

create table Roles(
id serial primary key,
role_name varchar(20)
);

create table Employees(
id serial primary key,
employee_name varchar(50),
passport varchar,
bank_account varchar(50),
family_status_id int references FamilyStatuses(id),
health_status_id int references HealthStatuses(id),
role_id int references Roles(id)
);

create table AccessRecords(
id serial primary key,
entry_time timestamp,
exit_time timestamp,
employee_id int references Employees(id)
);

create table MaterialTypes(
id serial primary key,
type_name varchar(30),
defect_percent float
);

create table UnitTypes(
id serial primary key,
unit_name varchar(30)
);

create table Materials(
id serial primary key,
material_type_id int references MaterialTypes(id),
material_name varchar(50),
package_quantity int,
unit_id int references UnitTypes(id),
description varchar,
material_cost float,
stock_quantity int,
min_quantity int
);

create table Warehouses(
id serial primary key,
warehouse_name varchar(30)
);

create table OperationType(
id serial primary key,
operation_type varchar(30)
);

create table MaterialHistory(
id serial primary key,
material_id int references Materials(id),
operation_date date,
operation_type_id int references OperationType(id),
quantity int,
warehouse_id int references Warehouses(id)
);
