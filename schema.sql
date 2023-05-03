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