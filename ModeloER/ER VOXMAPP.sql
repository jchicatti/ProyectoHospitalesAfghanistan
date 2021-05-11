CREATE TYPE "tipo_hospital" AS ENUM (
  'distrital',
  'regional',
  'municipal'
);

CREATE TYPE "fondos" AS ENUM (
  'Si-Gobierno',
  'Si-Privado',
  'Si-Ambos',
  'No',
  'No sabe'
);

CREATE TYPE "tipo_recurso" AS ENUM (
  'covid',
  'general'
);

CREATE TABLE "Hospital" (
  "id_hospital" int PRIMARY KEY,
  "nombre" varchar,
  "direccion" varchar,
  "latitud" double,
  "longitud" double,
  "altitud" double,
  "distrito" varchar,
  "tipo" tipo_hospital,
  "MOPH_number" int
);

CREATE TABLE "Update_hospital" (
  "id_update" int PRIMARY KEY,
  "id_contacto" int,
  "id_personel_vm" int,
  "id_hospital" int,
  "id_cuestionario_status" int,
  "id_problema_status" int,
  "id_accion_status" int,
  "origen_fondos" fondos,
  "comentarios" varchar,
  "date" timestamp
);

CREATE TABLE "Personel_VM" (
  "id_personel_vm" int PRIMARY KEY,
  "nombre" varchar
);

CREATE TABLE "Hospital_Contact" (
  "id_contacto" int PRIMARY KEY,
  "telefono" varchar,
  "nombre" varchar,
  "rango" varchar
);

CREATE TABLE "Catalogo_Status_Cuestionario" (
  "id_status" int PRIMARY KEY,
  "nombre" varchar
);

CREATE TABLE "Catalogo_Problemas" (
  "id_problema" int PRIMARY KEY,
  "nombre" varchar
);

CREATE TABLE "Catalogo_Accion" (
  "id_accion" int PRIMARY KEY,
  "nombre" varchar
);

CREATE TABLE "Protocolo" (
  "id_protocolo" int PRIMARY KEY,
  "id_update" int,
  "covid_screening" boolean,
  "covid_awareness" boolean,
  "avg_test_result_time" int,
  "test_capacity" boolean,
  "covid_tracking" boolean,
  "MOPH_report" boolean
);

CREATE TABLE "Covid_Cases" (
  "id_casefile" int PRIMARY KEY,
  "id_update" int,
  "patients_with_symptoms" int,
  "positive_patients" int,
  "intensive_care" int,
  "covid_deaths" int,
  "non_covid_deaths" int,
  "covid_recovered" int,
  "PHC_referred" int
);

CREATE TABLE "Personel" (
  "id_personel" int PRIMARY KEY,
  "id_update" int,
  "no_doctors" int,
  "no_paramedics" int
);

CREATE TABLE "Inventario" (
  "id_update" int,
  "id_producto" int,
  "numero_dias" int,
  PRIMARY KEY ("id_update", "id_producto")
);

CREATE TABLE "Catalogo_Recursos" (
  "id_producto" int PRIMARY KEY,
  "nombre" varchar,
  "tipo" tipo_recurso
);

ALTER TABLE "Update_hospital" ADD FOREIGN KEY ("id_contacto") REFERENCES "Hospital_Contact" ("id_contacto");

ALTER TABLE "Update_hospital" ADD FOREIGN KEY ("id_personel_vm") REFERENCES "Personel_VM" ("id_personel_vm");

ALTER TABLE "Update_hospital" ADD FOREIGN KEY ("id_hospital") REFERENCES "Hospital" ("id_hospital");

ALTER TABLE "Update_hospital" ADD FOREIGN KEY ("id_cuestionario_status") REFERENCES "Catalogo_Status_Cuestionario" ("id_status");

ALTER TABLE "Update_hospital" ADD FOREIGN KEY ("id_problema_status") REFERENCES "Catalogo_Problemas" ("id_problema");

ALTER TABLE "Update_hospital" ADD FOREIGN KEY ("id_accion_status") REFERENCES "Catalogo_Accion" ("id_accion");

ALTER TABLE "Protocolo" ADD FOREIGN KEY ("id_update") REFERENCES "Update_hospital" ("id_update");

ALTER TABLE "Covid_Cases" ADD FOREIGN KEY ("id_update") REFERENCES "Update_hospital" ("id_update");

ALTER TABLE "Personel" ADD FOREIGN KEY ("id_update") REFERENCES "Update_hospital" ("id_update");

ALTER TABLE "Inventario" ADD FOREIGN KEY ("id_update") REFERENCES "Update_hospital" ("id_update");

ALTER TABLE "Inventario" ADD FOREIGN KEY ("id_producto") REFERENCES "Catalogo_Recursos" ("id_producto");

