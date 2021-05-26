--1.Vista con el nombre de hospitales que tienen <=1 números de telefono
create view hospitals_w_few_contacts as (
with aux as (
select h.id_hospital as id, h.hospital_name as nam, t.telephone as tel, t.active as status from hospital h join telephone t using (id_hospital)
), telefonos as ( 
select aux.id as id, aux.nam as hospital, count(aux.tel) as num_tel from aux where aux.status=true group by aux.id, aux.nam
) select telefonos.hospital, telefonos.id, telefonos.num_tel from telefonos where telefonos.num_tel<=1);

--2.Vista con hospitales registrados y el número de telefonos que tienen divididos en activos y no activos 
create view hospital_telephone as (
select id_hospital, h.hospital_name as "Nombre Hospital", count(t.id_telephone) as "Número de teléfonos", t.active from hospital h join telephone t using (id_hospital) group by t.active, h.id_hospital order by h.id_hospital
);

--3.Vista con el número de updates realizados por cada empleado el último mes
create view last_month_updates as (
select pv.id_personel_vm as "Employee id",pv.employee_name as "Employee name",count(uh.id_update)as "Number of updates" from update_hospital uh join 
personel_vm pv using (id_personel_vm) where 
((extract('month' from age(now(),uh.update_date)))=0 and (extract('year' from age(now(),uh.update_date)))=0 and (extract('day' from age(now(),uh.update_date)))<=31) 
or ((extract('month' from age(now(),uh.update_date)))<=1 and (extract('year' from age(now(),uh.update_date)))=0 and (extract('day' from age(now(),uh.update_date)))=0) 
group by pv.id_personel_vm
);
