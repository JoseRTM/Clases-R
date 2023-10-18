# Dos elementos fundamentales para utilizar R son: librerias e importacion de datos
# Como R es un software de codigo abierto, personas de todo el mundo
# se dedican a crear funciones que nos faciliten el trabajo
# R puede instalar cualquier libreria utilizando el comando install.packages()

# Antes de eso, vamos a entender el comando setwd()
# OJO, ESTE PASO NO ES NECESARIO CUANDO USAMOS RSTUDIO CLOUD
# Para guardar nuestro trabajo en una carpeta especifica, debemos declarar cual
# sera la carpeta o working directory
# Podemos chequear esto usando el comando getwd()

getwd() # Podemos ver el working directory
setwd("C:/Users/Jose/Desktop/Clases/Ejercicios R/Datos") # Podemos declarar un nuevo working directory
getwd()


# Librerias en R
# Para instalar una libreria, debemos usar el comando install.packages()
# Es importante que el nombre del paquete este entre paréntesis
# Primero usaremos un paquete llamado readxl, tiene como principal funcion 
# importar datos provenientes de archivos excel, recuerden que la extension 
# de un archivo excel es por lo general .xlsx
install.packages(readxl) # esto nos da error porque no esta con comillas
install.packages("readxl") # esto si funciona
# R nos ayuda con las funciones y paquetes para entender como funcionan
??readxl
# aqui podemos buscar la funcion read_excel o mirar que otras funciones tiene la libreria
# Para cargar datos provenientes de excel tenemos que usar la funcion read_excel de la libreria readxl
# si la base de datos se encuentra en nuestro directorio de trabajo, simplemente debemos decir el nombre
# exactamente como aparece, seguido de la extension del archivo (xlsx)
read_excel(bbdd_prueba1.xlsx) # nos da error could not find function "read_excel"
# esto significa que no hemos activado la libreria readxl, por eso no reconoce la funcion read_excel
# para activar una libreria podemos usar el comando library()
library(readxl) # library() puede usar el nombre de la libreria sin comillas, no asi install.packages()
read_excel(bbdd_prueba1.xlsx) # esto nos da error porque no usamos comillas
read_excel("bbdd_prueba1.xlsx") 
# Ahora si funciona, pero debemos guardar la data en el enviroment para poder trabajar con ella
datos_xlsx <- read_excel("bbdd_prueba1.xlsx") 
View(datos) # Primero miremos el data frame

# Hay muchas extensiones desde donde podemos importar datos
# Por ejemplo: dta,csv,sav,json,etc.
# Una libreria para importar datos provenientes de STATA o SPSS es haven
install.packages("haven") # instalar la libreria
library(haven) # activar la libreria
# Archivos .sav (SPSS)
datos_sav <- read_sav("bbdd_prueba1.sav")
# Archivos .dta (STATA)
datos_dta <- read_dta("bbdd_prueba1.dta")

# notemos que la base en dta tiene 4 observaciones mas
# exploremos

View(datos_dta)
# Hay cuatro filas vacias, debemos corregirlo
datos_dta <- datos_dta[1:70,]

# Vistazo rapido de lo que contiene el data frame
str(datos_dta)  # tibble 70 x 10 significa 70 filas y 10 columnas
# tambien nos da la clase de las variables
# ¿cuales son variables character?

# Para eliminar algo del environment tenemos que usar rm()
rm(datos_xlsx)
# se pueden listar los elementos en el environment
ls()
# si quiero eliminar todo, puedo usar
rm(list=ls())


