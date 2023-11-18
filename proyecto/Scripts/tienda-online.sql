/*==============================================================*/
/* DBMS name:      ORACLE Version 10gR2                         */
/* Created on:     11/18/2023 12:07:47 AM                       */
/*==============================================================*/


/*==============================================================*/
/* Table: CATEGORIA                                             */
/*==============================================================*/
CREATE TABLE CATEGORIA  (
   ID_CATEGORIA         INTEGER                         NOT NULL,
   ID_PEDIDO            INTEGER,
   FECHA_PEDIDO         TIMESTAMP WITH LOCAL TIME ZONE,
   NOMBRE               VARCHAR(255)                    NOT NULL,
   CONSTRAINT PK_CATEGORIA PRIMARY KEY (ID_CATEGORIA)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
CREATE TABLE CLIENTE  (
   ID_CLIENTE           NUMBER(50)                      NOT NULL,
   NOMBRE               CHARACTER(50)                   NOT NULL,
   DIRECCION            VARCHAR(50)                     NOT NULL,
   CORREO_ELECTRONICO   VARCHAR(70)                     NOT NULL,
   CONSTRAINT PK_CLIENTE PRIMARY KEY (ID_CLIENTE)
);

/*==============================================================*/
/* Table: DETALLE_PEDIDO                                        */
/*==============================================================*/
CREATE TABLE DETALLE_PEDIDO  (
   ID_DETALLE_PEDIDO    INTEGER                         NOT NULL,
   ID_PEDIDO            INTEGER,
   FECHA_PEDIDO         TIMESTAMP WITH LOCAL TIME ZONE,
   ID_CLIENTE           INTEGER,
   ID_PRODUCTO          INTEGER,
   PRECIO               FLOAT(15),
   CONSTRAINT PK_DETALLE_PEDIDO PRIMARY KEY (ID_DETALLE_PEDIDO)
);

/*==============================================================*/
/* Table: ESTADO_PEDIDO                                         */
/*==============================================================*/
CREATE TABLE ESTADO_PEDIDO  (
   ID_ESTADO_PEDIDO     INTEGER                         NOT NULL,
   ID_PEDIDO            INTEGER,
   FECHA_PEDIDO         TIMESTAMP WITH LOCAL TIME ZONE,
   CONSTRAINT PK_ESTADO_PEDIDO PRIMARY KEY (ID_ESTADO_PEDIDO)
);

/*==============================================================*/
/* Table: HISTORIAL_COMPRAS                                     */
/*==============================================================*/
CREATE TABLE HISTORIAL_COMPRAS  (
   ID_HISTORIAL_COMPRAS NUMBER(15)                      NOT NULL,
   ID_PRODUCTO          NUMBER(50),
   ID_CLIENTE           NUMBER(50),
   ID_PEDIDO            INTEGER,
   FECHA_PEDIDO         TIMESTAMP WITH LOCAL TIME ZONE,
   PRECIO               FLOAT(15)                       NOT NULL,
   CONSTRAINT PK_HISTORIAL_COMPRAS PRIMARY KEY (ID_HISTORIAL_COMPRAS)
);

/*==============================================================*/
/* Table: PEDIDO                                                */
/*==============================================================*/
CREATE TABLE PEDIDO  (
   ID_PEDIDO            INTEGER                         NOT NULL,
   ID_CLIENTE           INTEGER,
   FECHA_PEDIDO         TIMESTAMP WITH LOCAL TIME ZONE  NOT NULL,
   PRODUCTOS            VARCHAR(255)                    NOT NULL,
   CONSTRAINT PK_PEDIDO PRIMARY KEY (ID_PEDIDO, FECHA_PEDIDO)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
CREATE TABLE PRODUCTO  (
   ID_PRODUCTO          NUMBER(50)                      NOT NULL,
   NOMBRE               VARCHAR(50)                     NOT NULL,
   PRECIO               FLOAT(15)                       NOT NULL,
   CONSTRAINT PK_PRODUCTO PRIMARY KEY (ID_PRODUCTO, PRECIO)
);

ALTER TABLE CATEGORIA
   ADD CONSTRAINT FK_CATEGORI_REFERENCE_PEDIDO FOREIGN KEY (ID_PEDIDO)
      REFERENCES PEDIDO (ID_PEDIDO);

ALTER TABLE DETALLE_PEDIDO
   ADD CONSTRAINT FK_DETALLE__REFERENCE_PEDIDO FOREIGN KEY (ID_PEDIDO, FECHA_PEDIDO)
      REFERENCES PEDIDO (ID_PEDIDO, FECHA_PEDIDO);

ALTER TABLE DETALLE_PEDIDO
   ADD CONSTRAINT FK_DETALLE__REFERENCE_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE);

ALTER TABLE DETALLE_PEDIDO
   ADD CONSTRAINT FK_DETALLE__REFERENCE_PRODUCTO FOREIGN KEY (ID_PRODUCTO, PRECIO)
      REFERENCES PRODUCTO (ID_PRODUCTO, PRECIO);

ALTER TABLE ESTADO_PEDIDO
   ADD CONSTRAINT FK_ESTADO_P_REFERENCE_PEDIDO FOREIGN KEY (ID_PEDIDO, FECHA_PEDIDO)
      REFERENCES PEDIDO (ID_PEDIDO, FECHA_PEDIDO);

ALTER TABLE HISTORIAL_COMPRAS
   ADD CONSTRAINT FK_HISTORIA_REFERENCE_PRODUCTO FOREIGN KEY (ID_PRODUCTO, PRECIO)
      REFERENCES PRODUCTO (ID_PRODUCTO, PRECIO);

ALTER TABLE HISTORIAL_COMPRAS
   ADD CONSTRAINT FK_HISTORIA_REFERENCE_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE);

ALTER TABLE HISTORIAL_COMPRAS
   ADD CONSTRAINT FK_HISTORIA_REFERENCE_PEDIDO FOREIGN KEY (ID_PEDIDO, FECHA_PEDIDO)
      REFERENCES PEDIDO (ID_PEDIDO, FECHA_PEDIDO);

ALTER TABLE PEDIDO
   ADD CONSTRAINT FK_PEDIDO_REFERENCE_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE);

