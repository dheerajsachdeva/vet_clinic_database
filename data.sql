/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Agumon','2020-02-03',0,true,10.23),
('Gabumon','2018-11-15',2,true,8 ),
('Pikachu','2021-01-07',1,false,15.04 ),
('Devimon','2017-05-12',5,true,11 );

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Charmander','2020-02-08',0,false,-11),
('Plantmon','2021-11-15',2,true,-5.7),
('Squirtle','1993-04-02',3,false,-12.13),
('Angemon','2005-06-12',1,true,-45),
('Boarmon','2005-06-07',7,true,20.4),
('Blossom','1998-10-13',3,true,17),
('Ditto','2022-05-14',4,true,22);

Insert INTO owners (full_name, age)
values ('Sam Smith',34),
('Jennifer Orwell', 19),
('Bob',45),
('Melody Pond',77),
('Dean Winchester',14),
('Jodie Whittaker',38);

insert into species (name)
values ('Pokemon'),
('Digimon');

update animals set species_id = 2 where name like '%mon'
update animals set species_id = 1 where name not like '%mon'

update animals SET owner_id = owners.id 
FROM owners 
WHERE animals.name='Agumon' AND owners.full_name='Sam Smith';

update animals SET owner_id = owners.id 
FROM owners 
WHERE (animals.name='Gabumon' or animals.name='Pikachu') AND (owners.full_name='Jennifer Orwell');

update animals SET owner_id = owners.id 
FROM owners 
WHERE (animals.name='Devimon' or animals.name='Plantmon') AND (owners.full_name='Bob');

update animals SET owner_id = owners.id 
FROM owners 
WHERE (animals.name='Charmander' or animals.name='Squirtle' or animals.name='Blossom') AND (owners.full_name='Melody Pond');

update animals SET owner_id = owners.id 
FROM owners 
WHERE (animals.name='Angemon' or animals.name='Boarmon') AND (owners.full_name='Dean Winchester');

insert into vets (name,age,date_of_graduation)
values ('William Tatcher', 45,'2000-04-23'),
('Maisy Smith',26,'2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness',38,'2008-06-08');

insert into specializations(vets_id, species_id)
values ((select id from vets where name = 'William Tatcher'),(select id from species where name = 'Pokemon')),
((select id from vets where name = 'Stephanie Mendez'),(select id from species where name = 'Pokemon')),
((select id from vets where name = 'Stephanie Mendez'),(select id from species where name = 'Digimon')),
((select id from vets where name = 'Jack Harkness'),(select id from species where name = 'Digimon'));

insert into visits (vets_id, animals_id, visit_date)
values ((select id from vets where name = 'William Tatcher'),
(select id from animals where name = 'Agumon'),('2020-05-24')),

((select id from vets where name = 'Stephanie Mendez'),
(select id from animals where name = 'Agumon'),('2020-07-22')),

((select id from vets where name = 'Jack Harkness'),
(select id from animals where name = 'Gabumon'),('2021-02-02')),

((select id from vets where name = 'Maisy Smith'),
(select id from animals where name = 'Pikachu'),('2020-01-05')),

((select id from vets where name = 'Maisy Smith'),
(select id from animals where name = 'Pikachu'),('2020-03-08')),

((select id from vets where name = 'Maisy Smith'),
(select id from animals where name = 'Pikachu'),('2020-05-14')),

((select id from vets where name = 'Stephanie Mendez'),
(select id from animals where name = 'Devimon'),('2021-05-04')),

((select id from vets where name = 'Jack Harkness'),
(select id from animals where name = 'Charmander'),('2021-02-24')),

((select id from vets where name = 'Maisy Smith'),
(select id from animals where name = 'Plantmon'),('2019-12-21')),

((select id from vets where name = 'William Tatcher'),
(select id from animals where name = 'Plantmon'),('2020-08-10')),

((select id from vets where name = 'Maisy Smith'),
(select id from animals where name = 'Plantmon'),('2021-04-07')),

((select id from vets where name = 'Stephanie Mendez'),
(select id from animals where name = 'Squirtle'),('2019-09-29')),

((select id from vets where name = 'Jack Harkness'),
(select id from animals where name = 'Angemon'),('2020-10-03')),

((select id from vets where name = 'Jack Harkness'),
(select id from animals where name = 'Angemon'),('2020-11-04')),

((select id from vets where name = 'Maisy Smith'),
(select id from animals where name = 'Boarmon'),('2019-01-24')),

((select id from vets where name = 'Maisy Smith'),
(select id from animals where name = 'Boarmon'),('2019-05-15')),

((select id from vets where name = 'Maisy Smith'),
(select id from animals where name = 'Boarmon'),('2020-02-27')),

((select id from vets where name = 'Maisy Smith'),
(select id from animals where name = 'Boarmon'),('2020-08-03')),

((select id from vets where name = 'Stephanie Mendez'),
(select id from animals where name = 'Blossom'),('2020-05-24')),

((select id from vets where name = 'William Tatcher'),
(select id from animals where name = 'Blossom'),('2021-01-11'));

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';


CREATE INDEX vets_id_desc ON visits(vets_id asc);