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
SELECT B.*,
		A.num,
		A.rue,
		A.ville,
		A.cp,
		A.boite,
		A.id_pays,
		Pa.nom,
		M.nom,
		M.prenom,
		M.email,
		M.tel,
		M.is_admin,
		M.mdp,
		Ph.id_image,
		Ph.legende,
		Ph.lien
	FROM Bien AS B LEFT JOIN Adresse AS A ON B.id_adresse = A.id_adresse
					LEFT JOIN Pays AS Pa ON A.id_pays = Pa.id_pays
					LEFT JOIN Membre AS M ON B.id_membre = M.id_membre
					LEFT JOIN Photo AS Ph ON B.id_bien = Ph.id_bien
		WHERE B.id_bien = @id_bien
GO

CREATE PROCEDURE Bien_A_Date @date_debut DATE , @date_fin DATE
AS
SELECT * 
	FROM Bien AS B
		WHERE B.id_bien NOT IN (SELECT E.id_bien 
								FROM Echange AS E 
									WHERE E.valide = 1
										AND (
											(E.date_debut >  @date_debut AND E.date_fin < @date_fin)
											OR
											(@date_debut >= E.date_debut AND @date_debut <= E.date_fin)
											OR
											(@date_fin >= E.date_debut AND @date_fin <= E.date_fin)
											)										
											)
GO

--test date 23-1-2020 au 25-01-2020 2 1ers resultats