/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
select name from animals where neutered = 'true' AND escape_attempts < 3;
select date_of_birth from animals where name in ('Agumon','Pikachu');
select name, escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered is 'true';
select * from animals where name <> 'Gabumon';
select * from animals where weight_kg BETWEEN 10.4 and 17.3;

begin transaction;
update animals set species = 'unspecified';
rollback transaction;

Begin work;
update animals set species = 'digimon' where name like '%mon'
update animals set species = 'pokemon' where species is null
commit work;

Begin work;
Delete from animals;
rollback work;

Begin transaction;
Delete from animals where date_of_birth > '2022-01-01'
savepoint save1;
update animals set weight_kg = weight_kg * -1;
rollback to save1;
update animals set weight_kg = weight_kg * -1 where weight_kg < 0
commit transaction;

select count(id) from animals;
select count (*) from animals where escape_attempts = 0;
select Round(avg(weight_kg),2) from animals;
select neutered, sum(escape_attempts) as Escape_Attempts from animals group by neutered;
select species, min(weight_kg) as Min_Weight, max(weight_kg) as Max_weight from animals group by species;
select species, avg(escape_attempts) as Avg_Escape_Attempts from animals
where date_of_birth between '1990-01-01' and '2000-12-31'
group by species;


select * from animals
JOIN owners on animals.owner_id = owners.id
where owners.full_name = 'Melody Pond'

select * from animals
Join species on species.id = animals.species_id
where species.name = 'Pokemon'

select owners.full_name, animals.name 
from owners
left join animals on animals.owner_id = owners.id

select count(animals.name), species.name 
from animals
join species on animals.species_id = species.id
group by species.name

select species.name, owners.full_name, animals.name
from species
join animals on animals.species_id = species.id
join owners on animals.owner_id = owners.id
where species.name = 'Digimon' and owners.full_name = 'Jennifer Orwell'

select animals.name as Animals_name, owners.full_name
from animals
join owners on animals.owner_id = owners.id
where owners.full_name = 'Dean Winchester' and animals.escape_attempts = 0

select count(animals.name) as Total_Animals, owners.full_name
from animals
join owners on animals.owner_id = owners.id
group by owners.full_name
order by Total_Animals desc