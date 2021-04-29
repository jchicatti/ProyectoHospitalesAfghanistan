# Proyecto VoxMapp Dream Team
## Problem domain
![VoxMapp](https://imgur.com/gG68PvJ.png)

La compañía [VoxMapp](http://voxmapp.com) diseña y crea soluciones tecnológicas para la recolección y análisis de datos. Dentro de sus múltiples proyectos, recaban datos de hospitales en varios países para ofrecer información puntual y pertinente respecto al manejo del COVID-19.

La compañía tiene un _baseline_ de hospitales con datos estáticos (como el nombre del hospital, la ubicación geográfica, y el tipo de hospital).
Una vez al mes, la compañía realiza un _update_ de los datos de los hospitales a través de una encuesta telefónica. El _update_ es realizado por un empleado que entrevista a un doctor del hospital cuyos datos se pretenden actualizar. Los datos tanto del entrevistador como del doctor se registran en el _update_.

El _update_ consiste en una serie de preguntas sobre el hospital en el que trabaja el doctor; es una "fotografía" del hospital en ese momento. La recabación de datos comprende el inventario del hospital, su protocolo COVID-19, el personal disponible, y el estado de los casos.
- Respecto al inventario, se le pregunta al hospital sobre la existencia de ciertos productos: se registra el número de días antes de que se agote el suministro de cada insumo para el tratamiento de COVID-19.
- Respecto a los protocolos, se pregunta sobre la implementación de campañas preventivas, procesos de reporte, y su capacidad de realizar pruebas para la detección del COVID-19.
- Respecto al personal, se pregunta la cantidad de médicos y paramédicos disponibles.
- Respecto a los casos, se pregunta la cantidad de positivos, muertes, recuperados, etc.
Junto con cada update, los encuestadores indican si el cuestionario se llenó correcta y cabalmente, y en consecuencia, el tipo de acción a seguir. Estos marcadores se utilizan para generar un reporte para que los encuestadores tomen la acción necesaria.

Se realiza un reporte diario sobre estos _status_ (el número de hospitales encuestados, las preguntas no contestadas, etc.) para poder resolver el problema presentado.

Con los _updates_ completos, se realiza una serie de tablas que alimentan a Tableau Public, con el cual se hacen tableros analíticos que muestran información relevante y pertinente a las personas que toman decisiones en VoxMapp.

## User story

- Un hospital está conformado por sus datos estáticos, tales como su localización, nombre y tipo.
- Cada hospital tiene N contactos.
- - Cada contacto tiene 1 teléfono, nombre y posición.
- 1 Hospital tiene N updates.
- -Un update tiene un entrevistador y un entrevistado. A su vez, un entrevistador puede realizar varios updates y un entrevistado contestar varios updates. 
- Un update tiene un inventario, un protocolo, un registro de personal y un registro de casos. 
  - Un inventario tiene N productos con cierta existencia (número y duración para pruebas COVID-19 y ventiladores, y solo duración para reservas de oxígeno, antipiréticos, anestesia, relajantes musculares, soluciones alcohólicas mayores al 70%, jabón de manos, y materiales de protección para el personal). Estos mismos productos pueden pertenecer a N inventarios. 
  - Un protocolo está conformado por varios sub protocolos que se cumplen o no.
  - Un registro de personal está conformado por el número de doctores y paramédicos en ese momento. 
  - Un registro de casos de COVID-19 está conformado por varias categorías: los pacientes con síntomas, positivos, en cuidado intensivo, fallecidos (por COVID-19 y no COVID-19), recuperados de COVID-19, y referidos al Ministro de Salud Pública. 
- Un update tiene un status sobre su completitud, un status sobre los problemas que se presentaron y un status sobre la acción a tomar. Además, un update tiene un status sobre los fondos.


## Equipo
- Josué Chicatti ([**@jchicatti**](https://github.com/jchicatti))
- Sebastian Dulong ([**@dulongski**](https://github.com/dulongski))
- Guillermo Naranjo ([**@guillermoNaranjo**](https://github.com/guillermoNaranjo))
- Ana Pizaña ([**@anapizana**](https://github.com/anapizana))
- Ulises Quevedo ([**@JoseUlisesQuevedo**](https://github.com/JoseUlisesQuevedo))
- Julieta Rivero ([**@Ju-Riv**](https://github.com/Ju-Riv))

Profesor: Jesús Ramos ([**@xuxoramos**](https://github.com/xuxoramos))
