CREATE TABLE usuarios (
    id_Usuarios VARCHAR2(10),
    nombre VARCHAR2(100),
    email VARCHAR2(100),
    contrasenya VARCHAR2(255) NOT NULL,
    fecha_registro DATE,
    CONSTRAINT PK_usuarios_id_usuarios PRIMARY KEY (id_Usuarios)
);

CREATE TABLE eventos (
    id_eventos VARCHAR2(10),
    nombre VARCHAR2(100),
    fecha VARCHAR2(20),
    ubicacion VARCHAR2(255),
    precio NUMBER(10,2),  
    destacado NUMBER(1),  -- Usamos NUMBER(1) para valores booleanos (1 = TRUE, 0 = FALSE)
    tipo VARCHAR2(50),
    CONSTRAINT PK_eventos_id_eventos PRIMARY KEY (id_eventos),
    CONSTRAINT CK_tipos_evento CHECK(tipo IN ('Concierto', 'Teatro', 'Evento', 'Festival'))
);

CREATE TABLE entradas (
    id_entradas VARCHAR2(10),
    nombre VARCHAR2(100),
    id_usuario VARCHAR2(10),
    id_eventos VARCHAR2(10),
    fecha_compra DATE,
    CONSTRAINT PK_entradas_id_entradas PRIMARY KEY (id_entradas),
    CONSTRAINT FK_entradas_id_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios,
    CONSTRAINT FK_entradas_id_eventos FOREIGN KEY (id_eventos) REFERENCES eventos
);

CREATE TABLE pagos (
    id_pagos VARCHAR2(10),
    id_usuario VARCHAR2(10),
    id_eventos VARCHAR2(10),
    metodo_pago VARCHAR2(50),
    estado VARCHAR2(50),
    CONSTRAINT PK_pagos_id_pagos PRIMARY KEY (id_pagos),
    CONSTRAINT FK_pagos_id_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios,
    CONSTRAINT FK_pagos_id_eventos FOREIGN KEY (id_eventos) REFERENCES eventos, -- Se corrigió aquí
    CONSTRAINT CK_pagos_metodo_pago CHECK(metodo_pago IN ('Tarjeta', 'PayPal', 'Criptomoneda', 'Transferencia')),
    CONSTRAINT CK_pagos_estado CHECK(estado IN ('Completado', 'Fallido', 'Pendiente'))
);

CREATE TABLE grupos (
    id_grupos VARCHAR2(10),
    nombre VARCHAR2(255) NOT NULL,
    descripcion VARCHAR2(255),
    id_eventos VARCHAR2(10),
    creador   VARCHAR2(50),
    CONSTRAINT PK_grupos_id_grupos PRIMARY KEY (id_grupos),
    CONSTRAINT FK_grupos_id_eventos FOREIGN KEY (id_eventos) REFERENCES eventos
);

CREATE TABLE grupo_usuarios (
    id_grupos_usuarios VARCHAR2(10),
    id_grupos VARCHAR2(10),
    id_usuario VARCHAR2(10),
    fecha_union DATE,
    CONSTRAINT PK_grupo_usuarios_id_grupos_usuarios PRIMARY KEY (id_grupos_usuarios),
    CONSTRAINT FK_grupo_usuarios_id_grupos FOREIGN KEY (id_grupos) REFERENCES grupos,
    CONSTRAINT FK_grupo_usuarios_id_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios
);

CREATE TABLE unirse (
    id_grupos_usuarios VARCHAR2(10),
    id_usuarios VARCHAR2(10),
    CONSTRAINT PK_unirse_id_grupos_usuarios PRIMARY KEY (id_grupos_usuarios, id_usuarios),
    CONSTRAINT FK_unirse_id_usuario FOREIGN KEY (id_usuarios) REFERENCES usuarios,
    CONSTRAINT FK_unirse_grupos_usuarios FOREIGN KEY (id_grupos_usuarios) REFERENCES grupo_usuarios
);


-- INSERTS

-- Inserts para la tabla usuarios
INSERT INTO usuarios VALUES ('U001', 'Juan Pérez', 'juanperez@mail.com', 'hashedpassword1', TO_DATE('2024-04-01', 'YYYY-MM-DD'));
INSERT INTO usuarios VALUES ('U002', 'María López', 'marialopez@mail.com', 'hashedpassword2', TO_DATE('2024-03-15', 'YYYY-MM-DD'));
INSERT INTO usuarios VALUES ('U003', 'Carlos Gómez', 'carlosgomez@mail.com', 'hashedpassword3', TO_DATE('2024-02-20', 'YYYY-MM-DD'));
INSERT INTO usuarios VALUES ('U004', 'Laura Torres', 'lauratorres@mail.com', 'hashedpassword4', TO_DATE('2024-03-22', 'YYYY-MM-DD'));
INSERT INTO usuarios VALUES ('U005', 'Pedro Sánchez', 'pedrosanchez@mail.com', 'hashedpassword5', TO_DATE('2024-04-02', 'YYYY-MM-DD'));

-- Inserts para la tabla eventos (Conciertos, Teatro, Eventos, Festivales)
INSERT INTO eventos VALUES ('E001', 'Melendi', '2024-05-10', 'Madrid', 50.00, 1, 'Concierto');
INSERT INTO eventos VALUES ('E002', 'Shakira', '2024-06-15', 'Barcelona', 70.00, 1, 'Concierto');
INSERT INTO eventos VALUES ('E003', 'Queen Tribute', '2024-07-20', 'Valencia', 30.00, 0, 'Concierto');
INSERT INTO eventos VALUES ('E004', 'Metallica', '2024-08-05', 'YYYY-MM-DD'), 'Sevilla', 90.00, 1, 'Concierto');
INSERT INTO eventos VALUES ('E005', 'Coldplay', '2024-09-12', 'Bilbao', 80.00, 1, 'Concierto');
INSERT INTO eventos VALUES ('E006', 'Hamlet', '2024-05-18', 'Madrid', 40.00, 0, 'Teatro');
INSERT INTO eventos VALUES ('E007', 'El Rey León', '2024-06-25', 'Barcelona', 60.00, 0, 'Teatro');
INSERT INTO eventos VALUES ('E008', 'La Casa de Bernarda Alba', '2024-07-15', 'Sevilla', 35.00, 0, 'Teatro');
INSERT INTO eventos VALUES ('E009', 'Don Juan Tenorio', '2024-08-10', 'Valencia', 45.00, 1, 'Teatro');
INSERT INTO eventos VALUES ('E010', 'Romeo y Julieta', '2024-09-20', 'Granada', 50.00, 0, 'Teatro');
INSERT INTO eventos VALUES ('E011', 'Comic Con', '2024-06-10', 'Madrid', 25.00, 0, 'Evento');
INSERT INTO eventos VALUES ('E012', 'Feria del Libro', '2024-07-05', 'Barcelona', 15.00, 0, 'Evento');
INSERT INTO eventos VALUES ('E013', 'Gaming Expo', '2024-08-12', 'Sevilla', 35.00, 1, 'Evento');
INSERT INTO eventos VALUES ('E014', 'Feria de Ciencia', '2024-09-01', 'Valencia', 20.00, 0, 'Evento');
INSERT INTO eventos VALUES ('E015', 'Auto Show', '2024-10-15', 'Bilbao', 40.00, 1, 'Evento');
INSERT INTO eventos VALUES ('E016', 'Tomorrowland', '2024-07-20', 'Bélgica', 200.00, 0, 'Festival');
INSERT INTO eventos VALUES ('E017', 'Coachella', '2024-04-15', 'California', 300.00, 1, 'Festival');
INSERT INTO eventos VALUES ('E018', 'Glastonbury', '2024-06-25', 'Reino Unido', 250.00, 0, 'Festival');
INSERT INTO eventos VALUES ('E019', 'Rock in Rio', '2024-09-10', 'Brasil', 220.00, 0, 'Festival');
INSERT INTO eventos VALUES ('E020', 'Lollapalooza', '2024-08-05', 'Argentina', 180.00, 1, 'Festival');


-- Inserts para la tabla entradas
INSERT INTO entradas VALUES ('EN001', 'Entrada Melendi', 'U001', 'E001', TO_DATE('2024-04-02', 'YYYY-MM-DD'));
INSERT INTO entradas VALUES ('EN002', 'Entrada Shakira', 'U002', 'E002', TO_DATE('2024-04-03', 'YYYY-MM-DD'));
INSERT INTO entradas VALUES ('EN003', 'Entrada Queen Tribute', 'U003', 'E003', TO_DATE('2024-04-04', 'YYYY-MM-DD'));
INSERT INTO entradas VALUES ('EN004', 'Entrada Metallica', 'U004', 'E004', TO_DATE('2024-04-05', 'YYYY-MM-DD'));
INSERT INTO entradas VALUES ('EN005', 'Entrada Coldplay', 'U005', 'E005', TO_DATE('2024-04-06', 'YYYY-MM-DD'));
INSERT INTO entradas VALUES ('EN006', 'Entrada Hamlet', 'U001', 'E006', TO_DATE('2024-04-07', 'YYYY-MM-DD'));
INSERT INTO entradas VALUES ('EN007', 'Entrada El Rey León', 'U002', 'E007', TO_DATE('2024-04-08', 'YYYY-MM-DD'));
INSERT INTO entradas VALUES ('EN008', 'Entrada La Casa de Bernarda Alba', 'U003', 'E008', TO_DATE('2024-04-09', 'YYYY-MM-DD'));
INSERT INTO entradas VALUES ('EN009', 'Entrada Don Juan Tenorio', 'U004', 'E009', TO_DATE('2024-04-10', 'YYYY-MM-DD'));
INSERT INTO entradas VALUES ('EN010', 'Entrada Romeo y Julieta', 'U005', 'E010', TO_DATE('2024-04-11', 'YYYY-MM-DD'));
INSERT INTO entradas VALUES ('EN011', 'Entrada Comic Con', 'U001', 'E011', TO_DATE('2024-04-12', 'YYYY-MM-DD'));
INSERT INTO entradas VALUES ('EN012', 'Entrada Feria del Libro', 'U002', 'E012', TO_DATE('2024-04-13', 'YYYY-MM-DD'));
INSERT INTO entradas VALUES ('EN013', 'Entrada Gaming Expo', 'U003', 'E013', TO_DATE('2024-04-14', 'YYYY-MM-DD'));
INSERT INTO entradas VALUES ('EN014', 'Entrada Feria de Ciencia', 'U004', 'E014', TO_DATE('2024-04-15', 'YYYY-MM-DD'));
INSERT INTO entradas VALUES ('EN015', 'Entrada Auto Show', 'U005', 'E015', TO_DATE('2024-04-16', 'YYYY-MM-DD'));
INSERT INTO entradas VALUES ('EN016', 'Entrada Tomorrowland', 'U001', 'E016', TO_DATE('2024-04-17', 'YYYY-MM-DD'));
INSERT INTO entradas VALUES ('EN017', 'Entrada Coachella', 'U002', 'E017', TO_DATE('2024-04-18', 'YYYY-MM-DD'));
INSERT INTO entradas VALUES ('EN018', 'Entrada Glastonbury', 'U003', 'E018', TO_DATE('2024-04-19', 'YYYY-MM-DD'));
INSERT INTO entradas VALUES ('EN019', 'Entrada Rock in Rio', 'U004', 'E019', TO_DATE('2024-04-20', 'YYYY-MM-DD'));
INSERT INTO entradas VALUES ('EN020', 'Entrada Lollapalooza', 'U005', 'E020', TO_DATE('2024-04-21', 'YYYY-MM-DD'));
