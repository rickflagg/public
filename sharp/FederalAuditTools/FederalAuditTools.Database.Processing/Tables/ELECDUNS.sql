DROP TABLE ELECDUNS CASCADE CONSTRAINTS;

CREATE TABLE ELECDUNS
(
  REPORTID    NUMBER(12)                        NOT NULL,
  AUDITYEAR   VARCHAR2(4 BYTE)                  NOT NULL,
  SEQNUM      VARCHAR2(4 BYTE),
  PASS_FLAG   VARCHAR2(1 BYTE),
  DUNS        VARCHAR2(9 BYTE),
  MAIN_DUNS   VARCHAR2(9 BYTE),
  VERSION     NUMBER(2),
  ELECDUNSID  NUMBER
)
TABLESPACE TS_SAP
RESULT_CACHE (MODE DEFAULT)
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

