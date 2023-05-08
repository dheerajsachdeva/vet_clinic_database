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


select animals.name as Animals_name, vets.name as Vet_Name, visits.visit_date 
from animals, vets, visits
where vets.name = 'William Tatcher'
and vets.id = visits.vets_id
and animals.id = visits.animals_id
order by visit_date desc Limit 1

select vets.name as Vet_Name, count(distinct (animals.id))
from vets, animals, visits
where vets.name = 'Stephanie Mendez'
and vets.id = visits.vets_id
and animals.id = visits.animals_id
group by vet_name

select vets.name as Vet_Name, species.name as Specialities
from vets
Left Join specializations
on vets.id = specializations.vets_id
Left join species
on species.id = specializations.species_id

select animals.name as Animals_Name, vets.name as Vet_Name, visits.visit_date
from animals, vets, visits
where vets.name = 'Stephanie Mendez'
and visits.visit_date between '2020-04-01' and '2020-08-30'
and vets.id = visits.vets_id
and animals.id = visits.animals_id

select animals.name as Animals_Name, count(visits.visit_date) as counts
from animals, visits
where animals.id = visits.animals_id
group by Animals_name 
order by counts desc limit 1

select vets.name as Vet_Name, animals.name as Animal_name, visits.visit_date
from animals, visits, vets
where vets.name = 'Maisy Smith'
and animals.id = visits.animals_id
and vets.id = visits.vets_id
order by visits.visit_date asc limit 1

select animals.name, animals.date_of_birth,animals.escape_attempts, animals.neutered,
animals.weight_kg, vets.name as Vet_Name, vets.age, vets.date_of_graduation,species.name,
visits.visit_date from animals, species, vets, visits
where animals.id = visits.animals_id
and vets.id = visits.vets_id
and animals.species_id = species.id
order by visits.visit_date desc limit 1

select vets.name as Vet_Name, count(visits.visit_date)
from vets, visits
where vets.id = visits.vets_id
and vets.id not in(select vets_id from specializations)
group by Vet_Name

select vets.name as Vet_Name, species.name as Species_Name, 
count(visits.visit_date) as visit_count from vets, visits, species, animals
where  vets.name = 'Maisy Smith'
and vets.id = visits.vets_id
and species.id = animals.species_id
and animals.id = visits.animals_id
group by Vet_Name, Species_Name
order by visit_count desc limit 1

-- Performance and Indexing

-- Explain analyse SELECT * FROM visits where vet_id = 2;
explain analyze SELECT * FROM visits where vets_id = 2;


-- Explain analyse SELECT * FROM owners where email = 'owner_18327@mail.com';
explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';


-- Explain analyse SELECT COUNT(*) FROM visits where animal_id = 4;
explain analyze SELECT COUNT(*) FROM visits where animals_id = 4;
