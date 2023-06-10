# Rúbrica para proyecto final de Fundamentos de las Ciencias de Información Geoespacial

En el presente documento se describen las características que debe cubrir el
proyecto final del curso.

## Planteamiento
Se requiere de un proyecto que englobe dos elementos principales, una base de
datos y una representación cartográfica derivada de algún elemento de la base de
datos.
Los datos deben representar información sobre un tema en concreto y parte de
ellos debe provenir de la base de datos. La base debe tener al menos dos tablas.

A partir de los datos se generará una representación cartográfica en la que se
apliquen al menos dos elementos de geo-procesamiento de los vistos en clase.

El procedimiento realizado debe describirse en un documento con la estructura de
un reporte de práctica.

## Ejemplo

Supongamos un análisis de temperatura en la Ciudad de México, a partir de las
estaciones meteorológicas de la Ciudad y su relación con parques en la Ciudad.
Se pretende mostrar en el mapa la temperatura promedio alrededor de cada
estación meteorológica para una fecha en concreto (06/06/23).

Los datos que tenemos son: 

1. Estaciones meteorológicas (id, ubicación (x, y), mediciones de temperatura promedio)
1. Mapa de la Ciudad de México dividido por delegaciones
1. Localización de parques en la ciudad (id, nombre, ubicación (x,y))

La base de datos de este caso se compone de dos tablas:

1. Estaciones meteorológicas (se debe agregar la geometría)
1. Localización de parques (se debe agregar la geometría)

Ambas tablas se mandan a llamar a QGIS y se despliegan los puntos que
representan cada elemento. 

Procesamiento geoespacial (se eligen dos de las opciones):

    a) Sobre las estaciones se generan polígonos de Voronoi, y cada uno es pintado del color elegido para la temperatura promedio de la zona (se usa una escala).
    
    b) Se hace un buffer alrededor de cada punto que representa un parque, y se cuentan las estaciones más cercanas.

    c) Se digitalizan los polígonos de los parques.

El resultado obtenido se muestra en un mapa bien diseñado. Se realiza el
documento en un reporte de práctica común (formato libre).

## Evaluación

| Elemento | Ponderación |
|----------|-------------|
|Base de datos (al menos dos tablas conectadas a QGIS) | 30% |
| Geoprocesamiento (al menos dos herramientas usadas) | 40% |
| Representación cartográfica | 10% |
| Documento | 20% |
|Total | 100% |
