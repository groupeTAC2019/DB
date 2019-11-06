USE HomeShareDB
GO

CREATE PROCEDURE Creation_Bien @titre VARCHAR(50), 
				@desc_courte VARCHAR(255),
				@desc_longue VARCHAR(255),
				@nb_personne INT,
				@disponible BIT,
				@date_desactivation DATE,
				@id_adresse INT,
				@id_membre INT
AS
INSERT INTO Bien(titre,
				desc_courte,
				desc_longue,
				nb_personne,
				disponible,
				date_desactivation,
				id_adresse,
				id_membre)
VALUES (@titre,
		@desc_courte,
		@desc_longue,
		@nb_personne,
		@disponible,
		@date_desactivation,
		@id_adresse,
		@id_membre)
GO

CREATE PROCEDURE Bien_Membre @id_membre INT
AS
SELECT * FROM Bien WHERE id_membre = @id_membre
GO

CREATE PROCEDURE Details_Bien @id_bien INT
AS
SELECT B.id_bien AS "id bien",
		B.titre AS "Titre du bien",
		B.desc_courte AS "Desccritpion courte",
		B.desc_longue AS "Desccritpion longue",
		B.nb_personne AS "Nombre de personne",
		B.disponible AS Disponible,
		B.date_desactivation AS "date de desactivation",
		A.ville AS Ville,
		A.cp AS CP,
		A.rue AS Rue,
		A.num AS Numero,
		A.boite AS Boite,
		Pa.nom AS Pays,
		M.nom,
		M.email,
		Ph.legende,
		Ph.lien
	FROM Bien AS B LEFT JOIN Adresse AS A ON B.id_adresse = A.id_adresse
					LEFT JOIN Pays AS Pa ON A.id_pays = Pa.id_pays
					LEFT JOIN Membre AS M ON B.id_membre = M.id_membre
					LEFT JOIN Photo AS Ph ON B.id_bien = Ph.id_bien
		WHERE B.id_bien = @id_bien