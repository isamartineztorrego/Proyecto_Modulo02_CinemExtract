import pandas as pd
import os

def listarPeliculas(peliculas):   #Función que hace un listado de todas las peliculas.
    
    print("Peliculas: ")
            
    columnas = ['Tipo pelicula', 'Titulo pelicula','año de estreno','mes de estreno','id pelicula','genero pelicula']
    df = pd.DataFrame(peliculas, columns=columnas)
    print(df)
      
       

    print(" ")   
            

def pedirDatosPelicula (): #Función que pide los datos de la película al usuario.
   
    print("Introduzca los siguientes datos de la película")
    
    tipo_pelicula=input("Tipo de película (Movie,Short):  ")
    titulo_pelicula=input("Iítulo de la pelicula:  ")
    anno_estreno=input("Año de estreno (AAAA): ")
    mes_estreno=input("Mes de estreno (MM): ")
    id_pelicula=input("Id de la película (ttXXXXXXX): ")
    genero_pelicula=input("Género al que pertence la película (Drama,Comedy,Action):  ")
 
    
    pelicula = (tipo_pelicula, titulo_pelicula,anno_estreno,mes_estreno,id_pelicula,genero_pelicula)
    
    os.system("clear")
    
    return pelicula


def pedirDatosPeliModificar(peliculas):  #Pide al usuario el codigo de la pelicula a modificar.
    listarPeliculas(peliculas)  

    codigoPeliEditar = input("Por favor, introduzca el id_pelicula de la pelicula a modificar (ttxxxxxxx): ")
    
    for peli in peliculas:
        if peli[4] == codigoPeliEditar:
            print("Introduzca los siguientes datos de la película")
            tipo_pelicula = input("Tipo de película (Movie,Short): ")
            titulo_pelicula = input("Título de la película: ")
            anno_estreno = input("Año de estreno (AAAA): ")
            mes_estreno = input("Mes de estreno (MM): ")
            genero_pelicula = input("Género al que pertenece la película (Drama,Comedy,Action): ")
            pelicula = (tipo_pelicula, titulo_pelicula, anno_estreno, mes_estreno, codigoPeliEditar, genero_pelicula)
            
            os.system("clear")
            
            return pelicula

    print("La película con el id_pelicula {} no fue encontrada.".format(codigoPeliEditar))
    
    return ""

    

def pedirDatosPeliEliminar(peliculas):   #Pide al usuario el código de la pelicula a eliminar.
    
    listarPeliculas(peliculas)
    
    existePeli=False

    codigoPeliEliminar = input ("Por favor, introduzca el codigo de la pelicula a eliminar (ttxxxxxxx):   ")
    
    for peli in peliculas:
        if peli[4] == codigoPeliEliminar:
            existePeli=True
            break
    if not existePeli:
        codigoPeliEliminar =""
    
    os.system("clear")
    return codigoPeliEliminar        
    