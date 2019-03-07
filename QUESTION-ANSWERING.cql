/*
docker exec -it cassandra /bin/bash
cqlsh
create keyspace question_answering with replication = {'class':'SimpleStrategy', 'replication_factor': 3};
*/

use question_answering;

create type question (question text, question_date timestamp, category text);
create type answer (answer text, answer_date timestamp, votes int);

create table question_with_answers (id UUID, question frozen<question>, answer frozen<answer>, primary key (question, answer));
