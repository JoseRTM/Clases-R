# El primer paso es instalar la libreria 
install.packages("ggplot2")

# Ahora la librería está instalada, el siguiente paso es "llamar" a la libreria
library(ggplot2)
# Noten que el R no nos dice nada, pero si no nos da error, significa que salió todo bien.
# Otras librerias que necesitamos
library(readxl) # nos permite cargar datos en formato excel, o extension .xlsx
library(dplyr) # nuestro amigo dplyr nos permite usar pipes %>%
# Vamos a trabajar con datos de estudiantes
data <- read_excel("C:/Users/José antonio/Desktop/base_2022.xlsx")
# El comando str revisa la estructura de la base de datos, no dice qué tipos de variables contiene
str(data)
# ¿Las variables tienen la naturaleza que les corresponde?
# No hay ninguna variable numerica que reconocida como character o viceversa?

#############################
### GRAFICO DE DISPERSION ###
#############################
# VAMOS A EVALUAR DE FORMA VISUAL SI LA EDAD SE RELACIONA CON EL RENDIMIENTO EN LA NOTA 1
# COMO AMBAS VARIABLES SON CUANTITATIVAS CORRESPONDE HACER UN GRAFICO DE DISPERSION
ggplot(data, aes(x = edad, y = nota_1)) +
  geom_point()
# ¿QUE INFORMACION PROVEE ESTE GRAFICO?
# EXISTE ALGUNA RELACION ENTRE X E Y?

###############
# EJERCICIO 1 #
###############

# EVALUAR VISUALMENTE SI LA NOTA DE PRERREQUISITO SE RELACIONA CON LA NOTA 1


# Como pueden ver, existen tres elementos clave en la visualización con ggplot
# 1) Datos (Data): La base de datos que estamos utilizando
# 2) Ejes (Aesthetics): Establecer el eje X y el eje Y. 
# 3) Geometría(Geometries): El tipo de gráfico que queremos usar
# Tanto el punto 1 como el 2 van dentro del comando ggplot, sin embargo, el punto 3 va aparte
# usando un "+". En el ejemplo anterior, utilizamos como geometria los puntos, es decir,
# Le dijimos al R que hiciera un grafico de puntos. 

# Tambien, podemos colorear los puntos en funcion de otra variable
ggplot(data, aes(x=edad, y=nota_1, color= genero)) +
  geom_point() 

# O podemos jugar con el tamaño de los puntos
ggplot(data, aes(x=edad, y=nota_1, color = genero, size = tiempo_estudio)) +
  geom_point()

###############
# EJERCICIO 2 #
###############

# EVALUAR SI EL CONSUMO Y EL TIEMPO DE ESTUDIO INFLUYE EN LA RELACION ENTRE NOTA DE PRERREQUISITO Y NOTA 1





# PROBEMOS CON OTRA BASE DE DATOS
str(diamonds)
?diamonds
# DIAMONDS ES UNA BASE DE DATOS DE PRUEBA, QUE VIENE DENTRO DE R
# POR ESO NO ES NECESARIO CARGARLA

# VAMOS A HACER UN GRAFICO DE PUNTOS PARA VER SI EL PESO DEL DIAMANTE
# SE RELACIONA CON EL PRECIO
ggplot(diamonds, aes(carat, price)) +
  geom_point()
# INTERPRETEN EL GRAFICO
# ¿CREEN QUE EXISTE UNA RELACION POSITIVA?
# PARA GUIARNOS PODEMOS AGREGAR UNA LINEA RECTA
ggplot(diamonds, aes(carat, price)) +
  geom_point() + geom_smooth(method = "lm") 

# ES IMPORTANTE AGREGAR method = "lm"
# lm SIGNIFICA LINEAR MODEL O MODELO LINEAL
# NOS SIRVE PARA IDENTIFICAR SI EXISTE UNA RELACION LINEAL
# QUE DIRIAN EN ESTE CASO?

# SI NO QUEREMOS UNA LINEA RECTA, DEJAMOS geom_smooth() VACIO
ggplot(diamonds, aes(carat, price)) +
  geom_point() +
  geom_smooth() +
  geom_smooth(method = "lm", col = "red")

# AHORA PODEMOS IDENTIFICAR QUE LA LINEA NO ES COMPLETAMENTE RECTA
# ¿PODRIA EXISTIR OTRA VARIABLE QUE ESTE INVOLUCRADA EN EL PRECIO DEL DIAMANTE?
# QUIZAS NO SOLAMENTE SU PESO DEFINE EL PRECIO
# PROBEMOS COLOREANDO LOS PUNTOS
ggplot(diamonds, aes(carat, price, color = clarity)) +
  geom_point() +
  geom_smooth()
# LA CLARIDAD DEFINE LA CALIDAD DEL DIAMANTE, MIENTRAS MAS CLARO (IF) MEJOR, MIENTRAS
# MAS OPACO ES PEOR(I1)
# QUE PODEMOS INTERPRETAR DEL GRAFICO?

# SI ENCUENTRAN QUE NO SE VE LO SUFICIENTEMENTE CLARO, PODEMOS AGREGAR
# EL COMANDO ALPHA, QUE OSCILA ENTRE 0 Y 1 PARA HACER LOS PUNTITOS MAS TRANSPARENTES
ggplot(diamonds, aes(carat, price, color = clarity)) +
  geom_point(alpha = 0.4) +
  geom_smooth()

# ¿QUE PODEMOS DECIR DEL GRAFICO?


###############
# EJERCICIO 3 #
###############

# JUGAR CON DISTINTOS NIVELES DE ALPHA PARA VER LA OPACIDAD DE LOS PUNTOS
# INCLUIR UN ALPHA DE 0, ¿QUE OCURRE?
# INCLUIR UN ALPHA DE 1 Y 1.6, ¿QUE OCURRE?



# SE PUEDEN GUARDAR LOS GRAFICOS COMO OBJETOS Y DESPUES IR AGREGANDO COSAS (RECOMENDADO)
graf_precio <- ggplot(diamonds, aes(x = carat, y = price))
# ¿QUE LE FALTA A ESTE GRAFICO?

# AGREGAR GEOMETRIA Y EDITAR LA OPACIDAD DE LOS PUNTOS
graf_precio_tras <- graf_precio + geom_point(alpha = 0.2)

# VEAMOS EL GRAFICO
graf_precio_tras

# VAMOS A COLOREAR POR CLARIDAD
graf_precio_claridad <- graf_precio + geom_point(aes(color = clarity))

# VEAMOS
graf_precio_claridad

#####################
# GRAFICO DE BARRAS #
#####################

# LA GEOMETRIA DEL GRAFICO DE BARRAS ES geom_bar()
# ES MUY INTUITIVO

ggplot(data, aes(x = consume)) +
  geom_bar() 
# AQUI TENEMOS UN PROBLEMA, APARECE UNA COLUMNA DE NA
# NO QUIERO QUE APAREZCA
# USEMOS DPLYR 
data %>%
  filter(!is.na(consume)) %>%
  ggplot(., aes(x = consume)) +
  geom_bar()
  
# NOTEMOS QUE APARECE SOLO EL CONTEO
# QUE PASA SI QUIERO QUE APAREZCA EL PORCENTAJE
# HAY VARIAS MANERAS DE HACERLO

# FORMA 1
data %>%
  filter(!is.na(consume)) %>%
  count(consume) %>%
  mutate(perc = n/sum(n)) %>%
  ggplot(., aes(x = consume, y= perc*100)) +
  geom_bar(stat = "identity")

# FORMA 2
data %>%
  filter(!is.na(consume)) %>%
  ggplot(., aes(x = consume)) +  
  geom_bar(aes(y = ((..count..)/sum(..count..))*100))

# FORMA 3
data %>%
  filter(!is.na(consume)) %>%
  ggplot(., aes(consume)) + 
  geom_bar(aes(y = (..count..)/sum(..count..))) + 
  scale_y_continuous(labels=scales::percent) 

# PARA QUE EL GRAFICO SEA AUTOEXPLICATIVO
# DEBEMOS INCORPORAR NOMBRES A LOS EJES Y UN TITULO
# PODEMOS USAR EL COMANDO labs()
data %>%
  filter(!is.na(consume)) %>%
  ggplot(., aes(x = consume)) +  
  geom_bar(aes(y = ((..count..)/sum(..count..))*100)) +
  labs(title = "Gráfico de barras de consumo", y = "Porcentaje", x = "Consumo")

###############
# EJERCICIO 4 #
###############

# BUSCAR EN INTERNET COMO CAMBIAR EL COLOR DE LAS BARRAS
# BUSCAR EN INTERNET COMO CAMBIAR A BARRAS HORIZONTALES
# VISUALIZAR EL CONSUMO A TRAVES DE UN GRAFICO DE BARRAS HORIZONTALES
# EL COLOR DEBE SER LIGHTBLUE
# CAMBIAR EL EJE A PORCENTAJE UTILIZANDO ALGUNO DE LOS TRES METODOS VISTOS

####################
# BARRAS AGRUPADAS #
####################

ggplot(data, aes(x = tiempo_estudio, fill = consume)) +
  geom_bar()
  
# TAMBIEN PODEMOS DEJAR LAS BARRAS AL LADO UTILIZANDO position = "dodge"
ggplot(data, aes(x = tiempo_estudio, fill = consume)) +
  geom_bar(position = "dodge")
# Si las queremos más solapadas tambien se puede, deben usar width
ggplot(data, aes(x = tiempo_estudio, fill = consume)) +
  geom_bar(position = position_dodge(width = 0.2))

# TAMBIEN PODEMOS JUGAR CON LA OPACIDAD
ggplot(data, aes(x = tiempo_estudio, fill = consume)) +
  geom_bar(position = position_dodge(width = 0.2), alpha = 0.6)

############
# BOX PLOT #
############

# LA GEOMETRIA DEL BOXPLOT ES geom_boxplot()
# AL IGUAL QUE EL GRAFICO DE BARRAS, NO ES ESTRICTAMENTE NECESARIO
# INCLUIR UN EJE Y
ggplot(data, aes(nota_1)) +
  geom_boxplot() 
# ES UTIL PARA COMPARAR GRUPOS
ggplot(data, aes(x = consume, y= nota_prerrequisito)) +
  geom_boxplot()

###############
# EJERCICIO 5 #
###############

# COMPARAR LOS BOXPLOT DE NOTA 1 ENTRE CONSUMIDORES Y NO CONSUMIDORES
# SACAR LOS NA
# AGREGAR TITULO Y NOMBRES A LOS EJES




# A VECES SE VE BIEN AGREGAR PUNTOS INDIVIDUALES A LOS BOXPLOT
# ESTO SE PUEDE HACER CON geom_jitter()
ggplot(data, aes(x = consume, y= nota_prerrequisito)) +
  geom_boxplot() +
  geom_jitter()

##############
# HISTOGRAMA #
##############

# Los histogramas también necesitan solamente una variable
# NOS SIRVE PARA CONOCER LA DISTRIBUCION DE VARIABLES CUANTITATIVAS
ggplot(data, aes(edad)) +
  geom_histogram()
# NO SE VE MUY BIEN QUE LAS BARRAS ESTEN SEPARADAS
# PODEMOS AGRANDAR EL TAMAÑO DE LAS BARRAS USANDO binwidth()
ggplot(data, aes(edad)) +
  geom_histogram(binwidth = 1)
###############
# EJERCICIO 6 #
###############

# HACER UN HISTOGRAMA DE LA VARIABLE NOTA 1
# ES SIMETRICA?
# SE PARECE A UNA CAMPANA?


#####################
# GRAFICO DE LINEA  #
#####################

# LA GEOMETRIA ES geom_line()
# USAREMOS UNA BASE DE DATOS DE INDICADORES DEMOGRAFICOS Y ECONOMICOS
str(economics)
?economics

# ¿Cómo ha aumentado la población?
ggplot(data=economics, aes(x=date, y=pop))+
  geom_line()

# Podemos ver el desempleo
ggplot(economics, aes(date, unemploy)) + 
  geom_line(color = "midnightblue")

# Es importante agregar nombres
ggplot(economics, aes(date, unemploy)) + 
  geom_line(colour = "midnightblue") + 
  labs(title="N° de desempleados por año", x="Años", y="Personas desempleadas")
