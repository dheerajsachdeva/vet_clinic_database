/* Database schema to keep the structure of entire database. */

create database vet_clinic

create table animals (
id int PRIMARY KEY,
name varchar(50),
date_of_birth date,
escape_attempts int,
neutered boolean,
weight_kg decimal
);