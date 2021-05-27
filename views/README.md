# Documentación de las vistas

## Views de monitoreo: 

1. ¿Cuál es el update más reciente por hospital?

  **most_recent_update_by_hospital**
  
  Regresa, para cada hospital, la entrada del update más reciente que exista.
  
  Depende de la tabla **update_hospital**.
  
  ![monit_1](https://user-images.githubusercontent.com/77305951/119763816-d9d50700-be75-11eb-9312-a1242b00000d.png)
  
2. ¿Cuál es el update _completo_ más reciente por hospital?

  **most_recent_complete_update_by_hospital**
  
  Regresa, para cada hospital, la entrada del update completo más reciente que exista. De no existir ni un solo update completo de cierto hospital, no regresa ninguna entrada para dicho hospital.
  
  Depende de la tabla **update_hospital**.
  
  ![monit_2](https://user-images.githubusercontent.com/77305951/119763880-fc672000-be75-11eb-8305-a3bc14f66527.png)

  
3. ¿Cuáles son los hospitales que tuvieron problemas en el último wave?
  
  **hospitales_faltantes**
  
  Regresa, los hospitales que no han sido marcados con el estatus 1 del católogo de problemas, es decir aquellos a los que hay que volver a marcar, hay datos faltantes, etc. 
  
  Depende de la tabla **update_hospital**
  
4. ¿Cuáles son los hospitales que no tuvieron problemas en el último wave?

**hospitales_completos**

 Regresa los hospitales que ya no tienen problemas por resolver, es decir, han sido marcado con el id 1 del catalógo de problemas, que corresponde a "No  hubo problemas".
 
 Depende de la tabla **update_hospital**
 
 5. ¿Cuántos y cuáles problemas se presentaron en el último wave?

**count_problemas**

Regresa el número total de problemas en el último update de los hospitales para un mejor monitoreo interno de actividades.

Depende de la tabla **update_hospital**
  
## Views de análisis: 

1. ¿Cuántas muertes y cuántos casos hay por provincia?
  
  **cases_and_deaths_by_province**
  
  Regresa, para cada provincia, el acumulado de muertes y casos.
  
  Depende de las tablas **covid_cases**, **hospital** y **province**, y de la view **most_recent_complete_update_by_hospital**.
  
  ![anal_1](https://user-images.githubusercontent.com/77305951/119763945-1f91cf80-be76-11eb-97ff-7b913e5fa467.png)

2. ¿Qué hospitales realizan awareness campaigns?
  
  **hospitals_with_awareness_campaigns**
  
  Regresa los hospitales que realizan campañas de prevención COVID-19.
  
  Depende de la tabla **protocol** y de la view **most_recent_complete_update_by_hospital**.
  
  ![anal_2](https://user-images.githubusercontent.com/77305951/119763962-2587b080-be76-11eb-9c64-badd4d8f73ec.png)
 
3. ¿Cómo se correlacionan las campañas de prevención con los casos que hay por hospital?
  
  **hospitals_awareness_cases**
  
  Regresa el promedio de casos divididos por si se realizan campañas de prevención COVID-19 o no.
  
  Depende de las tablas **covid_cases**, **hospital** y **protocol**, y de la view **most_recent_complete_update_by_hospital**.
  
  ![anal_3](https://user-images.githubusercontent.com/77305951/119764151-831bfd00-be76-11eb-90ff-8bbb30e6cba5.png)  

4. ¿Qué porcentaje de muertos, recuperados, y positivos hay por hospital?
  
  **patient_percentages**
  
  Regresa, para cada hospital, el porcentaje de muertos, recuperados, y positivos. Se considera que muertos + recuperados + positivos es el número total de pacientes.
  
  Depende de la tabla **covid_cases** y de la view **most_recent_complete_update_by_hospital**.
  
  ![anal_4](https://user-images.githubusercontent.com/77305951/119764244-ab0b6080-be76-11eb-9be7-032a312a3514.png)

5. ¿Qué provincias no tienen la capacidad de hacer pruebas COVID-19?
  
  **provinces_wout_test_cap**
  
  Regresa todos los hospitales agrupados por provincias sin capacidad de hacer pruebas COVID-19.
  
  Depende de las tablas **covid_cases**, **hospital**, **protocol** y **province** y de la view **most_recent_complete_update_by_hospital**.
  
  ![anal_5](https://user-images.githubusercontent.com/77305951/119764621-63390900-be77-11eb-98fb-00e1a34ba696.png)
  
6. ¿Qué distritos no tienen la capacidad de hacer pruebas COVID-19?
  
  **districts_wout_test_cap**
  
   Regresa todos los hospitales agrupados por distritos sin capacidad de hacer pruebas COVID-19.
  
  Depende de las tablas **covid_cases**, **hospital**, **protocol** y **district** y de la view **most_recent_complete_update_by_hospital**.
  
  ![anal_6](https://user-images.githubusercontent.com/77305951/119764638-68965380-be77-11eb-834d-efc381fa8f3e.png)
  
7. Evolución de muertes / casos / recuperados. 

        7.1 ¿Cómo ha evlucionado el número de muertes en cada provincia?

 **monthly_deaths_by_province**

 
 Utiliza el histórico de todos los updates (completos) y agrupa primero por provincia y luego por mes/año, con la suma de las muertes de los hospitales de esa provincia
 
 
 <img width="499" alt="DeathTrends" src="https://user-images.githubusercontent.com/47492091/119738257-0a9d4800-be46-11eb-8c3c-1ccdebd8bda4.png">


**NOTA**: Trunca las fechas para quedarse solamente con el año y el mes


    7.1.2 Para cada mes, ¿Cómo rankea cada provincia en cuanto a número de muertes? 
    
  **monthly_death_ranking_by_province**
    
  Utiliza el histórico de todos los updates (completos) y agrupa por mes y luego por provincia. Ordena las provincias de cada mes por número de muerte y les asigna una posición usando rank().
  
  
  <img width="535" alt="DeathRanks" src="https://user-images.githubusercontent.com/47492091/119738633-9ca55080-be46-11eb-9864-d8f1f2a40c91.png">
  
    7.2 ¿Cómo ha evlucionado el número de casos en cada provincia?
   
   **monthly_cases_by_province**
 
 Utiliza el histórico de todos los updates (completos) y agrupa primero por provincia y luego por mes/año, con la suma de los casos de los hospitales de esa provincia
 
 
<img width="568" alt="CaseTrends" src="https://user-images.githubusercontent.com/47492091/119739051-45ec4680-be47-11eb-84b7-3ef1dcc441b2.png">


**NOTA**: Trunca las fechas para quedarse solamente con el año y el mes

    7.2.2 Para cada mes, ¿Cómo rankea cada provincia en cuanto a número de casos? 
    
   **monthly_cases_ranking_by_province**
    
  Utiliza el histórico de todos los updates (completos) y agrupa por mes y luego por provincia. Ordena las provincias de cada mes por número de casos y les asigna una posición usando rank().
  
  
<img width="536" alt="CaseRanks" src="https://user-images.githubusercontent.com/47492091/119739115-58668000-be47-11eb-885c-3b7526cc47fd.png">


**NOTA:** Para el total de casos consideramos pacientes positivos + paceintes con síntomas + pacientes en Intensive Care
    
    7.3 ¿Cómo ha evlucionado el número de recuperados en cada provincia? 
    
   **monthly_recovered_by_province**
 
 Utiliza el histórico de todos los updates (completos) y agrupa primero por provincia y luego por mes/año, con la suma de los recuperados de los hospitales de esa provincia
 

<img width="572" alt="RecoveredTrends" src="https://user-images.githubusercontent.com/47492091/119739287-9a8fc180-be47-11eb-92d0-5eb1bff65810.png">


**NOTA**: Trunca las fechas para quedarse solamente con el año y el mes

    7.3.2 Para cada mes, ¿Cómo rankea cada provincia en cuanto a número de recuperados? 
    
  **monthly_recovered_ranking_by_province**
    
  Utiliza el histórico de todos los updates (completos) y agrupa por mes y luego por provincia. Ordena las provincias de cada mes por número de recuperados y les asigna una posición usando rank().
  
  
 <img width="562" alt="RecoveredRank" src="https://user-images.githubusercontent.com/47492091/119739324-ad09fb00-be47-11eb-9da4-e214fa5aaeb8.png">

8. Conteos de personal

         8.1 En el ultimo wave de updates, ¿Cuántos doctores y paramédicos había en cada hospital?
         
  **personel_counts_byHospital_lastWave**
  
  Regresa cuántos médicos y paramédicos hay en cada hospital con update, junto con sus coordenadas geográficas. 
  <img width="999" alt="HospitalPersonelCount" src="https://user-images.githubusercontent.com/47492091/119740218-25bd8700-be49-11eb-94d0-dfcd06ab2bbe.png">

  **NOTA**: Depende del view **most_recent_complete_update_by_hospital** para obtener los views completos de esa wave
  
     8.2 En el ultimo wave de updates ¿Cuántos doctores y paramédicos había en cada provincia?
     
 **personel_counts_byProvince_lastWave**

Regresa una lista de las provincias, junto con el número de médicos y paramédicos promedio para los hospitales de esa provincia.

<img width="540" alt="PersonelByCounty" src="https://user-images.githubusercontent.com/47492091/119741509-7b932e80-be4b-11eb-985a-9516b0c511c1.png">

  **NOTA**: Depende del view **most_recent_complete_update_by_hospital** para obtener los views completos de esa wave

    8.3 En el ultimo wave de updates, ¿cuántos doctores y paramédicos había en el país?
    
**personel_counts_byCountry_lastWave**


 Dado que es solo un país, regresa el total de médicos y paramédicos
 
 
 <img width="451" alt="Screen Shot 2021-05-26 at 5 59 28 PM" src="https://user-images.githubusercontent.com/47492091/119741846-24418e00-be4c-11eb-92cd-df920e20c4c0.png">
 
   **NOTA**: Depende del view **most_recent_complete_update_by_hospital** para obtener los views completos de esa wave

9. Conteo de recursos sobrantes

         9.1 En el último wave de updates, ¿Cuántos días de recursos quedan para cada recurso en cada hospital?
      
     **days_remaining_byResource_byHospital_lastWave**
     
     
    Regresa para cada hospital, el número de días restantes de cada tipo de recurso
    
    <img width="806" alt="Screen Shot 2021-05-26 at 6 03 12 PM" src="https://user-images.githubusercontent.com/47492091/119742100-aa5dd480-be4c-11eb-913e-403ef196bbba.png">

  **NOTA**: Depende del view **most_recent_complete_update_by_hospital** para obtener los views completos de esa wave

     9.2 Para cada hospital, ¿Cuál es el promedio de días restantes de recursos?
     
  **avg_days_remaining_byHosptial_lastWave**
   
   Similar al view 9.1, pero promedia todos los recursos para cada hospital
   
   
   <img width="602" alt="Screen Shot 2021-05-26 at 6 05 39 PM" src="https://user-images.githubusercontent.com/47492091/119742309-1fc9a500-be4d-11eb-862f-37ce98b564e8.png">
   
   **NOTA**: Depende del view **most_recent_complete_update_by_hospital** para obtener los views completos de esa wave

    9.3 Para cada provincia ¿Cuál es el número promedio de días restantes para cada producto?
    
  **avg_days_remaining_byProduct_Provinces**
  
  Para los hospitales de cada provincia, toma el promedio de los días restantes de cada producto. Es la tabla 9.2 pero agrupada por provincia y promediada. 
  
  
  <img width="580" alt="Screen Shot 2021-05-26 at 6 07 52 PM" src="https://user-images.githubusercontent.com/47492091/119742393-54d5f780-be4d-11eb-926f-4815ac8ba761.png">

  **NOTA**: Depende del view **most_recent_complete_update_by_hospital** para obtener los views completos de esa wave


     9.4 A nivel país, ¿En promedio, para cada producto cuántos días de recursos sobran?
     
   **avg_daysRemaining_byProduct_country**
   
   <img width="467" alt="Screen Shot 2021-05-26 at 6 10 23 PM" src="https://user-images.githubusercontent.com/47492091/119742546-aa120900-be4d-11eb-80dc-2b539c30531e.png">
   
   **NOTA**: Depende del view **most_recent_complete_update_by_hospital** para obtener los views completos de esa wave
   
   
   
10. En el último wave, ¿Qué tan completos eran los protocolos de los hospitales?


**Protocol_pct_byHospital_lastWave**


Un hospital puede implementar varios protocolos contra el COVID. Actualmente, la encuesta de Voxmapp recoge un protocolo de 4 partes. Así, podemos considerar que un hospital cumple con un % de esas partes; un hospital que cumple el 100% implementa los 4 protocolos. 


<img width="555" alt="Screen Shot 2021-05-26 at 6 14 51 PM" src="https://user-images.githubusercontent.com/47492091/119742849-4b00c400-be4e-11eb-83bb-2d7efcf23129.png">

   **NOTA**: Depende del view **most_recent_complete_update_by_hospital** para obtener los views completos de esa wave


11. En el último wave, ¿Qué tan completo era el protocolo promedio de cada provincia?

**Avg_protocol_pct_byProvince**


Misma idea de la vista A10, pero promediado por provincia.

<img width="289" alt="Screen Shot 2021-05-26 at 6 16 22 PM" src="https://user-images.githubusercontent.com/47492091/119742979-869b8e00-be4e-11eb-8fb3-057abd5fc5dd.png">

   **NOTA**: Depende del view **most_recent_complete_update_by_hospital** para obtener los views completos de esa wave



## Views de utilidad:
1. ¿Qué hospitales están en riesgo de quedarse sin contactos?

![Captura_menores_tel](https://user-images.githubusercontent.com/70484786/119583629-9eaad900-bd8c-11eb-8034-d53fcd178970.PNG)
- Regresa el nombre, id y número de teléfonos de hospitales que tienen 1 o menos teléfonos. No depende de ninguna otra vista. 

2. ¿Qué hospitales tenemos registrados y cuántos teléfonos de contacto tienen cada uno (divididos en activos y no activos)?

![tel_hosp](https://user-images.githubusercontent.com/70484786/119703917-aca83a80-be1c-11eb-8fa5-4b1c544ae233.PNG)
- Regresa el nombre, id y número de teléfonos activos e inactivos por hospital. No depende de ninguna otra vista. 
3. ¿Cuántos updates ha realizado cada empleado del call center en el último mes?

![captura_last_month](https://user-images.githubusercontent.com/70484786/119583709-c8fc9680-bd8c-11eb-9c43-4a66f45246a9.PNG)
- Regresa el número de updates realizadas por un empleado en el último mes. No depende de ninguna otra vista.

