CREATE TABLE usuarios (
    id_Usuarios VARCHAR2(10),
    nombre VARCHAR(100),
    email VARCHAR(100),
    contrasenya VARCHAR(255) NOT NULL,
    fecha_registro DATE,
    CONSTRAINT PK_usuarios_id_usuarios PRIMARY KEY (id_Usuarios)
);

CREATE TABLE eventos (
    id_eventos VARCHAR2(10),
    nombre VARCHAR(100),
    fecha DATE ,
    ubicacion VARCHAR(255) ,
    precio DECIMAL(10,2),
    CONSTRAINT PK_eventos_id_eventos PRIMARY KEY (id_eventos)
);

CREATE TABLE entradas (
    id_entradas VARCHAR2(10),
    nombre VARCHAR(100),
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
    nombre VARCHAR(255) NOT NULL,
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