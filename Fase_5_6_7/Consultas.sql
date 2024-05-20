USE CinemExtract;

INSERT INTO actores 
VALUES (1,'Actor1','2011','conocido1','hace1','1'),
	(2,'Actor2','2012','conocido2','hace2','2'),
	(3,'Actor3','2013','conocido3','hace3','3')
;
    
INSERT INTO MoviesDataset
VALUES ('short','peli1','2011','1','1111','Action'),
		('movie','peli2','2012','1','2222','Comedy'),
        ('short','peli3','2013','1','3333','Drama');
        
INSERT INTO MoviesDataset
VALUES  ('short','peli4','2012','1','4444','Drama');   

INSERT INTO MoviesDataset
VALUES  ('short','peli4','2012','1','5555','Drama');   

   
     
INSERT INTO detalles_peliculas
VALUES (11,1111,101,111,'director1','guionista1','argumento1','121','peli1'),
		(12,2222,102,112,'director2','guionista2','argumento2','122','peli2'),
        (13,3333,103,113,'director3','guionista3','argumento3','123','peli3');
        
INSERT INTO detalles_peliculas
VALUES (14,4444,103,113,'director2','guionista2','argumento3','123','peli3');
        
INSERT INTO int_pelis_actores
VALUES  (1,1111),
		(2,2222),
		(3,3333);
        
INSERT INTO oscars
VALUES ('111','2011','mejor_peli_1','mejor_director_1','mejor_actor_1','mejor_actriz_1'),
	('222','2012','mejor_peli_2','mejor_director_2','mejor_actor_2','mejor_actriz_2'), 
    ('333','2013','mejor_peli_3','mejor_director_3','mejor_actor_3','mejor_actriz_3');

-- ------------        
-- CONSULTAS --
-- ------------
	
-- 1. ¿Que mujer ha ganado mas premios Óscar a major actriz?'
???????

-- Que actriz/actor ha ganado más premios
SELECT nombre_actor AS 'actriz/actor', SUM(premios) AS 'num premios'
FROM actores
GROUP BY nombre_actor
ORDER BY SUM(premios) DESC
LIMIT 1;

-- 2. ¿Qué género es el mejor valorado en IMDB?
SELECT genero_pelicula AS genero, SUM(puntuacion_imdb) AS puntuacion
FROM MoviesDataset
INNER JOIN detalles_peliculas ON MoviesDataset.id_pelicula = detalles_peliculas.id_pelicula
GROUP BY genero_pelicula
ORDER BY puntuacion DESC
LIMIT 1;

-- '3. ¿Qué género es el mejor valorado en Tomatometro?'
SELECT genero_pelicula AS genero, SUM(puntuacion_rotten) AS puntuacion
FROM MoviesDataset
INNER JOIN detalles_peliculas ON MoviesDataset.id_pelicula = detalles_peliculas.id_pelicula
GROUP BY genero_pelicula
ORDER BY puntuacion DESC
LIMIT 1;

-- '4. ¿En que año se estrenaron más películas?'
SELECT anno_estreno AS 'año estreno', COUNT(id_pelicula) AS 'total estrenos'
FROM MoviesDataset
WHERE tipo_pelicula = 'movie'
GROUP BY anno_estreno
ORDER BY COUNT(id_pelicula) DESC
LIMIT 1;

-- '5. ¿En que año se estrenaron mas cortos?'
SELECT anno_estreno AS 'año estreno', COUNT(id_pelicula) AS 'total estrenos'
FROM MoviesDataset
WHERE tipo_pelicula = 'short'
GROUP BY anno_estreno
ORDER BY COUNT(id_pelicula) DESC
LIMIT 1;

-- 6. ¿Cuál es el corto mejor valorado en IMDB?
SELECT nombre_pelicula AS corto, SUM(puntuacion_imdb) AS puntuacion
FROM detalles_peliculas
WHERE id_pelicula IN (
					SELECT id_pelicula
                    FROM MoviesDataset
                    WHERE tipo_pelicula = 'short'
                    )
GROUP BY corto
ORDER BY puntuacion DESC
LIMIT 1;

-- 7. ¿Cuál es la película mejor valorada en IMDB?
SELECT nombre_pelicula AS corto, SUM(puntuacion_imdb) AS puntuacion
FROM detalles_peliculas
WHERE id_pelicula IN (
					SELECT id_pelicula
                    FROM MoviesDataset
                    WHERE tipo_pelicula = 'movie'
                    )
GROUP BY corto
ORDER BY puntuacion DESC
LIMIT 1;

-- 8. ¿Qué palabra es la más utilizada en los títulos?
????????


-- 9. ¿Qué director ha dirigido más peliculas?
??????

-- 10. ¿Qué actor ha actuado en más peliculas?
??????


-- 11. ¿Quién es el actor más joven?
SELECT nombre_actor, anno_nacimiento AS año
FROM actores
ORDER BY año DESC
LIMIT 1;

-- 12. ¿Número de peliculas estrenadas por año?
SELECT anno_estreno as año, COUNT(id_pelicula) AS 'total pelis'
FROM MoviesDataset
GROUP BY anno_estreno;

