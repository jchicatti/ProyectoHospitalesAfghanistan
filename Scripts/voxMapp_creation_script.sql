--
-- TABLE: id_hospital
-- 
CREATE TABLE Hospital (
  id_hospital numeric(5,0) constraint pk_Hospital primary key,
  nombre varchar(100) not null,
  dirección varchar(100) NOT null, 
  latitud numeric(8,6) not null,
  longitud numeric(9,6) not null,
  telefono_fijo varchar(100) not null
  );
--tipo_fondo falta
CREATE SEQUENCE Hospital_id_hospital_seq START 1 INCREMENT 1 ;
ALTER TABLE Hospital ALTER COLUMN id_hospital SET DEFAULT nextval('Hospital_id_hospital_seq');


--
--CATALOGO: Recursos
--
create table Catalogo_Recursos(
	id_producto numeric(5,0) constraint pk_catalogo_recursos primary key,
	nombre varchar (100) not null
);
--tipo numeric() not null
CREATE SEQUENCE Catalogo_Recursos_id_producto_seq START 1 INCREMENT 1 ;
ALTER TABLE Catalogo_Recursos ALTER COLUMN id_producto SET DEFAULT nextval('Catalogo_Recursos_id_producto_seq');

--
--CATALOGO: Problemas
--
create table Catalogo_Problemas(
	id_problema numeric(2,0) constraint pk_catalogo_problema primary key,
	nombre varchar (100) not null,	
	id_problema_status bool not null
);

CREATE SEQUENCE Catalogo_Problemas_id_problema_seq START 1 INCREMENT 1 ;
ALTER TABLE Catalogo_Problemas ALTER COLUMN id_problema SET DEFAULT nextval('Catalogo_Problemas_id_problema_seq');

--
--CATALOGO: Acción
--
create table Catalogo_Accion(
	id_accion numeric(2,0) constraint pk_catalogo_accion primary key,
	nombre varchar (100) not null,	
	id_accion_status bool not null
);

CREATE SEQUENCE Catalogo_Accion_id_accion_seq START 1 INCREMENT 1 ;
ALTER TABLE Catalogo_Accion ALTER COLUMN id_accion SET DEFAULT nextval('Catalogo_Accion_id_accion_seq');

--
--CATALOGO: Fondos
--
create table Catalogo_Fondos(
	id_fondos numeric(2,0) constraint pk_catalogo_fondos primary key,
	nombre varchar (100) not null	
);

CREATE SEQUENCE Catalogo_Fondos_id_fondos_seq START 1 INCREMENT 1 ;
ALTER TABLE Catalogo_Fondos ALTER COLUMN id_fondos SET DEFAULT nextval('Catalogo_Fondos_id_fondos_seq');

--
--TABLE: Hospital_Contact
--
create table Hospital_Contact(
	id_contacto numeric (6,0) constraint pk_id_contacto primary key,
	telefono varchar (50) not null,
	nombre varchar(100) not null,
	rango varchar(100) not null
);

/*
 * La razón de tener rango varchar es que VM intenta tener 3 profesionoistas diferentes por hospital, primero se intenta encuestar a directores, luego doctores y luego enfermeras
 */

CREATE SEQUENCE Hospital_Contact_id_contact_seq START 1 INCREMENT 1 ;
ALTER TABLE Hospital_Contact ALTER COLUMN id_contacto SET DEFAULT nextval('Hospital_Contact_id_contact_seq');

--
--TABLE: Personel_VM
--

create table Personel_VM(
	id_personel_vm numeric (5,0) constraint pk_id_personel primary key,
	nombre varchar(100) not null
);

CREATE SEQUENCE Personel_VM_id_personel_vm_seq START 1 INCREMENT 1 ;
ALTER TABLE Personel_VM ALTER COLUMN id_personel_vm SET DEFAULT nextval('Personel_VM_id_personel_vm_seq');

--
--Catalogo: Cuestionario_status
--

create table Cuestionario_status(
	id_cuestionario_status numeric(2,0) constraint pk_id_cuestionario_status primary key,
	nombre bool
);

CREATE SEQUENCE Cuestionario_status_id_cuestionario_status_seq START 1 INCREMENT 1 ;
ALTER TABLE Cuestionario_status ALTER COLUMN id_cuestionario_status SET DEFAULT nextval('Cuestionario_status_id_cuestionario_status_seq');


--
--TABLE: Update_hospital
--
create table Update_Hospital(
	id_update numeric(6,0) constraint pk_update_hospital primary key,
	id_contacto numeric(6,0) references Hospital_Contact(id_contacto),
	id_personel_vm numeric(5,0) references Personel_VM(id_personel_vm),
	id_hospital numeric(5,0) references Hospital(id_hospital),
	id_cuestionario_status numeric(2,0) references Cuestionario_status(id_cuestionario_status),
	id_problema_status numeric(10) references Catalogo_Problemas(id_problema),
	id_accion_status numeric(10) references Catalogo_Accion(id_accion),
	id_fondos_status numeric(5) references Catalogo_Fondos(id_fondos),
	comentarios varchar(200),
	fecha timestamp
);

create sequence Update_Hospital_id_update_seq start 1 increment 1;
ALTER TABLE Update_Hospital ALTER COLUMN id_update SET DEFAULT nextval('Update_Hospital_id_update_seq');

--
--TABLE: Inventario
--
create table Inventario(
	id_hospital numeric(5,0) references Hospital(id_hospital) ON DELETE RESTRICT, 
	id_update numeric(6,0) references Update_Hospital(id_update) ON DELETE RESTRICT,
	id_producto numeric(5,0) references Catalogo_Recursos(id_producto) ON DELETE RESTRICT,
	numero_dias numeric (4,0),
	primary key (id_update, id_producto)
);

/*
 * Creo que no se pueden crear secuencias para primary keys compuestas 
 */
--create sequence Inventario_id_inventario_seq start 1 increment 1;
--alter table Inventario alter column id_inventario set default nextval('Inventario_id_inventario_seq');

/*
 * Empiezan las tablas cuya PK es id_update
 */

--
--TABLE: Covid Cases
--

create table Covid_Cases(
	id_update numeric(6,0) references Update_Hospital(id_update) constraint id_update_covid_cases primary key,
	patients_w_symptoms numeric(4,0),
	positive_patients numeric(4,0),
	intensive_care numeric(4,0),
	covid_deaths numeric(4,0),
	non_covid_deaths numeric(4,0),
	covid_recovered numeric(4,0),
	PHC_referred numeric(4,0)
);

create sequence Covid_Cases_id_update_seq start 1 increment 1;
alter table Covid_Cases alter column id_update set default nextval('Covid_Cases_id_update_seq');

--
--TABLE: Protocolo
--

create table Protocolo( 
	id_update numeric(6,0) references Update_Hospital(id_update) constraint id_update_protocolo primary key,
	covid_screening bool,
	covid_awareness bool,
	avg_test_result_time numeric (5,0),
	test_capacity bool,
	covid_tracking bool,
	MOPH_report numeric(4,0)	
);

create sequence Protocolo_seq start 1 increment 1;
alter table Protocolo alter column id_update set default nextval('Protocolo_seq');

--
--TABLE: Personel
--

create table Personel( 
	id_update numeric(6,0) references Update_Hospital(id_update) constraint id_update_personel primary key,
	no_doctores numeric (4,0),
	no_paramedicos numeric (4,0)
);

create sequence personel_seq start 1 increment 1;
alter table Personel alter column id_update set default nextval('personel_seq');






