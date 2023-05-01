/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
select name from animals where neutered = 'true' AND escape_attempts < 3;
select date_of_birth from animals where name in ('Agumon','Pikachu');
select name, escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered is 'true';
select * from animals where name <> 'Gabumon';
select * from animals where weight_kg BETWEEN 10.4 and 17.3;