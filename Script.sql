CREATE DATABASE basek2;

USE basek2;

CREATE TABLE groupes(
num_groupe int AUTO_INCREMENT PRIMARY KEY,
nom_groupe varchar(10) NOT NULL,
typ char(20) NOT NULL
)ENGINE=InnoDB ;

CREATE TABLE membres(
num_membre int AUTO_INCREMENT PRIMARY KEY,
prenom_membre varchar(30) NOT NULL,
nom_membre varchar(30) NOT NULL,
login varchar(20) NOT NULL,
mdp varchar(20) NOT NULL,
mail varchar(40),
num_groupe int,
FOREIGN KEY (num_groupe) REFERENCES groupes(num_groupe)
) ENGINE=InnoDB ;

CREATE TABLE matieres(
num_matiere int AUTO_INCREMENT PRIMARY KEY,
nom_matiere varchar(80) NOT NULL,
coeff_matiere int NOT NULL
)ENGINE=InnoDB ;

CREATE TABLE travauxes(
num_travail int AUTO_INCREMENT PRIMARY KEY,
desc_travail char(255),
echeance date NOT NULL,
progression varchar(10) NOT NULL,
num_membre int NOT NULL,
num_matiere int NOT NULL,
FOREIGN KEY (num_membre) REFERENCES membres(num_membre),
FOREIGN KEY (num_matiere) REFERENCES matieres(num_matiere)
)ENGINE=InnoDB ;

CREATE TABLE bulletins(
num_bulletin int AUTO_INCREMENT PRIMARY KEY,
semestre_bulletin int NOT NULL,
moyenne real NOT NULL,
num_membre int NOT NULL,
FOREIGN KEY (num_membre) REFERENCES membres(num_membre)
)ENGINE=InnoDB ;

CREATE TABLE notes(
num_note int AUTO_INCREMENT PRIMARY KEY,
points real NOT NULL,
coeff_note int NOT NULL,
desc_note char(255),
num_matiere int NOT NULL,
num_bulletin int NOT NULL,
FOREIGN KEY (num_matiere) REFERENCES matieres(num_matiere),
FOREIGN KEY (num_bulletin) REFERENCES bulletins(num_bulletin)
)ENGINE=InnoDB ;

CREATE TABLE edts(
num_edt int AUTO_INCREMENT PRIMARY KEY,
semaine int NOT NULL,
semestre int NOT NULL,
num_groupe int NOT NULL,
FOREIGN KEY (num_groupe) REFERENCES groupes(num_groupe)
)ENGINE=InnoDB ;

CREATE TABLE cours(
num_cour int AUTO_INCREMENT PRIMARY KEY,
date_cours date NOT NULL,
horaire_deb time NOT NULL,
horaire_fin time NOT NULL,
num_matiere int NOT NULL,
num_edt int NOT NULL,
FOREIGN KEY (num_matiere) REFERENCES matieres(num_matiere),
FOREIGN KEY (num_edt) REFERENCES edts(num_edt)
)ENGINE=InnoDB ;

CREATE TABLE amphis(
num_amphi int AUTO_INCREMENT PRIMARY KEY,
date_amphi date NOT NULL,
deb_amphi time NOT NULL,
fin_amphi time NOT NULL,
partiel boolean NOT NULL,
num_matiere int NOT NULL,
FOREIGN KEY (num_matiere) REFERENCES matieres(num_matiere)
)ENGINE=InnoDB ;

CREATE TABLE membrematieres(
num_membrematiere int AUTO_INCREMENT PRIMARY KEY,
num_membre int NOT NULL,
num_matiere int NOT NULL,
moy_mat double NOT NULL,
FOREIGN KEY (num_membre) REFERENCES membres(num_membre),
FOREIGN KEY(num_matiere) REFERENCES matieres(num_matiere)
)ENGINE=InnoDB;


/* Insertion des groupes Ok */
INSERT INTO groupes(nom_groupe, typ) VALUES ('A', 'A1');
INSERT INTO groupes(nom_groupe, typ) VALUES ('B', 'A1');
INSERT INTO groupes(nom_groupe, typ) VALUES ('C', 'A1');
INSERT INTO groupes(nom_groupe, typ) VALUES ('D', 'A1');
INSERT INTO groupes(nom_groupe, typ) VALUES ('E', 'A1');
INSERT INTO groupes(nom_groupe, typ) VALUES ('F', 'A1');
INSERT INTO groupes(nom_groupe, typ) VALUES ('IP Cisco', 'A2');
INSERT INTO groupes(nom_groupe, typ) VALUES ('IP Web A', 'A2');
INSERT INTO groupes(nom_groupe, typ) VALUES ('IP Web B', 'A2');
INSERT INTO groupes(nom_groupe, typ) VALUES ('PE A', 'A2');
INSERT INTO groupes(nom_groupe, typ) VALUES ('PE B', 'A2');
INSERT INTO groupes(nom_groupe, typ) VALUES ('AS', 'AS');
INSERT INTO groupes(nom_groupe, typ) VALUES ('INIT', 'LP');
INSERT INTO groupes(nom_groupe, typ) VALUES ('ERP', 'LP');
INSERT INTO groupes(nom_groupe, typ) VALUES ('CISCO', 'LP');
INSERT INTO groupes(nom_groupe, typ) VALUES ('Profs', 'Profs');

/* Insertion des matières, toutes années confondues Ok */
INSERT INTO matieres (nom_matiere) VALUES ('M1101 - Introduction aux systèmes informatiques');
INSERT INTO matieres (nom_matiere) VALUES ('M1102 - Introduction à l''algorithmique et à la programmation');
INSERT INTO matieres (nom_matiere) VALUES ('M1103 - Structures de données et algorithmes fondamentaux');
INSERT INTO matieres (nom_matiere) VALUES ('M1104 - Introduction aux bases de données');
INSERT INTO matieres (nom_matiere) VALUES ('M1105 - Conception de documents et d''interfaces numériques');
INSERT INTO matieres (nom_matiere) VALUES ('M1106 - Projets tutoré');
INSERT INTO matieres (nom_matiere) VALUES ('M1201 - Mathématiques discrètes');
INSERT INTO matieres (nom_matiere) VALUES ('M1202 - Algèbre linéaire');
INSERT INTO matieres (nom_matiere) VALUES ('M1203 - Environnement économique');
INSERT INTO matieres (nom_matiere) VALUES ('M1204 - Fonctionnement des organisations');
INSERT INTO matieres (nom_matiere) VALUES ('M1205 - Fondamentaux de la communication');
INSERT INTO matieres (nom_matiere) VALUES ('M1206 - Anglais');
INSERT INTO matieres (nom_matiere) VALUES ('M1207 - PPP');
INSERT INTO matieres (nom_matiere) VALUES ('M2101 - Architecture et programmation');
INSERT INTO matieres (nom_matiere) VALUES ('M2102 - Architecture des réseaux');
INSERT INTO matieres (nom_matiere) VALUES ('M2103 - Base de la programmation objet');
INSERT INTO matieres (nom_matiere) VALUES ('M2104 - Base de la conception orintée objet');
INSERT INTO matieres (nom_matiere) VALUES ('M2105 - Programmation événementielle et IHM');
INSERT INTO matieres (nom_matiere) VALUES ('M2106 - Programmation et administration des bases de données');
INSERT INTO matieres (nom_matiere) VALUES ('M2107 - Projet tutoré');
INSERT INTO matieres (nom_matiere) VALUES ('M2201 - Graphes et langages');
INSERT INTO matieres (nom_matiere) VALUES ('M2202 - Analyse et méthodes numériques');
INSERT INTO matieres (nom_matiere) VALUES ('M2203 - Environnement comptable, financier et juridique');
INSERT INTO matieres (nom_matiere) VALUES ('M2204 - Gestion de projet informatique');
INSERT INTO matieres (nom_matiere) VALUES ('M2205 - Expression-Communication');
INSERT INTO matieres (nom_matiere) VALUES ('M2206 - Communiquer en anglais');
INSERT INTO matieres (nom_matiere) VALUES ('M2207 - PPP');
INSERT INTO matieres (nom_matiere) VALUES ('M3101 - Principes systèmes d''exploitation');
INSERT INTO matieres (nom_matiere) VALUES ('M3102 - Services réseaux');
INSERT INTO matieres (nom_matiere) VALUES ('M3103 - Algorithmique avancée');
INSERT INTO matieres (nom_matiere) VALUES ('M3104 - Programmation web côté serveur');
INSERT INTO matieres (nom_matiere) VALUES ('M3105 - Conception et programmation objet avancés');
INSERT INTO matieres (nom_matiere) VALUES ('M3106C - Base de données avancées');
INSERT INTO matieres (nom_matiere) VALUES ('M3201 - Probablités et statistique');
INSERT INTO matieres (nom_matiere) VALUES ('M3202C - Modélisations mathématiques');
INSERT INTO matieres (nom_matiere) VALUES ('M3203 - Droit');
INSERT INTO matieres (nom_matiere) VALUES ('M3204 - Gestion des sytèmes d''information');
INSERT INTO matieres (nom_matiere) VALUES ('M3205 - Expression-Communication');
INSERT INTO matieres (nom_matiere) VALUES ('M3206 - Anglais');
INSERT INTO matieres (nom_matiere) VALUES ('M3301 - Méthogologie de la production d''applications');
INSERT INTO matieres (nom_matiere) VALUES ('M3302 - Projets tutorés');
INSERT INTO matieres (nom_matiere) VALUES ('M3303 - PPP');
INSERT INTO matieres (nom_matiere) VALUES ('M4101C - Administration système et réseaux');
INSERT INTO matieres (nom_matiere) VALUES ('M4102C - Programmation répartie');
INSERT INTO matieres (nom_matiere) VALUES ('M4103C - Programmation web client riche');
INSERT INTO matieres (nom_matiere) VALUES ('M4104C - Conception et dévellopement d''applications mobiles');
INSERT INTO matieres (nom_matiere) VALUES ('M4105C - Typo3');
INSERT INTO matieres (nom_matiere) VALUES ('M4106 - Projet tutoré');
INSERT INTO matieres (nom_matiere) VALUES ('M4201C - Ateliers de création d''entreprise');
INSERT INTO matieres (nom_matiere) VALUES ('M4202C - Recherche opérationnelle et aide à la décision');
INSERT INTO matieres (nom_matiere) VALUES ('M4203 - Expression-Communication');
INSERT INTO matieres (nom_matiere) VALUES ('M4204 - Anglais');
INSERT INTO matieres (nom_matiere) VALUES ('M4301 - Stage professionnel');
INSERT INTO matieres (nom_matiere) VALUES ('M4105C - Ciso');
INSERT INTO matieres (nom_matiere) VALUES ('OS8 - Traitement de l''information');
INSERT INTO matieres (nom_matiere) VALUES ('S1102 - Algorithme');
INSERT INTO matieres (nom_matiere) VALUES ('S1103 - Langage C');
INSERT INTO matieres (nom_matiere) VALUES ('S1105 - Programmation Web');
INSERT INTO matieres (nom_matiere) VALUES ('S1109 - Programmation Windows');
INSERT INTO matieres (nom_matiere) VALUES ('S1104 - Introduction aux bases de données / Bases de données');
INSERT INTO matieres (nom_matiere) VALUES ('S1101 - Introduction aux systèmes d''exploitation / Systèmes d''exploitation');
INSERT INTO matieres (nom_matiere) VALUES ('S1201 - Mathématiques');
INSERT INTO matieres (nom_matiere) VALUES ('S1202 - Gestion / Economie');
INSERT INTO matieres (nom_matiere) VALUES ('S1204 - Expression et Communication');
INSERT INTO matieres (nom_matiere) VALUES ('S1205 - Anglais');
INSERT INTO matieres (nom_matiere) VALUES ('S1107 - Programmation objet');
INSERT INTO matieres (nom_matiere) VALUES ('S1109 - Programmation Windows');
INSERT INTO matieres (nom_matiere) VALUES ('S2104 - Compléments de bases de données');
INSERT INTO matieres (nom_matiere) VALUES ('S2105 - Programmation Web côté serveur');
INSERT INTO matieres (nom_matiere) VALUES ('S2101 - Programmation système');
INSERT INTO matieres (nom_matiere) VALUES ('S2102 - CISCO');
INSERT INTO matieres (nom_matiere) VALUES ('S2102 - Réseaux');
INSERT INTO matieres (nom_matiere) VALUES ('S2201 - Mathématiques');
INSERT INTO matieres (nom_matiere) VALUES ('S2201 - Mathématiques numériques');
INSERT INTO matieres (nom_matiere) VALUES ('S2202 - Gestion');
INSERT INTO matieres (nom_matiere) VALUES ('S1202 - Economie');
INSERT INTO matieres (nom_matiere) VALUES ('S1202 - Base du droit / Droit des TIC');
INSERT INTO matieres (nom_matiere) VALUES ('S2204 - Anglais');
INSERT INTO matieres (nom_matiere) VALUES ('S1206 - PPP');
INSERT INTO matieres (nom_matiere) VALUES ('S2203 - Expression communication');
INSERT INTO matieres (nom_matiere) VALUES ('S2303 - Stage');
INSERT INTO matieres (nom_matiere) VALUES ('S1207 - Projet turoré');
INSERT INTO matieres (nom_matiere) VALUES ('S2301 - Projet tutoré');
INSERT INTO matieres (nom_matiere) VALUES ('Réseaux');
INSERT INTO matieres (nom_matiere) VALUES ('Objet');
INSERT INTO matieres (nom_matiere) VALUES ('C');
INSERT INTO matieres (nom_matiere) VALUES ('Base de données');
INSERT INTO matieres (nom_matiere) VALUES ('Unix');
INSERT INTO matieres (nom_matiere) VALUES ('Web');
INSERT INTO matieres (nom_matiere) VALUES ('Mathématiques');
INSERT INTO matieres (nom_matiere) VALUES ('Communication');
INSERT INTO matieres (nom_matiere) VALUES ('Anglais');
INSERT INTO matieres (nom_matiere) VALUES ('Management / Economie');
INSERT INTO matieres (nom_matiere) VALUES ('Algorithmique');
INSERT INTO matieres (nom_matiere) VALUES ('Objets et Middleware');
INSERT INTO matieres (nom_matiere) VALUES ('Base de données et ERP');
INSERT INTO matieres (nom_matiere) VALUES ('Systèmes et configurations');
INSERT INTO matieres (nom_matiere) VALUES ('Programmation système');
INSERT INTO matieres (nom_matiere) VALUES ('Web dynamique');
INSERT INTO matieres (nom_matiere) VALUES ('Interconnexion 1');
INSERT INTO matieres (nom_matiere) VALUES ('Interconnexion 2');
INSERT INTO matieres (nom_matiere) VALUES ('Programmation système 2');
INSERT INTO matieres (nom_matiere) VALUES ('Programmation SAP');
INSERT INTO matieres (nom_matiere) VALUES ('Programmation E-Business');
INSERT INTO matieres (nom_matiere) VALUES ('Oracle optimisation');
INSERT INTO matieres (nom_matiere) VALUES ('CMS Typo3');
INSERT INTO matieres (nom_matiere) VALUES ('Projet tutoré');
INSERT INTO matieres (nom_matiere) VALUES ('Stage en entreprise');
INSERT INTO matieres (nom_matiere) VALUES ('Pré-rapport');
INSERT INTO matieres (nom_matiere) VALUES ('Autres');
/*INSERT INTO matieres (nom_matiere) VALUES ('M');*/

/* Insertion des membres dans la table 
Début des professeurs */
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Arnaud', 'Clérentin', 'a.clerentin', 'e2baa383ef07203774dfdc8c34c9057a', 'arnaud.clerentin@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Claude', 'Pégard', 'c.pegard', '101e537156acf4f970f5c25ccb204336', 'claude.pegard@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Brigitte', 'Kervella', 'b.kervella', '595eff554e528d645075b84f6ebd85fb', 'brigitte.kervella@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Sandrine', 'Lelièvre', 's.lelievre', '179461361860856f1b834a38b97e152f', 'sandrine.lelievre@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Bernard', 'Caranton', 'b.caranton', '8bf86f1f748c48afc38df3cee9506ae9', 'bernard.caranton@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Isabelle', 'Lapole', 'i.lapole', '5c52706f2370b10bd175c824597eacf6', 'isabelle.lapole@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Sylvie', 'Fares', 's.fares', 'f29fda580bc914dca191b2098300d2dd', 'sylvie.fares@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Frédérique', 'Horen', 'f.horen', '296ed179373e81f14fbb7719ef0ec596', 'frederique.horen@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Chantal', 'Bielawski', 'c.bielawski', '3645df12f5547930558a9ad4267b211f', 'chantal.bielawski@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Magalie', 'Lainé', 'm.laine', '3ff5f6aa1a50fbd9758c6d67cc754fe0', 'magalie.laine@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Marie-Liesse', 'Atteleyn', 'ml.atteleyn', 'd7525c675b0b9530c0da227800ad1151', 'marieliesse.atteleyn@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Anne', 'Bourdé', 'a.bourde', '0dd1d10d0020e42e56cf4c8dff709cad', 'anne.bourde@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Eric', 'Brassart', 'e.brassart', 'e016b03eb9692c0c27e06effa03a4be7', 'eric.brassart@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Laurent', 'Delahoche', 'l.delahoche', '57a7717e2d810706d61858fc25eeca6f', 'laurent.delahoche@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Jean-Philippe', 'Demory', 'jph.demory', 'c79e79cfcf5c6cce164957bf284d1997', 'jeanphilippe.demory@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Fabien', 'Durand', 'f.durand', '3ab61be8c01fcd34dfc45eba023c0461', 'fabien.durand@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Pascal', 'Bourdé', 'p.bourde', '0dd1d10d0020e42e56cf4c8dff709cad', 'pascal.bourde@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Jacky', 'Renart', 'j.renart', '47fc442738d071f657092bd2686f2d34', 'jacky.renart@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Laurent', 'Herjean', 'l.herjean', '7bb219457980bb5ea7f812a9d3c532dc', 'laurent.herjean@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Cyril', 'Drocourt', 'c.drocourt', '2b1ba66db5122988c4745cdf2fc7eaca', 'cyril.drocourt@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Bruno', 'Marhic', 'b.marhic', '07de4a87b02e6df58bd2360e76b5612c', 'bruno.marhic@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('David', 'Durand', 'd.durand', '3ab61be8c01fcd34dfc45eba023c0461', 'david.durand@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Victorien', 'Desenclos', 'v.desenclos', '57a179c1026ee8c9acb84357efb95934', 'victorien.desenclos@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Christophe', 'Logé', 'c.loge', '924f33213df31ea6e15e46b350573a97', 'christophe.loge@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Jean-Baptiste', 'Masson', 'jb.masson', '978843766973c9bea62bdd751f7d4dfb', 'jeanbaptiste.masson@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('El Mustapha', 'Mouaddib', 'em.mouaddib', '8846d09552a832057e022fbbb6b781a7', 'elmustapha.mouaddib@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Odile', 'Poupin', 'o.poupin', '733687bf002530d4eb03accdf5fd1c10', 'odile.poupin@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Keith', 'Randall', 'k.randall', 'c524ef418b2410152716900c7245677b', 'keith.randall@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Cyril', 'Wolfangel', 'c.wolfangel', '85d3faf96d6ba8b59bf032b659672672', 'cyril.wolfangel@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('jy', 'Delattaignant', 'jy.delattaignant', 'f6efb6ede009ec1ec3b34ac514687e4d', 'jy.delattaignant@u-picardie.fr', 16);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Stéphane', 'Di Benedetto', 's.dibenedetto', 'f5df7886000ed97d70ab77a61a1c9a1b', 'stephane.dibenedetto@u-picardie.fr', 16);
/* Début des élèves */
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Sunny', 'Baye', 's.baye', 'a31a391851984167c4cf85c3766f6c76', 'sunny.baye@info.iut-amiens.fr', 1); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Melissande', 'Boivin', 'm.boivin', '706e1cd8513041cdf2ab6e3eb9559a8b', 'melissande.boivin@info.iut-amiens.fr', 1); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Thibaud', 'Chivet', 't.chivet', 'e0ee632f7aeb96a6814a3ec46b460d92', 'thibaud.chivet@info.iut-amiens.fr', 1); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Vincent', 'Goux', 'v.goux', '4689924beaa330977b1d65248b15f853	', 'vincent.goux@info.iut-amiens.fr', 1); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Raphaël', 'Henin', 'r.henin', '5de1eed428bcc176af4b73377f80fbca', 'raphael.henin@info.iut-amiens.fr', 1); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Antoine', 'Lima', 'a.lima', '6742923575546471370cc028f289db40', 'antoine.lima@info.iut-amiens.fr', 1); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Nicolas', 'Marquais', 'n.marquais', '967c3ca9b2cdcc6bf802b05560cea0ce', 'nicolas.marquais@info.iut-amiens.fr', 1); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Josias', 'Ntuaremba', 'j.ntuaremba', 'f78941cd438d3559a702102b6182b57c', 'josias.ntuaremba@info.iut-amiens.fr', 1); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Remy', 'Rotier', 'r.rotier', 'f78fc06306c534cd1086cb22e26a1d48', 'remy.rotier@info.iut-amiens.fr', 1); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Vunnedy', 'Tauch', 'v.tauch', '8328e2a717f038c0738771b0930fe143', 'vunnedy.tauch@info.iut-amiens.fr', 1); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Nabil', 'Bentayaa', 'n.bentayaa', '17291cef8788c24d160a18d1e694316b', 'nabil.bentayaa@info.iut-amiens.fr', 2); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Hugo', 'Billiaert', 'h.billiart', '22c134db00a03749e0ed38b90cf6d30c', 'hugo.billiaert@info.iut-amiens.fr', 2); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Jonathan', 'Corbillon', 'j.corbillon', '4d522b5e9365204c81ce6aec30e427a1', 'joanthan.corbillon@info.iut-amiens.fr', 2); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Lucas', 'Cottin', 'l.cottin', 'b30a440e54a707c3590f05df4215d2a2', 'lucas.cottin@info.iut-amiens.fr', 2); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Samy', 'Derradji', 's.derradji', '65800e0cc804afe205066d317c18dbbe', 'samy.derradji@info.iut-amiens.fr', 2); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Frederic', 'Gery', 'f.gery', '59cb1879dea33148b9a97af3a1a92550', 'frederic.gery@info.iut-amiens.fr', 2); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Maxime', 'Labart', 'm.labart', 'bed24675674ed05fae4e147e54914fa5', 'maxime.labart@info.iut-amiens.fr', 2); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Alexandre', 'Moutarde', 'a.moutarde', '880a462d1f03849842d18628de6fcc4d', 'alexandre.moutarde@info.iut-amiens.fr', 2); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Jeofrey', 'Stephan', 'j.stephan', 'bf1f92de980819a99356289142b9590d', 'jeoffrey.stephan@info.iut-amiens.fr', 2); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Guillaume', 'Sueur', 'g.sueur', '5744e217fc97a6e30234749be77111ef', 'guillaume.sueur@info.iut-amiens.fr', 2); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Ahmed-Sami', 'Boumehdi', 'a.boumehdi', '25093f2b55761c60dbc283c93728a600', 'ahmed-sami.boumehdi@info.iut-amiens.fr', 3); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Romain', 'Chollet', 'r.chollet', 'fa07a8dafd73191e7242416b40d45913', 'romain.chollet@info.iut-amiens.fr', 3); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Robin', 'Collet', 'r.collet', '0b09f4859bd274c81e1b1dd28a66dc9d', 'robin.collet@info.iut-amiens.fr', 3); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Jeanne', 'Coune', 'j.coune', '6e4c6218b7b7a54769e04f367b8b0a17', 'jeanne.coune@info.iut-amiens.fr', 3); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Julien', 'Garcin', 'j.garcin', '207463e6e2c6f008ea6fec87aec480bf', 'julien.garcin@info.iut-amiens.fr', 3); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Jonathan', 'Lapierre', 'j.lapierre', '42db20ae31f82391d6756280486ae779', 'jonathan.lapierre@info.iut-amiens.fr', 3); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Benoit', 'Lecomte', 'b.lecomte', 'f4a59f2db679b12279a674121dc83bc8', 'benoit.lecomte@info.iut-amiens.fr', 3); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Cedric', 'Legrand', 'c.legrand', '3b25531d07b6165b81f5fbacf640759c', 'cedric.legrand@info.iut-amiens.fr', 3); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Jeremy', 'Leprince', 'j.leprince', '3d43efec11f468407cdbc068ebea9e26', 'jeremy.leprince@info.iut-amiens.fr', 3); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Raphaël', 'Souchard de Lavoreille', 'r.souchardelavoreille', '538af8d07034b70184b10a0ff2e532b4', 'raphael.soucharddelavoreille@info.iut-amiens.fr', 3); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Amaury', 'Brisach', 'a.brisach', 'a57d904528b23bb031037fbf894f6880', 'amaury.brisach@info.iut-amiens.fr', 4); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Valentin', 'Camus', 'v.camus', '233bd6c38b52b0bcc029f17ce6444ff8', 'valentin.camus@info.iut-amiens.fr', 4); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Adrien', 'Colau', 'a.colau', 'be80e09bb2012eff8997712d957576de', 'adrien.colau@info.iut-amiens.fr', 4); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Louis', 'Degardin', 'l.degardin', 'e603560352831aabc028186d9f704333', 'louis.degardin@info.iut-amiens.fr', 4); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Valentin', 'Delaruelle', 'v.delaruelle', '5f5bc132ec945528f47ae3d45e8a6621', 'valentin.delaruelle@info.iut-amiens.fr', 4); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Sebastien', 'Deparme', 's.deparme', 'f9636e986096405973d0015797557b04', 'sebastien.deparme@info.iut-amiens.fr', 4); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Etienne', 'Devillers', 'e.devillers', 'e93e3e8a3d5a80c4ad4e19d2c302a4ae', 'etienne.devillers@info.iut-amiens.fr', 4); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Thomas', 'Freitas', 't.freitas', '8163646238dbfa141cfbb630ddcf31f5', 'thomas.freitas@info.iut-amiens.fr', 4); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Arthur', 'Molmy', 'a.molmy', '076d27f947a48b48fe31369a268ff576', 'arthur.momy@info.iut-amiens.fr', 4); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Erwan', 'Roudot', 'e.roudot', '976483294b207148fa07ee2aeca08b91', 'erwan.roudot@info.iut-amiens.fr', 4); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Arthur', 'Allix', 'a.allix', 'b96019e1fc2fe612bc889737662614c9', 'arthur.allix@info.iut-amiens.fr', 5); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Florian', 'Bellenger', 'f.bellenger', 'db060e3470f56a11219f2eda17ccda6d', 'florian.bellender@info.iut-amiens.fr', 5); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Maximilien', 'Bourgeteau', 'm.bourgeteau', 'bcee79a1e6f92a07cd8f51e9ed33d7da', 'maximilien.bourgeteau@info.iut-amiens.fr', 5); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Vincent', 'Candappane', 'v.candappane', '6e6a66034d70f6135a56360c7630127b', 'vincent.candappane@info.iut-amiens.fr', 5); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Pablo', 'Delgado', 'p.delgado', '41e2dd5f17c3524cb1f5abe851fa6c0d', 'pablo.delgado@info.iut-amiens.fr', 5); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Florent', 'Heudent', 'f.heudent', 'cc90eb399410b782ad62258e4306fd5f', 'florent.heudent@info.iut-amiens.fr', 5); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Tony', 'Meuret', 't.meuret', 'c289b94a8658f3a392212b602d0337fa', 'tony.meuret@info.iut-amiens.fr', 5); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Cyril', 'Morelle', 'c.morelle', '45afd1285dd75fdcc2111beae78262bb', 'cyril.morelle@info.iut-amiens.fr', 5); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Jean', 'Nguyen', 'j.nguyen', '27ff2ffe376b2edcc7c2de309173f0d8', 'jean.nguyen@info.iut-amiens.fr', 5); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Romain', 'Soudet', 'r.soudet', '0afd1913c93e41e95b7eb7c1038ead39', 'romain.soudet@info.iut-amiens.fr', 5); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Pierre', 'Beaujean', 'p.beaujean', 'fc35b388577a0574c5393d4149748e4e', 'pierrE.beaujean@info.iut-amiens.fr', 6); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Farid', 'Bouanimba', 'f.bouanimba', '2dd4d021e098dfa25744c4a3056f642f', 'farid.bouanimba@info.iut-amiens.fr', 6); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Jean', 'Chevassus-Clement', 'j.chevassusclement', '357ef115d2645cf23a6b7ffc5df06b44', 'jean.chevassusclement@info.iut-amiens.fr', 6); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Florian', 'Crimet', 'f.crimet', '62e9c06c2b8eb6631bc4d2c6fab0a34a', 'florian.crimet@info.iut-amiens.fr', 6); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Kevin', 'Ionescu', 'k.ionescu', 'cc8beea637061490f0b5afa2fb58f336', 'kevin.ionescu@info.iut-amiens.fr', 6); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Sophian', 'Kraeutlein', 's.kraeutlein', '7a87484ecda60924d4d47d010dae18b3', 'sophian.kraeutlein@info.iut-amiens.fr', 6); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Flavien', 'Onana Ngono', 'f.onanagnono', 'd6b59f0395ebb1ea389ea5c893329cd4', 'flavien.onanangono@info.iut-amiens.fr', 6); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Jean-Baptiste', 'Piazza', 'j.piazza', '4558aac7b93717f32323b02d2db1f28b', 'jeanbaptistepiazza@info.iut-amiens.fr', 6); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Andry', 'Rakotoarison Andrianantenaina Tolojonahary', 'a.rakotoarisona', '39f957149061900087b4c32f9f143718', 'andry.rakotoarisona@info.iut-amiens.fr', 6); 
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Theophile', 'Selva', 't.selva', 'ca676b517a4cee2da0ccbd208a051173', 'theophile.selva@info.iut-amiens.fr', 6);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Florian', 'Cartier', 'f.cartier', 'a5958df402c969d1eda5b4d08ca3acbf', 'florian.cartier@info.iut-amiens.fr', 7);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Jérémy', 'Halle', 'j.halle', '1093e6aaf548e2c3a94c7192ff0d03cb', 'jeremy.halle@info.iut-amiens.fr', 7);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Julien', 'Boyeldieu', 'j.boyeldieu', '4b7a6f97ccb8d2c1ddfca9cbec441a8d', 'julien.boyeldieu@info.iut-amiens.fr', 7);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Alexis', 'Allain', 'a.allain', '446ace83ccdcf59fdd722dbe50d8e87d', 'alexis.allain@info.iut-amiens.fr', 7);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Dylan', 'Augusto', 'd.augusto', '70dc9794fd98431263b895f1344860c7', 'dylan.augusto@info.iut-amiens.fr', 7);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Thierry', 'Girard', 't.girard', 'ee7218216e8069ad13d402bbe0aa3833', 'thierry.girard@info.iut-amiens.fr', 7);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Nicolas', 'Febrezar', 'n.febrezar', '3e1659f60c53d12388374b0c466111aa', 'nicolas.febrezar@info.iut-amiens.fr', 7);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Rémi', 'Bereaux', 'r.bereaux', '3da93d944ec342e98636cd83671f4a41', 'remi.bereaux@info.iut-amiens.fr', 7);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Aymerica', 'Rosette', 'a.rosette', '9551ea1bf14aa978c3f9df1eb443b8d0', 'aymerica.rosette@info.iut-amiens.fr', 7);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Kevin', 'Péret', 'k.perret', '6dde4e566d7f5ef44108ccf066d332be', 'kevin.perret@info.iut-amiens.fr', 7);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Maxime', 'Baumann', 'm.baumann', 'ba712fe030c797287cb9733445296647', 'maxime.baumann@info.iut-amiens.fr', 8);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Benjamin', 'Blangier', 'b.blangier', 'cd75e16a3dec638fb536d436d36501e2', 'benjmain.blangier', 8);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Rémi', 'Boiseaubert', 'r.boiseaubert', '69fd4ef2683d9fb35691be5db026d20b', 'remi.boiseaubert@info.iut-amiens.fr', 8);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Charles', 'Caranton', 'c.caranton', '8bf86f1f748c48afc38df3cee9506ae9', 'charles.caranton@info.iut-amiens.fr', 8);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Romain', 'Delabie', 'r.delabie', '5c2a0f04b456cf8f6b3226dcc91d063d', 'romain.delabie@info.iut-amiens.fr', 8);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Bertrand', 'Feuillette', 'b.feuillette', 'bd5ce9570e53e7c853f4f06217c11f20', 'bertrand.feuillette@info.iut-amiens.fr', 8);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Camille', 'Guerbert', 'c.guerbert', '86a7be9162fb007c48e3455c90e33ec4', 'camille.guerbert@info.iut-amiens.fr', 8);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Camille', 'Milleville', 'c.milleville', '55f1137a791ec4b545244aeacc68c642', 'camille.milleville@info.iut-amiens.fr', 8);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Gauthier', 'Puertas', 'g.puertas', '61aa5bd3c8eba14c3ce6f36bc98f0d64', 'gauthier.puertas@info.iut-amiens.fr', 8);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Augustin', 'Texier', 'a.texier', '32db69a4095073eb1b7b31056f02b44b', 'augustin.texier@info.iut-amiens.fr', 8);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Hugo', 'Ben Ali', 'h.benali', '484502d14f90721cdf586c5cf9301c41', 'hugo.benali@info.iut-amiens.fr', 9);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Alexis', 'Billard', 'a.billard', 'ddd27734bf571471b0844ec2b4af3282', 'alexis.billard@info.iut-amiens.fr', 9);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Maxence', 'Daussy', 'm.daussy', 'edd61090df2b1763ad0058a8b043943e', 'maxence.daussy@info.iut-amiens.fr', 9);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Dylan', 'Dubos', 'd.dubos', 'b9c8de583f2a869587f179a2501363e1', 'dylan.dubos@info.iut-amiens.fr', 9);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Alexandre', 'Duclay', 'a.duclay', '744357cf5cec90451277145d6a463403', 'alexandre.duclay@info.iut-amiens.fr', 9);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Guillaume', 'Fregat', 'g.fregat', 'ec44d478abf7c6f4925d7959ead67400', 'guillaume.fregat@info.iut-amiens.fr', 9);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Paul', 'Jeannot', 'p.jeannot', '074c78ed7ba3d960b5adf99caaa46bd0', 'paul.jeannot@info.iut-amiens.fr', 9);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Guillaume', 'Monflier', 'g.monflier', '4c2e34afb69ee95078549cf96c04879c', 'guillaume.monflier@info.iut-amiens.fr', 9);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Estelle', 'Saison', 'e.saison', '62d8617d49c4cbd03664e39af6f0fe2f', 'estelle.saison@info.iut-amiens.fr', 9);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Guillaume', 'Stenek', 'g.stenek', '8ef0a621b8636898f5460317a01809ae', 'guillaume.stenek@info.iut-amiens.fr', 9);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Amélie', 'Bailleul', 'a.bailleul', 'ceb0edb6b012bf4152483b360aef8c9f', 'amelie.bailleul@info.iut-amiens.fr', 10);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Mathieu', 'Boitelle', 'm.boitelle', 'a3a95789b6b12a7f91fda12326393d4b', 'mathier.boitelle@info.iut-amiens.fr', 10);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Valentin', 'Delacroix', 'v.delacroix', '0de06909c773b114bd25c18109f70ecf', 'valentin.delcroix@info.iut-amiens.fr', 10);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Clément', 'Edde', 'c.edde', '20c51e8faffa2f9f0329b09ee8ddf35a', 'clement.edde@info.iut-amiens.fr', 10);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Vincent', 'Fragoso', 'v.fragoso', '328ab2d71304c41e67e56c83579d47c2', 'vincent.fragoso@info.iut-amiens.fr', 10);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Pierre', 'Martin', 'p.martin', '925d7518fc597af0e43f5606f9a51512', 'pierre.martin@info.iut-amiens.fr', 10);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Florentin', 'Pauchet', 'f.pauchet', 'a48bec2fb0db5ff4a9f7883e7040c5f4', 'florentin.pauchet@info.iut-amiens.fr', 10);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Emilien', 'Porquet', 'e.porquet', 'ea7b068b8aba489e8baedfae90c301ed', 'emilien.porquet@info.iut-amiens.fr', 10);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Rémi', 'Thiney', 'r.thiney', 'a169443ee53237d2901c6d09f659a172', 'remi.thiney@info.iut-amiens.fr', 10);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Alexandre', 'Triboulet', 'a.triboulet', '8f31a72156adbc10a83c661531555e80', 'alexandre.triboulet@info.iut-amiens.fr', 10);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Fabien', 'Basset', 'f.basset', 'a4dac552fa165975e72c296b606033e6', 'fabien.basset@info.iut-amiens.fr', 11);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Loïc', 'Calvez', 'l.calvez', '5870f0c37ecfb00085e5db4c8f5432a1', 'loic.calvez@info.iut-amiens.fr', 11);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Raphaël', 'Debray', 'r.debray', '31ccea404766d440e92702506c9e4f84', 'raphael.debray@info.iut-amiens.fr', 11);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Matthieu', 'Desplanques', 'm.desplanques', '69ca2b4a1c30adf9029be9d47747c02c', 'matthieu.desplanques@info.iut-amiens.fr', 11);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Dylan', 'Lecomte', 'd.lecomte', 'f4a59f2db679b12279a674121dc83bc8', 'dylan.lecomte@info.iut-amiens.fr', 11);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Romain', 'Lemoine', 'r.lemoine', '8e3d3fa42452752c3b1b8dbf66188a47', 'romaine.lemoine@info.iut-amiens.fr', 11);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Loïc', 'Michel', 'l.michel', 'd780182f77b121450849c2b088a444f0', 'loic.michel@info.iut-amiens.fr', 11);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Clément', 'Palluel', 'c.palluel', '6ee41454d99a5e9ccfdf5745a023be28', 'clement.palluel@info.iut-amiens.fr', 11);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Théotime', 'Poisseau', 't.poisseau', 'b668d0bfb8b94da967452bf002d81b38', 'theotime.poisseau', 11);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Remy', 'Ramet', 'r.ramet', '12c0e7fe2ba80fc840913381f77a72b7', 'remy.ramet@info.iut-amiens.fr', 11);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Michel', 'Azelart', 'm.azelart', '5977af7d0be53705c091a7c2529539e3', 'michel.azelart@info.iut-amiens.fr', 12);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Thomas', 'Barizien', 't.barizien', '865a006ecb775778efa5dbb171d94c20', 'thomas.barizien@info.iut-amiens.fr', 12);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Pierre', 'Begey', 'p.begey', 'c53244f9f52fa9a8871fbe6175100f35', 'pierre.begey@info.iut-amiens.fr', 12);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Dorian', 'Dineur', 'd.dineur', '6b6f796d722f63e5e2af660df81576bf', 'dorian.dineur@info.iut-amiens.fr', 12);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Quentin', 'Druault-Aubin', 'q.druaultaubin', 'f99cec654fe960ee69371ab9e305a1a2', 'quentin.druaultaubin@info.iut-amiens.fr', 12);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Laurent', 'Fontaine', 'l.fontaine', 'a2efa083ef204f6fbb3c4d4b5c48ab0b', 'laurnet.fontaine@info.iut-amiens.fr', 12);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Salim', 'Hadid', 's.hadid', 'f7446a2da8431a537f724406e730d531', 'salim.hadid@info.iut-amiens.fr', 12);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Nathan', 'Mecreant', 'n.mecreant', '38f4a8f5999a8065e32b55c0a8cd8d72', 'nathan.mecreant@info.iut-amiens.fr', 12);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Charles', 'Payot', 'c.payot', '53b5dd1976759c09d0606a652410dc23', 'charles.payot@info.iut-amiens.fr', 12);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Mathieu', 'Willemot', 'm.willemot', '2f543db7ba537adc6312cad6b67a0168', 'mathieu.willemot@info.iut-amiens.fr', 12);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Valentin', 'Audon', 'v.audon', 'db1be1c82d22079327fc37ca1b5b442b', 'valentin.audon@info.iut-amiens.fr', 13);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Thimotée', 'Chlon', 't.chlon', '1f11c9917591efc08b8c5981c47199b9', 'thimothee.chlon@info.iut-amiens.fr', 13);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Julien', 'Gamand', 'j.gamand', 'ba7ec18ef4025726eafeff5a72a6cea2', 'julien.gamand@info.iut-amiens.fr', 13);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Melody', 'Horwath', 'm.horwath', 'f50c1cf5a3df4d4f3cd2189bfbdafbec', 'melody.horwath@info.iut-amiens.fr', 13);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Eric', 'Hubert', 'e.hubert', 'c79c6f489015e0bc97f892e357db7156', 'eric.hubert@info.iut-amiens.fr', 13);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Jocelyn', 'Nourtier', 'j.nourtier', '57baf650ec7f63ea29ad2668ce811919', 'jocelyn.nourtier@info.iut-amiens.fr', 13);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Clément', 'Pierrard', 'c.pierrard', '0bf025182d2617edb1470ad8607a907f', 'clement.pierrard@info.iut-amiens.fr', 13);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Romain', 'Sénéchal', 'r.senechal', '2146f6a83092d7ddac7d1c76b0a2feff', 'romain.senechal@info.iut-amiens.fr', 13);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Nicolas', 'Tavernier', 'n.tavernier', '9c9a2b4d145a1cc74301fa9fda14cff0', 'nicolas.tavernier@info.iut-amiens.fr', 13);
INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('Hongwei', 'Zhao', 'h.zhao', '77e6789426d131e4d862ecac4c7d0c5d', 'hongwai.zhao@info.iut-amiens.fr', 13);
/*INSERT INTO membres (nom_membre, prenom_membre, login, mdp, mail, num_groupe) VALUES ('', '', '', '', '@info.iut-amiens.fr', );*/

/* Insertion d'emploi du temps d'exemple
   Début emplois du temps semaine du 17 au 21 novembre */
INSERT INTO edts (semaine, semestre, num_groupe) VALUES (10, 1, 1);
INSERT INTO edts (semaine, semestre, num_groupe) VALUES (10, 1, 2);
INSERT INTO edts (semaine, semestre, num_groupe) VALUES (10, 1, 3);
INSERT INTO edts (semaine, semestre, num_groupe) VALUES (10, 1, 4);
INSERT INTO edts (semaine, semestre, num_groupe) VALUES (10, 1, 5);
INSERT INTO edts (semaine, semestre, num_groupe) VALUES (10, 1, 6);
INSERT INTO edts (semaine, semestre, num_groupe) VALUES (10, 3, 7);
INSERT INTO edts (semaine, semestre, num_groupe) VALUES (10, 3, 8);
INSERT INTO edts (semaine, semestre, num_groupe) VALUES (10, 3, 9);
INSERT INTO edts (semaine, semestre, num_groupe) VALUES (10, 3, 10);
INSERT INTO edts (semaine, semestre, num_groupe) VALUES (10, 3, 11);

/* Insertion des cours pour les emplois du temps de la semaine du 17 au 21 novembre 
	Groupe A, B, C sans amphi*/
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '09:00:00', '10:30:00', 4, 1);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '14:00:00', '15:30:00', 9, 1);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '15:30:00', '17:00:00', 3, 1);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '09:00:00', '10:30:00', 3, 1);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '10:30:00', '12:00:00', 4, 1);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '13:00:00', '16:00:00', 7, 1);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '16:00:00', '18:00:00', 3, 1);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-19', '08:00:00', '09:30:00', 8, 1);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-19', '09:30:00', '11:00:00', 1, 1);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-19', '13:30:00', '15:00:00', 3, 1);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-19', '15:00:00', '17:00:00', 5, 1);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-20', '09:30:00', '11:00:00', 13, 1);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-20', '15:00:00', '16:30:00', 10, 1);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '08:30:00', '10:00:00', 13, 1);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '10:00:00', '12:00:00', 3, 1);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '14:00:00', '15:30:00', 1, 1);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '09:00:00', '10:30:00', 3, 2);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '10:30:00', '12:00:00', 9, 2);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '14:00:00', '15:30:00', 13, 2);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '15:30:00', '17:00:00', 1, 2);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '17:00:00', '20:00:00', 7, 2);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '09:00:00', '10:30:00', 4, 2);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '10:30:00', '12:00:00', 3, 2);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '14:00:00', '16:00:00', 3, 2);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-19', '09:30:00', '11:00:00', 8, 2);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-20', '09:00:00', '10:30:00', 4, 2);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '08:00:00', '10:00:00', 5, 2);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '11:00:00', '12:30:00', 12, 2);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '14:00:00', '15:30:00', 10, 2);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '10:30:00', '12:00:00', 4, 3);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '14:00:00', '15:30:00', 3, 3);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '15:30:00', '17:00:00', 13, 3);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '09:00:00', '10:30:00', 9, 3);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '13:00:00', '14:30:00', 3, 3);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '14:30:00', '16:00:00', 10, 3);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-19', '15:00:00', '18:00:00', 7, 3);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-19', '18:00:00', '19:30:00', 1, 3);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-20', '08:00:00', '09:30:00', 12, 3);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-20', '10:30:00', '12:00:00', 4, 3);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-20', '15:00:00', '17:00:00', 3, 3);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '09:30:00', '11:00:00', 8, 3);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '14:00:00', '15:3:00', 5, 3);
/*INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-', ':0:00', ':0:00', , 3);*/

/* Groupes de deuxième semaine du 17 au 21 novembre avec amphi */
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '10:00:00', '12:00:00', 37, 7);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '13:00:00', '15:00:00', 32, 7);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '15:00:00', '17:00:00', 39, 7);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '08:00:00', '10:00:00', 34, 7);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '10:00:00', '12:00:00', 31, 7);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '13:00:00', '15:00:00', 33, 7);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '15:00:00', '17:00:00', 38, 7);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '17:00:00', '19:00:00', 29, 7);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-19', '08:00:00', '10:00:00', 31, 7);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-19', '10:00:00', '12:00:00', 39, 7);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-19', '14:00:00', '16:00:00', 36, 7);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-19', '16:00:00', '18:00:00', 32, 7);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-20', '10:00:00', ':1200:00', 28, 7);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '08:00:00', '10:00:00', 40, 7);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '10:00:00', '12:00:00', 35, 7);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '14:00:00', '16:00:00', 30, 7);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '16:00:00', '18:00:00', 38, 7);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '09:00:00', '11:00:00', 39, 8);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '11:00:00', '13:00:00', 40, 8);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '14:00:00', '16:00:00', 37, 8);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '16:00:00', '18:00:00', 32, 8);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '08:00:00', '10:00:00', 38, 8);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '10:00:00', '12:00:00', 34, 8);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '13:00:00', '15:00:00', 28, 8);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '15:00:00', '17:00:00', 29, 8);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '17:00:00', '19:00:00', 31, 8);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-19', '08:00:00', '10:00:00', 36, 8);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-19', '10:00:00', '12:00:00', 32, 8);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-19', '14:00:00', '16:00:00', 31, 8);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-20', '08:00:00', '10:00:00', 30, 8);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-20', '10:00:00', '12:00:00', 39, 8);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '08:00:00', '10:00:00', 35, 8);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '10:00:00', '12:00:00', 39, 8);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '14:00:00', '16:00:00', 38, 8);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '16:00:00', '18:00:00', 32, 8);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '09:00:00', '11:00:00', 32, 9);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '11:00:00', '13:00:00', 33, 9);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '14:00:00', '16:00:00', 39, 9);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '16:00:00', '18:00:00', 37, 9);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '18:00:00', '20:00:00', 31, 9);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '08:00:00', '10:00:00', 36, 9);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '10:00:00', '12:00:00', 38, 9);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '13:00:00', '15:00:00', 31, 9);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '15:00:00', '17:00:00', 35, 9);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '17:00:00', '19:00:00', 28, 9);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-19', '08:00:00', '10:00:00', 29, 9);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-19', '10:00:00', '12:00:00', 32, 9);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-19', '14:00:00', '16:00:00', 34, 9);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-20', '10:00:00', '12:00:00', 40, 9);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '08:00:00', '10:00:00', 39, 9);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '10:00:00', '12:00:00', 38, 9);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '16:00:00', '18:00:00', 30, 9);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '09:00:00', '11:00:00', 30, 10);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '11:00:00', '13:00:00', 35, 10);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '14:00:00', '16:00:00', 38, 10);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '08:00:00', '10:00:00', 40, 10);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '10:00:00', '12:00:00', 36, 10);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '13:00:00', '15:00:00', 34, 10);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '15:00:00', '17:00:00', 31, 10);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-19', '08:00:00', '10:00:00', 33, 10);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-19', '10:00:00', '12:00:00', 31, 10);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-19', '14:00:00', '16:00:00', 38, 10);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-19', '17:00:00', '19:00:00', 29, 10);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-20', '08:00:00', '10:00:00', 39, 10);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-20', '10:00:00', '12:00:00', 32, 10);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '08:00:00', '10:00:00', 31, 10);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '10:00:00', '12:00:00', 32, 10);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '14:00:00', '16:00:00', 28, 10);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '16:00:00', '18:00:00', 39, 10);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '09:00:00', '11:00:00', 33, 11);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '11:00:00', '13:00:00', 32, 11);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '14:00:00', '16:00:00', 35, 11);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-17', '16:00:00', '18:00:00', 38, 11);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '08:00:00', '10:00:00', 31, 11);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '10:00:00', '12:00:00', 40, 11);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '13:00:00', '15:00:00', 29, 11);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-18', '15:00:00', '17:00:00', 39, 11);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-19', '10:00:00', '12:00:00', 36, 11);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-19', '14:00:00', '16:00:00', 32, 11);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-19', '16:00:00', '18:00:00', 31, 11);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-20', '08:00:00', '10:00:00', 34, 11);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-20', '10:00:00', '12:00:00', 30, 11);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '08:00:00', '10:00:00', 38, 11);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '10:00:00', '12:00:00', 37, 11);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-21', '14:00:00', '16:00:00', 39, 11);
INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-22', '16:00:00', '18:00:00', 28, 11);
INSERT INTO amphis(date_amphi, deb_amphi, fin_amphi, partiel, num_matiere) VALUES ('2014-11-19', '13:00:00', '14:00:00', false, 34);
INSERT INTO amphis(date_amphi, deb_amphi, fin_amphi, partiel, num_matiere) VALUES ('2014-11-20', '13:00:00', '15:00:00', false, 36);
INSERT INTO amphis(date_amphi, deb_amphi, fin_amphi, partiel, num_matiere) VALUES ('2014-11-20', '15:30:00', '16:30:00', false, 110);
INSERT INTO amphis(date_amphi, deb_amphi, fin_amphi, partiel, num_matiere) VALUES ('2014-11-21', '13:00:00', '14:00:00', false, 28);
/* INSERT INTO cours(date_cours, horaire_deb, horaire_fin, num_matiere, num_edt) VALUES ('2014-11-', ':00:00', ':00:00', , ); */

/* Travaux à rendre. Concerne les deuxième année uniquement (pour le moment) */
INSERT INTO travauxes(desc_travail, echeance, progression, num_membre, num_matiere) VALUES ('Création d''abre et de matrices. Fonctionnalités à ajouter', '2014-12-15', 'En cours', 76, 30);
INSERT INTO travauxes(desc_travail, echeance, progression, num_membre, num_matiere) VALUES ('Projet gestion des stages à l''iut', '2014-12-15', 'En cours', 76, 40);
INSERT INTO travauxes(desc_travail, echeance, progression, num_membre, num_matiere) VALUES ('Cv et lettre de motivation', '2014-11-30', 'En cours', 76, 42);
INSERT INTO travauxes(desc_travail, echeance, progression, num_membre, num_matiere) VALUES ('Site internet sur le pronote', '2014-12-01', 'En cours', 76, 31);
INSERT INTO travauxes(desc_travail, echeance, progression, num_membre, num_matiere) VALUES ('Probabilités avec Walter :)', '2014-12-05', 'En cours', 76, 35);
/* INSERT INTO travauxes(desc_travail, echeance, progression, num_membre, num_matiere) VALUES ('', '2014-', 'En cours', , ); */
