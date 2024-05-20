
![BBDD (1)](https://github.com/fernandaMarti/Proyecto-da-promo-H-modulo-2-team1-cine_freaks/assets/99440874/e306731c-ed44-4e7b-8592-93a6639e89f1)


<img width="158" alt="Titulo1tablas" src="https://github.com/fernandaMarti/Proyecto-da-promo-H-modulo-2-team1-cine_freaks/assets/99440874/ce910868-b8d8-473b-9edb-6ecaf1b0331f"></br>
</br>

### MoviesDataset

 tipo_pelicula VARCHAR (45) </br>
 titulo_pelicula VARCHAR (100) </br>
 anno_estreno INT </br>
 mes_estreno VARCHAR (45) </br>
 id_pelicula VARCHAR (20) PK </br>
 genero_pelicula VARCHAR (45) </br>

### Oscars

  id_ceremonia INT PK </br>
  fecha_ceremonia INT </br>
  mejor_pelicula VARCHAR (255) </br>
  mejor_director VARCHAR (100) </br>
  mejor_actor VARCHAR (100) </br>
  mejor_actriz VARCHAR (100) </br>

### Actores

  id_actor INT PK </br>
  nombre_actor VARCHAR (100) </br>
  anno_nacimiento INT </br>
  conocido VARCHAR (45) </br>
  que_hace VARCHAR (45) </br>
  premios INT </br>

## Detalles Pelicula

  id_detalle_peli INT PK </br>
  id_pelicula VARCHAR(20) FK </br>
  puntuacion_imdb VARCHAR (45) </br>
  puntuacion_rotten VARCHAR (45) </br>
  directores VARCHAR (255) </br>
  guionistas VARCHAR(255) </br>
  argumento VARCHAR (2000) </br>
  duracion VARCHAR (45) </br>
  nombre_pelicula VARCHAR (100) </br>
  
## Tabla Intermedia Actores/peliculas

id_actor INT FK </br>
id_pelicula VARCHAR(20) FK </br>
id_actor,id_pelicula PK </br>


</br>
</br>
<img width="141" alt="tituloesquema" src="https://github.com/fernandaMarti/Proyecto-da-promo-H-modulo-2-team1-cine_freaks/assets/99440874/62805399-ecaf-4d19-a50f-7bbb4c8814b9">
</br>
</br>


<img width="472" alt="tablas_esquema" src="https://github.com/fernandaMarti/Proyecto-da-promo-H-modulo-2-team1-cine_freaks/assets/99440874/c7f9d47f-2e51-4209-8059-e222d3ccca5f">




