create database AED;create table GestionAlumnos(
	id int auto_increment not null,
	nombre varchar (20),
	apellidos varchar(20),
	edad int,
	direccion varchar (20),
	curso int,
	datosFamilia varchar (80),
	nota int,
	primary key (id)
);create table administradores(
	id int auto_increment primary key,
	name varchar(20),
	password varchar(20)
);
INsert into
	administradores(name, password)
values("admin", "admin");
