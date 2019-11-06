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