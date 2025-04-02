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
    fecha DATE ,
    ubicacion VARCHAR2(255) ,
    precio DECIMAL(10,2),
    destacado BOOLEAN,
    imagen LONGBLOB,
    tipo VARCHAR2(50),
    CONSTRAINT PK_eventos_id_eventos PRIMARY KEY (id_eventos)
    CONSTRAINT CK_tipos_evento CHECK(tipo in('Concierto', 'Teatro', 'Evento', 'Festival')),
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
    CONSTRAINT FK_pagos_id_eventos FOREIGN KEY (id_eventos) REFERENCES entradas,
    CONSTRAINT CK_pagos_metodo_pago CHECK(metodo_pago in('Tarjeta', 'PayPal', 'Criptomoneda', 'Transferencia')),
    CONSTRAINT CK_pagos_estado CHECK(estado in('Completado', 'Fallido', 'Pendiente'))
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

    CONSTRAINT PK_unirse_id_grupos_usuarios PRIMARY KEY (id_grupos_usuarios,id_usuarios),
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
INSERT INTO eventos VALUES ('E001', 'Melendi', TO_DATE('2024-05-10', 'YYYY-MM-DD'), 'Madrid', 50.00, TRUE, 'melendi.jpg', 'Concierto');
INSERT INTO eventos VALUES ('E002', 'Shakira', TO_DATE('2024-06-15', 'YYYY-MM-DD'), 'Barcelona', 70.00, TRUE, 'shakira.jpg', 'Concierto');
INSERT INTO eventos VALUES ('E003', 'Queen Tribute', TO_DATE('2024-07-20', 'YYYY-MM-DD'), 'Valencia', 30.00, FALSE, 'queen.jpg', 'Concierto');
INSERT INTO eventos VALUES ('E004', 'Metallica', TO_DATE('2024-08-05', 'YYYY-MM-DD'), 'Sevilla', 90.00, TRUE, 'metallica.jpg', 'Concierto');
INSERT INTO eventos VALUES ('E005', 'Coldplay', TO_DATE('2024-09-12', 'YYYY-MM-DD'), 'Bilbao', 80.00, TRUE, 'coldplay.jpg', 'Concierto');
INSERT INTO eventos VALUES ('E006', 'Hamlet', TO_DATE('2024-05-18', 'YYYY-MM-DD'), 'Madrid', 40.00, FALSE, 'hamlet.jpg', 'Teatro');
INSERT INTO eventos VALUES ('E007', 'El Rey León', TO_DATE('2024-06-25', 'YYYY-MM-DD'), 'Barcelona', 60.00, TRUE, 'rey_leon.jpg', 'Teatro');
INSERT INTO eventos VALUES ('E008', 'La Casa de Bernarda Alba', TO_DATE('2024-07-15', 'YYYY-MM-DD'), 'Sevilla', 35.00, FALSE, 'bernarda.jpg', 'Teatro');
INSERT INTO eventos VALUES ('E009', 'Don Juan Tenorio', TO_DATE('2024-08-10', 'YYYY-MM-DD'), 'Valencia', 45.00, TRUE, 'donjuan.jpg', 'Teatro');
INSERT INTO eventos VALUES ('E010', 'Romeo y Julieta', TO_DATE('2024-09-20', 'YYYY-MM-DD'), 'Granada', 50.00, FALSE, 'romeo_julieta.jpg', 'Teatro');
INSERT INTO eventos VALUES ('E011', 'Comic Con', TO_DATE('2024-06-10', 'YYYY-MM-DD'), 'Madrid', 25.00, TRUE, 'comiccon.jpg', 'Evento');
INSERT INTO eventos VALUES ('E012', 'Feria del Libro', TO_DATE('2024-07-05', 'YYYY-MM-DD'), 'Barcelona', 15.00, FALSE, 'ferialibro.jpg', 'Evento');
INSERT INTO eventos VALUES ('E013', 'Gaming Expo', TO_DATE('2024-08-12', 'YYYY-MM-DD'), 'Sevilla', 35.00, TRUE, 'gamingexpo.jpg', 'Evento');
INSERT INTO eventos VALUES ('E014', 'Feria de Ciencia', TO_DATE('2024-09-01', 'YYYY-MM-DD'), 'Valencia', 20.00, FALSE, 'feriaciencia.jpg', 'Evento');
INSERT INTO eventos VALUES ('E015', 'Auto Show', TO_DATE('2024-10-15', 'YYYY-MM-DD'), 'Bilbao', 40.00, TRUE, 'autoshow.jpg', 'Evento');
INSERT INTO eventos VALUES ('E016', 'Tomorrowland', TO_DATE('2024-07-20', 'YYYY-MM-DD'), 'Bélgica', 200.00, TRUE, 'tomorrowland.jpg', 'Festival');
INSERT INTO eventos VALUES ('E017', 'Coachella', TO_DATE('2024-04-15', 'YYYY-MM-DD'), 'California', 300.00, TRUE, 'coachella.jpg', 'Festival');
INSERT INTO eventos VALUES ('E018', 'Glastonbury', TO_DATE('2024-06-25', 'YYYY-MM-DD'), 'Reino Unido', 250.00, TRUE, 'glastonbury.jpg', 'Festival');
INSERT INTO eventos VALUES ('E019', 'Rock in Rio', TO_DATE('2024-09-10', 'YYYY-MM-DD'), 'Brasil', 220.00, FALSE, 'rockinrio.jpg', 'Festival');
INSERT INTO eventos VALUES ('E020', 'Lollapalooza', TO_DATE('2024-08-05', 'YYYY-MM-DD'), 'Argentina', 180.00, TRUE, 'lollapalooza.jpg', 'Festival');

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





