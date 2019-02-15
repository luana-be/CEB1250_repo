-- Question 1: List all entities of the given model providing the entity types and it’s cardinality

-- The strong entities are:
-- Academic_staff (sub-entities Assistant and Professor)
-- Project
-- Section
-- Course

-- The cardinalities are the following:

-- Academic_staff (0,N) <Participates> (1,N) Project //Many-to-many: An academic staff may participate on 0 to N projects and a project must be associated with 1 to N academic staffs
-- Academic_staff (0,N) <Teaches> (1,1) Section //One-to-Many: A section must be taught by 1 academic staff and an academic staff may teach on 0 to N sections 
-- Section (1,1) <CouSec> (1,N) Course //One-to-Many: A section must have 1 course and a course may be given in 1 to N sections

-- Question 2: Based on the logical model, please create the necessary DDL scripts for the physical model implementation

create table academic_staff (
	employee_no int not null,
	first_name varchar(50),
	last_name varchar(50),
	address varchar(100),
	email varchar(50),
	homepage varchar(50),
	primary key (employee_no)
)

create table research_area (
	research_area_id int not null,
	description varchar(100),
	primary key (research_area_id)
)

create table academic_research_area (
	foreign key (research_area_id) references research_area(research_area_id)
	foreign key (emploee_no) references academic_staff(employee_no)
)

create table project (
	project_id int not null,
	-- todo: add the other attr
	primary key (project_id)
)

create table academic_project (
	start_date datetime,
	end_date datetime,
	foreign key (emploee_no) references academic_staff(employee_no)
	foreign key (project_id) references project(project_id)
)

create table course (
	course_id int,
	-- todo: add the other attr
	primary key (course_id)
);

create table section (
	semester int not null,
	year datetime not null,
	primary key (semester, year),
	homepage varchar(50),
	foreign key (employee_no) references academic_staff(employee_no)
	foreign key (course_id) references couse(course_id)
)

create table course_section (
	foreign key (course_id) references course(course_id)
	foreign key (semester) references section(semester)
	foreign key (year) references section(year)
);
