-- View del update completo más reciente por hospital
create view most_recent_update_by_hospital as
SELECT 
  uh.id_hospital, uh.update_date, id_update, name_responder, id_personel_vm , id_questionnare_status, id_problem_status , id_action_status , funds, additional_comments
FROM update_hospital uh 
  INNER JOIN (
    SELECT uh2.id_hospital, MAX(uh2.update_date) AS most_recent FROM update_hospital uh2 GROUP BY uh2.id_hospital 
  ) ms ON uh.id_hospital = ms.id_hospital AND uh.update_date = most_recent;
  

-- View del update completo más reciente por hospital
create view most_recent_complete_update_by_hospital as
SELECT 
  uh.id_hospital, uh.update_date, id_update, name_responder, id_personel_vm , id_questionnare_status, id_problem_status , id_action_status , funds, additional_comments
FROM update_hospital uh 
  INNER JOIN (
    SELECT uh2.id_hospital, MAX(uh2.update_date) AS most_recent 
    FROM update_hospital uh2 
    where uh2.id_questionnare_status = 1 
    GROUP BY uh2.id_hospital 
  ) ms ON uh.id_hospital = ms.id_hospital AND uh.update_date = most_recent
  
  --View de los problemas por hospital 
 create view most_recent_problems as
select uh.id_hospital, id_update, id_questionnare_status , update_date, pc.problem, id_problem_status 
FROM update_hospital uh join problem_catalog pc on (uh.id_problem_status= pc.id_problem)
  INNER JOIN (
 SELECT uh2.id_hospital, MAX(uh2.update_date) AS most_recent 
 FROM update_hospital uh2 
 GROUP BY uh2.id_hospital 
) ms on uh.id_hospital = ms.id_hospital AND uh.update_date = most_recent
where id_problem_status in (2,3,5)
;

--¿Qué hospitales no tienen un update completo?
create view hospitales_faltantes
select uh.id_hospital, hospital_name, id_update, id_questionnare_status as estatus_cuestionario , update_date, id_problem_status , pc.problem 
from hospital h join update_hospital uh on (h.id_hospital=uh.id_hospital) join problem_catalog pc on (uh.id_problem_status=pc.id_problem)
INNER JOIN (
 SELECT uh2.id_hospital, MAX(uh2.update_date) AS most_recent 
 FROM update_hospital uh2 
 GROUP BY uh2.id_hospital 
) ms on uh.id_hospital = ms.id_hospital AND uh.update_date = most_recent
where id_problem_status in (2,3,4,5,6);

--Qué hospitales tienen un update completo este wave?
create view hospitales_completos
select uh.id_hospital, hospital_name, id_update, id_questionnare_status as estatus_cuestionario , update_date, id_problem_status , pc.problem 
from hospital h join update_hospital uh on (h.id_hospital=uh.id_hospital) join problem_catalog pc on (uh.id_problem_status=pc.id_problem)
INNER JOIN (
 SELECT uh2.id_hospital, MAX(uh2.update_date) AS most_recent 
 FROM update_hospital uh2 
 GROUP BY uh2.id_hospital 
) ms on uh.id_hospital = ms.id_hospital AND uh.update_date = most_recent
where id_problem_status in (1);

--¿Cuántos y cuáles problemas se presentaron en el último wave?
create view count_problemas
select count(id_problem_status),pc.problem as problem 
from hospital h join update_hospital uh on (h.id_hospital=uh.id_hospital) join problem_catalog pc on (uh.id_problem_status=pc.id_problem)
INNER JOIN (
 SELECT uh2.id_hospital, MAX(uh2.update_date) AS most_recent 
 FROM update_hospital uh2 
 GROUP BY uh2.id_hospital 
) ms on uh.id_hospital = ms.id_hospital AND uh.update_date = most_recent
where id_problem_status in (2,3,4,5,6)
group by id_problem_status,pc.problem ;
