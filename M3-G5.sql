-- DESARROLLO

/*Parte 1: Crear entorno de trabajo
- Crear una base de datos*/
create database ejercicioG5;
use ejercicioG5;

-- - Crear un usuario con todos los privilegios para trabajar con la base de datos recién creada.
create user 'admin5'@'localhost' IDENTIFIED by '123456789';
GRANT ALL PRIVILEGES ON ejercicioG5 TO 'admin5'@'localhost';
FLUSH PRIVILEGES;

/*Parte 2: Crear dos tablas.
- La primera almacena a los usuarios de la aplicación (id_usuario, nombre, apellido,
contraseña, zona horaria (por defecto UTC-3), género y teléfono de contacto).*/

create table UsuariosAplicacion(
	id_usuario int,
	nombre varchar(40),
	apellido varchar(40),
	contraseña varchar(6),
	zona_horaria varchar(8) default 'UTC-3',
	genero varchar(10),
	telefono_contacto varchar(15)
);

/*
- La segunda tabla almacena información relacionada a la fecha-hora de ingreso de los
usuarios a la plataforma (id_ingreso, id_usuario y la fecha-hora de ingreso (por defecto la
fecha-hora actual)).
*/

create table RegistroUsuarioApp(
	id_ingreso int,
	id_usuario int,
	fecha_hora_ingreso datetime default current_timestamp()
);

/*
Parte 3: Modificación de la tabla
- Modifique el UTC por defecto.Desde UTC-3 a UTC-2.
*/

alter table UsuariosAplicacion alter zona_horaria set default 'UTC-2';

/*Parte 4: Creación de registros.
- Para cada tabla crea 8 registros.*/
insert into UsuariosAplicacion (id_usuario,nombre, apellido, contraseña, zona_horaria, genero, telefono_contacto) values (1,'Eward', 'Bowe', 'j0tz4l', 'UTC-3', 'Male', '3831464074');
insert into UsuariosAplicacion (id_usuario,nombre, apellido, contraseña, zona_horaria, genero, telefono_contacto) values (2,'Constantina', 'Whiston', 'z0PLdL', 'UTC-3', 'Female', '7261352040');
insert into UsuariosAplicacion (id_usuario,nombre, apellido, contraseña, zona_horaria, genero, telefono_contacto) values (3,'Tony', 'Atherley', 'Xvn7g7', 'UTC-3', 'Female', '2123707913');
insert into UsuariosAplicacion (id_usuario,nombre, apellido, contraseña, zona_horaria, genero, telefono_contacto) values (4,'Quinton', 'Piens', 'EU8MEL', 'UTC-3', 'Male', '8774861820');
insert into UsuariosAplicacion (id_usuario,nombre, apellido, contraseña, zona_horaria, genero, telefono_contacto) values (5,'Nicoline', 'Mulran', 'L8999P', 'UTC-3', 'Female', '5453087967');
insert into UsuariosAplicacion (id_usuario,nombre, apellido, contraseña, zona_horaria, genero, telefono_contacto) values (6,'Jocko', 'Midlar', 'U5El5h', 'UTC-3', 'Male', '4664464142');
insert into UsuariosAplicacion (id_usuario,nombre, apellido, contraseña, zona_horaria, genero, telefono_contacto) values (7,'Jaime', 'Worcs', 'oCHUHk', 'UTC-3', 'Male', '5517532228');
insert into UsuariosAplicacion (id_usuario,nombre, apellido, contraseña, zona_horaria, genero, telefono_contacto) values (8,'Benny', 'Flintuff', 'wDhOy7', 'UTC-3', 'Female', '2884690035');

insert into RegistroUsuarioApp (id_ingreso, id_usuario) values (1,5);
insert into RegistroUsuarioApp (id_ingreso, id_usuario) values (2,4);
insert into RegistroUsuarioApp (id_ingreso, id_usuario) values (3,2);
insert into RegistroUsuarioApp (id_ingreso, id_usuario) values (4,2);
insert into RegistroUsuarioApp (id_ingreso, id_usuario) values (5,6);
insert into RegistroUsuarioApp (id_ingreso, id_usuario) values (6,3);
insert into RegistroUsuarioApp (id_ingreso, id_usuario) values (7,1);
insert into RegistroUsuarioApp (id_ingreso, id_usuario) values (8,3);

-- Parte 5: Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso?
#datetime: necesario para almacenar fecha y hora
#varchar: quizas no el mas apropiado para todos los tipos de datos pero basicamente podemos guardar todo en una cadena de texto
#int: ideal para numeros con una larga y corta longitud


-- Parte 6: Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, numero de telefono,correo electronico).
create table Contactos(
	id_contacto int,
	id_usuario int,
	numero_telefono varchar(15),
	correo_electronico varchar(50)
);

-- Parte 7: Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la tabla Contactos.

#cabe aclarar que la modificacion a la columna no hace falta para crear una relacion ya que podemos utilizar los campos existentes para crear una relacion

 alter table UsuariosAplicacion change telefono_contacto contacto varchar(15);
 alter table Contactos add primary key (numero_telefono);
SET FOREIGN_KEY_CHECKS=0;
 alter table UsuariosAplicacion add constraint fk_contacto_user foreign key (contacto) references Contactos(numero_telefono);




