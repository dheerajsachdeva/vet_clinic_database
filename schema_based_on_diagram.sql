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

create table medical_histories_treatments(
id int GENERATED ALWAYS AS IDENTITY,
medical_history_id int references medical_histories(id),
treatment_id int references treatments(id)
);

Alter table invoices add column medical_history_id int;
Alter table invoices add foreign key (medical_history_id) references medical_histories (id);

create index patient_id_asc on medical_histories(patient_id asc);
create index invoice_id_asc on invoice_items(invoice_id asc);
create index treatment_id_asc on invoice_items(treatment_id asc);
create index medical_history_id_asc on medical_histories_treatments(medical_history_id asc);
create index treatment_id_asc on medical_histories_treatments(treatment_id asc);
create index medical_history_id_asc on invoices(medical_history_id asc);