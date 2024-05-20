

CREATE SCHEMA CinemExtract;

USE CinemExtract;

-- Tupla que viene del CSV (Tipo,Nombre,Anno_estreno,Mes_estreno,Id_peli,Genero)
  
CREATE TABLE MoviesDataset (
tipo_pelicula VARCHAR (45),
titulo_pelicula VARCHAR (100),
anno_estreno INT,
mes_estreno VARCHAR (45),
id_pelicula VARCHAR (20),
genero_pelicula VARCHAR (45),
PRIMARY KEY (id_pelicula)
);

-- Tupla que viene del CSV (indice,Ceremonia,Mejor película,Mejor director,Mejor actor,Mejor actriz)

CREATE TABLE oscars (
id_ceremonia INT,
fecha_ceremonia INT,
mejor_pelicula VARCHAR (255),
mejor_director VARCHAR (100),
mejor_actor VARCHAR (100),
mejor_actriz VARCHAR (100),
PRIMARY KEY (id_ceremonia)
);

-- Tupla que viene del CSV (indice, nombre_actor,anno_nacimineto, conocido,que_hace,premios)
  
CREATE TABLE actores (
id_actor INT AUTO_INCREMENT,
nombre_actor VARCHAR (100),
anno_nacimiento INT,
conocido VARCHAR (1000),
que_hace VARCHAR (1000),
premios INT,
PRIMARY KEY (id_actor)
);

-- Tupla que viene del CSV (Id_peli,Punt_IMDB,Tomatometer,Direccion,Guionistas,Argumento,Duracion,Nombre)
  
CREATE TABLE detalles_peliculas (
id_detalle_peli INT AUTO_INCREMENT,
id_pelicula VARCHAR(20),
puntuacion_imdb VARCHAR (45),
puntuacion_rotten VARCHAR (45),
directores VARCHAR (255),
guionistas VARCHAR(255),
argumento VARCHAR (2000),
duracion VARCHAR (45),
nombre_pelicula VARCHAR (100),
PRIMARY KEY (id_detalle_peli),
FOREIGN KEY (id_pelicula) REFERENCES MoviesDataset (id_pelicula)
);

-- Tabla inermedia para una relación de muchos a muchos.
  
CREATE TABLE int_pelis_actores (
id_actor INT,
id_pelicula VARCHAR(20),
PRIMARY KEY (id_actor,id_pelicula),
FOREIGN KEY (id_actor) REFERENCES actores (id_actor),
FOREIGN KEY (id_pelicula) REFERENCES MoviesDataset (id_pelicula)  
);

-- Tabla para meter las consultas que queremos hacer

CREATE TABLE consultas (
Num_consulta INT AUTO_INCREMENT,
descripcion VARCHAR (500),
consulta VARCHAR (500),
PRIMARY KEY (Num_consulta)
);

INSERT INTO consultas (descripcion,consulta) 
VALUES ('¿Qué género es el mejor valorado en IMDB?',"SELECT genero_pelicula AS genero, ROUND(SUM(puntuacion_imdb)) AS puntuacion FROM MoviesDataset INNER JOIN detalles_peliculas ON MoviesDataset.id_pelicula = detalles_peliculas.id_pelicula GROUP BY genero_pelicula ORDER BY puntuacion DESC LIMIT 1"),
('¿Qué género es el mejor valorado en Tomatómetro?',"SELECT genero_pelicula AS genero, SUM(puntuacion_rotten) AS puntuacion FROM MoviesDataset INNER JOIN detalles_peliculas ON MoviesDataset.id_pelicula = detalles_peliculas.id_pelicula GROUP BY genero_pelicula ORDER BY puntuacion DESC LIMIT 1"),
('¿En qué año se estrenaron más películas?',"SELECT anno_estreno AS 'año estreno', COUNT(id_pelicula) AS 'total estrenos' FROM MoviesDataset WHERE tipo_pelicula = 'movie' GROUP BY anno_estreno ORDER BY COUNT(id_pelicula) DESC LIMIT 1"),
('¿En qué año se estrenaron más cortos?',"SELECT anno_estreno AS 'año estreno', COUNT(id_pelicula) AS 'total estrenos' FROM MoviesDataset WHERE tipo_pelicula = 'short' GROUP BY anno_estreno ORDER BY COUNT(id_pelicula) DESC LIMIT 1"),
('¿En qué año hubo más estrenos (pelis y cortos)?',"SELECT anno_estreno as año, COUNT(id_pelicula) AS total_pelis FROM MoviesDataset GROUP BY anno_estreno ORDER BY total_pelis DESC LIMIT 1")
('¿Cuál es el corto mejor valorado en IMDB?',"SELECT nombre_pelicula AS corto, SUM(puntuacion_imdb) AS puntuacion FROM detalles_peliculas WHERE id_pelicula IN (SELECT id_pelicula FROM MoviesDataset WHERE tipo_pelicula = 'short') GROUP BY corto ORDER BY puntuacion DESC LIMIT 1"),
<<<<<<< HEAD
('¿Cuál es la película mejor valorada en IMDB?',"SELECT nombre_pelicula AS pelicula, SUM(puntuacion_imdb) AS puntuacion FROM detalles_peliculas WHERE id_pelicula IN (SELECT id_pelicula FROM MoviesDataset WHERE tipo_pelicula = 'movie' GROUP BY corto ORDER BY puntuacion DESC LIMIT 1"),
('¿Quién es el actor más joven?',"SELECT nombre_actor, anno_nacimiento AS año FROM actores ORDER BY año DESC LIMIT 1"),
('¿Que actriz/actor ha ganado más premios?',"SELECT nombre_actor AS 'actriz/actor', SUM(premios) AS 'num premios' FROM actores GROUP BY nombre_actor ORDER BY SUM(premios) DESC LIMIT 1"),
=======
('¿Cuál es la película mejor valorada en IMDB?',"SELECT nombre_pelicula AS pelicula, SUM(puntuacion_imdb) AS puntuacion FROM detalles_peliculas WHERE id_pelicula IN (SELECT id_pelicula FROM MoviesDataset WHERE tipo_pelicula = 'movie') GROUP BY pelicula ORDER BY puntuacion DESC LIMIT 1"),
('¿Quién es el actor más joven?',"SELECT nombre_actor, anno_nacimiento AS año FROM actores ORDER BY año DESC LIMIT 1"),
('¿Qué actriz/actor ha ganado más premios?',"SELECT nombre_actor AS 'actriz/actor', SUM(premios) AS 'num premios' FROM actores GROUP BY nombre_actor ORDER BY SUM(premios) DESC LIMIT 1"),
>>>>>>> 6ca23073f59d4fcb8bcf898d7cc1becb2801f6fc
('¿Número de peliculas estrenadas por año?',"SELECT anno_estreno as año, COUNT(id_pelicula) AS 'total pelis' FROM MoviesDataset GROUP BY anno_estreno");
