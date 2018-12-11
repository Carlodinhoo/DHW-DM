-- EJERCICIO 1

SELECT *
FROM PERSONA INNER JOIN VENDEDOR ON PERSONA.RFC = VENDEDOR.RFC_VENDEDOR
WHERE ANIO_NACIMIENTO < 1970;

--EJERCICIO 2

SELECT *
FROM AUTO
WHERE MARCA LIKE 'F%';

-- EJERCICIO 3

-- NO SE PUDO RESOLVER :(

-- EJERCICIO 4 

SELECT PERSONA.NOMBRE, VENDEDOR.SUELDO
FROM PERSONA INNER JOIN VENDEDOR ON PERSONA.RFC = VENDEDOR.RFC_VENDEDOR
WHERE SUELDO <= '1500';

-- EJERCICIO 5

SELECT CLIENTE.RFC_CLIENTE, PERSONA.NOMBRE, PERSONA.ANIO_NACIMIENTO
FROM PERSONA INNER JOIN CLIENTE ON PERSONA.RFC = CLIENTE.RFC_CLIENTE
WHERE ANIO_NACIMIENTO BETWEEN 1920 AND 1953;

-- EJERCICIO 6

SELECT DISTINCT AUTO.COLOR 
FROM AUTO
WHERE FECHA_COMPRA > '01-01-16';

-- EJERCICIO 7

SELECT PERSONA.NOMBRE, PERSONA.APATERNO, PERSONA.AMATERNO, PERSONA.ANIO_NACIMIENTO
FROM PERSONA INNER JOIN CLIENTE ON PERSONA.RFC = CLIENTE.RFC_CLIENTE
	INNER JOIN REALIZA ON REALIZA.RFC_CLIENTE = CLIENTE.RFC_CLIENTE
    INNER JOIN AUTO ON AUTO.NO_MOTOR = REALIZA.NO_MOTOR
    INNER JOIN OPERACION ON OPERACION.ID_OPERACION = REALIZA.ID_OPERACION
WHERE AMATERNO LIKE '_r%' AND ANIO_NACIMIENTO <= 1999 AND AUTO.MARCA = 'Nissan' AND FECHA_COMPRA > '01-01-16'
ORDER BY ANIO_NACIMIENTO DESC;

-- EJERCICIO 8

SELECT PERSONA.NOMBRE, PERSONA.APATERNO, PERSONA.AMATERNO, PERSONA.ANIO_NACIMIENTO
FROM DIRECCION INNER JOIN PERSONA ON DIRECCION.ID = PERSONA.ID_DIRECCION
	INNER JOIN VENDEDOR ON PERSONA.RFC = VENDEDOR.RFC_VENDEDOR
    INNER JOIN REALIZA ON REALIZA.RFC_VENDEDOR = VENDEDOR.RFC_VENDEDOR
    INNER JOIN AUTO ON AUTO.NO_MOTOR = REALIZA.NO_MOTOR
    INNER JOIN OPERACION ON OPERACION.ID_OPERACION = REALIZA.ID_OPERACION
WHERE CALLE = '204 Posurere' AND ANIO_NACIMIENTO <= 1994 AND MARCA = 'Ford' AND FECHA_VENTA > '01-01-16'
ORDER BY ANIO_NACIMIENTO;

-- EJERCICIO 9

SELECT DISTINCT PERSONA.APATERNO, PERSONA.AMATERNO
FROM PERSONA INNER JOIN REALIZA ON PERSONA.RFC = REALIZA.RFC_CLIENTE
	INNER JOIN AUTO ON AUTO.NO_MOTOR = REALIZA.NO_MOTOR
WHERE MARCA = 'Nissan' OR MARCA = 'Seat'
ORDER BY APATERNO, AMATERNO;

-- EJERCICIO 10

-- LA CONSULTA SI SE PUEDE REALIZAR PERO NO TIENE COHERENCIA YA QUE AUNQUE SE PUEDA HACER LOS
-- JOIN CON LAS TABLAS 'REALIZA', 'VENDEDOR', 'PERSONA' Y 'AUTO' NO NOS ASEGURA EL RESULTADO ESPERADO

-- EJERCICIO 11

-- SI SE PUEDE REALIZAR PERO LA BASE DE DATOS SOLO CONTIENE DATOS DEL AÑO 2016

-- EJERCICIO 12

-- ASI COMO EN EL EJERCICIO 11, SE PUEDE REALIZAR LA CONSULTA PERO SOLO TENEMOS DATOS DEL AÑO 2016 

-- EJERCICIO 13

SELECT COUNT(MARCA) AS TOTAL
FROM AGENCIA INNER JOIN AUTO ON AGENCIA.RFC = AUTO.RFC_AGENCIA
WHERE MARCA = 'Toyota' AND FECHA_COMPRA < '12-31-16';

-- EJERCICIO 14

-- NO SE PUEDE REALIZAR YA QUE TENDRIAMOS QUE 'AGRUPAR' DIFERENTES TABLAS, YA QUE NOS PIDEN DATOS DE CADA TRIMIESTRE

-- EJERCICIO 15

-- ASI MISMO NO SE PUEDE REALIZAR YA QUE SE TENDRIA QUE DIVIDIR EL AÑO