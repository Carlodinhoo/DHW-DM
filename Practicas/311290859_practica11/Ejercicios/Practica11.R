library(readr)
library(arules)
library(grid)
bank <- read.csv(file = "/Users/juan/Downloads/[A&MD]Practica11/bank-additional-full.csv",
                 head = TRUE,
                 sep = ";")

#Se transforma los valores numericos a nominales
bank$age <- factor(bank$age)
bank$job <- factor(bank$job)
bank$marital <- factor(bank$marital)
bank$education <- factor(bank$education)
bank$default <- factor(bank$default)
bank$housing <- factor(bank$housing)
bank$loan <- factor(bank$loan)
bank$contact <- factor(bank$contact)
bank$month <- factor(bank$month)
bank$day_of_week <- factor(bank$day_of_week)
bank$duration <- factor(bank$duration)
bank$campaign <- factor(bank$campaign)
bank$pdays <- factor(bank$pdays)
bank$previous <- factor(bank$previous)
bank$poutcome<- factor(bank$poutcome)
bank$emp.var.rate <- factor(bank$emp.var.rate)
bank$cons.price.idx <- factor(bank$cons.price.idx)
bank$cons.conf.idx <- factor(bank$cons.conf.idx)
bank$euribor3m <- factor(bank$euribor3m)
bank$nr.employed <- factor(bank$nr.employed)
bank$y <- factor(bank$y)


#2) 	Ocupe la funcion apriori para generar las reglas de asociaci?n con la configuraci?n por defecto.
#	Observe el resultado, ?encuentras reglas ?tiles y significativas?. Justifique. 
#
#	Una vez ejecutados los comandos con un soporte mínimo de 0.1, una confianza mínima de 0.8,
# un máximo de 10 elementos (maxlen) y un tiempo máximo para la verificación de subconjuntos de 5 segundos no se encuentran reglas utiles 
# ya que las reglas significativas son aquellas las que y = yes, y esas son el conjunto que nos importa.
#
reglasDefecto <- apriori(bank)
reglasUtiles <- subset(reglasDefecto, rhs %in% c("y=yes","y=no") & support >= 0.5 & confidence >= 0.8 & lift != 1)
inspect(reglasUtiles)

# 3)  Ejecute de nuevo la funci?n apriori (cinco veces al menos) pero ahora variando el soporte.
#	Observe el resultado, ?observa reglas ?tiles y significativas?, ?qu? cambio con respecto al
#	soporte por defecto?, ?en qu? ayudan este tipo de cambios (del soporte)?. Seleccione el
#	soporte que m?s le parezca apropiado (justifique su respuesta).
#
# Si el soporte se elige demasiado bajo para el conjunto de datos, 
# entonces el algoritmo intentará crear un conjunto extremadamente grande 
# de conjuntos de elementos o reglas. Esto dará como resultado un tiempo de 
# ejecución muy largo y, finalmente, el proceso se quedará sin memoria.
# Por lo que un soporte adecuado podria ser entre 0.5 o de 0.6 con un total de entre 170 y 116 reglas
#

#corremos el apriori con el soporte=0.4 
#Las reglas significativas son aquellas las que y = yes, ya que son el conjunto que nos importa. 
reglasDefecto1 <- apriori(bank, parameter = list(supp = 0.4))
reglasUtiles1 <- subset(reglasDefecto1, rhs %in% c("y=yes","y=no"))
inspect(reglasUtiles1)

#corremos el apriori con el soporte=0.6
#Las reglas significativas son aquellas las que y = yes, ya que son el conjunto que nos importa. 
reglasDefecto1 <- apriori(bank, parameter = list(supp = 0.6))
reglasUtiles1 <- subset(reglasDefecto1, rhs %in% c("y=yes","y=no"))
inspect(reglasUtiles1)


#corremos el apriori con el soporte=0.7
#Las reglas significativas son aquellas las que y = yes, ya que son el conjunto que nos importa. 
reglasDefecto1 <- apriori(bank, parameter = list(supp = 0.7))
reglasUtiles1 <- subset(reglasDefecto1, rhs %in% c("y=yes","y=no"))
inspect(reglasUtiles1)


#corremos el apriori con el soporte=0.8
#Las reglas significativas son aquellas las que y = yes, ya que son el conjunto que nos importa. 
reglasDefecto1 <- apriori(bank, parameter = list(supp = 0.8))
reglasUtiles1 <- subset(reglasDefecto1, rhs %in% c("y=yes","y=no"))
inspect(reglasUtiles1)


#corremos el apriori con el soporte=0.9
#Las reglas significativas son aquellas las que y = yes, ya que son el conjunto que nos importa. 
reglasDefecto1 <- apriori(bank, parameter = list(supp = 0.9))
reglasUtiles1 <- subset(reglasDefecto1, rhs %in% c("y=yes","y=no"))
inspect(reglasUtiles1)

#4) 	Repite el paso anterior pero ahora modificando la confianza. Responda las mismas preguntas
#	que el ejercicio anterior pero ahora con respecto al par?metro actual.
#
#	Modificando el valor de la confianza podemos considerar que una regla es interesante si su confianza son mayores o iguales
# que ciertos umbrales de mínima confianza especificados. Por lo que una confianza cosiderable seria de 0.9
# ya que esta cuenta con el menor numero de reglas
#

#corremos el apriori con el confianza= 0.9
#Las reglas significativas son aquellas las que y = yes, ya que son el conjunto que nos importa. 
reglasDefecto2 <- apriori(bank, parameter = list(conf = 0.9))
reglasUtiles2 <- subset(reglasDefecto2, rhs %in% c("y=yes","y=no"))
inspect(reglasUtiles2)

#corremos el apriori con el confianza= 0.6
#Las reglas significativas son aquellas las que y = yes, ya que son el conjunto que nos importa. 
reglasDefecto2 <- apriori(bank, parameter = list(conf = 0.6))
reglasUtiles2 <- subset(reglasDefecto2, rhs %in% c("y=yes","y=no"))
inspect(reglasUtiles2)

#corremos el apriori con el confianza= 0.7
#Las reglas significativas son aquellas las que y = yes, ya que son el conjunto que nos importa. 
reglasDefecto2 <- apriori(bank, parameter = list(conf = 0.7))
reglasUtiles2 <- subset(reglasDefecto2, rhs %in% c("y=yes","y=no"))
inspect(reglasUtiles2)

#corremos el apriori con el confianza= 0.5
#Las reglas significativas son aquellas las que y = yes, ya que son el conjunto que nos importa. 
reglasDefecto2 <- apriori(bank, parameter = list(conf = 0.5))
reglasUtiles2 <- subset(reglasDefecto2, rhs %in% c("y=yes","y=no"))
inspect(reglasUtiles2)

#corremos el apriori con el confianza= 0.4
#Las reglas significativas son aquellas las que y = yes, ya que son el conjunto que nos importa. 
reglasDefecto2 <- apriori(bank, parameter = list(conf = 0.4))
reglasUtiles2 <- subset(reglasDefecto2, rhs %in% c("y=yes","y=no"))
inspect(reglasUtiles2)

#5)	Tras las iteraciones anteriores, arroje el conjunto que, a su juicio, es el m?s significativo, ?til y
#	novedoso. No olvide indicar con qu? par?metros los obtuvo.
#
# Un conjunto significativo seria usar un soporte de 0.6 y una confianza de 0.9  generando un total de 68 reglas
# que a nuestro parecer son mayores o iguales que ciertos umbrales de soporte minimo y de mínima confianza especificados
#

res <- apriori(bank, parameter = list(conf = 0.9, supp=0.6))
dat <- subset(res, rhs %in% c("y=yes","y=no"))
inspect(dat)