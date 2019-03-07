/*
docker exec -it cassandra /bin/bash
cqlsh
*/

drop keyspace question_answering;
create keyspace question_answering with replication = {'class':'SimpleStrategy', 'replication_factor': 3};

use question_answering;

create table question_with_categories (id UUID, question text, question_date timestamp, category text, primary key (question, category));

create table question_with_answers (id UUID, question text, answer text, answer_date timestamp, answer_votes int, primary key (question, answer));

insert into question_with_categories(id, question, question_date, category) values (now(), 'what is a question', toTimestamp(now()), 'all');
insert into question_with_categories(id, question, question_date, category) values (now(), 'what is a question', toTimestamp(now()), 'category1');

select * from question_answering.question_with_categories; 

select * from question_answering.question_with_categories where category='all' ALLOW FILTERING;
select * from question_answering.question_with_categories where question='what is a question';

insert into question_answering.question_with_answers(id, question, answer, answer_date, answer_votes) values (now(), 'what is a question', 'question is something that needs an answer', toTimestamp(now()), 0);

select * from question_answering.question_with_answers;