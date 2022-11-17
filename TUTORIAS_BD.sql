Create database TutoriasDB

Use TutoriasDB

CREATE TABLE Usuarios
(
Usuario_Matricula int primary key not null,
Usuario_Nombre varchar (50),
Usuario_Apellido1 varchar(50),
Usuario_Correo varchar(50),
Usuario_Contrasena varchar (50),
Usuario_Telefono int,
Usuario_Descripcion varchar (50),
Usuario_Estado bit
);

CREATE TABLE Roles
(
Rol_ID int identity not null,
Rol_Nombre varchar(50),
Rol_Estado bit,
);
alter table Roles
add primary key (Rol_ID)

CREATE TABLE UsuarioRoles
(
Us_Rol_ID int identity primary key not null,
Usuario_ID int FOREIGN KEY REFERENCES Usuarios (Usuario_Matricula),
Rol_ID int FOREIGN KEY REFERENCES Roles (Rol_ID)
);

CREATE TABLE Asignaturas
(
Asignatura_ID int primary key not null,
Asignatura_Nombre varchar(50),
Asignatura_Descripcion varchar(255),
Asignatura_Estado bit
);

CREATE TABLE ProfesorAsignatura
(
Pro_asig_ID int identity primary key not null,
Profesor_ID int FOREIGN KEY REFERENCES Usuarios (Usuario_Matricula),
Asignatura_ID int FOREIGN KEY REFERENCES Asignaturas (Asignatura_ID)
);

CREATE TABLE Tutorias
(
Tutoria_ID int identity primary key not null,
Asignatura_ID int FOREIGN KEY REFERENCES Asignaturas (Asignatura_ID),
Profesor_ID int FOREIGN KEY REFERENCES Usuarios (Usuario_Matricula),
Estudiante_ID int FOREIGN KEY REFERENCES Usuarios (Usuario_Matricula),
Tuoria_Estado bit
);

CREATE TABLE Itinerario
(
Itinerario_ID int identity primary key not null,
Tutoria_ID int FOREIGN KEY REFERENCES Tutorias (Tutoria_ID),
Fecha_Inicio Datetime not null ,
Fecha_Termino Datetime not null
);
