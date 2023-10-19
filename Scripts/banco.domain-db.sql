/*==============================================================*/
/* DBMS name:      ORACLE Version 10gR2                         */
/* Created on:     10/12/2023 2:38:12 PM                        */
/*==============================================================*/


ALTER TABLE CUENTA_LOGS
   DROP CONSTRAINT FK_CUENTA_LOGS_REF_CUENTA;

DROP TABLE CUENTA CASCADE CONSTRAINTS;

DROP TABLE CUENTA_LOGS CASCADE CONSTRAINTS;

/*==============================================================*/
/* Table: CUENTA                                                */
/*==============================================================*/
CREATE TABLE CUENTA  (
   ID                   NUMERIC(10)                     NOT NULL,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE        NOT NULL,
   FECHA_ACTUALIZACIO   TIMESTAMP WITH TIME ZONE,
   SALDO                DECIMAL(12, 2)                  NOT NULL,
   USUARIO              VARCHAR(10),
   IP                   VARCHAR(15),
   CONSTRAINT PK_CUENTA PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: CUENTA_LOGS                                           */
/*==============================================================*/
CREATE TABLE CUENTA_LOGS  (
   ID                   NUMERIC(20)                     NOT NULL,
   FECHA_HORA           TIMESTAMP WITH TIME ZONE,
   CUENTA_ID            NUMERIC(10)                     NOT NULL,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE        NOT NULL,
   FECHA_ACTUALIZACIO   TIMESTAMP WITH TIME ZONE,
   SALDO                DECIMAL(12, 2)                  NOT NULL,
   USUARIO              VARCHAR(10),
   IP                   VARCHAR(15),
   CONSTRAINT PK_CUENTA_LOGS PRIMARY KEY (ID)
);

ALTER TABLE CUENTA_LOGS
   ADD CONSTRAINT FK_CUENTA_LOGS_REF_CUENTA FOREIGN KEY (CUENTA_ID)
      REFERENCES CUENTA (ID);

