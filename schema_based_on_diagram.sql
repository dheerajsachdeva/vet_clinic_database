create database clinic;

create table patients (
id int GENERATED ALWAYS AS IDENTITY,
name varchar(50),
date_of_birth date,
primary key (id)
);

create table invoices (
id int GENERATED ALWAYS AS IDENTITY,
total_amount decimal,
generated_at timestamp,
payed_at timestamp,
primary key (id)
);

create table medical_histories (
id int GENERATED ALWAYS AS IDENTITY,
admitted_at timestamp,
patient_id int references patients (id),
status varchar(50),
primary key (id)
);

create table treatments (
id int GENERATED ALWAYS AS IDENTITY,
type varchar(50),
name varchar (50),
primary key (id)
);

create table invoice_items (
id int GENERATED ALWAYS AS IDENTITY,
unit_price decimal,
quantity int,
total_price decimal,
invoice_id int references invoices(id),
treatment_id int references treatments(id),
primary key (id)
);