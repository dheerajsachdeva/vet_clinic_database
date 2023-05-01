Vet clinic database

📗 Table of Contents
📖 About the Project
🛠 Built With
Tech Stack
Key Features
💻 Getting Started
Setup
Prerequisites
Create database
👥 Authors
🔭 Future Features
🤝 Contributing
⭐️ Show your support
🙏 Acknowledgements
📝 License

📖 Vet clinic database
Vet clinic database is a database project where we create data structure using relational database for a vet clinic

🛠 Built With
Tech Stack
Database
Key Features
create database and table for animals
insert animals data into the table
make query for the table data
(back to top)

💻 Getting Started
To get a local copy up and running, follow these steps.

Prerequisites
In order to run this project you need:

PostgreSQL database server installed
Setup
Clone this repository to your desired folder:

git clone git@github.com:dheerajsachdeva/vet_clinic_database.git

cd vet_clinic_database

Create database

Connect to your PostgreSQL server with psql
> psql
postgres=#

Create the database vet_clinic

postgres=# CREATE DATABASE vet_clinic;

CREATE DATABASE
Connect to your database vet_clinic. Inside your current session do:
postgres=# \c vet_clinic
You are now connected to database "vet_clinic" as user "postgres".
vet_clinic=#
That's it! Congratulations, you have created your database and connected to it. Next, we will add a table.

Use schema.sql to create all tables.
Use data.sql to populate tables with sample data.
Check queries.sql for examples of queries that can be run on a newly created database.
(back to top)

👥 Authors
👤 DHEERAJ SACHDEVA

GitHub: @githubhandle
LinkedIn: LinkedIn
(back to top)

🔭 Future Features
Add new tables
Add new data
implement more queries
(back to top)

🤝 Contributing
Contributions, issues, and feature requests are welcome!

Feel free to check the issues page.

(back to top)

⭐️ Show your support
If you like this project please give it a ⭐

(back to top)

🙏 Acknowledgments
I would like to thank the Microverse Team!

(back to top)

📝 License
This project is MIT licensed.

(back to top)