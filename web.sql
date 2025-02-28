/*==============================================================*/
/* Nom de SGBD :  Sybase SQL Anywhere 11                        */
/* Date de création :  27/02/2025 23:40:01                      */
/*==============================================================*/

/*==============================================================*/
/* Table : ANONCE                                               */
/*==============================================================*/
create table ANONCE 
(
   ID_ANNONCE           integer                        not null,
   ID_COUR              integer                        not null,
   ID                   integer                        not null,
   TITRE                varchar(200)                   null,
   CONTENU              long varchar                   null,
   DATE_PUBLICATION     timestamp                      null,
   constraint PK_ANONCE primary key (ID_ANNONCE)
);

/*==============================================================*/
/* Index : ANONCE_PK                                            */
/*==============================================================*/
create unique index ANONCE_PK on ANONCE (
ID_ANNONCE ASC
);

/*==============================================================*/
/* Index : DIFFUSER_FK                                          */
/*==============================================================*/
create index DIFFUSER_FK on ANONCE (
ID_COUR ASC
);

/*==============================================================*/
/* Index : ANONCER_FK                                           */
/*==============================================================*/
create index ANONCER_FK on ANONCE (
ID ASC
);

/*==============================================================*/
/* Table : ASSOCIER                                             */
/*==============================================================*/
create table ASSOCIER 
(
   ID_COUR              integer                        not null,
   ID_RESSOURCE         integer                        not null,
   constraint PK_ASSOCIER primary key (ID_COUR, ID_RESSOURCE)
);

/*==============================================================*/
/* Index : ASSOCIER_PK                                          */
/*==============================================================*/
create unique index ASSOCIER_PK on ASSOCIER (
ID_COUR ASC,
ID_RESSOURCE ASC
);

/*==============================================================*/
/* Index : ASSOCIER2_FK                                         */
/*==============================================================*/
create index ASSOCIER2_FK on ASSOCIER (
ID_COUR ASC
);

/*==============================================================*/
/* Index : ASSOCIER_FK                                          */
/*==============================================================*/
create index ASSOCIER_FK on ASSOCIER (
ID_RESSOURCE ASC
);

/*==============================================================*/
/* Table : CATEGORIE_PUBLICATION                                */
/*==============================================================*/
create table CATEGORIE_PUBLICATION 
(
   ID_CATEGORIE         integer                        not null,
   NOM                  char(50)                       null,
   constraint PK_CATEGORIE_PUBLICATION primary key (ID_CATEGORIE)
);

/*==============================================================*/
/* Index : CATEGORIE_PUBLICATION_PK                             */
/*==============================================================*/
create unique index CATEGORIE_PUBLICATION_PK on CATEGORIE_PUBLICATION (
ID_CATEGORIE ASC
);

/*==============================================================*/
/* Table : COMPTE                                               */
/*==============================================================*/
create table COMPTE 
(
   ID_COMPTE            integer                        not null,
   ID                   integer                        not null,
   EMAIL                varchar(100)                   null,
   MDP                  varchar(100)                   null,
   TYPE_UTILISATEUR     char(50)                       null,
   constraint PK_COMPTE primary key (ID_COMPTE)
);

/*==============================================================*/
/* Index : COMPTE_PK                                            */
/*==============================================================*/
create unique index COMPTE_PK on COMPTE (
ID_COMPTE ASC
);

/*==============================================================*/
/* Index : AVOIR_FK                                             */
/*==============================================================*/
create index AVOIR_FK on COMPTE (
ID ASC
);

/*==============================================================*/
/* Table : CONTACT                                              */
/*==============================================================*/
create table CONTACT 
(
   ID_CONTACT           integer                        not null,
   ID                   integer                        not null,
   ETU_ID               integer                        not null,
   NOM                  char(50)                       null,
   EMAIL                varchar(100)                   null,
   "MESSAGE"            long varchar                   null,
   DATE_ENVOI           timestamp                      null,
   constraint PK_CONTACT primary key (ID_CONTACT)
);

/*==============================================================*/
/* Index : CONTACT_PK                                           */
/*==============================================================*/
create unique index CONTACT_PK on CONTACT (
ID_CONTACT ASC
);

/*==============================================================*/
/* Index : ENVOYER_FK                                           */
/*==============================================================*/
create index ENVOYER_FK on CONTACT (
ETU_ID ASC
);

/*==============================================================*/
/* Index : RECEVOIRE_FK                                         */
/*==============================================================*/
create index RECEVOIRE_FK on CONTACT (
ID ASC
);

/*==============================================================*/
/* Table : COUR                                                 */
/*==============================================================*/
create table COUR 
(
   ID_COUR              integer                        not null,
   ID                   integer                        not null,
   SUJET                varchar(100)                   null,
   DESCRIPTION          long varchar                   null,
   SYLLABUS             long varchar                   null,
   constraint PK_COUR primary key (ID_COUR)
);

/*==============================================================*/
/* Index : COUR_PK                                              */
/*==============================================================*/
create unique index COUR_PK on COUR (
ID_COUR ASC
);

/*==============================================================*/
/* Index : PARTAGER_FK                                          */
/*==============================================================*/
create index PARTAGER_FK on COUR (
ID ASC
);

/*==============================================================*/
/* Table : ETUDIANT                                             */
/*==============================================================*/
create table ETUDIANT 
(
   ID                   integer                        not null,
   NOM                  char(50)                       null,
   PRENOM               char(50)                       null,
   PHOTO_PROFIL         long binary                    null,
   constraint PK_ETUDIANT primary key (ID)
);

/*==============================================================*/
/* Index : ETUDIANT_PK                                          */
/*==============================================================*/
create unique index ETUDIANT_PK on ETUDIANT (
ID ASC
);

/*==============================================================*/
/* Table : FORUM                                                */
/*==============================================================*/
create table FORUM 
(
   ID_FORUM             integer                        not null,
   ID_COUR              integer                        not null,
   constraint PK_FORUM primary key (ID_FORUM)
);

/*==============================================================*/
/* Index : FORUM_PK                                             */
/*==============================================================*/
create unique index FORUM_PK on FORUM (
ID_FORUM ASC
);

/*==============================================================*/
/* Index : CONTENIR_FK                                          */
/*==============================================================*/
create index CONTENIR_FK on FORUM (
ID_COUR ASC
);

/*==============================================================*/
/* Table : INSCRIPTION                                          */
/*==============================================================*/
create table INSCRIPTION 
(
   ID_INSCRIPTION       integer                        not null,
   ID_COUR              integer                        not null,
   ID                   integer                        not null,
   constraint PK_INSCRIPTION primary key (ID_INSCRIPTION)
);

/*==============================================================*/
/* Index : INSCRIPTION_PK                                       */
/*==============================================================*/
create unique index INSCRIPTION_PK on INSCRIPTION (
ID_INSCRIPTION ASC
);

/*==============================================================*/
/* Index : S_INSCRIRE_FK                                        */
/*==============================================================*/
create index S_INSCRIRE_FK on INSCRIPTION (
ID ASC
);

/*==============================================================*/
/* Index : CONCERNER_FK                                         */
/*==============================================================*/
create index CONCERNER_FK on INSCRIPTION (
ID_COUR ASC
);

/*==============================================================*/
/* Table : MESSAGEFORUM                                         */
/*==============================================================*/
create table MESSAGEFORUM 
(
   ID_MESSAGE           integer                        not null,
   ID_FORUM             integer                        not null,
   ID                   integer                        not null,
   CONTENU              long varchar                   null,
   "DATE"               timestamp                      null,
   constraint PK_MESSAGEFORUM primary key (ID_MESSAGE)
);

/*==============================================================*/
/* Index : MESSAGEFORUM_PK                                      */
/*==============================================================*/
create unique index MESSAGEFORUM_PK on MESSAGEFORUM (
ID_MESSAGE ASC
);

/*==============================================================*/
/* Index : ECRIRE_FK                                            */
/*==============================================================*/
create index ECRIRE_FK on MESSAGEFORUM (
ID_FORUM ASC
);

/*==============================================================*/
/* Index : REDIGER_FK                                           */
/*==============================================================*/
create index REDIGER_FK on MESSAGEFORUM (
ID ASC
);

/*==============================================================*/
/* Table : PROFESSEUR                                           */
/*==============================================================*/
create table PROFESSEUR 
(
   ID                   integer                        not null,
   NOM                  char(50)                       null,
   PRENOM               char(50)                       null,
   PHOTO_PROFIL         long binary                    null,
   BIOGRAPHIE           long varchar                   null,
   LIEN_GOOGLE_SCHOLAR  varchar(100)                   null,
   constraint PK_PROFESSEUR primary key (ID)
);

/*==============================================================*/
/* Index : PROFESSEUR_PK                                        */
/*==============================================================*/
create unique index PROFESSEUR_PK on PROFESSEUR (
ID ASC
);

/*==============================================================*/
/* Table : "PUBLICATION"                                        */
/*==============================================================*/
create table "PUBLICATION" 
(
   ID_PUB               integer                        not null,
   ID_CATEGORIE         integer                        not null,
   ID                   integer                        not null,
   SUJET                varchar(100)                   null,
   AUTEURS              long varchar                   null,
   ANNEE                date                           null,
   FICHIER_PDF          varchar(500)                   null,
   constraint PK_PUBLICATION primary key (ID_PUB)
);

/*==============================================================*/
/* Index : PUBLICATION_PK                                       */
/*==============================================================*/
create unique index PUBLICATION_PK on "PUBLICATION" (
ID_PUB ASC
);

/*==============================================================*/
/* Index : PUBLIER_FK                                           */
/*==============================================================*/
create index PUBLIER_FK on "PUBLICATION" (
ID ASC
);

/*==============================================================*/
/* Index : APPARTENIR_FK                                        */
/*==============================================================*/
create index APPARTENIR_FK on "PUBLICATION" (
ID_CATEGORIE ASC
);

/*==============================================================*/
/* Table : RESSOURCE                                            */
/*==============================================================*/
create table RESSOURCE 
(
   ID_RESSOURCE         integer                        not null,
   TITRE                varchar(200)                   null,
   DESCRIPTION          long varchar                   null,
   FICHIER              varchar(300)                   null,
   constraint PK_RESSOURCE primary key (ID_RESSOURCE)
);

/*==============================================================*/
/* Index : RESSOURCE_PK                                         */
/*==============================================================*/
create unique index RESSOURCE_PK on RESSOURCE (
ID_RESSOURCE ASC
);

/*==============================================================*/
/* Table : UTILISATEUR                                          */
/*==============================================================*/
create table UTILISATEUR 
(
   ID                   integer                        not null,
   NOM                  char(50)                       null,
   PRENOM               char(50)                       null,
   PHOTO_PROFIL         long binary                    null,
   constraint PK_UTILISATEUR primary key (ID)
);

/*==============================================================*/
/* Index : UTILISATEUR_PK                                       */
/*==============================================================*/
create unique index UTILISATEUR_PK on UTILISATEUR (
ID ASC
);

alter table ANONCE
   add constraint FK_ANONCE_ANONCER_PROFESSE foreign key (ID)
      references PROFESSEUR (ID)
      on update restrict
      on delete restrict;

alter table ANONCE
   add constraint FK_ANONCE_DIFFUSER_COUR foreign key (ID_COUR)
      references COUR (ID_COUR)
      on update restrict
      on delete restrict;

alter table ASSOCIER
   add constraint FK_ASSOCIER_ASSOCIER_RESSOURC foreign key (ID_RESSOURCE)
      references RESSOURCE (ID_RESSOURCE)
      on update restrict
      on delete restrict;

alter table ASSOCIER
   add constraint FK_ASSOCIER_ASSOCIER2_COUR foreign key (ID_COUR)
      references COUR (ID_COUR)
      on update restrict
      on delete restrict;

alter table COMPTE
   add constraint FK_COMPTE_AVOIR_UTILISAT foreign key (ID)
      references UTILISATEUR (ID)
      on update restrict
      on delete restrict;

alter table CONTACT
   add constraint FK_CONTACT_ENVOYER_ETUDIANT foreign key (ETU_ID)
      references ETUDIANT (ID)
      on update restrict
      on delete restrict;

alter table CONTACT
   add constraint FK_CONTACT_RECEVOIRE_PROFESSE foreign key (ID)
      references PROFESSEUR (ID)
      on update restrict
      on delete restrict;

alter table COUR
   add constraint FK_COUR_PARTAGER_PROFESSE foreign key (ID)
      references PROFESSEUR (ID)
      on update restrict
      on delete restrict;

alter table ETUDIANT
   add constraint FK_ETUDIANT_HERITAGE__UTILISAT foreign key (ID)
      references UTILISATEUR (ID)
      on update restrict
      on delete restrict;

alter table FORUM
   add constraint FK_FORUM_CONTENIR_COUR foreign key (ID_COUR)
      references COUR (ID_COUR)
      on update restrict
      on delete restrict;

alter table INSCRIPTION
   add constraint FK_INSCRIPT_CONCERNER_COUR foreign key (ID_COUR)
      references COUR (ID_COUR)
      on update restrict
      on delete restrict;

alter table INSCRIPTION
   add constraint FK_INSCRIPT_S_INSCRIR_ETUDIANT foreign key (ID)
      references ETUDIANT (ID)
      on update restrict
      on delete restrict;

alter table MESSAGEFORUM
   add constraint FK_MESSAGEF_ECRIRE_FORUM foreign key (ID_FORUM)
      references FORUM (ID_FORUM)
      on update restrict
      on delete restrict;

alter table MESSAGEFORUM
   add constraint FK_MESSAGEF_REDIGER_UTILISAT foreign key (ID)
      references UTILISATEUR (ID)
      on update restrict
      on delete restrict;

alter table PROFESSEUR
   add constraint FK_PROFESSE_HERITAGE__UTILISAT foreign key (ID)
      references UTILISATEUR (ID)
      on update restrict
      on delete restrict;

alter table "PUBLICATION"
   add constraint FK_PUBLICAT_APPARTENI_CATEGORI foreign key (ID_CATEGORIE)
      references CATEGORIE_PUBLICATION (ID_CATEGORIE)
      on update restrict
      on delete restrict;

alter table "PUBLICATION"
   add constraint FK_PUBLICAT_PUBLIER_PROFESSE foreign key (ID)
      references PROFESSEUR (ID)
      on update restrict
      on delete restrict;

