library(readr)
library(cluster)
#Cargamos el dataset
Adult <- read_csv("Adult.cvs")

#Utilizando el algoritmo de k-medoids
#Utilizamos la funcion pam de la biblioteca cluster con k = 5
pam.res <- pam(Adult,5)
table(pam.res$clustering, Adult$Edad)
table(pam.res$clustering, Adult$TipoEmpleado)
table(pam.res$clustering, Adult$PonderacionFinal)
table(pam.res$clustering, Adult$NivelEducacion)
table(pam.res$clustering, Adult$GradoEducaion)
table(pam.res$clustering, Adult$EstadoCivil)
table(pam.res$clustering, Adult$Ocupacion)
table(pam.res$clustering, Adult$RolFamiliar)
table(pam.res$clustering, Adult$Raza)
table(pam.res$clustering, Adult$Sexo)
table(pam.res$clustering, Adult$Ganancias)
table(pam.res$clustering, Adult$Perdidas)
table(pam.res$clustering, Adult$HorasTrabajadas)
table(pam.res$clustering, Adult$PaisOrigen)
table(pam.res$clustering, Adult$Ingresos)