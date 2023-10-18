#Demostracion Teorema del limite central

# Primero generamos una poblacion con numeros pseudoaleatorios
# Vamos a generar una poblacion de 100 mil personas
# a partir de una distribucion uniforme con el comando runif()
set.seed(1234)
poblacion<-runif(100000,70,100) # mu=85.01
summary(poblacion)
hist(poblacion) # Asi se ve una distribucion uniforme
# esta muy lejos de ser una distribucion normal

# Vamos a sacar 1000 veces una muestra de esa poblacion y calcularemos la media
# Para esto, vamos a crear tres vectores vacios
m1=c() # Esta muestra sera de 10 personas
m2=c() # Esta muestra sera de 50 personas
m3=c() # Esta muestra sera de 100 personas

# El comando for es un loop que hace repetidas veces lo que le pedimos
# En este caso, le estoy pidiendo que haga mil veces lo siguiente:
# Sacar la media de una muestra de la poblacion de 10 personas
# guardar la media en el vector m1
# Sacar la media de una muestra de la poblacion de 50 personas
# guardar la media en el vector m2
#Sacar la media de una muestra de la poblacion de 100 personas
# guardar la media en el vector m3

for (i in 1:1000){
  m1[i]=mean(sample(poblacion, 10, replace=T)) # Sacamos una muestra aleatoria de tamaño 10
  m2[i]=mean(sample(poblacion, 50, replace=T)) # Sacamos una muestra aleatoria de tamaño 50
  m3[i]=mean(sample(poblacion, 100, replace=T)) # Sacamos una muestra aleatoria de tamaño 100
}

# Ahora debemos graficar
par(mfrow=c(1,3))
hist(m1, col="orange", main="n=10", xlab="Peso")
abline(v=mean(m1), col="red")
hist(m2, col="lightblue", main="n=50", xlab="Peso")
abline(v=mean(m1), col="red")
hist(m3, col="lightgreen", main="n=100", xlab="Peso")
abline(v=mean(m1), col="red")

# Notemos la diferencia en la desviacion estandar
sd(m1)
sd(m2)
sd(m3)

# ¿Por que ocurre eso?

