--Populating catalogs

insert into resources_catalog
(nombre)
values
("Oxygen reserves"),
("Antipyretics (paracetamol)"),
("Anesthetic drugs/Muscular Relaxant"),
("Alcohol solutions (>70) and soap for handwashing"),
("Disposable masks (minimum P2)"),
("Disposable vinyl gloves"),
("Disposable hats"),
("Disposable aprons"),
("Visors"),
("Disposable shoe covers"),
("Covid test kits"),
("?");

insert into action_catalog
(nombre)
values
("NO ADDITIONAL ACTION NEEDED"),
("CALL BACK TOMORROW TO COMPLETE DATA"),
("FIND NEW PHONE NUMBER"),
("FIND AUTHORIZATION"),
("OTHER");


insert into problem_catalog
(nombre)
values
("NO PROBLEM"),
("SOME DATA IS MISSING"),
("REFUSED TO SPEAK"),
("NO ANSWER"),
("WRONG PHONE NUMBER"),
("DOCTOR HAS QUIT");

insert into questionnaire_status_catalog
(nombre)
values 
("QUESTIONNAIRE COMPLETED"),
("QUESTIONNAIRE COMPLETED PARTIALLY"),
("QUESTIONNAIRE NOT DONE"),
("THIS WAS A TEST"),
("OTHER - SEE COMMENTS");

-- Agregamos empleados de VoxMap falsos
insert into personel_vm
(nombre)
values 
("Armando"),
("Bruno"),
("Carla"),
("Daniela");

-- Agregamos un par de hospitales falsos
insert into hospital
(nombre, direccion, latitud, longitud, altitud, distrito, tipo, "MOPH_number")
values
('Angeles','Periferico Sur',100,200,300, 'Magdalena Contreras','distrital',1023),
('SEDNA','EDOMEX',200,1,3020, 'Naucalpan','distrital',1038),
('Cardiología','Centro',3,4,5, 'Alvaro Obregón','distrital',93837)

