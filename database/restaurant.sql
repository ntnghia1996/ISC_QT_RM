/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     18/12/2020 1:57:57 PM                        */
/*==============================================================*/


drop table if exists BILLS;

drop table if exists BILL_DETAILS;

drop table if exists DESKS_ROOMS;

drop table if exists DESKS_ROOMS_GROUPS;

drop table if exists GUESTS;

drop table if exists MATERIALS;

drop table if exists MENU;

drop table if exists MENU_MATERIALS;

drop table if exists STAFFS;

drop table if exists USERS;

/*==============================================================*/
/* Table: BILLS                                                 */
/*==============================================================*/
create table BILLS
(
   BILL_ID              varchar(10) not null,
   ID                   varchar(6) not null,
   USER_ID              varchar(5) not null,
   CREATEDDATE          date,
   primary key (BILL_ID)
);

/*==============================================================*/
/* Table: BILL_DETAILS                                          */
/*==============================================================*/
create table BILL_DETAILS
(
   BDETAIL_ID           varchar(11) not null,
   BILL_ID              varchar(10) not null,
   MENU_ID              varchar(5) not null,
   AMOUNT               int,
   UNITPRICE            varchar(4),
   primary key (BDETAIL_ID)
);

/*==============================================================*/
/* Table: DESKS_ROOMS                                           */
/*==============================================================*/
create table DESKS_ROOMS
(
   ID                   varchar(6) not null,
   GROUP_ID             varchar(5) not null,
   NAME                 varchar(15) not null,
   NOTE                 varchar(200),
   NUMBEROFSEATS        int not null,
   STATUS               tinyint not null,
   primary key (ID)
);

/*==============================================================*/
/* Table: DESKS_ROOMS_GROUPS                                    */
/*==============================================================*/
create table DESKS_ROOMS_GROUPS
(
   GROUP_ID             varchar(5) not null,
   NAME                 varchar(15) not null,
   NOTE                 varchar(200),
   STATUS               tinyint not null,
   primary key (GROUP_ID)
);

/*==============================================================*/
/* Table: GUESTS                                                */
/*==============================================================*/
create table GUESTS
(
   GUEST_ID             varchar(8) not null,
   BILL_ID              varchar(10) not null,
   NAME                 varchar(15) not null,
   PHONE                varchar(15),
   primary key (GUEST_ID)
);

/*==============================================================*/
/* Table: MATERIALS                                             */
/*==============================================================*/
create table MATERIALS
(
   STORE_ID             varchar(5) not null,
   NAME                 varchar(15) not null,
   NUMBER               int not null,
   STATUS               tinyint not null,
   INPUTDATE            date not null,
   primary key (STORE_ID)
);

/*==============================================================*/
/* Table: MENU                                                  */
/*==============================================================*/
create table MENU
(
   MENU_ID              varchar(5) not null,
   NAME                 varchar(15) not null,
   PRICE                bigint not null,
   DECRIPTION           varchar(300),
   UNIT                 varchar(10) not null,
   TYPE                 tinyint not null,
   STATUS               tinyint not null,
   primary key (MENU_ID)
);

/*==============================================================*/
/* Table: MENU_MATERIALS                                        */
/*==============================================================*/
create table MENU_MATERIALS
(
   MATERIAL_ID          varchar(6) not null,
   MENU_ID              varchar(5) not null,
   STORE_ID             varchar(5) not null,
   NUMBER               int not null,
   primary key (MATERIAL_ID)
);

/*==============================================================*/
/* Table: STAFFS                                                */
/*==============================================================*/
create table STAFFS
(
   STAFF_ID             varchar(5) not null,
   USER_ID              varchar(5),
   NAME                 varchar(15) not null,
   SALARY               bigint not null,
   PHONE                varchar(15) not null,
   ADDRESS              varchar(50),
   primary key (STAFF_ID)
);

/*==============================================================*/
/* Table: USERS                                                 */
/*==============================================================*/
create table USERS
(
   USER_ID              varchar(5) not null,
   STAFF_ID             varchar(5) not null,
   USERNAME             varchar(30) not null,
   PASSWORD             varchar(30) not null,
   POSITION             int not null,
   primary key (USER_ID)
);

alter table BILLS add constraint FK_CREATED foreign key (USER_ID)
      references USERS (USER_ID);

alter table BILLS add constraint FK_FK_BILL_DESK foreign key (ID)
      references DESKS_ROOMS (ID);

alter table BILL_DETAILS add constraint FK_BELONGTO foreign key (MENU_ID)
      references MENU (MENU_ID);

alter table BILL_DETAILS add constraint FK_FK_BILL_DETAIL foreign key (BILL_ID)
      references BILLS (BILL_ID);

alter table DESKS_ROOMS add constraint FK_IN foreign key (GROUP_ID)
      references DESKS_ROOMS_GROUPS (GROUP_ID);

alter table GUESTS add constraint FK_PAY foreign key (BILL_ID)
      references BILLS (BILL_ID);

alter table MENU_MATERIALS add constraint FK_INCLUDE foreign key (MENU_ID)
      references MENU (MENU_ID);

alter table MENU_MATERIALS add constraint FK_IS foreign key (STORE_ID)
      references MATERIALS (STORE_ID);

alter table STAFFS add constraint FK_HAS2 foreign key (USER_ID)
      references USERS (USER_ID);

alter table USERS add constraint FK_HAS foreign key (STAFF_ID)
      references STAFFS (STAFF_ID);

