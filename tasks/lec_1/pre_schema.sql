-- Скрипт создания таблиц и накачки данными
-- для задания 1
create table fw_identifiers
(
  id_identifier         NUMBER(10) not null,
  v_identifier_type     VARCHAR2(255),
  v_value               VARCHAR2(128 CHAR) not null,
  v_status              CHAR(1 CHAR) default 'N' not null,
  b_deleted             NUMBER(1) default 0 not null,
  v_ext_ident           VARCHAR2(20 CHAR)
)
/
insert into fw_identifiers(id_identifier, v_identifier_type, v_value, v_status, b_deleted, v_ext_ident)
  select 2000 + rownum, 'Тип ' || trunc(dbms_random.value(1, 6)), '00801' || 1000 + rownum, 'N', 0, to_char(rownum)
	from dual connect by level <= 100
/
