
CREATE SEQUENCE operacion_id_operacion_seq;

CREATE TABLE Operacion (
                id_operacion REAL NOT NULL DEFAULT nextval('operacion_id_operacion_seq'),
                precio_venta NUMERIC NOT NULL,
                fecha_venta DATE NOT NULL,
                CONSTRAINT operacion_pk PRIMARY KEY (id_operacion)
);


ALTER SEQUENCE operacion_id_operacion_seq OWNED BY Operacion.id_operacion;

CREATE TABLE Agencia (
                id_agencia INTEGER NOT NULL,
                nombre VARCHAR NOT NULL,
                telefono INTEGER NOT NULL,
                ubicacion VARCHAR NOT NULL,
                CONSTRAINT agencia_pk PRIMARY KEY (id_agencia)
);


CREATE TABLE Auto (
                id_auto INTEGER NOT NULL,
                id_agencia INTEGER NOT NULL,
                fecha_compra DATE NOT NULL,
                modelo VARCHAR NOT NULL,
                version VARCHAR NOT NULL,
                hp INTEGER NOT NULL,
                transmision VARCHAR NOT NULL,
                categoria VARCHAR NOT NULL,
                color VARCHAR NOT NULL,
                costo_compra NUMERIC NOT NULL,
                CONSTRAINT auto_pk PRIMARY KEY (id_auto)
);


CREATE SEQUENCE direccion_id_direccion_seq;

CREATE TABLE Direccion (
                id_direccion INTEGER NOT NULL DEFAULT nextval('direccion_id_direccion_seq'),
                estado VARCHAR NOT NULL,
                cp VARCHAR NOT NULL,
                CONSTRAINT direccion_pk PRIMARY KEY (id_direccion)
);


ALTER SEQUENCE direccion_id_direccion_seq OWNED BY Direccion.id_direccion;

CREATE TABLE Ubica (
                id_agencia INTEGER NOT NULL,
                id_direccion INTEGER NOT NULL,
                CONSTRAINT ubica_pk PRIMARY KEY (id_agencia)
);


CREATE TABLE Persona (
                curp INTEGER NOT NULL,
                nombre VARCHAR NOT NULL,
                apaterno VARCHAR NOT NULL,
                amaterno VARCHAR NOT NULL,
                edad INTEGER NOT NULL,
                genero VARCHAR NOT NULL,
                telefono INTEGER NOT NULL,
                correo VARCHAR NOT NULL,
                CONSTRAINT curp PRIMARY KEY (curp)
);


CREATE TABLE Vive (
                curp INTEGER NOT NULL,
                id_direccion INTEGER NOT NULL,
                CONSTRAINT vive_pk PRIMARY KEY (curp)
);


CREATE TABLE Cliente (
                curp_cliente INTEGER NOT NULL,
                grado_estudio VARCHAR NOT NULL,
                ingreso NUMERIC NOT NULL,
                CONSTRAINT cliente_pk PRIMARY KEY (curp_cliente)
);


CREATE TABLE Vendedor2 (
                curp_vendedor INTEGER NOT NULL,
                id_direccion INTEGER NOT NULL,
                sueldo NUMERIC NOT NULL,
                CONSTRAINT vendedor PRIMARY KEY (curp_vendedor)
);


CREATE TABLE Realiza (
                id_operacion REAL NOT NULL,
                curp_cliente INTEGER NOT NULL,
                curp_vendedor INTEGER NOT NULL,
                id_auto INTEGER NOT NULL,
                CONSTRAINT realiza_pk PRIMARY KEY (id_operacion)
);


ALTER TABLE Realiza ADD CONSTRAINT operacion_realiza_fk
FOREIGN KEY (id_operacion)
REFERENCES Operacion (id_operacion)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE Auto ADD CONSTRAINT agencia_auto_fk
FOREIGN KEY (id_agencia)
REFERENCES Agencia (id_agencia)
ON DELETE NO ACTION
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE Ubica ADD CONSTRAINT agencia_ubica_fk
FOREIGN KEY (id_agencia)
REFERENCES Agencia (id_agencia)
ON DELETE NO ACTION
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE Realiza ADD CONSTRAINT auto_realiza_fk
FOREIGN KEY (id_auto)
REFERENCES Auto (id_auto)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE Ubica ADD CONSTRAINT direccion_ubica_fk
FOREIGN KEY (id_direccion)
REFERENCES Direccion (id_direccion)
ON DELETE NO ACTION
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE Vendedor2 ADD CONSTRAINT direccion_vendedor_fk
FOREIGN KEY (id_direccion)
REFERENCES Direccion (id_direccion)
ON DELETE NO ACTION
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE Vive ADD CONSTRAINT direccion_vive_fk
FOREIGN KEY (id_direccion)
REFERENCES Direccion (id_direccion)
ON DELETE NO ACTION
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE Vendedor2 ADD CONSTRAINT persona_vendedor_fk
FOREIGN KEY (curp_vendedor)
REFERENCES Persona (curp)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Cliente ADD CONSTRAINT persona_cliente_fk
FOREIGN KEY (curp_cliente)
REFERENCES Persona (curp)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE Vive ADD CONSTRAINT persona_vive_fk
FOREIGN KEY (curp)
REFERENCES Persona (curp)
ON DELETE NO ACTION
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE Realiza ADD CONSTRAINT cliente_realiza_fk
FOREIGN KEY (curp_cliente)
REFERENCES Cliente (curp_cliente)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE Realiza ADD CONSTRAINT vendedor_realiza_fk
FOREIGN KEY (curp_vendedor)
REFERENCES Vendedor2 (curp_vendedor)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;
