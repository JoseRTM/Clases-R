#######################################
### MANIPULACION DE DATOS CON DPLYR ###
#######################################
install.packages("dplyr")
library(dplyr)

# DPLYR ES UNA LIBRERIA PARA LA MANIPULACION DE DATOS
# VERBOS QUE VEREMOS HOY:
# select()    # SELECCIONA VARIABLES O VECTORES DE NUESTRO INTER?S
# filter()    # FILTRA LOS DATOS A TRAV?S DE CONDICIONES
# arrange()   # ORDENA LOS DATOS DE FORMA ASCENDENTE O DESCENDENTE
# mutate()    # SIRVE PARA CREAR VARIABLES NUEVAS (SIMILAR A TRANSFORM)
# count()     # SIRVE PARA OBTENER EL N
# group_by()  # AGRUPA LOS DATOS EN TORNO A UNA VARIABLE NOMINAL
# summarize() # PROVEE ESTADISTICOS DE RESUMEN
# transmute() # COMBINACION ENTRE SELECT Y MUTATE
# rename()    # RENOMBRA UNA VARIABLE

###############
# EJERCICIO 1 #
###############

# IMPORTAR bbdd_prueba.xlsx
# UTILIZAR EL COMANDO str() PARA DAR UN VISTAZO A LA BASE


# DPLYR SE TRABAJA CON PIPES, QUE SIGNIFICA TUBERIA
# SE PUEDEN ANADIR DIVERSOS COMANDOS A LAS TUBERIAS
# ESTO ORDENA MUCHO NUESTRO SCRIPT
# LOS PIPES SE HACEN ASI --> %>% DONDE ANTES DEL PIPE, 
# SE DEBE SELECCIONAR LA BASE DE DATOS

################
# VERBO SELECT #
################

# SI QUEREMOS SELECCIONAR SOLO ALGUNAS VARIABLES PARA TRABAJAR DE FORMA MAS ORDENADA, 
# PODEMOS USAR SELECT. VAMOS A USAR SELECT PARA USAR SELECCIONAR LAS NOTAS.
notas <- data %>%
  select(nota1,nota2,nota3,nota4)
head(notas)

# TAMBIEN PODEMOS ELIMINAR COLUMNAS
notas <- data %>%
  select(-sexo,-asistencia,-edad,-id,-seccion,-examen)
head(notas)

###############
# EJERCICIO 2 #
###############

# SELECCIONAR LAS COLUMNAS SECCION Y EXAMEN
# GUARDAR LA BASE EN EL ENVIRONMENT CON EL NOMBRE QUE USTED ELIJA
# SACAR LAS COLUMNAS SEXO Y EDAD
# GUARDAR LA BASE EN EL ENVIRONMENT CON EL NOMBRE QUE USTED ELIJA


################
# VERBO FILTER #
################

# FILTER NOS SIRVE PARA SELECCIONAR OBSERVACIONES QUE CUMPLAN ALGUNA CONDICION
# SUPONGAMOS QUE A MI ME INTERESA OBSERVAR SOLAMENTE A LA GENTE DE LA SECCION 1

seccion1 <- data %>%
  filter(seccion == 1 | seccion == 2)
head(seccion1)

# O SOLO AQUELLAS PERSONAS MAYORES DE 20
mayor_a_20 <- data %>%
  filter(edad > 20)
head(mayor_a_20)

# O AMBAS
seccion1_20 <- data %>%
  filter(seccion == 1,
         edad > 20)
head(seccion1_20)

# TAMBIEN PUEDO USAR EL CONECTOR "O"-> | 

seccion1y2 <- data %>% 
  filter(seccion == 1 | seccion == 2)
# AQUI ESTAMOS SELECCIONANDO LA SECCION 1 O 2, ES DECIR, DEJAMOS FUERA A LA 3.

 # O EL CONECTOR "Y" -> &
seccion2y20 <- data %>% 
  filter(seccion == 2 & edad == 20)
# SELECCIONAMOS PERSONAS DE LA SECCION 2 Y QUE TENGAN 20 ANIOS.

# NO PUEDO USAR EL CONECTOR "Y" EN EVENTOS MUTUAMENTE EXCLUYENTES
seccion2y3 <- data %>% 
  filter(seccion == 2 & seccion == 3) # HAY 0 OBSERVACIONES, 
# NO EXISTEN PERSONAS QUE PERTENEZCAN A LAS DOS SECCIONES.

###############
# EJERCICIO 3 #
###############

# Filtrar las observaciones que tienen bajo el 75% de asistencia O QUE TENGAN UNA NOTA
# IGUAL A 5 O INFERIOR EN EL EXAMEN. 
# GUARDAR LA BASE CON UN NOMBRE A ELECCION

#################
# VERBO ARRANGE #
#################

# ESTE VERBO ORDENA LOS DATOS EN ORDEN ASCENDENTE
datos_arrange <- data %>%
  arrange(examen)
head(datos_arrange)

# TAMBIEN EN ORDEN DESCENDENTE
datos_arrange <- data %>%
  arrange(desc(examen), nota1)
head(datos_arrange)

###############
# EJERCICIO 4 #
###############

# ORDENAR DE FORMA DESCENDENTE LA ASISTENCIA
# GUARDAR CON NOMBRE A ELECCION


################
# VERBO MUTATE #
################

# MUTATE FUNCIONA DE LA MISMA MANERA QUE TRANSFORM
# CREA UNA NUEVA VARIABLE A PARTIR DE CALCULO DE OTRA

data2 <- data %>% # tambien se puede guardar la columna en el mismo data frame que he estado trabajando
  mutate(nota_presentacion = rowMeans(data[,4:7]))
head(data2)

# COMANDO IFELSE 
# IFELSE CREA UNA VARIABLE A PARTIR DE DOS CONDICIONES
# FUNCIONA DE LA SIGUIENTE MANERA:

azul = ifelse(data2$nota_presentacion>=4,1,0) 
# ESTO SIGNIFICA: SI LA NOTA DE TALLER 1 ES MAYOR O IGUAL A 4,
# ENTREGAME 1, DE LO CONTRARIO, 0. 
# ES EXCELENTE PARA COMBINARLO CON MUTATE

data2 <- data %>%
  mutate(nota_presentacion = rowMeans(data[,4:7]),
         azul = ifelse(nota_presentacion>=4,1,0))
head(data2)

###############
# EJERCICIO 5 #
###############
# CREAR LA VARIABLE NOTA_FINAL: ESTA COMPUESTA POR EL PROMEDIO DE LA NOTA 1,2,3 Y 4 (60%)
# Y DEL EXAMEN (40%)


###############
# VERBO COUNT #
###############

# NOS DA LA FRECUENCIA ABSOLUTA
# SI LA DEJAMOS VACIA, VA A ARROJAR EL TAMAÑO DE LA MUESTRA

data %>% # esto no es necesario guardarlo
  count()
# HAY 70 PERSONAS EN ESTE CURSO

# CUANDO INGRESAMOS UNA VARIABLE, NOS ENTREGA LA FRECUENCIA ABSOLUTA
# DE LAS CATEGORIAS DE ESA VARIABLE

data %>%
  count(seccion)
# GENERALMENTE, NOS INTERESA MIRAR EL PORCENTAJE
# PARA ESTO, DEBEMOS COMBINARLO CON MUTATE

data %>% 
  count(seccion) %>% 
  mutate(porcentaje = (n/sum(n))*100) 
# DIVIMOS LA FRECUENCIA ABSOLUTA EN EL TOTAL DE DATOS Y MULTIPLICAMOS POR 100

###############
# EJERCICIO 6 #
###############
# CONTAR LA VARIABLE SEXO, OBTENER EL PORCENTAJE E INTERPRETAR

###################
# VERBO SUMMARIZE #   
###################
# ESTE VERBO NOS PERMITE GENERAR ESTADISTICA DESCRIPTIVA EN FORMATO DE TABLAS
data %>%
  summarize(media = mean(examen),
            mediana = median(examen))
# PERO TENEMOS UN PROBLEMA, HAY VALORES PERDIDOS DENTRO DE LOS DATOS
# ESO SIGNIFICA QUE ALGUNAS PERSONAS NO RESPONDIERON LA ENCUESTA
# PARA ESO PODEMOS USAR NA.RM
data %>%
  summarize(media = mean(examen,na.rm = T),
            mediana = median(examen, na.rm = T))

# FUNCIONES DE RESUMEN QUE PODEMOS USAR EN SUMMARIZE
# HAY MUCHAS MAS QUE PODEMOS DESCUBRIR
# OTRA FORMA DE HACER ESTO ES FILTRAR POR VALORES QUE NO SEAN NA
# DADO QUE TENEMOS INFO DE QUE HAY NA EN EXAMEN
# PODEMOS AGREGAR UN FILTRO QUE NOS EVITARA PONER CONSTANTEMENTE na.rm=T
# EL COMANDO SE LLAMA is.na()
is.na(data$examen) # ESTO NOS DA UNA RESPUESTA LOGICA, DONDE TRUE ES QUE LA CASILLA ESTA VACIA
# PODEMOS HACER UN TABLE DE ESTO
table(is.na(data$examen)) # HAY 1 VALOR PERDIDO
# EN R, LO CONTRARIO A ALGO SE SIMBOLIZA COMO !
# PODEMOS PEDIRLE A R QUE NOS MUESTRE LO QUE NO ES MISSING
!is.na(data$examen) # AHORA LA RESPUESTA SE INVIERTE, ES FALSE CUANDO ES NA.
# CUANDO YO PONGO UNA RESPUESTA LOGICA EN UN filter(), SELECCIONA LOS VALORES QUE TENGAN TRUE

data %>% 
  filter(!is.na(examen)) %>% 
  summarise(media = mean(examen),
            mediana = median(examen))

# DE ESTA MANERA ELIMINO LAS OBSERVACIONES QUE TIENEN MISSING EN EXAMEN
# ESTAS SON ALGUNOS ESTADISTICOS QUE LE PUEDO SOLICITAR A summarise() o summarize()

# mean()    # ENTREGA LA MEDIA DE UN VECTOR(VARIABLE)
# median()  # ENTREGA LA MEDIANA 
# min()     # ENTREGA EL MINIMO
# max()     # ENTREGA EL MAXIMO
# sd()      # ENTREGA LA DESVIACION ESTANDAR
# n()       # ENTREGA LA FRECUENCIA ABSOLUTA

###############
# EJERCICIO 7 #
###############
# ENTREGAR TODOS LOS DESCRIPTIVOS PARA VARIABLES NUMERICAS( N, MEDIA, MEDIANA,
# DESVIACION ESTANDAR, MINIMO Y MAXIMO) DE LA VARIABLE nota_final

##################
# VERBO GROUP_BY #
##################
# GROUP_BY NOS SIRVE PARA AGRUPAR LOS DATOS EN TORNO A UNA VARIABLE
# POR EJEMPLO, SI QUISIERAMOS OBSERVAR LAS NOTAS POR SEXO
# DEBERIAMOS AGRUPAR POR SEXO, GROUP_BY GENERALMENTE SE COMBINA CON OTROS
# VERBOS PARA SACARLE EL MAYOR PROVECHO POSIBLE 

data %>%
  filter(!is.na(examen)) %>%
  group_by(sexo) %>%
  summarize(media = mean(examen),
            mediana = median(examen))
            
# PODEMOS COMBINAR TODOS LOS VERBOS QUE QUERAMOS
# ES IMPORTANTE NO OLVIDAR UNIR ESTOS VERBOS CON
# LOS PIPES %>%
# SI NO AGREGAMOS LOS PIPES, R NOS DARA ERROR.

###############
# EJERCICIO 8 #
###############
# USAR EL PAQUETE DPLYR PARA CONTESTAR LA SIGUIENTE PREGUNTA
# ¿QUE SECCION TUVO MEJORES NOTAS EN BIOESTADISTICA? 




############################
# OTROS VERBOS ADICIONALES #
############################

################
# VERBO RENAME #   
################

# A VECES, PODRIAMOS QUERER CAMBIAR EL NOMBRE DE ALGUNA VARIABLE
# AHI PODEMOS USAR RENAME

data_rename <- data %>%
  rename(identificador = id ) # primero va el nombre nuevo y despues el nombre antiguo
head(data_rename)

# PERO ESTO TAMBIEN LO PODEMOS HACER DESDE SELECT
datos_rename <- data %>%
  select(edad, sexo, identificador = id)
datos_rename

###################
# VERBO TRANSMUTE #   
###################
# TRANSMUTE ES UNA COMBINACION ENTRE SELECT Y MUTATE
datos_transmute <- data %>%
  transmute(edad,nota1,sexo,azul = ifelse(examen>=4,1,0))
datos_transmute

# USANDO TRANSMUTE, EN ESTE CASO SELECCIONAMOS LAS VARIABLES
# EDAD, NOTA1, SEXO Y ADEMAS CREAMOS LA VARIABLE AZUL
# UTILIZANDO EL COMANDO IFELSE







