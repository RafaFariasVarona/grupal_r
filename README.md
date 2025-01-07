# Trabajo grupal R

La práctica se basará en los archivos de datos electorales que se indican a continuación, recopilando datos sobre las elecciones al Congreso de los Diputados en España desde 2008 hasta la actualidad, así como encuestas, códigos de municipios y abreviaturas

## Datos

- election_data: archivo con las elecciones al congreso
- cod_mun: archivo con los códigos y nombres de cada municipio
- abbrev: siglas de cada partido
- surveys: encuestas electorales desde 1982.

## Objetivos

El objetivo de la entrega es realizar un análisis de los datos electorales, llevando a cabo la depuración, los resúmenes y los gráficos que consideres necesarios, tanto de los resultados como de la precisión de las encuestas electorales.

En concreto, debes trabajar únicamente en el período de tiempo que incluye las elecciones desde 2008 hasta las últimas elecciones de 2019

## Algunos comentarios

Además de lo que consideres oportuno realizar, los siguientes elementos son obligatorios:

Cada grupo debe presentar antes del 7 de enero (23:59) un análisis de los datos en formato .qmd y .html, en modo Quarto slides, que serán los que presentarán el día de la exposición.

Las Quarto slides deben subirse a Github (un miembro de cada grupo deberá proporcionar el enlace).

El número máximo de diapositivas será de 45. El tiempo máximo para cada grupo será de 22 minutos (+5-10 minutos para preguntas).

Durante la presentación, deberéis explicar (de manera resumida) el análisis realizado, asegurándoos de que cada miembro del equipo hable durante un tiempo similar y que cualquier miembro pueda responder preguntas sobre cualquiera de los pasos realizados. La nota no será la misma para todos los integrantes.

Se valorará no solo el contenido, sino también la presentación (estética).

El objetivo es demostrar que se ha adquirido el máximo conocimiento del curso

## Ítems obligatorios

Los datos deben ser convertidos a tidydata donde sea apropiado.

Debes incluir al menos un join entre tablas.

Los paquetes {glue}, {forcats} y {lubridate} deben ser utilizados en algún punto

Los siguientes elementos deben usarse al menos una vez: mutate, summarise, group_by (o su equivalente), case_when

Deberéis definir al menos una función (con más de 5 líneas de código)

Contamos con muchos partidos que se presentan a las elecciones. Solo nos interesarán los siguientes partidos (cuidado: algunos tienen o tenían federaciones - sucursales - con otros nombres):

- PARTIDO SOCIALISTA OBRERO ESPAÑOL
- PARTIDO POPULAR
- CIUDADANOS
- PARTIDO NACIONALISTA VASCO
- BLOQUE NACIONALISTA GALLEGO
- UNIDAS PODEMOS - IU (Unidas Podemos, Unidos Podemos, Podemos, IU, Podem, y Ezker Batua)
- ESQUERRA REPUBLICANA DE CATALUNYA
- EH - BILDU (ahora son una coalición de partidos formada por lo que antes era Sortu, Eusko Alkartasuna, Aralar, Alternatiba)
- VOX

Todo lo que no esté en alguno de los anteriores partidos debe ser correctamente reagrupado (y resumido) en OTROS

Las siglas deben ser usadas en las visualizaciones (ideas en https://r-graph-gallery.com/).

Debes usar todos los archivos en algún momento.

Debes descartar las encuestas que:

-   se refieran a elecciones anteriores a 2008
-   sean a pie de urna
-   tamaño muestral desconocido o inferior a 500.
-   tenga 1 día o menos de trabajo de campo.

## Preguntas

Deberás responder obligatoriamente a

- ¿Qué partido fue el ganador en los municipios con más de 100.000 habitantes (censo) en cada una de las elecciones?
- ¿Qué partido fue el segundo cuando el primero fue el PSOE? ¿Y cuando el primero fue el PP?
- ¿Cómo calibrar el error de las encuestas (recordemos que las encuestas son de intención de voto a nivel nacional)?
- ¿Cómo analizar la relación entre censo y voto? ¿Es cierto que determinados partidos ganan en las zonas rurales?

Preguntas extra:
- ¿Qué municipios replican el resultado de las encuestas?
- ¿Qué partidos ganan en los municipios con menos participación? ¿Y en los municipios con más participación?
