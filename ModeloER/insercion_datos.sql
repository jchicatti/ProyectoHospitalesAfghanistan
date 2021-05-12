--Populating catalogs

insert into Resource_Catalog
(product_name, product_type)
values
('Oxygen reserves','general'),
('Antipyretics (paracetamol)','general'),
('Anesthetic drugs/Muscular Relaxant','general'),
('Alcohol solutions (>70) and soap for handwashing','general'),
('Disposable masks (minimum P2)','general'),
('Disposable vinyl gloves','general'),
('Disposable hats','covid'),
('Disposable aprons','covid'),
('Visors','covid'),
('Disposable shoe covers', 'covid'),
('Covid test kits', 'covid');

insert into Action_Catalog
(action_name)
values
('NO ADDITIONAL ACTION NEEDED'),
('CALL BACK TOMORROW TO COMPLETE DATA'),
('FIND NEW PHONE NUMBER'),
('FIND AUTHORIZATION'),
('OTHER');


insert into Problem_Catalog
(problem)
values
('NO PROBLEM'),
('SOME DATA IS MISSING'),
('REFUSED TO SPEAK'),
('NO ANSWER'),
('WRONG PHONE NUMBER'),
('DOCTOR HAS QUIT');

insert into Questionnaire_Status_Catalog
(status)
values 
('QUESTIONNAIRE COMPLETED'),
('QUESTIONNAIRE COMPLETED PARTIALLY'),
('QUESTIONNAIRE NOT DONE'),
('THIS WAS A TEST'),
('OTHER - SEE COMMENTS');

-- Agregamos empleados de VoxMap falsos
insert into Personel_VM
(employee_name)
values 
('Armando'),
('Bruno'),
('Carla'),
('Daniela');


--PROVINCES

"Badakhshan"
"Badghis"
"Baghlan"
"Balkh"
"Bamyan"
"Daykundi"
"Farah"
"Faryab"
"Ghazni"
"Ghor"
"Hilmand"
"Hirat"
"Jawzjan"
"Kabul"
"Kandahar"
"Kapisa"
"Khost"
"Kunar"
"Kunduz"
"Laghman"
"Logar"
"Maidan Wardak"
"Nangarhar"
"Nimroz"
"Nuristan"
"Paktika"
"Paktya"
"Panjsher"
"Parwan"
"Samangan"
"Sar-e-Pul"
"Takhar"
"Uruzgan"
"Zabul"

-- Agregamos un par de hospitales falsos
insert into hospital
(hospital_name, address, latitude, longitude, altitude, district, province, hospital_type, MOPH_number)
values
('Angeles','Periferico Sur',100,200,300, 'Magdalena Contreras','ejemplo','distrital',1023),
('SEDNA','EDOMEX',200,1,3020, 'Naucalpan','ejemplo','distrital',1038),
('Cardiologia','Centro',3,4,5, 'Alvaro Obregon','ejemplo','distrital',93837);

