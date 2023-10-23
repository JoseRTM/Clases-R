library(dplyr)
library(ggplot2)
library(tidyr)
library(nortest)

data <- readr::read_csv("https://github.com/JoseRTM/Clases-R/raw/main/movie_profit.csv")


# DESCRIPTIVO
data %>% 
  group_by(mpaa_rating) %>% 
  summarise(media = mean(worldwide_gross))

# EJERCICIO
# Obtener el logaritmo base 10 del ingreso mundial
# guardar como log_gross

ggplot(data, aes( x = mpaa_rating, y = worldwide_gross, color = mpaa_rating)) +
  geom_boxplot()

# EJERCICIO
# graficar la variable log_gross, comparar resultados

# NORMALIDAD
data %>% 
  filter(!is.na(mpaa_rating)) %>% 
ggplot(., aes(x = worldwide_gross)) +
  geom_density() +
  facet_wrap(~mpaa_rating) +
  theme_classic()

## TRANSFORMADA
data %>% 
  filter(!is.na(mpaa_rating)) %>% 
  ggplot(., aes(x = log10(worldwide_gross))) +
  geom_density() +
  facet_wrap(~mpaa_rating) +
  theme_classic()

require(nortest)
by(data = data,INDICES = data$mpaa_rating,FUN = function(x){ lillie.test(x$worldwide_gross)})

#EJERCICIO
#REALIZAR TEST DE NORMALIDAD PARA LA VARIABLE log_gross
# HACER GRÁFICOS
# INTERPRETAR LOS RESULTADOS

#ANOVA
anova <- aov(worldwide_gross~mpaa_rating, data)
summary(anova)

hsd <- TukeyHSD(anova)
plot(hsd)

#EJERCICIO
#realizar ANOVA con la variable log_gross
#realizar ANOVA para evaluar las diferencias en el ingreso de las peliculas
# por genero.
# INTERPRETAR LOS RESULTADOS.


