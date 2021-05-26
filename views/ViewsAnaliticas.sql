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

-- A7: Trends mensuales por provincia

  --A7.1 Muertes
  create view monthly_deaths_by_province as (
select p.province_name , date_trunc('month', uh.update_date) as "year-month", sum(cc.covid_deaths) as "Number of Deaths"
from update_hospital uh 
join hospital h on (uh.id_hospital = h.id_hospital)
join covid_cases cc on (uh.id_update = cc.id_update)
join province p on (h.province = p.id_province)
where uh.id_questionnare_status = 1 --Jalamos solo updates completos
group by p.province_name, date_trunc('month', uh.update_date)
order by p.province_name, 2 
)
  --A7.1.2 Rankings muertes por mes
  create view monthly_death_ranking_by_province as (
  with counts as (
select p.province_name, date_trunc('month', uh.update_date) as YM,sum(cc.covid_deaths) as TotalDeaths
from update_hospital uh 
join hospital h on (uh.id_hospital = h.id_hospital)
join covid_cases cc on (uh.id_update = cc.id_update)
join province p on (h.province = p.id_province)
where uh.id_questionnare_status = 1 
group by p.province_name, date_trunc('month', uh.update_date)
order by  date_trunc('month', uh.update_date) desc,TotalDeaths desc
) 
select *, rank() over(partition by  ym order by totaldeaths desc)
from counts
    
)
  --A7.2 Casos
  create view monthly_cases_by_province as (
select p.province_name , date_trunc('month', uh.update_date) as "year-month", sum(cc.positive_patients+cc.patients_with_symptoms+cc.intensive_care) as "Number of Confirmed Patients"
from update_hospital uh 
join hospital h on (uh.id_hospital = h.id_hospital)
join covid_cases cc on (uh.id_update = cc.id_update)
join province p on (h.province = p.id_province)
where uh.id_questionnare_status = 1
group by p.province_name, date_trunc('month', uh.update_date)
order by province_name, 2
)

  --A7.2.1 Rankings casos por mes
  create view monthly_cases_ranking_by_province as(
    with counts as (
select p.province_name, date_trunc('month', uh.update_date) as ym,sum(cc.positive_patients+cc.patients_with_symptoms+cc.intensive_care) as TotalCases
from update_hospital uh 
join hospital h on (uh.id_hospital = h.id_hospital)
join covid_cases cc on (uh.id_update = cc.id_update)
join province p on (h.province = p.id_province)
where uh.id_questionnare_status = 1 
group by p.province_name, date_trunc('month', uh.update_date)
order by  date_trunc('month', uh.update_date) desc,TotalCases desc
)

select *, rank() over (partition by ym order by TotalCases desc)
from counts 
)

  --A7.3 Recuperados
  create view monthly_recovered_by_province as (
select p.province_name , date_trunc('month', uh.update_date) as "year-month", sum(cc.covid_deaths) as "Number of Recovered Patients"
from update_hospital uh 
join hospital h on (uh.id_hospital = h.id_hospital)
join covid_cases cc on (uh.id_update = cc.id_update)
join province p on (h.province = p.id_province)
where uh.id_questionnare_status = 1
group by p.province_name, date_trunc('month', uh.update_date)
order by province_name, 2
)
--A7.3.1 Ranking recuperados por mes
create view monthly_recovered_ranking_by_province as (
  with counts as(
select p.province_name, date_trunc('month', uh.update_date) as ym,sum(cc.covid_recovered) as TotalRecoveries
from update_hospital uh 
join hospital h on (uh.id_hospital = h.id_hospital)
join covid_cases cc on (uh.id_update = cc.id_update)
join province p on (h.province = p.id_province)
where uh.id_questionnare_status = 1 
group by p.province_name, date_trunc('month', uh.update_date)
order by  date_trunc('month', uh.update_date) desc,totalrecoveries desc
)
select *, rank() over (partition by ym order by totalrecoveries desc)
from counts 
)


