# TEST DE HIPOTESIS

# EJERCICIO:
# CARGAR Y/O INSTALAR LIBRERIAS: dplyr, readxl, ggplot2, epiDisplay

data <- read_excel("C:/Users/Jose/Downloads/bbdd_prueba1.xlsx")

################################
# PRUEBA Z PARA UNA PROPORCION #
################################

# En los 2000 al 30% le gustaba el centella, en una muestra de 50 personas,
# a 22 de ellas le gustaba el centella. ¿Es significativa esta diferencia?
prop.test(22,50,p=.3, alternative="greater")
# el test también nos proporciona el intervalo de confianza
# noten que va desde el .32 hasta 1
# eso es porque está calculando el intervalo a 1 cola.
prop.test(22,50,p=.3, alternative="two.sided")
# NO SERÁ EL MISMO RESULTADO QUE HICIMOS A MANO, PORQUE R USA LA CORRECCION DE WILSON
# CREAMOSLE AL R

################################
# PRUEBA Z PARA 2 PROPORCIONES #
################################

# EN UNA ENCUESTA A 200 ESTUDIANTES DE CPO, 88 DIJERON QUE PREFERIAN
# TENER CLASES EN LA MANANA Y NO EN LA TARDE.
# DE 200 DE AP, 80 DIJERON QUE PREFERIAN TENER CLASE EN LA MANANA
# ES MAS PROBABLE QUE LAS PERSONAS DE CPO PREFIERAN CLASES EN LA MANANA QUE LAS DE AP?
datos <- matrix(c(88,112,80,120), ncol = 2, byrow = TRUE)
rownames(datos) <- c("CPO","AP")
colnames(datos) <- c("Temprano","Tarde")
datos <- as.table(datos)
datos

prop.test(datos, alternative = "greater", correct = T) # dos colas
prop.test(datos, alternative = "less", correct = T) # cola inferior
prop.test(datos,alternative = "greater", correct = T) # cola superior

# PARA ENCONTRAR EL Z DEBEMOS SACAR LA RAIZ CUADRADA DE X-SQUARED
z <- sqrt(0.50287);z

# CHI-CUADRADO
#H0 DE ESTE TEST ES QUE DOS VARIABLES CATEGORICAS SON INDEPENDIENTES
# POR LO TANTO, H1 SERIA QUE AMBAS VARIABLES ESTAN RELACIONADAS

chisq.test(datos) # ES EQUIVALENTE A REALIZAR UN prop.test a dos colas

#############
# EJERCICIO #
#############

# UTILIZAR dplyr PARA:
# CREAR LA VARIABLE NOTA FINAL
# SE DEBE CALCULAR CON EL PROMEDIO DE LA NOTA 1 A LA 4
# ESO DEBE REPRESENTAR EL 60% DE LA NOTA
# EL EXAMEN VALE EL 40% DE LA NOTA FINAL
# CREAR LA VARIABLE "reprueba"
# DEBE SER 1 CUANDO LA PERSONA TIENE UN PROMEDIO DE NOTAS MENOR A 4
# Y 0 EN CASO CONTRARIO
# REALIZAR UN CHI-CUADRADO ENTRE LA VARIABLE REPROBADO Y SECCION
# INTERPRETAR

data <- data %>% 
  mutate(nota_final = rowMeans(data[,4:7])*0.6+examen*0.4,
         reprueba = ifelse(nota_final<4,1,0))

chisq.test(data$reprueba,data$nota_final)

#############################
# PRUEBA T PARA UNA MUESTRA #
#############################
# ESTE COMANDO ME DA UN INTERVALO DE CONFIANZA PARA LA MEDIA
t.test(data$edad, alternative = "two.sided")
# SIN ESPECIFICAR NADA, H0 ES QUE MU ES IGUAL A 0
# ES MUY OBVIO QUE EL P VALOR SERA MENOR A ALFA
# LA INFORMACION REAL ESTA EN EL INTERVALO
# ES UNA RUTA CORTA PARA CALCULARLO Y NO TENER QUE HACERLO A MANO
t.test(data$edad, mu =20, alternative = "greater")
# ESPECIFICANDO MU, PODEMOS SABER SI X BARRA ES SIGNIFICATIVAMENTE
# DISTINTO DE MU
# AQUI PODEMOS VER QUE EL INTERVALO NO PASA POR 20
# POR LO TANTO SABEMOS INMEDIATAMENTE QUE ES SIGNIFICATIVO

#############################################
# PRUEBA T PARA DOS MUESTRAS INDEPENDIENTES #
#############################################
# EXISTE UNA DIFERENCIA SIGNIFICATIVA ENTRE LA ASISTENCIA DE LA SECCION 1 Y 3?

#INSPECCION VISUAL Y ANALISIS DESCRIPTIVO
ggplot(data2, aes(x=factor(seccion), y = asistencia)) +
  geom_boxplot()

data2 %>%
  group_by(seccion) %>%
  summarise(media = mean(asistencia),
            varianza = sd(asistencia)^2)

var.test(data$asistencia~data$seccion)
# VARIANZAS NO SON IGUALES

t.test(data$asistencia~data$seccion, var.equal = FALSE)
# NOTA: PRIMERO VA LA VARIABLE CUANTITATIVA
# SEGUNDO VA LA VARIABLE NOMINAL DE DOS CATEGORIAS
# SI LAS VARIANZAS DE AMBOS GRUPOS SON IGUALES,
# SE DEBE ESPECIFICAR COMO TRUE var.equal

# EJERCICIO
# REALIZAR UNA INSPECCION VISUAL DE LAS DIFERENCIAS ENTRE 
# SECCION 1 Y 3 RESPECTO A LA NOTA FINAL
# REALIZAR ANALISIS DESCRIPTIVO, COMPARAR MEDIAS Y VARIANZAS
# REALIZAR UN TEST DE IGUALDAD DE VARIANZAS
# REALIZAR UN TEST DE COMPARACION DE MEDIAS.

