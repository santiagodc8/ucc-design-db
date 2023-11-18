/*==============================================================*/
/* DBMS name:      ORACLE Version 10gR2                         */
/* Created on:     10/18/2023 4:42:17 PM                        */
/*==============================================================*/


ALTER TABLE AEROLINEA
   DROP CONSTRAINT FK_AEROLINE_PASAJES;

DROP TABLE AEROLINEA CASCADE CONSTRAINTS;

DROP TABLE PASAJES CASCADE CONSTRAINTS;

/*==============================================================*/
/* Table: AEROLINEA                                             */
/*==============================================================*/
CREATE TABLE AEROLINEA  (
   ID                   NUMERIC(20)                     NOT NULL,
   VUELOS               NUMBER(6)                       NOT NULL,
   RUTAS                VARCHAR(10),
   CONSTRAINT PK_AEROLINEA PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: PASAJES                                               */
/*==============================================================*/
CREATE TABLE PASAJES  (
   ID                   NUMERIC(10)                     NOT NULL,
   FECHA_VUELO          TIMESTAMP WITH TIME ZONE        NOT NULL,
   FECHA_COMPRA         TIMESTAMP WITH TIME ZONE,
   PASAJERO             NUMBER(12)                      NOT NULL,
   VALOR                DECIMAL(12, 2),
   CONSTRAINT PK_PASAJES PRIMARY KEY (ID)
);

ALTER TABLE AEROLINEA
   ADD CONSTRAINT FK_AEROLINE_PASAJES FOREIGN KEY (ID)
      REFERENCES PASAJES (ID);

