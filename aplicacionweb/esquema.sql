
-- Creacción de las tablas:

create table pacientes (
    cod_paciente varchar(15) primary key,
    nombre varchar(50) NOT NULL,
    apellidos varchar(50) NOT NULL,
    dni varchar(9),
    fecha_nacimiento datetime NOT NULL,
    sexo varchar(1) NOT NULL,
    telefono varchar(9) NOT NULL UNIQUE,
    direccion varchar(50) NOT NULL
);

create table doctores (
    cod_doctor varchar(15) primary key,
    nombre varchar(50) NOT NULL,
    apellidos varchar(50) NOT NULL,
    dni varchar(9) NOT NULL UNIQUE,
    fecha_nacimiento datetime NOT NULL,
    especialidad varchar(50) default 'pediatria' NOT NULL,
    telefono varchar(9) NOT NULL,
    direccion varchar(50) NOT NULL
);

create table citas (
    cod_cita varchar(15) NOT NULL primary key,
    cod_paciente varchar(15) NOT NULL,
    cod_doctor varchar(15) NOT NULL,
    fecha_hora_cita datetime NOT NULL,
    tipo_cita varchar(50) default 'consulta' NOT NULL,
    observaciones varchar(100),
    constraint fk_paciente_cita foreign key (cod_paciente) references pacientes(cod_paciente),
    constraint fk_doctor_cita foreign key (cod_doctor) references doctores(cod_doctor)
);

-- Insercción de registros:

-- Tabla pacientes

insert into pacientes values ('ABCD1234', 'Juan', 'Pérez', '11111111A', STR_TO_DATE('12/11/1987', '%d/%m/%Y'), 'H', '611111111', 'C/Antonio, 1, Madrid');
insert into pacientes values ('EFGH5678', 'María', 'García', '22222222B', STR_TO_DATE('05/01/1972', '%d/%m/%Y'), 'M', '911111111', 'C/Felipe, 6, Sevilla');
insert into pacientes values ('IJKL9012', 'Pedro', 'Rodríguez', '33333333C', STR_TO_DATE('12/12/1955', '%d/%m/%Y'), 'H', '772934423', 'C/Juan, 2, Cáceres');
insert into pacientes values ('LMNO3456', 'Ana', 'López', '44444444D', STR_TO_DATE('04/05/1993', '%d/%m/%Y'), 'M', '917837213', 'C/Isabel II, 2, Barcelona');

-- Tabla doctores

insert into doctores values ('DCBA4321', 'Paco', 'Gómez', '22555555B', STR_TO_DATE('22/09/1968', '%d/%m/%Y'), 'cardiologia', '686748423', 'C/Antonio, 1, Madrid');
insert into doctores values ('HGFE5678', 'Luisa', 'Pacheco', '32982333C', STR_TO_DATE('14/07/1991', '%d/%m/%Y'), 'ginecologia', '683923578', 'C/Ciervo, 2, Murcia');
insert into doctores values ('LKJI9012', 'Juan', 'López', '49234644D', STR_TO_DATE('11/03/1989', '%d/%m/%Y'), 'neurologia', '974637534', 'C/Fiesta, 34, Sevilla');
insert into doctores values ('ONML3456', 'Ana', 'García', '56789012E', STR_TO_DATE('12/12/1955', '%d/%m/%Y'), 'psiquiatria', '625434111', 'C/Isabel II, 25, Barcelona');

-- Tabla citas

insert into citas values ('CITA1', 'ABCD1234', 'DCBA4321', STR_TO_DATE('02/10/2022 09:01:00', '%d/%m/%Y %H:%i:%s'), 'consulta', 'Consulta de prueba');
insert into citas values ('CITA2', 'EFGH5678', 'DCBA4321', STR_TO_DATE('03/10/2022 09:32:00', '%d/%m/%Y %H:%i:%s'), 'control', 'Consulta de prueba');
insert into citas values ('CITA3', 'IJKL9012', 'HGFE5678', STR_TO_DATE('04/10/2022 09:33:00', '%d/%m/%Y %H:%i:%s'), 'tratamiento', 'Consulta de prueba');
