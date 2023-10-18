# GUIA DE EJERCICIOS DPLYR

###############
# EJERCICIO 1 #
###############

# cargar y/o instalar dplyr
# cargar  y/o instalar haven

# IMPORTAR DATOS
data <- readRDS(url("https://github.com/JoseRTM/Clases-R/raw/main/jovenes.rds"))

###############
# EJERCICIO 2 #
###############

# seleccionar y renombrar las variables a utilizar
# EDAD = edad
# SEXO = sexo
# P76_1 = alcohol
# P76_3 = marihuana
# P76_4 = cocaina
# P76_5 = pbc
# P91 = aborto

###############
# EJERCICIO 3 #
###############

# Generar la variable tramo_etario:
# tramo 1: menor a 18
# tramo 2: entre 18 y 22
# tramo 3: entre 23 y 26
# tramo 4: mayor a 26

###############
# EJERCICIO 4 #
###############

# limpiar las variables asignando NA, puede utilizar na_if

###############
# EJERCICIO 5 #
###############

# Asignar los labels a las categorías utilizando la funcion factor()

###############
# EJERCICIO 6 #
###############

# Desarrollar los ejercicios 2, 3, 4 y 5 en una misma linea de código, es decir,
# se deben hacer todas esas tareas solo en una asignacion (<-)

###############
# EJERCICIO 7 #
###############

# apoyandose en los datos, definir si las siguientes afirmaciones son verdaderas o falsas:

# 1) De las mujeres que han consumido pbc, la mayoría ha realizado un aborto.
# 2) Las personas que han consumido alcohol son en promedio mas jovenes que las que no han consumido.
# 3) La mayoría de las personas que se encuentran en el tramo de menores de 18 han consumido marihuana
# 4) La mayoría de los hombres entre 23 y 26 han consumido cocaína. 
# 5) La mayoría de las personas que ha consumido cocaína, también ha consumido alcohol.
