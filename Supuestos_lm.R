# librerias 
library(dplyr)
library(haven)
library(car)
library(texreg)
library(ggplot2)
library(skimr)
library(lmtest)
library(sandwich)
library(ggpubr)

# Importar data
data <- read_dta("C:/Users/José antonio/Desktop/Clases/Ejercicios R/Datos/welfare.dta")
skim(data) # descripcion rapida de la base de datos

# El objetivo de esta clase sera modelar el indice gini 
# relacion entre gini y gasto en educacion

# ANALISIS DESCRIPTIVO
ggplot(data, aes(x = educ_expend, y = gini_slc)) +
  geom_point() +
  geom_smooth(method = "lm")+
  labs(x= "Gasto en educacion(% del PIB)",y = "Índice Gini")

# MODELO 1
model_1 <- lm(gini_slc~educ_expend, data = data)
model_1_log <- lm(log(gini_slc)~educ_expend, data = data)
screenreg(model_1,
          custom.model.names = "Model 1",
          custom.coef.names = c("Constant", "Education expenditure"))

# SUPUESTOS DE LA REGRESION

#LINEALIDAD

ggplot(mapping = aes(x = model_1$fitted.values, y = model_1$residuals)) +
  labs(x = "Predicted Values", y = "Residuals") +
  geom_point() +
  geom_hline(mapping = aes(yintercept = 0))

data <- data %>%
  mutate(educ_expend2 = educ_expend * educ_expend)
model_1_quadratic <- lm(gini_slc ~ 1 + educ_expend2 + educ_expend,
                        data = data)
screenreg(model_1_quadratic)
crPlots(model_1_quadratic)

# RESET TEST
resettest(model_1, power = 2, type = "fitted", data = welfare_no_na)

# HOMOCEDASTICIDAD
residualPlot(model_1)
# BREUSCH-PAGAN TEST
bptest(model_1, studentize = T)
bptest(model_1_log, studentize = T)

# SOLUCION: ERRORES ESTANDAR ROBUSTOS

model_1_robust_3 <- coeftest(model_1, vcov = vcovHC(model_1, "HC3"))
model_1_robust_1 <- coeftest(model_1, vcov = vcovHC(model_1, "HC1"))
model_1_robust_0 <- coeftest(model_1, vcov = vcovHC(model_1, "HC0"))

models_robust <- list(model_1, model_1_robust_0,
                      model_1_robust_1, model_1_robust_3)
screenreg(models_robust,
          custom.model.names = c("w/o robust SE",
                                 "robust HC0", "robust HC1", "robust HC3"))

# NORMALIDAD DE RESIDUOS

qqPlot(model_1_log$residuals, col.lines = "black")

ggdensity(model_1$residuals, main = "Density plot of the residuals")
ggdensity(model_1_log$residuals, main = "Density plot of the residuals")

# EJERCICIO: AJUSTEN SU PROPIO MODELO, INCLUYAN LAS VARIABLES QUE LE PAREZCAN RELEVANTE.
# COMPRUEBE LOS SUPUESTOS DE LA REGRESION E INTENTE ARREGLARLO SI NO SE CUMPLEN.
# INTENTE DAR CON EL MEJOR MODELO POSIBLE.