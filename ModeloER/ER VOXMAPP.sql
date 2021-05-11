


CREATE TYPE tipo_hospital AS ENUM (
  'distrital',
  'regional',
  'municipal'
);



CREATE TABLE Hospital (
  id_hospital serial PRIMARY key ,
  nombre varchar(50) not NULL,
  direccion varchar(100) not null,
  "latitud" double precision not null,
  "longitud" double precision not null,
  "altitud" double precision not null,
  "distrito" varchar(50) not null,
  "tipo" tipo_hospital not null,
  "MOPH_number" int not null
);


CREATE TABLE Personel_VM (
  id_personel_vm serial  PRIMARY KEY,
  nombre varchar(50) not null
);

CREATE TABLE Hospital_Contact (
  id_contacto serial PRIMARY KEY,
  telefono varchar(15) not null,
  nombre varchar(50),
  rango varchar (20)
);

CREATE TABLE Catalogo_Status_Cuestionario (
  id_status  serial PRIMARY KEY,
  nombre varchar(50) not null
);

CREATE TABLE Catalogo_Problemas (
  id_problema serial  PRIMARY KEY,
  nombre varchar(50) not null
);

CREATE TABLE Catalogo_Accion (
  id_accion serial  PRIMARY KEY,
  nombre varchar(50) not null
);

CREATE TYPE fondos AS ENUM (
  'Si-Gobierno',
  'Si-Privado',
  'Si-Ambos',
  'No',
  'No sabe'
);

CREATE TABLE Update_hospital (
  id_update SERIAL PRIMARY KEY,
  id_contacto int references Hospital_Contact (id_contacto),
  id_personel_vm int references Personel_VM (id_personel_vm),
  id_hospital int references Hospital (id_hospital),
  id_cuestionario_status int references Catalogo_Status_Cuestionario (id_status),
  id_problema_status int references Catalogo_Problemas (id_problema),
  id_accion_status int references Catalogo_Accion (id_accion),
  origen_fondos fondos not null,
  comentarios varchar(300),
  update_date timestamp not null
);


CREATE TABLE Protocolo (
  id_protocolo serial PRIMARY KEY,
  id_update int references Update_hospital (id_update),
  covid_screening boolean,
  covid_awareness boolean,
  avg_test_result_time numeric(2),
  test_capacity boolean,
  covid_tracking boolean,
  MOPH_report boolean
);

CREATE TABLE Covid_Cases (
  id_casefile serial PRIMARY KEY,
  id_update int references Update_hospital (id_update),
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
  id_update int references Update_hospital (id_update),
  no_doctors int,
  no_paramedics int
);


CREATE TYPE "tipo_recurso" AS ENUM (
  'covid',
  'general'
);

CREATE TABLE Catalogo_Recursos (
  id_recurso serial PRIMARY KEY,
  nombre varchar(50),
  tipo tipo_recurso
);

CREATE TABLE Inventario (
  id_update int references Update_hospital (id_update) ON UPDATE CASCADE ON DELETE CASCADE,
  id_recurso int references Catalogo_Recursos (id_recurso) ON UPDATE CASCADE ON DELETE cascade,
  numero_dias int,
  constraint pk_Inventario primary key (id_update, id_recurso)
);



