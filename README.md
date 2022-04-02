# ITCS 3160 - Final Project
This is the full three parts of my final project for ITCS 3160 - Database Design and Implementation

The project is split into three parts:
* Part 1: (E)ER Design
* Part 2: Relational Mapping, Creating Database Schema, and Populating Database
* Part3: Complete Database and Final Report

## Part 1 Explanation
### Requirements
For the initial part, I created an EER (Extended Entity Relationship) diagram with the following requirements:
* This hospital has physicians and nurses and gives services to patients.
* The hospital contains several rooms.
* Every room has a unique number, capacity, and fee for one night.
* A patient has a name, unique id, address, and phone number.
* A patient may have a health record that includes a unique id for each patient, disease, date, status, and description.
* A physician has a unique id, name, certification number, field of expertise, address, and phone number.
* A nurse has a unique id, name, certification number, address, and phone number.
* Every patient is hospitalized in a specific room for some nights.
* Every patient has some physicians who monitor the patient for a specific duration.
* A physician orders some instructions for a patient on a specific date.
* A number of nurses execute the physician’s order for a specific patient on a date, and the execution results in a status.
* Instruction has a unique code, fee, and description.
* Nurses also provide medications to patients.
* Each patient has specific medications, and there is a specific amount of medication that is given to the patient daily by nurses.
* Patients get medicine from outside pharmacies, so the hospital does not charge them for medicine.
* All the cares that are provided for a patient are recorded, and the hospital issues an invoice for payable items such as rooms and instructions.
* Patients make payments for the hospital that includes date and amount.

### Skills Learned
During this first part, I worked on the following skills:
* Plan ways to map relationships and entities based on client requirements
* Brainstorm solutions to difficult relations and workarounds for conflicts in design
* Use specialization to branch out into parent and child relationships
* Designate all required attributes to the corresponding entities in a visually fitting manner
* Quickly and efficiently space out parts of design in a visually pleasant and informative layout

All submitted materials for part 1 will be inside of the <b>part1_submission</b> directory

## Part 2 Explanation
### Requirements
1- Using your EER design of Part1, map the conceptual design to a set of relations and also specify the primary key and foreign keys(s) of each relation. Use the following format for each relation:

RelationC(Attr1, Attr2, Attr3)

primary key: {Attr1}

foreign key: {Attr2 references RelationA(Attr1), Attr3 references RelationB(Attr1)} 

2- Using relations, primary key, and foreign key, create a database schema in your MySQL environment.

The name of your database should be hospital.

Create hospital-schema.sql and put the following statements at the top of hospital-schema.sql:

DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital;

Put all create table, alter table, etc in hospital-schema.sql.

3- You need to populate your database with at least 5 tuples for each table. Put all insert statements in hospital-data.sql.

### Skills Learned
Part 2 required me to really apply my SQL knowledge, and here is what I learned:
* Defining large sets of data tables, specifically those that might depend on each other
* Inserting large amounts of data and making sure everything lines up
* Switching between scripts that have different functions in SQL and generalizing the work flow
* Using queries as data is added to check that insertions were completed and proper
* Using a conceptual plan to implement a physical database

All submitted materials for part 2 will be inside of the <b>part2_submission</b> directory

## Part 3 Explanation
### Requirements

### Skills Learned


All submitted materials for part 3 will be inside of the <b>part3_submission</b> directory
