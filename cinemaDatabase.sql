CREATE DATABASE cinemaDatabase ;

USE cinemaDatabase;

CREATE TABLE personnes 
(
    id_personne INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    email VARCHAR(250)
);

INSERT INTO personnes(nom,prenom,email) VALUES ('Doh','John','dohjohn@gmail.com');
INSERT INTO personnes(nom,prenom,email) VALUES ('Brian','Matilda','briandmatilda@gmail.com');
INSERT INTO personnes(nom,prenom,email) VALUES ('Dillingham','Rosemary','dillingham.rosemary@gmail.com');
INSERT INTO personnes(nom,prenom,email) VALUES ('Weiss','Marko','weiss.m@live.com');
INSERT INTO personnes(nom,prenom,email) VALUES ('Kovaleva','katarina','kovkat@gmail.com');

CREATE TABLE tarifs
(
id_tarif INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(50),
prix FLOAT
);

INSERT INTO tarifs(nom,prix) VALUES ('Plein tarif',9.20);
INSERT INTO tarifs(nom,prix) VALUES ('Etudiant',7.60);
INSERT INTO tarifs(nom,prix) VALUES ('Moins de 14 ans',5.90);


CREATE TABLE cinemas
(
     id_cinema INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
     nom_cinema VARCHAR(250),
     adresse VARCHAR(250),
     ville VARCHAR(250),
     code_postal VARCHAR(6),
     telephone VARCHAR(250)
);

INSERT INTO cinemas (nom_cinema,adresse,ville,code_postal,telephone) VALUES ('Mon Ciné Etoile','56 Place du Général de Gaulle','Etoile','61400','0965374433');
INSERT INTO cinemas (nom_cinema,adresse,ville,code_postal,telephone) VALUES ('Mon Ciné Aiglon','7 rue du Docteur Rouyer 61300','Aiglon','61300','0233244033');
INSERT INTO cinemas (nom_cinema,adresse,ville,code_postal,telephone) VALUES ('Mon Ciné Normandy','13 Rue Georges Méheudin','Normandy','61200',' 0233394648');
INSERT INTO cinemas (nom_cinema,adresse,ville,code_postal,telephone) VALUES ('Mon Ciné Vikings','17 Rue Abbé Jean Baptiste Lecornu','Vikings','61100','0233644948');
INSERT INTO cinemas (nom_cinema,adresse,ville,code_postal,telephone) VALUES ('Mon Ciné Armontel','Rue de la Renaissance','Armontel','61120','0233390442');

CREATE TABLE reservations
(
    id_reservation INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_personne INT NOT NULL,
    date_reservation DATE NOT NULL,
    heure_reservation TIME NOT NULL,
    CONSTRAINT FK_PersonReserv FOREIGN KEY (id_personne) REFERENCES personnes(id_personne)
);

INSERT INTO reservations(id_personne,date_reservation,heure_reservation)
VALUES (1,'2021-09-01','12:00:00');
INSERT INTO reservations(id_personne,date_reservation,heure_reservation)
VALUES (2,'2021-09-04','18:00:00');
INSERT INTO reservations(id_personne,date_reservation,heure_reservation)
VALUES (3,'2021-09-03','15:00:00');
INSERT INTO reservations(id_personne,date_reservation,heure_reservation)
VALUES (4,'2021-09-01','21:00:00');
INSERT INTO reservations(id_personne,date_reservation,heure_reservation)
VALUES (5,'2021-09-01','17:00:00');

CREATE TABLE salles
(
    id_salle INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cinema INT NOT NULL,
    code_salle VARCHAR(250),
    nombre_siege INT,
    CONSTRAINT FK_CineSalle FOREIGN KEY (id_cinema) REFERENCES cinemas(id_cinema)
);

INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (1,'001',500);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (1,'002',300);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (1,'003',500);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (1,'004',490);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (1,'005',250);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (1,'006',500);

INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (2,'007',360);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (2,'008',700);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (2,'009',410);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (2,'010',150);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (2,'011',350);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (2,'012',200);

INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (3,'013',590);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (3,'014',230);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (3,'015',420);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (3,'016',120);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (3,'017',210);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (3,'018',500);

INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (4,'019',500);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (4,'020',700);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (4,'021',200);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (4,'022',100);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (4,'023',500);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (4,'024',400);

INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (5,'025',700);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (5,'026',600);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (5,'027',480);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (5,'028',160);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (5,'029',900);
INSERT INTO salles(id_cinema,code_salle,nombre_siege) VALUES (5,'030',400);

CREATE TABLE format_salles 
(
    id_format_salle INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_salle INT NOT NULL,
    nom_format VARCHAR(250),
    CONSTRAINT FK_SallFormat FOREIGN KEY (id_salle) REFERENCES salles(id_salle)
);

INSERT INTO format_salles(id_salle,nom_format) VALUES (1,'2D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (2,'2D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (3,'3D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (4,'2D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (5,'2D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (6,'2D');

INSERT INTO format_salles(id_salle,nom_format) VALUES (7,'2D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (8,'3D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (9,'3D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (10,'2D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (11,'3D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (12,'2D');

INSERT INTO format_salles(id_salle,nom_format) VALUES (13,'3D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (14,'2D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (15,'2D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (16,'2D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (17,'2D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (18,'2D');

INSERT INTO format_salles(id_salle,nom_format) VALUES (19,'2D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (20,'2D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (21,'3D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (22,'2D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (23,'3D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (24,'2D');

INSERT INTO format_salles(id_salle,nom_format) VALUES (25,'3D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (26,'3D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (27,'2D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (28,'3D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (29,'2D');
INSERT INTO format_salles(id_salle,nom_format) VALUES (30,'2D');

CREATE TABLE formats
(
    id_format INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom_format VARCHAR(100)
);

INSERT INTO formats(nom_format) VALUES ('Action/Aventure');
INSERT INTO formats(nom_format) VALUES ('Science-fiction');
INSERT INTO formats(nom_format) VALUES ('Horreur');
INSERT INTO formats(nom_format) VALUES ('Comedie');
INSERT INTO formats(nom_format) VALUES ('Thriller');
INSERT INTO formats(nom_format) VALUES ('Dramatique');
INSERT INTO formats(nom_format) VALUES ('Romantique');
INSERT INTO formats(nom_format) VALUES ('Documentaire');
INSERT INTO formats(nom_format) VALUES ('Policier');

CREATE TABLE films 
(
    id_film INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_format INT NOT NULL,
    titre_film VARCHAR(250),
    duree_film INT NOT NULL,
    CONSTRAINT FK_FormatFilm FOREIGN KEY (id_format) REFERENCES formats(id_format)
);

INSERT INTO films(id_format,titre_film,duree_film) VALUES (1,'Maison de Retraite',97);
INSERT INTO films(id_format,titre_film,duree_film) VALUES (2,'Maigret',88);
INSERT INTO films(id_format,titre_film,duree_film) VALUES (3,'The Batman',237);
INSERT INTO films(id_format,titre_film,duree_film) VALUES (4,'Uncharted',116);
INSERT INTO films(id_format,titre_film,duree_film) VALUES (5,'Hopper et le hamster des ténèbres',91);
INSERT INTO films(id_format,titre_film,duree_film) VALUES (6,'King',82);
INSERT INTO films(id_format,titre_film,duree_film) VALUES (7,'Vaillante',93);
INSERT INTO films(id_format,titre_film,duree_film) VALUES (8,'Super-héros malgré lui',82);
INSERT INTO films(id_format,titre_film,duree_film) VALUES (9,'Murder Party',103);

CREATE TABLE seances
(
    id_seance INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    id_cinema INT NOT NULL ,
    id_film INT NOT NULL,
    id_salle INT NOT NULL,
    date_seance DATE,
    heure_début TIME NOT NULL , 
    heure_fin TIME NOT NULL,
    CONSTRAINT FK_CineSeance FOREIGN KEY (id_cinema) REFERENCES cinemas(id_cinema),
    CONSTRAINT FK_FilmSeance FOREIGN KEY (id_film) REFERENCES films(id_film),
    CONSTRAINT FK_SalleSeance FOREIGN KEY (id_salle) REFERENCES salles(id_salle)
);

INSERT INTO seances(id_cinema,id_film,id_salle,date_seance,heure_début,heure_fin)
VALUES (1,2,3,'2021-09-01','15:00:00','16:28:00');
INSERT INTO seances(id_cinema,id_film,id_salle,date_seance,heure_début,heure_fin)
VALUES (2,6,10,'2021-09-01','16:00:00','17:22:00');
INSERT INTO seances(id_cinema,id_film,id_salle,date_seance,heure_début,heure_fin)
VALUES (3,7,15,'2021-09-05','19:00:00','20:33:00');
INSERT INTO seances(id_cinema,id_film,id_salle,date_seance,heure_début,heure_fin)
VALUES (4,2,21,'2021-09-03','21:30:00','22:52:00');
INSERT INTO seances(id_cinema,id_film,id_salle,date_seance,heure_début,heure_fin)
VALUES (5,5,30,'2021-09-02','17:00:00','18:31:00');
INSERT INTO seances(id_cinema,id_film,id_salle,date_seance,heure_début,heure_fin)
VALUES (2,1,7,'2021-09-04','19:00:00','20:37:00');
INSERT INTO seances(id_cinema,id_film,id_salle,date_seance,heure_début,heure_fin)
VALUES (4,4,22,'2021-09-02','19:00:00','20:54:00');
INSERT INTO seances(id_cinema,id_film,id_salle,date_seance,heure_début,heure_fin)
VALUES (1,3,1,'2021-09-03','21:00:00','23:57:00');
INSERT INTO seances(id_cinema,id_film,id_salle,date_seance,heure_début,heure_fin)
VALUES (3,9,27,'2021-09-04','17:00:00','18:43:00');
INSERT INTO seances(id_cinema,id_film,id_salle,date_seance,heure_début,heure_fin)
VALUES (4,6,23,'2021-09-01','17:00:00','18:22:00');
INSERT INTO seances(id_cinema,id_film,id_salle,date_seance,heure_début,heure_fin)
VALUES (1,9,2,'2021-09-04','18:00:00','19:43:00');

CREATE TABLE lignes 
(
    id_ligne INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_reservation INT NOT NULL,
    id_seance INT NOT NULL,
    id_tarif INT NOT NULL,
    nombre_place INT NOT NULL,
    CONSTRAINT FK_ReservLigne FOREIGN KEY (id_reservation) REFERENCES reservations(id_reservation),
    CONSTRAINT FK_SeanceLigne FOREIGN KEY (id_seance) REFERENCES seances(id_seance),
    CONSTRAINT FK_TarifLigne FOREIGN KEY (id_tarif) REFERENCES tarifs(id_tarif)
);

INSERT INTO lignes(id_reservation,id_seance,id_tarif,nombre_place)
VALUES (1,1,1,2);
INSERT INTO lignes(id_reservation,id_seance,id_tarif,nombre_place)
VALUES (2,6,2,1);
INSERT INTO lignes(id_reservation,id_seance,id_tarif,nombre_place)
VALUES (3,8,1,3);
INSERT INTO lignes(id_reservation,id_seance,id_tarif,nombre_place)
VALUES (4,2,3,1);
INSERT INTO lignes(id_reservation,id_seance,id_tarif,nombre_place)
VALUES (5,10,3,1);