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

