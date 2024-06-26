-- SELECT 'CREATE DATABASE parcialito_sql'
-- WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'parcialito_sql')\gexec
-- \connect parcialito_sql

-- Por si se modificaron los datos
-- DROP TABLE IF EXISTS notas;
-- DROP TABLE IF EXISTS materias;
-- DROP TABLE IF EXISTS departamentos;
-- DROP TABLE IF EXISTS inscripto_en;
-- DROP TABLE IF EXISTS carreras;
-- DROP TABLE IF EXISTS alumnos;

CREATE TABLE departamentos (
    codigo INTEGER NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    CONSTRAINT pk_departamentos PRIMARY KEY (codigo)
);

CREATE TABLE materias (
    codigo INTEGER NOT NULL,
    numero INTEGER NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    CONSTRAINT pk_materias PRIMARY KEY
        (codigo, numero),
    CONSTRAINT fk_materia_depto FOREIGN KEY (codigo)
        REFERENCES departamentos (codigo)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE alumnos (
    padron INTEGER NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    intercambio BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_ingreso DATE NOT NULL,
    CONSTRAINT pk_alumnos PRIMARY KEY (padron)
);

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

CREATE TABLE carreras (
    codigo INTEGER NOT NULL,
    nombre CHARACTER(40) NOT NULL,
    CONSTRAINT pk_carreras PRIMARY KEY (codigo)
);

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

-- Agregado de datos

INSERT INTO departamentos (codigo, nombre) VALUES
    (71, 'Gestión'),
    (75, 'Computación'),
    (61, 'Matemáticas'),
    (62, 'Física');

INSERT INTO materias (codigo, numero, nombre) VALUES
    (71, 12, 'Estructura de las Organizaciones'),
    (71, 13, 'Información en las Organizaciones'),
    (71, 14, 'Modelos y Optimización I'),
    (71, 15, 'Modelos y Optimización II'),
    (75, 1, 'Computación'),
    (75, 6, 'Organización de Datos'),
    (75, 8, 'Sistemas Operativos'),
    (75, 15, 'Base de Datos'),
    (75, 40, 'Algoritmos y Programación I'),
    (75, 41, 'Algoritmos y Programación II'),
    (75, 42, 'Taller de Programación I'),
    (61, 1, 'Álgebra Lineal'),
    (61, 2, 'Cálculo Diferencial'),
    (62, 5, 'Mecánica Clásica'),
    (62, 1, 'Física I A');

INSERT INTO alumnos (padron, nombre, apellido, intercambio, fecha_ingreso) VALUES
    (71000, 'Daniel', 'Molina', false, '2010-03-01'),
    (72000, 'Paula', 'Pérez Alonso', false, '2010-08-02'),
    (73000, 'José Agustín', 'Molina', true, '2011-03-07'),
    (74000, 'Miguel', 'Mazzeo', false, '2011-03-07'),
    (75000, 'Clemente', 'Onelli', false, '2011-03-07'),
    (76000, 'Graciela', 'Lecube', true, '2011-08-01'),
    (77000, 'Carla', 'Rodríguez', false, '2012-02-15'),
    (78000, 'Juan', 'López', true, '2013-09-10'),
    (79000, 'Laura', 'Gómez', false, '2014-03-22'),
    (80000, 'Marina', 'Sánchez', false, '2013-03-25'),
    (81000, 'Javier', 'Martínez', false, '2014-09-05'),
    (82000, 'Luis', 'González', true, '2015-02-12'),
    (86000, 'Mariana', 'Díaz', false, '2013-09-22'),
    (87000, 'Gabriel', 'Hernández', false, '2014-04-10'),
    (88000, 'Lucía', 'Vargas', true, '2015-02-18'),
    (83000, 'Fernando', 'Gómez', false, '2012-05-15'),
    (84000, 'Valeria', 'López', true, '2013-10-02'),
    (85000, 'Carlos', 'Fernández', false, '2014-04-18');

INSERT INTO notas (padron, codigo, numero, nota, fecha) VALUES
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
    (71000, 75, 1, 4, '2010-12-16'),
    (71000, 75, 6, 2, '2012-07-18'),
    (71000, 75, 6, 6, '2012-07-25'),
    (71000, 71, 14, 7, '2013-07-10'),
    (76000, 75, 15, 2, '2013-07-17'),
    (76000, 75, 15, 10, '2013-07-24'),
    (77000, 61, 1, 8, '2015-07-10'),
    (77000, 61, 2, 9, '2015-12-15'),
    (78000, 62, 1, 7, '2014-07-22'),
    (78000, 62, 1, 6, '2015-07-10'),
    (79000, 61, 1, 10, '2015-12-15'),
    (79000, 61, 2, 8, '2016-07-20'),
    (80000, 62, 5, 6, '2016-07-15'),
    (80000, 61, 2, 8, '2017-07-10'),
    (81000, 62, 5, 7, '2015-12-18'),
    (81000, 61, 1, 9, '2016-07-22'),
    (82000, 62, 1, 10, '2017-12-12'),
    (82000, 61, 2, 6, '2018-07-20'),
    (86000, 75, 8, 8, '2016-07-12'),
    (86000, 71, 15, 9, '2017-07-07'),
    (86000, 75, 42, 7, '2015-12-15'),
    (86000, 75, 6, 10, '2016-07-20'),
    (86000, 71, 14, 5, '2016-12-09'),
    (87000, 75, 8, 6, '2016-12-18'),
    (87000, 71, 15, 7, '2017-07-15'),
    (87000, 75, 42, 9, '2015-12-22'),
    (87000, 75, 6, 8, '2016-07-25'),
    (88000, 75, 1, 9, '2017-07-12'),
    (88000, 71, 14, 8, '2017-12-18'),
    (88000, 75, 42, 7, '2016-01-02'),
    (88000, 75, 6, 9, '2016-08-01'),
    (83000, 71, 12, 8, '2015-07-12'),
    (83000, 71, 13, 9, '2016-07-07'),
    (83000, 75, 40, 7, '2014-12-15'),
    (83000, 75, 41, 10, '2015-07-20'),
    (84000, 71, 12, 6, '2015-12-18'),
    (84000, 71, 13, 7, '2016-07-15'),
    (84000, 75, 40, 9, '2014-12-22'),
    (84000, 75, 41, 8, '2015-07-25'),
    (85000, 71, 12, 9, '2016-07-12'),
    (85000, 71, 13, 8, '2016-12-18'),
    (85000, 75, 40, 7, '2015-01-02'),
    (85000, 75, 41, 9, '2015-08-01');

INSERT INTO carreras (codigo,nombre)VALUES
    (5, 'Ingeniería Química'),
    (6, 'Ingeniería Mecánica'),
    (7, 'Ingeniería Electrónica'),
    (9, 'Licenciatura en Análisis de Sistemas'),
    (10, 'Ingeniería en Informática');

INSERT INTO inscripto_en (padron, codigo) VALUES
    (71000, 10),
    (72000, 10),
    (73000, 9),
    (73000, 10),
    (74000, 10),
    (75000, 9),
    (76000, 9),
    (77000, 6),
    (78000, 5),
    (79000, 6),
    (80000, 5),
    (81000, 6),
    (82000, 5),
    (86000, 10),
    (87000, 9),
    (88000, 10),
    (83000, 10),
    (84000, 10),
    (85000, 9);
