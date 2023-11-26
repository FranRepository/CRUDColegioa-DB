-- Crear la base de datos colegioDB
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'colegioDB')
BEGIN
    CREATE DATABASE colegioDB;
END
GO

-- Utilizar la base de datos colegioDB
USE colegioDB;
GO

-- Comprobar si la tabla Alumno existe antes de crearla
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Alumno')
BEGIN
    -- Tabla Alumno
    CREATE TABLE Alumno (
        Id INT PRIMARY KEY IDENTITY(1,1),
        Nombre VARCHAR(100),
        Apellidos VARCHAR(200),
        Genero CHAR(1),
        FechaNacimiento DATE
    );
END
GO

-- Comprobar si la tabla Profesor existe antes de crearla
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Profesor')
BEGIN
    -- Tabla Profesor
    CREATE TABLE Profesor (
        Id INT PRIMARY KEY IDENTITY(1,1),
        Nombre VARCHAR(100),
        Apellido VARCHAR(200),
        Genero CHAR(1)
    );
END
GO

-- Comprobar si la tabla Grado existe antes de crearla
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Grado')
BEGIN
    -- Tabla Grado
    CREATE TABLE Grado (
        Id INT PRIMARY KEY IDENTITY(1,1),
        Nombre VARCHAR(100),
        ProfesorId INT,
        FOREIGN KEY (ProfesorId) REFERENCES Profesor(Id)
    );
END
GO

-- Comprobar si la tabla AlumnoGrado existe antes de crearla
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'AlumnoGrado')
BEGIN
    -- Tabla AlumnoGrado
    CREATE TABLE AlumnoGrado (
        Id INT PRIMARY KEY IDENTITY(1,1),
        AlumnoId INT,
        GradoId INT,
        Seccion CHAR(2),
        FOREIGN KEY (AlumnoId) REFERENCES Alumno(id),
        FOREIGN KEY (GradoId) REFERENCES Grado(Id)
    );
END
GO
