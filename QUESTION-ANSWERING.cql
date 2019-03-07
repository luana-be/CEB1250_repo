/*
docker exec -it cassandra /bin/bash
cqlsh
create keyspace question_answering with replication = {'class':'SimpleStrategy', 'replication_factor': 3};
*/

use question_answering;

create table question (question_id int, question text, primary key (question_id));

create table answer (answer_id int, question_id int, answer text, primary key (answer_id, question_id)) with clustering order by (question_id asc);

create table category (category_id int, category text, primary key(category_id));

create table question_category (question_id int, category_id int, primary key (category_id, question_id));

alter table answer add votes int;
alter table question add date timestamp;
alter table answer add date timestamp;

alter table question_answering.question_category add category text; -- this way, we don't need to access the table category in order to get the category names