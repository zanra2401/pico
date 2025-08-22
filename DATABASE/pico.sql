/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     22/08/2025 09:01:34                          */
/*==============================================================*/


drop table if exists BOARDLIST;

drop table if exists CHAT;

drop table if exists FOLLOWERS;

drop table if exists FOLLOWING_FOLLOWERS;

drop table if exists IMAGE;

drop table if exists KOMENTAR;

drop table if exists LIKE_IMAGE;

drop table if exists USER;

/*==============================================================*/
/* Table: BOARDLIST                                             */
/*==============================================================*/
create table BOARDLIST
(
   ID_BOARD             int not null,
   ID_USER              int,
   ID_IMAGE             int,
   NAMA_BOARD           varchar(255),
   IMAGE_ID             int,
   USER_ID              int,
   primary key (ID_BOARD)
);

/*==============================================================*/
/* Table: CHAT                                                  */
/*==============================================================*/
create table CHAT
(
   ID_CHAT              int not null,
   ID_USER              int,
   PENERIMA_ID          int,
   PENGIRIM_ID          int,
   ISI_CHAT             text,
   IS_READ              bool,
   primary key (ID_CHAT)
);

/*==============================================================*/
/* Table: FOLLOWERS                                             */
/*==============================================================*/
create table FOLLOWERS
(
   ID_FOLLOWERS         int not null,
   FOLLOWER_ID          int,
   FOLLOWING_ID         int,
   primary key (ID_FOLLOWERS)
);

/*==============================================================*/
/* Table: FOLLOWING_FOLLOWERS                                   */
/*==============================================================*/
create table FOLLOWING_FOLLOWERS
(
   ID_FOLLOWERS         int not null,
   ID_USER              int not null,
   primary key (ID_FOLLOWERS, ID_USER)
);

/*==============================================================*/
/* Table: IMAGE                                                 */
/*==============================================================*/
create table IMAGE
(
   ID_IMAGE             int not null,
   ID_USER              int,
   USER_ID              int,
   JUDUL_GAMBAR         varchar(255),
   DESKRIPSI_GAMBAR     text,
   UPLOAD_AT            datetime,
   PATH_IMAGE           varchar(255),
   primary key (ID_IMAGE)
);

/*==============================================================*/
/* Table: KOMENTAR                                              */
/*==============================================================*/
create table KOMENTAR
(
   ID_KOMENTAR          int not null,
   ID_IMAGE             int,
   ID_USER              int,
   USER_ID              int,
   IMAGE_ID             int,
   ISI_KOMEN            text,
   CREATED_AT           datetime,
   primary key (ID_KOMENTAR)
);

/*==============================================================*/
/* Table: LIKE_IMAGE                                            */
/*==============================================================*/
create table LIKE_IMAGE
(
   ID_LIKEIMAGE         int not null,
   ID_IMAGE             int,
   ID_USER              int,
   USER_ID              int,
   IMAGE_ID             int,
   CREATED_AT           datetime,
   primary key (ID_LIKEIMAGE)
);

/*==============================================================*/
/* Table: USER                                                  */
/*==============================================================*/
create table USER
(
   ID_USER              int not null,
   NAMA_USER            varchar(255),
   PASSWORD             varchar(125),
   PATH_PROFILE         varchar(255),
   USERNAME             varchar(20),
   EMAIL_USER           varchar(255),
   CREATED_AT           datetime,
   DELETE_AT            datetime,
   BIO                  text,
   primary key (ID_USER)
);

alter table BOARDLIST add constraint FK_DISIMPAN foreign key (ID_IMAGE)
      references IMAGE (ID_IMAGE) on delete restrict on update restrict;

alter table BOARDLIST add constraint FK_MENYIMPAN foreign key (ID_USER)
      references USER (ID_USER) on delete restrict on update restrict;

alter table CHAT add constraint FK_MENGCHAT foreign key (ID_USER)
      references USER (ID_USER) on delete restrict on update restrict;

alter table FOLLOWING_FOLLOWERS add constraint FK_FOLLOWING_FOLLOWERS foreign key (ID_FOLLOWERS)
      references FOLLOWERS (ID_FOLLOWERS) on delete restrict on update restrict;

alter table FOLLOWING_FOLLOWERS add constraint FK_FOLLOWING_FOLLOWERS2 foreign key (ID_USER)
      references USER (ID_USER) on delete restrict on update restrict;

alter table IMAGE add constraint FK_UPLOAD foreign key (ID_USER)
      references USER (ID_USER) on delete restrict on update restrict;

alter table KOMENTAR add constraint FK_BERKOMENTAR foreign key (ID_USER)
      references USER (ID_USER) on delete restrict on update restrict;

alter table KOMENTAR add constraint FK_DIKOMENTAR foreign key (ID_IMAGE)
      references IMAGE (ID_IMAGE) on delete restrict on update restrict;

alter table LIKE_IMAGE add constraint FK_DISUKAI foreign key (ID_IMAGE)
      references IMAGE (ID_IMAGE) on delete restrict on update restrict;

alter table LIKE_IMAGE add constraint FK_MENYUKAI foreign key (ID_USER)
      references USER (ID_USER) on delete restrict on update restrict;

