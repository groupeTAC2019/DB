CREATE DATABASE HomeShareDB
go

USE HomeShareDB
go

CREATE TABLE Assurance(
   id_assurance INT IDENTITY(1,1),
   type VARCHAR(50) NOT NULL UNIQUE,
   prix DECIMAL(15,2),
   PRIMARY KEY(id_assurance)
);

CREATE TABLE Options(
   id_option INT IDENTITY(1,1),
   nom VARCHAR(50) NOT NULL UNIQUE,
   PRIMARY KEY(id_option)
);

CREATE TABLE Piece(
   id_piece INT IDENTITY(1,1),
   nom VARCHAR(50) NOT NULL UNIQUE,
   PRIMARY KEY(id_piece)
);

CREATE TABLE Pays(
   id_pays INT IDENTITY(1,1),
   nom VARCHAR(50) NOT NULL UNIQUE,
   PRIMARY KEY(id_pays)
);

CREATE TABLE Membre(
   id_membre INT IDENTITY(1,1),
   nom VARCHAR(50) NOT NULL,
   prenom VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL UNIQUE,
   tel INT NOT NULL,
   is_admin BIT NOT NULL,
   id_pays INT NOT NULL,
   mdp VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_membre),
   FOREIGN KEY(id_pays) REFERENCES Pays(id_pays)
);

CREATE TABLE Adresse(
   id_adresse INT IDENTITY(1,1),
   ville VARCHAR(50) NOT NULL,
   cp INT NOT NULL,
   rue VARCHAR(50) NOT NULL,
   num INT NOT NULL,
   boite VARCHAR(50),
   id_pays INT NOT NULL,
   PRIMARY KEY(id_adresse),
   FOREIGN KEY(id_pays) REFERENCES Pays(id_pays)
);

CREATE TABLE Bien(
   id_bien INT IDENTITY(1,1),
   titre VARCHAR(50) NOT NULL,
   desc_courte VARCHAR(255) NOT NULL,
   desc_longue VARCHAR(255) NOT NULL,
   nb_personne INT NOT NULL,
   disponible BIT NOT NULL,
   date_desactivation DATE,
   id_adresse INT NOT NULL,
   id_membre INT NOT NULL,
   PRIMARY KEY(id_bien),
   FOREIGN KEY(id_adresse) REFERENCES Adresse(id_adresse),
   FOREIGN KEY(id_membre) REFERENCES Membre(id_membre)
);

CREATE TABLE Commentaire(
   id_commentaire INT IDENTITY(1,1),
   message VARCHAR(255) NOT NULL,
   note INT NOT NULL,
   valide BIT NOT NULL,
   id_membre INT NOT NULL,
   id_bien INT NOT NULL,
   PRIMARY KEY(id_commentaire),
   FOREIGN KEY(id_membre) REFERENCES Membre(id_membre),
   FOREIGN KEY(id_bien) REFERENCES Bien(id_bien)
);

CREATE TABLE Echange(
   id_echange INT IDENTITY(1,1),
   date_debut DATE NOT NULL,
   date_fin VARCHAR(50) NOT NULL,
   valide BIT NOT NULL,
   id_bien INT NOT NULL,
   id_membre INT NOT NULL,
   PRIMARY KEY(id_echange),
   FOREIGN KEY(id_bien) REFERENCES Bien(id_bien),
   FOREIGN KEY(id_membre) REFERENCES Membre(id_membre)
);

CREATE TABLE comporte(
   id_bien INT,
   id_option INT,
   PRIMARY KEY(id_bien, id_option),
   FOREIGN KEY(id_bien) REFERENCES Bien(id_bien),
   FOREIGN KEY(id_option) REFERENCES Options(id_option)
);

CREATE TABLE comprend(
   id_echange INT,
   id_assurance INT,
   PRIMARY KEY(id_echange, id_assurance),
   FOREIGN KEY(id_echange) REFERENCES Echange(id_echange),
   FOREIGN KEY(id_assurance) REFERENCES Assurance(id_assurance)
);

CREATE TABLE imposer(
   id_assurance INT,
   id_bien INT,
   PRIMARY KEY(id_assurance, id_bien),
   FOREIGN KEY(id_assurance) REFERENCES Assurance(id_assurance),
   FOREIGN KEY(id_bien) REFERENCES Bien(id_bien)
);

CREATE TABLE verifier(
   id_membre INT,
   id_commentaire INT,
   PRIMARY KEY(id_membre, id_commentaire),
   FOREIGN KEY(id_membre) REFERENCES Membre(id_membre),
   FOREIGN KEY(id_commentaire) REFERENCES Commentaire(id_commentaire)
);

CREATE TABLE contien(
   id_bien INT,
   id_piece INT,
   nombre INT,
   PRIMARY KEY(id_bien, id_piece),
   FOREIGN KEY(id_bien) REFERENCES Bien(id_bien),
   FOREIGN KEY(id_piece) REFERENCES Piece(id_piece)
);

CREATE TABLE composer(
   id_assurance INT,
   id_assurance_1 INT,
   PRIMARY KEY(id_assurance, id_assurance_1),
   FOREIGN KEY(id_assurance) REFERENCES Assurance(id_assurance),
   FOREIGN KEY(id_assurance_1) REFERENCES Assurance(id_assurance)
);

CREATE TABLE Photo(
   id_image INT IDENTITY(1,1),
   lien VARCHAR(50) NOT NULL,
   legende VARCHAR(50),
   id_bien INT NOT NULL,
   PRIMARY KEY(id_image),
   FOREIGN KEY(id_bien) REFERENCES Bien(id_bien)
);
