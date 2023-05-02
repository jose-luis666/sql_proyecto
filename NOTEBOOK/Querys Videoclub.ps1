-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema archivos_videoclub3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS archivos_videoclub3 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE archivos_videoclub3 ;

-- Table archivos_videoclub3.INVENTORY

CREATE TABLE IF NOT EXISTS INVENTORY (
inventory_id INT NOT NULL,
FILMS_title_id INT NULL DEFAULT NULL,
PRIMARY KEY (inventory_id),
FOREIGN KEY (FILMS_title_id)
REFERENCES FILMS (title_id)
ON DELETE CASCADE
ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- Table archivos_videoclub3.FILMS

CREATE TABLE IF NOT EXISTS FILMS (
title_id INT NOT NULL,
title VARCHAR(45) NULL DEFAULT NULL,
description_ VARCHAR(5000) NULL DEFAULT NULL,
length_ INT NULL DEFAULT NULL,
replacement_cost FLOAT NULL DEFAULT NULL,
actors VARCHAR(5000) NULL DEFAULT NULL,
PRIMARY KEY (title_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- Table archivos_videoclub3.RENTAL

CREATE TABLE IF NOT EXISTS RENTAL (
rental_id INT NOT NULL,
rental_date DATETIME NULL DEFAULT NULL,
inventory_id INT NULL DEFAULT NULL,
customer_id INT NULL DEFAULT NULL,
return_date DATETIME NULL DEFAULT NULL,
PRIMARY KEY (rental_id),
FOREIGN KEY (INVENTORY_inventory_id)
REFERENCES INVENTORY (inventory_id)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (customer_id)
REFERENCES CLIENTS (customer_id)
ON DELETE CASCADE
ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- Table archivos_videoclub3.CLIENTS

CREATE TABLE IF NOT EXISTS CLIENTS (
customer_id INT NOT NULL,
name_ VARCHAR(45) NULL DEFAULT NULL,
address VARCHAR(500) NULL DEFAULT NULL,
phone INT NULL,
PRIMARY KEY (customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_0900_ai_ci;


QUERY 1

Tres películas en las que aparezca la actriz Penélope Guiness:

SELECT title, actors FROM films
WHERE actors LIKE '%penelope guiness%' 
LIMIT 3;




QUERY 2

Cinco películas que duren más de dos horas:

SELECT title, length_
FROM films
WHERE length_ > '120'
LIMIT 5;


QUERY 3 

Tres películas que sean de tipo documental:

SELECT title, description_
FROM films
WHERE description_ LIKE '%Documentary%'
LIMIT 3;


QUERY 4 

Los ID de las cinco películas que más se repiten en el inventario (las más susceptibles de alquilarse):

SELECT FILMS_title_id, COUNT(*) as qty
FROM inventory
GROUP BY FILMS_title_id
ORDER BY qty DESC
LIMIT 5;


QUERY 5

Los títulos de esas 5 películas más comunes en el inventario:

SELECT title_id, title 
FROM films 
WHERE title_id IN (1, 86, 69, 73, 31);


QUERY 6 

Los diez títulos con el valor de reposición más caro (replacement cost):

SELECT title, replacement_cost
FROM films
ORDER BY replacement_cost DESC
LIMIT 10;


QUERY 7

Los títulos de diez películas que fueron alquiladas el día 30 de mayo de 2005:

SELECT title 
FROM rental 
INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id 
INNER JOIN films ON inventory.FILMS_title_id = films.title_id 
WHERE rental.rental_date LIKE '%2005-05-30%' 
LIMIT 10;


QUERY 8 

La dirección de Paco Pérez, el cliente que hemos colocado en nuestra tabla clientes para comprobar que funciona:

SELECT phone
FROM clients
WHERE customer_id = 1


QUERY 9

Las películas que más se han alquilado:

SELECT films.title, COUNT(rental.rental_id) as total_rentals 
FROM rental 
INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id 
INNER JOIN films ON inventory.FILMS_title_id = films.title_id 
GROUP BY films.title 
ORDER BY total_rentals DESC 
LIMIT 10;


QUERY 10

Los títulos de películas de los que no tengamos información sobre sus actores:

SELECT title 
FROM films 
WHERE actors = ''

