# Correlaciones
data <- read.csv("https://raw.githubusercontent.com/JoseRTM/Clases/main/bbdd_prueba1.csv", header = TRUE, sep = ";")
View(data)
str(data) # las notas son character, debemos transformar
# Para transformar, debemos sustituir las comas por puntos
# para eso necesitamos la libreria stringr
library(stringr)
data <-  data %>%
  mutate(nota1 = as.numeric(str_replace_all(nota1, ",", ".")),
         nota2 = as.numeric(str_replace_all(nota2, ",", ".")),
         nota3 = as.numeric(str_replace_all(nota3, ",", ".")),
         nota4 = as.numeric(str_replace_all(nota4, ",", ".")),
         examen = as.numeric(str_replace_all(examen, ",", ".")))
data <- data %>%
         mutate(nota_final = rowMeans(data[,4:7])*0.4+examen*0.6)

# Inspeccion visual
library(ggplot2)
ggplot(data, aes(x = asistencia, y = nota_final)) +
  geom_point()+
  geom_smooth(method = "lm")

cor.test(data$asistencia,data$nota_final, use = "complete.obs")

# matriz de correlacion
install.packages("psych")
library(psych)
corPlot(data[,4:8])

# modelo lineal
modelo <- lm(nota_final~asistencia+sexo+factor(seccion), data = data)
summary(modelo)
confint(modelo)
