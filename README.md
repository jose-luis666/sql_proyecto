## W3 Project - Building mySQL Data-base ##



**Descripción del proyecto:**


En este proyecto se nos ha encargado el proceso de limpieza y adaptación de siete archivos .csv de un videoclub, para exportarlos a una base de datos en MySQL y así crear una estructura más eficiente.

Inicialmente, contamos con las siguientes tablas: FILM, ACTORS, CATEGORY, INVENTORY, LANGUAGE y OLD_HDD y RENTAL.

El propósito de este proyecto es entregar al cliente una base de datos coherente y sencilla de manejar, en la que las distintas tablas estén organizadas según las áreas de actividad del negocio. De esta manera, el personal a cargo tendrá la capacidad de registrar todos los datos de forma ordenada en una única tabla, dependiendo de la tarea que estén realizando.




**Exploración de los datos:**


Inicialmente, llevamos a cabo un análisis de los siete archivos CSV con la finalidad de garantizar la limpieza y coherencia de las columnas, así como de detectar posibles inconsistencias. A lo largo de este proceso.

Una vez tuvimos los datos limpios, sin duplicados, nulos, o valores inconsistentes o irrelevantes, pudimos observarlos con mayor claridad.

Por otro lado, nos deshicimos de columnas y tablas que no nos aportarían información valiosa de cara a nuestro negocio. A continuación detallamos algunos de los cambios que hicimos:

Prescindimos de las tablas Language y Category ya que consideramos que no utilizaríamos su información para el desarrollo del negocio.

Extrajimos la información de actores de la tabla OLD_HDD para incorporarla a FILMS. De esa manera, agrupamos los datos de las películas y sus respectivos actores y actrices en una sola tabla, permitiéndonos deshacernos de OLD_HDD.

Conservamos INVENTORY y RENTAL ya que contenían información clave tanto para relacionar tablas como para entender ciertas incoherencias que observamos.

Creamos una nueva tabla llamada CLIENTS que almacenaría datos correspondientes a los clientes que alquilarán películas en el futuro.

A continuación el diagrama de nuestras tablas en SQL :


<img src="/Users/joseluisreguera/Desktop/IRONHACK/sql_proyecto/IMG.jpg">



