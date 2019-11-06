USE HomeShareDB
GO

CREATE VIEW V_Bien_Pays
AS
SELECT B.titre AS "titre bien",
		B.desc_courte AS "Description courte",
		B.desc_longue AS "Description longue",
		B.disponible AS "Disponible",
		B.nb_personne AS "Nombre de personne",
		A.num AS "numero",
		A.rue AS "rue",
		A.ville AS "Ville",
		A.cp AS "code postal",
		A.boite AS "boite",
		Pa.nom AS "Pays"
		FROM Bien AS B LEFT JOIN Adresse AS A ON B.id_adresse = A.id_adresse
					LEFT JOIN Pays AS Pa ON A.id_pays = Pa.id_pays
GO

CREATE VIEW V_Dernier_5_Bien
AS
SELECT TOP 5 B.titre AS "titre bien",
		B.desc_courte AS "Description courte",
		B.desc_longue AS "Description longue",
		B.disponible AS "Disponible",
		B.nb_personne AS "Nombre de personne"
		FROM Bien AS B
			ORDER BY B.date_ajout
GO
CREATE VIEW V_Bien_Bonne_Note
AS
SELECT B.titre AS "titre bien",
		B.desc_courte AS "Description courte",
		B.desc_longue AS "Description longue",
		B.disponible AS "Disponible",
		B.nb_personne AS "Nombre de personne",
		A.num AS "numero",
		A.rue AS "rue",
		A.ville AS "Ville",
		A.cp AS "code postal",
		A.boite AS "boite",
		Pa.nom AS "Pays"
		FROM Bien AS B LEFT JOIN Adresse AS A ON B.id_adresse = A.id_adresse
					LEFT JOIN Pays AS Pa ON A.id_pays = Pa.id_pays
					LEFT JOIN Commentaire AS C ON  B.id_bien = id_commentaire
WHERE C.note >= 6
GO