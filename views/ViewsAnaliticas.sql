-- A1: View de casos y muertes por provincia
create view cases_and_deaths_by_province as
select p.id_province, sum(cc.covid_deaths), sum(cc.positive_patients) from covid_cases cc 
join most_recent_complete_update_by_hospital mrubh using (id_update)
join hospital h using (id_hospital)
join province p on h.province = p.id_province 
group by id_province;

-- A2: View de hospitales con campañas de awareness
create view hospitals_with_awareness_campaigns as
select h.id_hospital, p.covid_awareness from hospital h 
join most_recent_complete_update_by_hospital mrubh using (id_hospital)
join protocol p using (id_update)
where p.covid_awareness = true ;

-- A3: View de hospitales y si tienen campaña de awareness ordenados por sus casos
create view hospitals_awareness_cases as
select h.id_hospital, p.covid_awareness, cc.positive_patients from hospital h 
join most_recent_complete_update_by_hospital mrubh using (id_hospital)
join protocol p using (id_update)
join covid_cases cc using (id_update)
order by cc.positive_patients desc ;

-- A4: View de porcentajes de muertos, recuperados y positivos por hospital, no jala si covid cases está vacía porque all patients va a estar vacía
create view patient_percentages as (
with all_patients as(
select id_hospital, cc.covid_recovered+cc.covid_deaths+cc.positive_patients as patient_no 
from most_recent_complete_update_by_hospital mrubh 
join covid_cases cc using (id_update))
select mrubh2.id_hospital, cc2.covid_deaths/all_patients.patient_no as death_percentage, 
cc2.covid_recovered/all_patients.patient_no as recovered_percentage,
cc2.positive_patients/all_patients.patient_no as positive_percentage
from most_recent_update_by_hospital mrubh2 
join covid_cases cc2 );

-- A5: View de provincias sin capacidad de hacer pruebas
create view provinces_wout_covid_test_cap as
select p.id_province , p.province_name, p2.test_capacity 
from most_recent_complete_update_by_hospital mrubh 
join hospital h using (id_hospital)
join province p on h.province = p.id_province 
join protocol p2 using (id_update)
where exists (select * from protocol p3 where p3.test_capacity = false)

-- A6: View de distritos sin capacidad de hacer pruebas
create view districts_wout_covid_test_cap as
select d.id_district, d.district_name , p2.test_capacity 
from most_recent_complete_update_by_hospital mrubh 
join hospital h using (id_hospital)
join district d on h.district = d.id_district 
join protocol p2 using (id_update)
where exists (select * from protocol p3 where p3.test_capacity = false)

