/* Database schema to keep the structure of entire database. */

create database vet_clinic

create table animals (
id int GENERATED ALWAYS AS IDENTITY,
name varchar(50),
date_of_birth date,
escape_attempts int,
neutered boolean,
weight_kg decimal,
	PRIMARY KEY (id)
);

Alter table animals add column species varchar(50);

create table owners (
id int GENERATED ALWAYS AS IDENTITY,
full_name varchar(100),
age int,
PRIMARY KEY (id)
);

create table species (
	id int GENERATED ALWAYS AS IDENTITY,
	name varchar(50),
primary key (id)
);

Begin
Alter table animals drop column species
commit

Alter table animals add column species_id int;
Alter table animals add constraint FK_species Foreign key (species_id) references species(id);

Alter table animals add column owner_id int;
Alter table animals add constraint FK_owners Foreign key (owner_id) references owners(id);

create table vets (
	id int GENERATED ALWAYS AS IDENTITY,
	name varchar(50),
	age int,
	date_of_graduation date,
	primary key (id)
);

create table specializations (
id int GENERATED ALWAYS AS IDENTITY,
species_id int references species(id),
vets_id int references vets(id),
primary key (id)
);

create table visits (
	id int generated always as IDENTITY,
	animals_id int references animals (id),
	vets_id int references vets(id),
	visit_date date,
	primary key (id)
);

-- Performance and indexing.

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX animals_id_desc ON owners(animals_id desc);


CREATE INDEX email_asc ON owners(email ASC);


CREATE INDEX vets_id_desc ON visits(vets_id asc);



