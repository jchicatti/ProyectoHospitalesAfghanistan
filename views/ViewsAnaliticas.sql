-- A1: View de casos y muertes por provincia
create view cases_and_deaths_by_province as
select p.id_province, sum(cc.covid_deaths) as "covid_deaths", sum(cc.positive_patients) as "covid_positive" from covid_cases cc 
join most_recent_complete_update_by_hospital mrubh using (id_update)
join hospital h using (id_hospital)
join province p on h.province = p.id_province 
group by id_province

-- A2: View de hospitales con campañas de awareness
create view hospitals_with_awareness_campaigns as
select h.id_hospital, p.covid_awareness from hospital h 
join most_recent_complete_update_by_hospital mrubh using (id_hospital)
join protocol p using (id_update)
where p.covid_awareness = true 

-- A3: View de hospitales y el promedio de sus casos agrupados por si tienen campaña de awareness o no
create view hospitals_awareness_cases as
select p.covid_awareness, avg(cc.positive_patients) from hospital h 
join most_recent_complete_update_by_hospital mrubh using (id_hospital)
join protocol p using (id_update)
join covid_cases cc using (id_update)
group by p.covid_awareness

-- A4: View de porcentajes de muertos, recuperados y positivos por hospital
create view patient_percentages as
select id_hospital, 
concat(100*cast(cc.covid_deaths as float)/(cast(cc.covid_recovered+cc.covid_deaths+cc.positive_patients as float)),'%') as "death_percentage",
concat(100*cast(cc.covid_recovered as float)/(cast(cc.covid_recovered+cc.covid_deaths+cc.positive_patients as float)), '%') as "recovered_percentage",
concat(100*cast(cc.positive_patients as float)/(cast(cc.covid_recovered+cc.covid_deaths+cc.positive_patients as float)),'%') as "positive_percentage"
from most_recent_complete_update_by_hospital mrubh 
join covid_cases cc using (id_update)

-- A5: View de hospitales sin capacidad de hacer pruebas y sus casos

create view hospitals_test_cap as
select h.id_hospital, h.hospital_name, cc.covid_deaths+cc.covid_recovered+cc.positive_patients as "total_patients", p2.test_capacity 
from most_recent_complete_update_by_hospital mrubh 
join hospital h using (id_hospital)
join protocol p2 using (id_update)
join covid_cases cc using (id_update)


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

--A8 Personel Counts
  --A8.1 by hospital
  create view personel_counts_byHospital_lastWave as (
select h.id_hospital ,h.hospital_name,h.latitude, h.longitude ,no_doctors  as "Number of doctors", no_paramedics as "Number of Paramedics"
from most_recent_complete_update_by_hospital mrubh 
join hospital h on (mrubh.id_hospital = h.id_hospital)
join personel p on (mrubh.id_update = p.id_update)
)
--A8.2 by province
create view personel_counts_byProvince_lastWave as (
select  p2.province_name,  sum(no_doctors) as "Number of doctors", sum(no_paramedics) as "Number of Paramedics"
from most_recent_complete_update_by_hospital mrubh 
join hospital h on (mrubh.id_hospital = h.id_hospital)
join personel p on (mrubh.id_update = p.id_update)
join province p2 on (h.province = p2.id_province)
group by province_name 
)
--A8.3 by Country
create view personel_counts_byCountry_lastWave as (
select  sum(no_doctors) as "Total number of doctors", sum(no_paramedics) as "Total number of Paramedics"
from most_recent_complete_update_by_hospital mrubh 
join hospital h on (mrubh.id_hospital = h.id_hospital)
join personel p on (mrubh.id_update = p.id_update)
join province p2 on (h.province = p2.id_province)
)

-- A9 Resource counts
  --A9.1 Dias restantes de cada recurso por hospital
  create view days_remaining_byResource_byHospital_lastWave as ( 
select h.id_hospital , h.hospital_name, product_name, days_remaining
from most_recent_complete_update_by_hospital mrubh 
join inventory i on (mrubh.id_update = i.id_update)
join resource_catalog rc on (i.id_product = rc.id_product)
join hospital h using (id_hospital)
)
  --A9.2 Dias restantes promedio por hospital
  create view avg_days_remaining_byHosptial_lastWave as (
select h.id_hospital , h.hospital_name, avg(days_remaining) as avg_days_remaining
from most_recent_complete_update_by_hospital mrubh 
join inventory i on (mrubh.id_update = i.id_update)
join resource_catalog rc on (i.id_product = rc.id_product)
join hospital h using (id_hospital)
group by h.id_hospital, hospital_name
order by hospital_name 
)
  --A9.3 Dias restantes promedio por recurso por provincia
  
create view avg_days_remaining_byProduct_Provinces as (
select pr.province_name ,product_name, avg(days_remaining)
from most_recent_complete_update_by_hospital mrubh 
join inventory i on (mrubh.id_update = i.id_update)
join resource_catalog rc on (i.id_product = rc.id_product)
join hospital h using (id_hospital)
join province pr on (h.province = pr.id_province)
group by pr.province_name , product_name
order by province_name
)
  --A9.4 Dias restantes promedio por recurso en el país
  create view avg_daysRemaining_byProduct_country as ( 
select product_name, avg(days_remaining)
from most_recent_complete_update_by_hospital mrubh 
join inventory i on (mrubh.id_update = i.id_update)
join resource_catalog rc on (i.id_product = rc.id_product)
join hospital h using (id_hospital)
join province pr on (h.province = pr.id_province)
group by product_name
)

--A10 Porcentaje de los protocolos implementados por los hospitalese 
create view Protocol_pct_byHospital_lastWave as (
select h2.id_hospital,h2.hospital_name , 
((cast(covid_screening as int)+ cast(covid_awareness as int)+cast(test_capacity as int)+cast(covid_tracking as int))*100)/4 as pctgProtocol
from most_recent_complete_update_by_hospital mrubh 
join hospital h2 on (mrubh.id_hospital = h2.id_hospital)
join protocol p on (mrubh.id_update = p.id_update)
)
--A11 Porcentaje promedio del protocolo implementado por provincia
create view Avg_protocol_pct_byProvince  as (
with pctgByHospital as (
select h2.id_hospital,p2.province_name ,h2.hospital_name , 
((cast(covid_screening as int)+ cast(covid_awareness as int)+cast(test_capacity as int)+cast(covid_tracking as int))*100)/4 as pctgProtocol
from most_recent_complete_update_by_hospital mrubh 
join hospital h2 on (mrubh.id_hospital = h2.id_hospital)
join protocol p on (mrubh.id_update = p.id_update)
join province p2 on (h2.province = p2.id_province)
)

select province_name, avg(pctgprotocol)
from pctgByHospital
group by province_name





