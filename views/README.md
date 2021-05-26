# Documentación de las vistas

## Views de monitoreo: 

- ¿Cuál es el update más reciente por hospital?

  **most_recent_update_by_hospital**
  
  Regresa, para cada hospital, la entrada del update más reciente que exista.
  
  Depende de la tabla **update_hospital**.
  
- ¿Cuál es el update _completo_ más reciente por hospital?

  **most_recent_complete_update_by_hospital**
  
  Regresa, para cada hospital, la entrada del update completo más reciente que exista. De no existir ni un solo update completo de cierto hospital, no regresa ninguna entrada para dicho hospital.
  
  Depende de la tabla **update_hospital**.
  
## Views de análisis: 

1. ¿Cuántas muertes y cuántos casos hay por provincia?
  
  **cases_and_deaths_by_province**
  
  Regresa, para cada provincia, el acumulado de muertes y casos.
  
  Depende de las tablas **covid_cases**, **hospital** y **province**, y de la view **most_recent_complete_update_by_hospital**.

2. ¿Qué hospitales realizan awareness campaigns?
  
  **hospitals_with_awareness_campaigns**
  
  Regresa los hospitales que realizan campañas de prevención COVID-19.
  
  Depende de la tabla **protocol** y de la view **most_recent_complete_update_by_hospital**.
 
3. ¿Cómo se correlacionan las campañas de prevención con los casos que hay por hospital?
  
  **hospitals_awareness_cases**
  
  Regresa, para cada hospital, los casos y si se realizan campañas de prevención COVID-19. (añadir histograma)
  
  Depende de las tablas **covid_cases**, **hospital** y **protocol**, y de la view **most_recent_complete_update_by_hospital**.

4. ¿Qué porcentaje de muertos, recuperados, y positivos hay por hospital?
  
  **patient_percentages**
  
  Regresa, para cada hospital, el porcentaje de muertos, recuperados, y positivos. Se considera que muertos + recuperados + positivos es el número total de pacientes.
  
  Depende de la tabla **covid_cases** y de la view **most_recent_complete_update_by_hospital**.

5. ¿Qué provincias no tienen la capacidad de hacer pruebas COVID-19?
  
  **provinces_wout_test_cap**
  
  Regresa las provincias con al menos un hospital sin capacidad de hacer pruebas COVID-19.
  
  Depende de las tablas **covid_cases**, **hospital**, **protocol** y **province** y de la view **most_recent_complete_update_by_hospital**.
  
6. ¿Qué distritos no tienen la capacidad de hacer pruebas COVID-19?
  
  **districts_wout_test_cap**
  
  Regresa los distritos con al menos un hospital sin capacidad de hacer pruebas COVID-19.
  
  Depende de las tablas **covid_cases**, **hospital**, **protocol** y **district** y de la view **most_recent_complete_update_by_hospital**.
  
7. Evolución de muertes / casos / recuperados. 


    7.1 Muertes mensuales por provicincia **monthly_deaths_by_province**
 
 Utiliza todos los updates completos y agrupa primero por provincia y luego por mes/año, con la suma de las muertes de los hospitales de esa provincia



## Views de utilidad:
1. ¿Qué hospitales están en riesgo de quedarse sin contactos?

![Captura_menores_tel](https://user-images.githubusercontent.com/70484786/119583629-9eaad900-bd8c-11eb-8034-d53fcd178970.PNG)

2. ¿Qué hospitales tenemos registrados y cuántos teléfonos de contacto tienen cada uno (divididos en activos y no activos)?

![tel_hosp](https://user-images.githubusercontent.com/70484786/119703917-aca83a80-be1c-11eb-8fa5-4b1c544ae233.PNG)

3. ¿Cuántos updates ha realizado cada empleado del call center en el último mes?

![captura_last_month](https://user-images.githubusercontent.com/70484786/119583709-c8fc9680-bd8c-11eb-9c43-4a66f45246a9.PNG)

