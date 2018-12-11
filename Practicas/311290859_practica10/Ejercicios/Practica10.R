#cargamos el dataset y lo guardamos en un frame que lo transforma en table
cenzo <- read.cvs("Adult.cvs", header = TRUE)
datos <- data.frame(cenzo)

#Guardamos los datos en un vector para hacer los cambios a los atributos
#Usamos el metodo replace para hacer la sustitucion de atributos
x <- c(datos$Male)
x <- as.character(x)
x <- replace(x, x == "1", "Mujer")
x <- replace(x, x == "2", "Hombre")
#Aplicamos los cambios a la tabla
datos$Male <- x

#Guardamos los datos en un vector para hacer los cambios a los atributos
y <- c(datos$Never.married)
y <- as.character(y)
y <- replace(y, y == "1", "Divorciado")
y <- replace(y, y == "2", "Pareja Ausente")
y <- replace(y, y == "3", "Casados por el civil")
y <- replace(y, y == "4", "Casado")
y <- replace(y, y == "5", "Separado")
y <- replace(y, y == "6", "Separado")
y <- replace(y, y == "7", "Viud@")
datos$Never.married <- y

#Guardamos los datos en un vector para hacer los cambios a los atributos
z <- c(datos$State.gov)
z <- replace(z, z == "1", "Private")
z <- replace(z, z == "2", "Gobierno estatal")
z <- replace(z, z == "3", "Gobierno local")
z <- replace(z, z == "5", "Privado")
z <- replace(z, z == "6", "Auto-emp-inc")
z <- replace(z, z == "7", "Auto-emp-not-inc")
z <- replace(z, z == "8", "Gobierno estatal")
datos$State.gov <- z

#Guardamos los datos en un vector para hacer los cambios a los atributos
a <- c(datos$Adm.clerical)
a <- replace(a, a == 1, 11)
datos$Adm.clerical <- a

#Escribimos los cambios en el archivo resultado.cvs
write.csv(datos, file="resultado.cvs")

#Usamos el metodo de imputuacion con promediospero el problema de este metodo es que limitan o sobredimensionan el poder explicativo de los modelos y
# generan estimadores sesgados que distorsionan las relaciones de causalidad entre las variables y
#Alteran el valor de los coeficientes


#Una forma de mejorar estp es usar la imputacion por regresion
#Ya quee ante la ausencia de datos es posible utilizar metodos de regresion para imputar informacion en la variable
#a partir de un grupo de variables correlacionadas

#Renombramos las tablas
names(datos)[1] = "Edad"
names(datos)[2] = "Tipo_Trabajo"
names(datos)[4] = "Educacion"
 names(datos)[5] = "Numero_educacion"
 names(datos)[6] = "Estado_civil"
 names(datos)[7] = "Ocupacion"
 names(datos)[8] = "Relacion"
 names(datos)[9] = "Raza"
 names(datos)[10] = "Genero"
 names(datos)[11] = "Ganancia_capital"
 names(datos)[12] = "Perdida_capital"
 names(datos)[13] = "HorasXsemana"
 names(datos)[14] = "Pais"
 names(datos)[15] = "Salario"