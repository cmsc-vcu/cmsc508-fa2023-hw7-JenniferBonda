# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP tABLE IF EXISTS peopleroles;
DROP tABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP tABLE IF EXISTS roles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

drop table if exists skills;
CREATE TABLE skills (
    skills_id int not null,
    skills_name varchar(255) not null,
    skills_description varchar(255) not null DEFAULT 'default description',
    skills_tag varchar(255) not null,
    skills_url varchar(255),
    skills_time_commitment int,
    primary key(skills_id)

);

select * from skills;

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills( skills_id, skills_name, skills_description, skills_tag, skills_url, skills_time_commitment) values
    ( 1, 'kick boxing', 'visualize this!', 'Skill 1','https://www.skill.com/kb', 10),
    ( 2, 'python coding', 'writing python programs', 'Skill 2', 'https://www.skill.com/pc', 23),
    ( 3, 'fencing', 'fighting with a sword', 'Skill 3', 'https://www.skill.com/f', 234),
    ( 4, 'genji blading', 'getting a 5k with dragon blade', 'Skill 4', 'https://www.skill.com/gb', 999999),
    ( 5, 'hair cutting', 'styling hair', 'Skill 5', 'https://www.skill.com/hc', 20),
    ( 6, 'cooking', 'making yummy food', 'Skill 6','https://www.skill.com/c', 50),
    ( 7, 'singing', 'vocalizing songs', 'Skill 7', 'https://www.skill.com/s', 15),
    ( 8, 'sewing', 'creating clothing or items with cloth', 'Skill 8', 'https://www.skill.com/sewing', 8);

select * from skills;

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

drop table if exists people;
CREATE TABLE people (
    people_id int not null,
    people_first_name varchar(255) DEFAULT null,
    people_last_name varchar(255) NOT NULL,
    email varchar(255) DEFAULT null,
    linkedin_url varchar(255) DEFAULT null,
    headshot_url varchar(255) DEFAULT null,
    discord_handle varchar(255) DEFAULT null,
    brief_bio varchar(255) DEFAULT null,
    date_joined date NOT NULL default (current_date),
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (people_id, people_first_name, people_last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined) values 
(1, 'Brenda', 'Person 1', 'fluffy@gmail.com', 'https://www.linkedin.com/Brenda', 'https://www.headshotcom/Brenda', 'user1', 'loser', '2022-06-10'),
(2, 'Steven', 'Person 2', 'jkewfh@gmail.com', 'https://www.linkedin.com/Steven', 'https://www.headshotcom/Steven', 'user2', 'really smart', '2021-06-10'),
(3, 'Chris', 'Person 3', 'ChrisLou@gmail.com', 'https://www.linkedin.com/Chris', 'https://www.headshotcom/Chris','user3', 'bad', '2020-02-10'),
(4, 'Will', 'Person 4', 'Overwatchlover@gmail.com', 'https://www.linkedin.com/Will', 'https://www.headshotcom/Will', 'user4', 'annoying', '2022-01-12'),
(5, 'Mandy', 'Person 5', 'TigerCat@gmail.com', 'https://www.linkedin.com/Mandy', 'https://www.headshotcom/Mandy', 'user5', 'rude', '2018-07-10'),
(6,'Angel', 'Person 6', 'AnimalLover77@gmail.com', 'https://www.linkedin.com/Angel', 'https://www.headshotcom/Angel', 'user6', 'nice', '2021-11-11'),
(7,'Jimmy', 'Person 7', 'JimmySmith@gmail.com','https://www.linkedin.com/Jimmy','https://www.headshotcom/Jimmy', 'user7', 'good at management', '2022-08-10'),
(8,'Lou', 'Person 8', 'LouHatesYou@gmail.com', 'https://www.linkedin.com/Lou', 'https://www.headshotcom/Lou', 'user8', 'okay', '2022-06-11'),
(9,'Jennifer', 'Person 9', 'NanaAndTiger@gmail.com','https://www.linkedin.com/Jennifer', 'https://www.headshotcom/Jennfier', 'user9', 'alright', '2023-06-10'),
(10,'Jamie', 'Person 10', 'ewjkhakje@gmail.com', 'https://www.linkedin.com/Jamie', 'https://www.headshotcom/Jamie', 'user10', 'horrible', '2023-06-15');

select * from people;


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

drop table if exists peopleskills;
create table peopleskills(
    id int auto_increment,
    skills_id int not null,
    people_id int not null,
    date_acquired date default (current_date),
    primary key(id),
    foreign key (skills_id) references skills (skills_id) on delete cascade,
    foreign key (people_id) references people (people_id),
    unique (skills_id, people_id)
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

insert into peopleskills (people_id, skills_id, date_acquired) values
    (1,1, '2022-08-19'),
    (1,3, '2022-02-11'),
    (1,6, '2023-02-14'),
    (2,3, '2022-01-09'),
    (2,4, '2018-12-12'),
    (2,5, '2021-08-19'),
    (3,1, '2022-07-21'),
    (3,5, '2020-01-02'),
    (5,3, '2019-08-04'),
    (5,6, '2020-04-19'),
    (6,2, '2016-12-22'),
    (6,3, '2022-08-19'),
    (6,4, '2022-08-18'),
    (7,3, '2017-06-12'),
    (7,5, '2011-04-19'),
    (7,6, '2023-08-07'),
    (8,1, '2022-08-19'),
    (8,3, '2021-08-19'),
    (8,5, '2022-08-09'),
    (8,6, '2022-08-19'),
    (9,2, '2018-05-19'),
    (9,5, '2022-08-20'),
    (9,6, '2022-05-19'),
    (10,1,'2017-02-09'),
    (10,4, '2022-08-17'),
    (10,5, '2023-04-19');

    select * from peopleskills;
    select count(*) from peopleskills;

SELECT
    people_last_name,
    skills_name,
    skills_tag
from   
    peopleskills a
    inner join people b on (a.people_id=b.people_id)
    inner join skills c on (a.skills_id=c.skills_id)
WHERE   
    people_last_name = 'Person 1'
order BY
    skills_name,
    people_last_name
;

## delete from skills where skills_id=3;

SELECT
    people_last_name
from   
    people a
    left join peopleskills b on (a.people_id=b.people_id)
WHERE
    b.people_id is NULL
;

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

drop table if exists roles;
create table roles(
    roles_id int not null,
    roles_name varchar(255),
    sort_priority int,
    primary key(roles_id)
);

select * from roles;


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

insert into roles (roles_id, roles_name, sort_priority) values
    (1, 'Designer', 10),
    (2, 'Developer', 20),
    (3, 'Recruit', 30),
    (4, 'Team Lead', 40),
    (5, 'Boss', 50),
    (6, 'Mentor', 60);

    select * from roles;


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

drop table if exists peopleroles;
create table peopleroles(
    id int auto_increment,
    roles_id int not null,
    people_id int not null,
    date_assigned date default (current_date),
    primary key(id),
    foreign key(roles_id) references roles(roles_id),
    foreign key(people_id) references people(people_id)
);

select * from peopleroles;


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

insert into peopleroles (people_id, roles_id, date_assigned) values
    (1, 2, '2022-08-12'),
    (2, 5, '2018-08-07'),
    (2, 6, '2022-02-19'),
    (3, 2, '2017-07-12'),
    (3, 4, '2021-02-11'),
    (4, 3, '2020-09-08'),
    (5, 3, '2020-12-30'),
    (6, 2, '2020-08-12'),
    (6, 1, '2019-03-06'),
    (7, 1, '2022-05-03'),
    (8, 1, '2022-11-11'),
    (8, 4, '2023-10-17'),
    (9, 2, '2021-02-21'),
    (10, 2, '2023-08-26'),
    (10, 1, '2022-06-10');


    select * from peopleroles;

