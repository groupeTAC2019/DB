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

CREATE PROCEDURE Select_Bien_Pays @pays_name VARCHAR(50)
AS
SELECT * FROM Bien AS B LEFT JOIN Adresse AS A ON B.id_adresse=A.id_adresse
						LEFT JOIN Pays AS P ON A.id_pays=P.id_pays
						WHERE P.nom = 'France'

						--TODO Finish this!