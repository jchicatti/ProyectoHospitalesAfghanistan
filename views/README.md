# Documentación de las vistas

## Views de monitoreo: 

- ¿Cuál es el update más reciente por hospital?

  **most_recent_update_by_hospital**
  
  Regresa, para cada hospital, la entrada del update más reciente que exista.
  
  Depende de la tabla **update_hospital**.
  
- ¿Cuál es el update _completo_ más reciente por hospital?

  **most_recent_complete_update_by_hospital**
  
  Regresa, para cada hospital, la entrada del update completo más reciente que exista. De no existir ni un solo update completo, no regresa nada.
  
  Depende de la tabla **update_hospital**.
  
## Views de análisis: 




## Views de utilidad:
- ¿Qué hospitales están en riesgo de quedarse sin contactos?

![Captura_menores_tel](https://user-images.githubusercontent.com/70484786/119583629-9eaad900-bd8c-11eb-8034-d53fcd178970.PNG)

- ¿Qué hospitales tenemos registrados y cuántos teléfonos de contacto tienen cada uno (divididos en activos y no activos)?

![Captura_telefonoos_hospital](https://user-images.githubusercontent.com/70484786/119583688-bf732e80-bd8c-11eb-8eba-46aa8472ef7e.PNG)

- ¿Cuántos updates ha realizado cada empleado del call center en el último mes?

![captura_last_month](https://user-images.githubusercontent.com/70484786/119583709-c8fc9680-bd8c-11eb-9c43-4a66f45246a9.PNG)

