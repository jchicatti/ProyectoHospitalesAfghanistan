-- View del update más reciente por hospital
create view most_recent_update_by_hospital as
SELECT 
  uh.id_hospital, uh.update_date, id_update, name_responder, id_personel_vm , id_questionnare_status, id_problem_status , id_action_status , funds, additional_comments
FROM update_hospital uh 
  INNER JOIN (
    SELECT uh2.id_hospital, MAX(uh2.update_date) AS most_recent FROM update_hospital uh2 GROUP BY uh2.id_hospital 
  ) ms ON uh.id_hospital = ms.id_hospital AND uh.update_date = most_recent

-- View de casos y muertes por provincia
create view cases_and_deaths_by_province as
select p.id_province, count(cc.covid_deaths), count(cc.positive_patients) from covid_cases cc 
join most_recent_update_by_hospital mrubh using (id_update)
join hospital h using (id_hospital)
join province p on h.province = p.id_province 
group by id_province

-- View de hospitales con campañas de awareness
create view hospitals_with_awareness_campaigns as
select h.id_hospital, p.covid_awareness from hospital h 
join most_recent_update_by_hospital mrubh using (id_hospital)
join protocol p using (id_update)
where p.covid_awareness = true 

-- View de hospitales y si tienen campaña de awareness ordenados por sus casos
create view hospitals_awareness_cases as
select h.id_hospital, p.covid_awareness, cc.positive_patients from hospital h 
join most_recent_update_by_hospital mrubh using (id_hospital)
join protocol p using (id_update)
join covid_cases cc using (id_update)
order by cc.positive_patients desc 




-- para probar la primera view (deben salir los días 23 y 24)
insert into update_hospital 
(name_responder, id_personel_vm,id_hospital,id_questionnare_status,id_problem_status,id_action_status,funds,additional_comments,update_date)
values
('Abdul -Ghani', 1,1,1,1,1,  'No','','2021-06-22 19:10:25-07'),
('Abdul -Ghani', 1,2,3,1,1,  'Yes-Private','','2021-06-23 19:10:25-07'),
('Abdul -Ghani', 1,1,1,1,1,  'No','','2021-06-24 19:10:25-07'),
('Abdul -Ghani', 1,2,3,1,1,  'Yes-Private','','2021-06-20 19:10:25-07');
