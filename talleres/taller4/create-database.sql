-- CREATE DATABASE facultad

-- Por si se modificaron los datos
--DROP TABLE IF EXISTS notas;
--DROP TABLE IF EXISTS materias;
--DROP TABLE IF EXISTS departamentos;
--DROP TABLE IF EXISTS inscripto_en;
--DROP TABLE IF EXISTS carreras;
--DROP TABLE IF EXISTS alumnos;

CREATE TABLE departamentos (
    codigo INTEGER NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    CONSTRAINT pk_departamentos PRIMARY KEY (codigo)
);

INSERT INTO DEPARTAMENTOS (codigo, nombre) VALUES 
	(71,'Gestión'),
	(75,'Computación');

CREATE TABLE materias (
    codigo INTEGER NOT NULL,
    numero INTEGER NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    CONSTRAINT pk_materias PRIMARY KEY 
        (codigo, numero),
    CONSTRAINT fk_materia_depto FOREIGN KEY (codigo) 
        REFERENCES departamentos (codigo)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);

INSERT INTO MATERIAS (codigo, numero, nombre) VALUES
    (71, 14, 'Modelos y Optimización I'),
    (71, 15, 'Modelos y Optimización II'),
    (75, 1, 'Computación'),
    (75, 6, 'Organización de Datos'),
    (75, 15, 'Base de datos');

CREATE TABLE alumnos (
    padron INTEGER NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    intercambio BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_ingreso DATE NOT NULL,
    CONSTRAINT pk_alumnos PRIMARY KEY (padron)
);

INSERT INTO ALUMNOS (padron, nombre, apellido, intercambio, fecha_ingreso) VALUES
    (71000,'Daniel','Molina',false,'2010-03-01'),
    (72000,'Paula','Pérez Alonso',false,'2010-08-02'),
    (73000,'José Agustín','Molina',true,'2011-03-07'),
    (74000,'Miguel','Mazzeo',false,'2011-03-07'),
    (75000,'Clemente','Onelli',false,'2011-03-07'),
    (76000,'Graciela','Lecube',true,'2011-08-01');

CREATE TABLE notas(
    padron INTEGER NOT NULL,
    codigo INTEGER NOT NULL,
    numero INTEGER NOT NULL,
    fecha DATE NOT NULL,
    nota INTEGER NOT NULL,
    CONSTRAINT pk_notas PRIMARY KEY
        (padron, codigo, numero, fecha),
    CONSTRAINT fk_nota_alumno FOREIGN KEY (padron) 
        REFERENCES alumnos (padron) 
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT fk_nota_materia FOREIGN KEY 
        (codigo, numero) REFERENCES materias 
        (codigo, numero)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);

INSERT INTO NOTAS (padron, codigo, numero, nota, fecha) VALUES
    (73000, 71, 14, 5, '2013-12-09'), 
    (73000, 71, 15, 9, '2014-07-07'), 
    (73000, 75, 1, 5, '2010-07-14'), 
    (73000, 75, 6, 10, '2012-07-18'), 
    (73000, 75, 15, 4, '2013-07-10'), 
    (72000, 71, 14, 6, '2013-07-08'), 
    (72000, 71, 15, 2, '2013-12-09'), 
    (72000, 75, 1, 4, '2010-12-16'),
    (72000, 75, 6, 4, '2012-07-25'), 
    (72000, 75, 15, 1, '2013-07-10'), 
    (72000, 75, 15, 6, '2013-07-17'), 
    (75000, 71, 14, 7, '2013-12-16'), 
    (75000, 71, 15, 2, '2014-07-07'), 
    (75000, 75, 1, 8, '2010-07-21'), 
    (75000, 75, 6, 7, '2012-07-11'), 
    (75000, 75, 15, 2, '2013-07-24'), 
    (71000, 71, 14, 4, '2013-12-09'), 
    (71000, 75, 1, 4, '2010-12-16'), 
    (71000, 75, 6, 2, '2012-07-18'), 
    (71000, 75, 6, 6, '2012-07-25'), 
    (71000, 75, 15, 7, '2013-07-10'), 
    (76000, 75, 15, 2, '2013-07-17'), 
    (76000, 75, 15, 10, '2013-07-24'); 

CREATE TABLE carreras (
    codigo INTEGER NOT NULL,
    nombre CHARACTER(40) NOT NULL,
    CONSTRAINT pk_carreras PRIMARY KEY (codigo)
);

INSERT INTO carreras (codigo,nombre)VALUES
    (7, 'Ingeniería Electrónica'), 
    (9, 'Licenciatura en Análisis de Sistemas'), 
    (10, 'Ingeniería en Informática');

CREATE TABLE inscripto_en (
    padron INTEGER NOT NULL,
    codigo INTEGER NOT NULL,
    CONSTRAINT pk_inscripto_en PRIMARY KEY 
        (padron, codigo),
    CONSTRAINT fk_inscripto_padron FOREIGN KEY 
        (padron) REFERENCES alumnos (padron)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT fk_inscripto_carrera FOREIGN KEY 
        (codigo) REFERENCES carreras (codigo)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);

INSERT INTO inscripto_en (padron, codigo) VALUES
    (71000,10),
	(72000,10),
	(73000,9),
	(73000,10),
    (74000,10),
	(75000,9), 
	(76000,9);