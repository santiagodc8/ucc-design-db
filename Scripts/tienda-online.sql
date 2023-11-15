/*==============================================================*/
/* DBMS name:      ORACLE Version 10gR2                         */
/* Created on:     11/15/2023 1:24:12 PM                        */
/*==============================================================*/

-- Desactivar restricciones de clave externa antes de eliminar tablas
ALTER TABLE CATEGORIA
   DROP CONSTRAINT FK_CATEGORI_REFERENCE_PEDIDO;

ALTER TABLE DETALLE_PEDIDO
   DROP CONSTRAINT FK_DETALLE__REFERENCE_PEDIDO;

ALTER TABLE DETALLE_PEDIDO
   DROP CONSTRAINT FK_DETALLE__REFERENCE_CLIENTE;

ALTER TABLE DETALLE_PEDIDO
   DROP CONSTRAINT FK_DETALLE__REFERENCE_PRODUCTO;

ALTER TABLE ESTADO_PEDIDO
   DROP CONSTRAINT FK_ESTADO_P_REFERENCE_PEDIDO;

ALTER TABLE PEDIDO
   DROP CONSTRAINT FK_PEDIDO_REFERENCE_CLIENTE;

-- Eliminar tablas en orden inverso (tablas hijas primero)
DROP TABLE ESTADO_PEDIDO CASCADE CONSTRAINTS;

DROP TABLE DETALLE_PEDIDO CASCADE CONSTRAINTS;

DROP TABLE CATEGORIA CASCADE CONSTRAINTS;

DROP TABLE PRODUCTO CASCADE CONSTRAINTS;

DROP TABLE PEDIDO CASCADE CONSTRAINTS;

DROP TABLE CLIENTE CASCADE CONSTRAINTS;

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
CREATE TABLE CLIENTE  (
   ID_CLIENTE           INTEGER                         NOT NULL,
   NOMBRE               VARCHAR(50)                     NOT NULL,
   DIRECCION            VARCHAR(50)                     NOT NULL,
   CORREO_ELECTRONICO   VARCHAR(70)                     NOT NULL,
   CONSTRAINT PK_CLIENTE PRIMARY KEY (ID_CLIENTE)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
CREATE TABLE PRODUCTO  (
   ID_PRODUCTO          INTEGER                         NOT NULL,
   NOMBRE               VARCHAR(50)                     NOT NULL,
   DESCRIPCION          VARCHAR(256)                    NOT NULL,
   PRECIO               FLOAT(15)                       NOT NULL,
   IMAGEN               VARCHAR(255)                    NOT NULL,
   CONSTRAINT PK_PRODUCTO PRIMARY KEY (ID_PRODUCTO)
);

/*==============================================================*/
/* Table: PEDIDO                                                */
/*==============================================================*/
CREATE TABLE PEDIDO  (
   ID_PEDIDO            INTEGER                         NOT NULL,
   ID_CLIENTE           INTEGER,
   FECHA_PEDIDO         TIMESTAMP WITH LOCAL TIME ZONE  NOT NULL,
   PRODUCTOS            VARCHAR(255)                    NOT NULL,
   CONSTRAINT PK_PEDIDO PRIMARY KEY (ID_PEDIDO),
   CONSTRAINT FK_PEDIDO_REFERENCE_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE)
);

/*==============================================================*/
/* Table: DETALLE_PEDIDO                                        */
/*==============================================================*/
CREATE TABLE DETALLE_PEDIDO  (
   ID_DETALLE_PEDIDO    INTEGER                         NOT NULL,
   ID_PEDIDO            INTEGER,
   ID_CLIENTE           INTEGER,
   ID_PRODUCTO          INTEGER,
   CONSTRAINT PK_DETALLE_PEDIDO PRIMARY KEY (ID_DETALLE_PEDIDO),
   CONSTRAINT FK_DETALLE__REFERENCE_PEDIDO FOREIGN KEY (ID_PEDIDO)
      REFERENCES PEDIDO (ID_PEDIDO),
   CONSTRAINT FK_DETALLE__REFERENCE_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE),
   CONSTRAINT FK_DETALLE__REFERENCE_PRODUCTO FOREIGN KEY (ID_PRODUCTO)
      REFERENCES PRODUCTO (ID_PRODUCTO)
);

/*==============================================================*/
/* Table: ESTADO_PEDIDO                                         */
/*==============================================================*/
CREATE TABLE ESTADO_PEDIDO  (
   ID_ESTADO_PEDIDO     INTEGER                         NOT NULL,
   ID_PEDIDO            INTEGER,
   NOMBRE               VARCHAR(255)                    NOT NULL,
   DESCRPCION           VARCHAR(255)                    NOT NULL,
   CONSTRAINT PK_ESTADO_PEDIDO PRIMARY KEY (ID_ESTADO_PEDIDO),
   CONSTRAINT FK_ESTADO_P_REFERENCE_PEDIDO FOREIGN KEY (ID_PEDIDO)
      REFERENCES PEDIDO (ID_PEDIDO)
);

/*==============================================================*/
/* Table: CATEGORIA                                             */
/*==============================================================*/
CREATE TABLE CATEGORIA  (
   ID_CATEGORIA         INTEGER                         NOT NULL,
   ID_PEDIDO            INTEGER,
   NOMBRE               VARCHAR(255)                    NOT NULL,
   DESCRIPCION          VARCHAR(255)                    NOT NULL,
   CONSTRAINT PK_CATEGORIA PRIMARY KEY (ID_CATEGORIA),
   CONSTRAINT FK_CATEGORI_REFERENCE_PEDIDO FOREIGN KEY (ID_PEDIDO)
      REFERENCES PEDIDO (ID_PEDIDO)
);
