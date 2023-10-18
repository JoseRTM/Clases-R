data <- read.csv("https://raw.githubusercontent.com/JoseRTM/Clases/main/bbdd_prueba1.csv", header = TRUE, sep = ";")
View(data)
str(data) # las notas son character, debemos transformar
# Para transformar, debemos sustituir las comas por puntos
# para eso necesitamos la libreria stringr
library(stringr)
library(dplyr)
data <-  data %>%
  mutate(nota1 = as.numeric(str_replace_all(nota1, ",", ".")),
         nota2 = as.numeric(str_replace_all(nota2, ",", ".")),
         nota3 = as.numeric(str_replace_all(nota3, ",", ".")),
         nota4 = as.numeric(str_replace_all(nota4, ",", ".")),
         examen = as.numeric(str_replace_all(examen, ",", ".")))
data <- data %>%
  mutate(nota_final = rowMeans(data[,4:7])*0.4+examen*0.6)

# Analisis descriptivo
data %>%
  group_by(seccion) %>%
  summarise(media = mean(nota_final, na.rm = T))
library(ggplot2)
ggplot(data, aes(x= factor(seccion), y = nota_final))+
  geom_boxplot()

# ANOVA
?aov
anova <- aov(nota_final~factor(seccion),data=data)
summary(anova)

# comparaciones multiples
TukeyHSD(anova)

# modelo lineal
modelo <- lm(nota_final~asistencia, data = data)
summary(modelo)
confint(modelo)

# EJERCICIO: AJUSTAR UN MODELO LINEAL INCORPORANDO LA SECCION COMO FACTOR Y LA EDAD
# INTERPRETAR LOS BETA, EL R2 Y ANOVA.
# ¿QUÉ NOTA DEBERÍA TENER UNA PERSONA DE LA SECCION 3, DE 25 AÑOS Y CON UN PORCENTAJE DE ASISTENCIA DEL 80%


confint(modelo)