

DROP TABLE IF EXISTS alumnos;

CREATE TABLE inst_sec (
    nombre VARCHAR(30) NOT NULL,
    direccion VARCHAR(30) NOT NULL,
    CONSTRAINT pk_inst_sec PRIMARY KEY (nombre)
);
CREATE TABLE alumnos (
    padron INTEGER NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    nombre_inst_sec VARCHAR(30),
    cantidad_creditos INTEGER,
    CONSTRAINT pk_alumnos PRIMARY KEY (padron),
    CONSTRAINT fk_alumno_inst_sec
        FOREIGN KEY (nombre_inst_sec) 
        REFERENCES inst_sec (nombre)
);

INSERT INTO inst_sec (nombre, direccion)
VALUES ('CNBA', 'Bolívar 263'),
       ('ILSE', 'Libertad 555'),
       ('ORT' , 'Yatay 240');
       
INSERT INTO alumnos (padron, nombre, apellido, nombre_inst_sec, cantidad_creditos)
VALUES (12300, 'Álvarez', 'Antonio', 'ORT', 30),
       (45600, 'Barano', 'Beatriz', 'ILSE', NULL),
       (55555, 'De Marti', 'Darío', NULL, 30),
       (78900, 'Canga', 'Carla', 'ORT', 40);