


create table Province(
 id_province serial primary key,
 province_name varchar(60)
);

create table District(
 id_district serial primary key,
 district_name varchar(60)
);




CREATE TYPE hospital_type_enum AS ENUM (
  'distrital',
  'regional',
  'provincial'
);



CREATE TABLE Hospital (
  id_hospital serial PRIMARY key ,
  hospital_name varchar(50) not NULL,
  address varchar(100) not null,
  latitude double precision not null,
  longitude double precision not null,
  altitude double precision not null,
  district int references District (id_district) ON UPDATE CASCADE ON DELETE CASCADE,
  province int references Province (id_province) ON UPDATE CASCADE ON DELETE CASCADE,
  hospital_type hospital_type_enum not null,
  MOPH_number int not null
);


CREATE TABLE Personel_VM (
  id_personel_vm serial  PRIMARY KEY,
  employee_name varchar(50) not null
);

CREATE TABLE Telephone (
  id_telephone serial PRIMARY KEY,
  telephone varchar(15) not null,
  id_hospital int references Hospital (id_hospital) ON UPDATE CASCADE ON DELETE CASCADE,
  active boolean not null
);

CREATE TABLE Questionnaire_Status_Catalog (
  id_status  serial PRIMARY KEY,
  status varchar(50) not null
);

CREATE TABLE Problem_Catalog (
  id_problem serial  PRIMARY KEY,
  problem varchar(50) not null
);

CREATE TABLE Action_Catalog (
  id_action serial  PRIMARY KEY,
  action_name varchar(50) not null
);

CREATE TYPE funds_enum AS ENUM (
  'Yes-Government',
  'Yes-Private',
  'Yes-Both',
  'No',
  'Does not know'
);

CREATE TABLE Update_hospital (
  id_update SERIAL PRIMARY KEY,
  name_responder varchar(50),
  id_personel_vm int references Personel_VM (id_personel_vm) ON UPDATE CASCADE ON DELETE CASCADE ,
  id_hospital int references Hospital (id_hospital) ON UPDATE CASCADE ON DELETE CASCADE,
  id_questionnare_status int references Questionnaire_Status_Catalog (id_status) ON UPDATE CASCADE ON DELETE CASCADE not null  ,
  id_problem_status int references Problem_Catalog (id_problem)ON UPDATE CASCADE ON DELETE CASCADE not null ,
  id_action_status int references Action_Catalog (id_action)ON UPDATE CASCADE ON DELETE cascade not null ,
  funds funds_enum,
  additional_comments varchar(300),
  update_date timestamp not null
);


CREATE TABLE Protocol (
  id_protocol serial PRIMARY KEY,
  id_update int references Update_hospital (id_update) ON UPDATE CASCADE ON DELETE CASCADE unique , -- Guarantee 1 to 1
  covid_screening boolean,
  covid_awareness boolean,
  avg_test_result_time numeric(4),
  test_capacity boolean,
  covid_tracking boolean,
  MOPH_report boolean
);

CREATE TABLE Covid_Cases (
  id_casefile serial PRIMARY KEY,
  id_update int references Update_hospital (id_update) ON UPDATE CASCADE ON DELETE CASCADE unique ,-- Guarantee 1 to 1
  patients_with_symptoms int,
  positive_patients int,
  intensive_care int,
  covid_deaths int,
  non_covid_deaths int,
  covid_recovered int,
  PHC_referred int
);

CREATE TABLE Personel (
  id_personel serial PRIMARY KEY,
  id_update int references Update_hospital (id_update) ON UPDATE CASCADE ON DELETE cascade unique , -- Guarantee 1 to 1
  no_doctors int,
  no_paramedics int
);


CREATE TYPE resource_type_enum AS ENUM (
  'covid',
  'general'
);

CREATE TABLE Resource_Catalog (
  id_product serial PRIMARY KEY,
  product_name varchar(50),
  product_type resource_type_enum
);

CREATE TABLE Inventory (
  id_update int references Update_hospital (id_update) ON UPDATE CASCADE ON DELETE CASCADE,
  id_product int references Resource_Catalog (id_product) ON UPDATE CASCADE ON DELETE cascade,
  days_remaining int,
  constraint pk_Inventario primary key (id_update, id_product)
);



