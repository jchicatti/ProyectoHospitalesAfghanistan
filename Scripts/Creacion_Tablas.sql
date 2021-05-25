create table Province(
 id_province numeric(6) constraint Province_pk primary key,
 province_name varchar(60)
);

create sequence id_province_seq start 1 increment 1;
alter table Province alter column id_province set default nextval ('id_province_seq');

create table District(
 id_district numeric(6) constraint District_pk primary key,
 district_name varchar(60)
);

create sequence id_district_seq start 1 increment 1;
alter table District alter column id_district set default nextval('id_district_seq');

CREATE TYPE hospital_type_enum AS ENUM (
  'Distrital',
  'Regional',
  'Provincial'
);

CREATE TABLE Hospital (
  id_hospital numeric(6) constraint Hospital_pk PRIMARY key,
  hospital_name varchar(50) not NULL,
  address varchar(100) not null,
  latitude double precision,
  longitude double precision,
  district numeric(6) references District (id_district) ON UPDATE CASCADE ON DELETE CASCADE,
  province numeric(6) references Province (id_province) ON UPDATE CASCADE ON DELETE CASCADE,
  hospital_type hospital_type_enum not null,
  MOPH_number varchar(20) unique not null
);

create sequence id_hospital_seq start 1 increment 1;
alter table Hospital alter column id_hospital set default nextval('id_hospital_seq'); 


CREATE TABLE Personel_VM (
  id_personel_vm numeric(6) constraint Personel_pk PRIMARY KEY,
  employee_name varchar(50) not null
);

create sequence id_personel_vm_seq start 1 increment 1;
alter table Personel_VM alter column id_personel_vm set default nextval('id_personel_vm_seq');


CREATE TYPE phone_type_enum AS ENUM (
  'Landline',
  'Cellphone'
);

CREATE TABLE Telephone (
  id_telephone numeric(6) constraint Telephone_pk PRIMARY KEY,
  telephone varchar(15) not null,
  contact_name varchar(50),
  phone_type phone_type_enum not null,
  id_hospital numeric(6) references Hospital (id_hospital) ON UPDATE CASCADE ON DELETE CASCADE,
  active boolean not null
);

create sequence id_telephone_seq start 1 increment 1;
alter table Telephone alter column id_telephone set default nextval('id_telephone_seq');

CREATE TABLE Questionnaire_Status_Catalog (
  id_status numeric(6) constraint Questionnaire_pk PRIMARY KEY,
  status varchar(50) not null
);

create sequence id_status_seq start 1 increment 1;
alter table Questionnaire_Status_Catalog alter column id_status set default nextval('id_status_seq');

CREATE TABLE Problem_Catalog (
  id_problem numeric(6)constraint Problem_pk PRIMARY KEY,
  problem varchar(50) not null
);

create sequence id_problem_seq start 1 increment 1; 
alter table Problem_Catalog alter column id_problem set default nextval('id_problem_seq'); 

CREATE TABLE Action_Catalog (
  id_action numeric(6) constraint action_pk PRIMARY KEY,
  action_name varchar(50) not null
);

create sequence id_action_seq start 1 increment 1;
alter table Action_Catalog alter column id_action set default nextval('id_action_seq'); 

CREATE TYPE funds_enum AS ENUM (
  'Yes-Government',
  'Yes-Private',
  'Yes-Both',
  'No',
  'Does not know'
);

CREATE TABLE Update_hospital (
  id_update numeric(6)constraint update_pk PRIMARY KEY,
  name_responder varchar(50),
  id_personel_vm numeric(6) references Personel_VM (id_personel_vm) ON UPDATE CASCADE ON DELETE CASCADE,
  id_hospital numeric(6) references Hospital (id_hospital) ON UPDATE CASCADE ON DELETE CASCADE,
  id_questionnare_status numeric(6) references Questionnaire_Status_Catalog (id_status) ON UPDATE CASCADE ON DELETE CASCADE not null,
  id_problem_status numeric(6) references Problem_Catalog (id_problem)ON UPDATE CASCADE ON DELETE CASCADE not null,
  id_action_status numeric(6) references Action_Catalog (id_action)ON UPDATE CASCADE ON DELETE cascade not null,
  funds funds_enum,
  additional_comments varchar(300),
  update_date timestamp not null
);

create sequence id_update_seq start 1 increment 1;
alter table Update_hospital alter column id_update set default nextval('id_update_seq');

CREATE TABLE Protocol (
  id_protocol numeric(6) constraint Protocol_pk PRIMARY KEY,
  id_update numeric(6) references Update_hospital (id_update) ON UPDATE CASCADE ON DELETE CASCADE unique , -- Guarantee 1 to 1
  covid_screening boolean,
  covid_awareness boolean,
  avg_test_result_time numeric(4),
  test_capacity boolean,
  covid_tracking boolean,
  MOPH_report_often numeric(4)
);

create sequence id_protocol_seq start 1 increment 1;
alter table Protocol alter column id_protocol set default nextval('id_protocol_seq'); 

CREATE TABLE Covid_Cases (
  id_casefile numeric(6)constraint covid_cases_pk PRIMARY KEY,
  id_update numeric(6) references Update_hospital (id_update) ON UPDATE CASCADE ON DELETE CASCADE unique ,-- Guarantee 1 to 1
  patients_with_symptoms int,
  positive_patients int,
  intensive_care int,
  covid_deaths int,
  non_covid_deaths int,
  covid_recovered int,
  PHC_referred int
);

create sequence id_casefile_seq start 1 increment 1;
alter table Covid_Cases alter column id_casefile set default nextval('id_casefile_seq'); 

CREATE TABLE Personel (
  id_personel numeric(6)constraint Personel_n_pk PRIMARY KEY,
  id_update numeric(6) references Update_hospital (id_update) ON UPDATE CASCADE ON DELETE cascade unique , -- Guarantee 1 to 1
  no_doctors int,
  no_paramedics int
);

create sequence id_personel_seq start 1 increment 1;
alter table Personel alter column id_personel set default nextval('id_personel_seq');

CREATE TYPE resource_type_enum AS ENUM (
  'covid',
  'general'
);

CREATE TABLE Resource_Catalog (
  id_product numeric(6) constraint Rosource_pk PRIMARY KEY,
  product_name varchar(50),
  product_type resource_type_enum
);

create sequence id_product_seq start 1 increment 1; 
alter table Resource_Catalog alter column id_product set default nextval('id_product_seq');

CREATE TABLE Inventory (
  id_update numeric(6) references Update_hospital (id_update) ON UPDATE CASCADE ON DELETE CASCADE,
  id_product numeric(6) references Resource_Catalog (id_product) ON UPDATE CASCADE ON DELETE cascade,
  days_remaining int,
  constraint pk_Inventario primary key (id_update, id_product)
);



