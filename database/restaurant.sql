/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     22/12/2020 1:34:09 PM                        */
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
   BILL_ID              int not null,
   ID                   int not null,
   USER_ID              int not null,
   CREATEDDATE          date,
   primary key (BILL_ID)
);

/*==============================================================*/
/* Table: BILL_DETAILS                                          */
/*==============================================================*/
create table BILL_DETAILS
(
   BDETAIL_ID           int not null,
   BILL_ID              int not null,
   MENU_ID              int not null,
   AMOUNT               int,
   UNITPRICE            varchar(4),
   primary key (BDETAIL_ID)
);

/*==============================================================*/
/* Table: DESKS_ROOMS                                           */
/*==============================================================*/
create table DESKS_ROOMS
(
   ID                   int not null,
   GROUP_ID             int not null,
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
   GROUP_ID             int not null,
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
   GUEST_ID             int not null,
   BILL_ID              int not null,
   NAME                 varchar(15) not null,
   PHONE                varchar(15),
   primary key (GUEST_ID)
);

/*==============================================================*/
/* Table: MATERIALS                                             */
/*==============================================================*/
create table MATERIALS
(
   STORE_ID             int not null,
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
   MENU_ID              int not null,
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
   MATERIAL_ID          int not null,
   MENU_ID              int not null,
   STORE_ID             int not null,
   NUMBER               int not null,
   primary key (MATERIAL_ID)
);

/*==============================================================*/
/* Table: STAFFS                                                */
/*==============================================================*/
create table STAFFS
(
   STAFF_ID             int not null,
   USER_ID              int,
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
   USER_ID              int not null,
   STAFF_ID             int not null,
   USERNAME             varchar(30) not null,
   PASSWORD             varchar(30) not null,
   POSITION             int not null,
   primary key (USER_ID)
);

alter table BILLS add constraint FK_CREATED foreign key (USER_ID)
      references USERS (USER_ID) on delete restrict on update restrict;

alter table BILLS add constraint FK_FK_BILL_DESK foreign key (ID)
      references DESKS_ROOMS (ID) on delete restrict on update restrict;

alter table BILL_DETAILS add constraint FK_BELONGTO foreign key (MENU_ID)
      references MENU (MENU_ID) on delete restrict on update restrict;

alter table BILL_DETAILS add constraint FK_FK_BILL_DETAIL foreign key (BILL_ID)
      references BILLS (BILL_ID) on delete restrict on update restrict;

alter table DESKS_ROOMS add constraint FK_IN foreign key (GROUP_ID)
      references DESKS_ROOMS_GROUPS (GROUP_ID) on delete restrict on update restrict;

alter table GUESTS add constraint FK_PAY foreign key (BILL_ID)
      references BILLS (BILL_ID) on delete restrict on update restrict;

alter table MENU_MATERIALS add constraint FK_INCLUDE foreign key (MENU_ID)
      references MENU (MENU_ID) on delete restrict on update restrict;

alter table MENU_MATERIALS add constraint FK_IS foreign key (STORE_ID)
      references MATERIALS (STORE_ID) on delete restrict on update restrict;

alter table STAFFS add constraint FK_HAS2 foreign key (USER_ID)
      references USERS (USER_ID) on delete restrict on update restrict;

alter table USERS add constraint FK_HAS foreign key (STAFF_ID)
      references STAFFS (STAFF_ID) on delete restrict on update restrict;

