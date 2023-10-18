# Bienvenid@s a R, pueden escribir sus apuntes utilizando el "gato"(shift+3) 
# R es un software gratuito de codigo abierto
# Recomendaciones generales para el desarrollo del script
# No usar caracteres especiales como tildes o eñes.
# R es case sensitive, eso significa que es importante respetar las mayusculas y minusculas de las funciones
# R se puede usar como calculadora, probemos.

# Suma
5 + 5 

# Resta
5 - 5 

# Multiplicación
3 * 5

# División
(5 + 5) / 2 

# Exponencial
exp(5+5)

# Potencia
2^5 

# Logaritmo natural
log(10)

# Logaritmo base 10
log10(10)

########################
##### EJERCICIO 1 ######
########################

# Ahora ustedes deben calcular lo siguiente:
# 1) La diferencia entre 20 y 10, divido por 5.
# 2) La diferencia entre 5 y 2 elevado a 4.
# 3) El producto entre 9 y la exponencial de la diferencia entre 10 y 4.

# Los resultados se pueden almacenar en el Environment (Esquina superior derecha), tienen que usar una flecha "<-",
# De esta forma podemos crear objetos.

x <- 24

# El objeto x tiene solamente una observación, que es 24. Cuando la guardamos, 
# no nos da el resultado inmediatamente, tenemos que "llamar" al objeto.
x
# Es equivalente usar
print(x)

# Se pueden hacer operaciones matemáticas con los objetos guardados
manzanas <- 5

peras <- 6

frutas <- manzanas + peras

print(frutas)

#####################
#### EJERCICIO 2 ####
#####################

# 1.a) Crear un objeto llamado a, que sea igual a 100
# 1.b) Calcular el logartimo natural de a, guardarlo como log_a
# 2) Calcular la exponencial de log_a, no guardar el resultado

# En R existen diferentes tipos de variables: Numeric o numéricas, Character o 
# categóricas y Logical o lógicas
numerica <- 42

categorica <- "perro"

logica <- TRUE

# Podemos ver el tipo de variable utilizando el comando class
class(numerica)

###############
# EJERCICIO 3 #
###############
# Revisar la clase del objeto categorica y logica usando la funcion class()


# Hasta ahora, solo hemos trabajado con una sola "observacion". Para crear un vector, 
# debemos utilizar el comando c() que significa concatenar.
vector_numerico <- c(20,21,15,26)
vector_numerico
class(vector_numerico)

###############
# EJERCICIO 4 #
###############
# 1.a) Crear un vector llamado vector_categorico que sea de clase character
# este vector debe contener los elementos: perro,gato,canario,caballo
# 1.b) Inspeccionar la clase del vector_categorico



# 2.a) Crear un vector llamado vector_logico que sea de clase logical
# este vector debe contener los elementos: verdadero,falso,falso,verdadero
# 2.b) Inspeccionar la clase del vector_logico




# OPERACIONES CON VECTORES
vector_a <- c(1,2,3)
vector_b <- c(4,5,6)
vector_total <- vector_a + vector_b
vector_total

# Notemos que R suma el elemento 1 del vector 1 con el elemento 1 del vector 2
# y asi sucesivamente.


###################
### EJERCICIO 5 ###
###################
# Fueron al casino durante una semana (de lunes a viernes). Jugaron poker y ruleta. 
# A continuación se encuentra el balance por día del poker:
# Lunes: Ganaron 100
# Martes: Perdieron 200
# Miércoles: Ganaron 20
# Jueves: Perdieron 150
# Viernes: Ganaron 200

# Ahora el balance de la ruleta
# Lunes: Ganaron 40
# Martes: Perdieron 30
# Miércoles: Ganaron 100
# Jueves: Perdieron 140
# Viernes: Ganaron 60

# Construir dos vectores que reflejen el balance de cada juego, durante los 5 días.
# El primer vector debe llamarse poker, el segundo debe llamarse ruleta.








# NOMBRAR LOS VECTORES
# podemos utilizar la funcion names() para darle nombre a los elementos de un vector
print(vector_a)
names(vector_a) <- c("uno","dos","tres")
vector_a

print(vector_b)
names(vector_b)<- c("cuatro","cinco","seis")
vector_b

#################
## EJERCICIO 6 ##
#################
# crear un vector que se llame dias, debe contener los dias de la semana desde el lunes hasta el viernes
# nombrar los vectores poker y ruleta utilizando el vector dias







# Ejercicio 2: Calcular el balance total por día

#####################################
###### SOLUCIÓN EJERCICIO 2##########
#####################################

total_dia <- poker+ruleta
total_dia

# Si queremos sumar lo que hay dentro del vector, tenemos que utilizar el comando sum()
total_poker <- sum(poker)
total_ruleta <- sum(ruleta)
# Si quisieramos obtener el total semana, tendríamos que sumar el total del poker y el total de la ruleta
total_semanal <- total_poker+total_ruleta
total_semanal
# Parece que no estamos ganando ni perdiendo, 
# quizás tenemos mas habilidades para el poker 
# y si jugamos más podriamos tener un balance positivo.
# Para saber esto, podemos utilizar el mayor que ">" o menor que "<"
hipotesis <- total_poker>total_ruleta
class(hipotesis)

# Parece que nuestra hipótesis no era correcta. De todas formas, podemos seguir inspeccionando de otra manera,
# quizás nos va mejor los primeros dias de la semana. 
# Para seleccionar un elemento de un vector, debemos llamar al vector
# seguido de corchetes [], indicando el numero del elemento
poker_lunes <- poker[1]
ruleta_lunes <- ruleta[1]

# Usando esa estrategia, solamente podemos seleccionar un elemento, pero si quisieramos ver, por ejemplo,
# lunes y martes, debemos combinarlo con el concatenar c().
poker_lumar <- poker[c(1,2)]
poker_lumar

ruleta_lumar <- ruleta[c(1,2)]
ruleta_lumar

# Ejercicio 3: Hacer el balance de los días martes,miercoles y jueves. 
# Llamar a la variable total_midweek
# Responder las siguientes preguntas
# ¿Cuánto gané o perdí en total durante esos días? Llamar a la variable total_midweek
# ¿Gané más en poker o en la ruleta?

#####################################
###### SOLUCIÓN EJERCICIO 3##########
#####################################

poker_midweek <- sum(poker[c(2,3,4)])

ruleta_midweek <- sum(ruleta[c(2,3,4)])

total_midweek <- poker_midweek + ruleta_midweek

total_midweek

poker_midweek>ruleta_midweek

# Cuando son elementos colindantes, se puede utilizar : entre los dos elementos.
poker_midweek2 <- sum(poker[2:4])
# Esto significa, toma los elementos del vector desde el 2 hasta el 4. 
# Si el vector tiene nombres asignados, también podemos utilizarlos
poker_start <- poker[c("lunes","martes","miercoles")]

# Podemos calcular el promedio de un vector utilizando el comando mean()
mean(poker_start)

###################################
###### Comparaciones lógicas ######
###################################

# < menor que
# > mayor que
# <= menor o igual que
# >= mayor o igual que
# == igual a
# != distinto a

# Puedo hacer comparaciones lógicas con un vector, y como resultado me dará un vector lógico
# ¿Qué días obtuve ganancias?
poker_logico <- poker > 0
ruleta_logico <- ruleta > 0

# Puedo seleccionar elementos donde obtuve ganancias
poker_win <- poker[poker_logico]
ruleta_win <- ruleta[ruleta_logico]

######################
###### Matrices ######
######################

# Nosotros trabajaremos con matrices bidimensionales, que es una combinación de filas y columnas
# En R podemos crear matrices desde 0, utilizando el comando matrix.

# Para cualquier función, R les ayuda a utilizarlo. Pueden usar ? a la izquierda de la función o 
# apretar donde dice "Help", en la ventana inferior derecha. 
?matrix

# si byrow está activado, los datos se van a posicionar por fila
matrix(1:9, byrow = TRUE, nrow = 3)

# Si está desactivado, se van a posicionar por columna
matrix(1:9, byrow = FALSE, nrow = 3)

# Podemos tomar varios vectores y transformarlos en una matriz
# Si especificamos nrow = 5 y byrow = TRUE, tenemos 2 columnas y los valores hacia abajo.
casino1 <- matrix(c(poker,ruleta), byrow= FALSE, nrow=5)
# Si especificamos nrow = 2 y byrow = TRUE, tenemos 5 columnas y los valores hacia el lado.
casino2 <- matrix(c(poker,ruleta), byrow= TRUE, nrow=2)

# Para que se vea más ordenado, podemos nombrar las columnas y las filas
colnames(casino1)<- c("poker","ruleta")
rownames(casino1) <- c("lunes","martes","miercoles","jueves","viernes")
# ¿ Cómo se deberían llamar las columnas en casino2?
colnames(casino2) <- c("lunes","martes","miercoles","jueves","viernes")
rownames(casino2) <- c("poker","ruleta")

# Veamos como queda
print(casino1)
print(casino2)

# Todo esto se puede hacer dentro de la función matrix, utilizando el argumento dimnames (dimension names)
# Tener en cuenta que deben utilizar el comando list, para listar vectores de nombres.
juegos <- c("poker","ruleta")
dias <- c("lunes","martes","miercoles","jueves","viernes")

casino <- matrix(c(poker,ruleta), 
                  byrow= FALSE, 
                  nrow=5,
                  dimnames = list(dias,juegos))
# Para sumar los valores por día, puedo utilizar el comando rowSums: Recuerde que R es case sensitive y es una S MAYUSCULA.
total_dia <- rowSums(casino)
print(total_dia)

# Para ir completando la base, me gustaría agregar el vector que acabo de crear a la matriz casino.
# Para esto, debo utilizar el comando cbind() que significa column bind.
casino_total <- cbind(casino,total_dia)
casino_total

# Supongamos que ahora quiero agregar el sábado y el domingo. Para eso debo utilizar el comando rbind(),
# que significa row bind.
sabado <- c(100,70)
domingo <- c(-20,10)
fds <- matrix(c(sabado,domingo), byrow = TRUE, nrow = 2, 
              dimnames = list(c("sabado","domingo"),c("poker","ruleta")))

casino_fds <- rbind(casino, fds)

print(casino_fds)

# Ahora, si quisieramos calcular el total por columna, podemos utilizar el comando colSums(), que significa column sum
casino_fds_total <- colSums(casino_fds)

# Ejercicio 4. Encontrar el total de ambos juegos por los 7 dias a la semana. 
# Asignar el resultado a total_casino
# Pista 1: Deben crear una variable que sume poker y ruleta por dia, utilizando rowSums. Llamenla total_dia
# Pista 2: Deben sumar la variable nueva que crearon para aplicar colSums.


#########################################
############ SOLUCIÓN EJ 4 ##############
#########################################

# Primero calculamos el total por fila usando rowSums
total_dia <- rowSums(casino_fds)
# La agregamos a la matriz con cbind
casino_fds <- cbind(casino_fds,total_dia)
# Sumamos hacia abajo utilizando colSums
colSums(casino_fds)

# Otra forma de hacerlo
sum(total_dia)









