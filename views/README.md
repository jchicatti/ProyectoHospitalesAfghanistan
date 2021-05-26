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




## Views de utilidad:
1. ¿Qué hospitales están en riesgo de quedarse sin contactos?

![Captura_menores_tel](https://user-images.githubusercontent.com/70484786/119583629-9eaad900-bd8c-11eb-8034-d53fcd178970.PNG)

2. ¿Qué hospitales tenemos registrados y cuántos teléfonos de contacto tienen cada uno (divididos en activos y no activos)?

![tel_hosp](https://user-images.githubusercontent.com/70484786/119703917-aca83a80-be1c-11eb-8fa5-4b1c544ae233.PNG)

3. ¿Cuántos updates ha realizado cada empleado del call center en el último mes?

![captura_last_month](https://user-images.githubusercontent.com/70484786/119583709-c8fc9680-bd8c-11eb-9c43-4a66f45246a9.PNG)

