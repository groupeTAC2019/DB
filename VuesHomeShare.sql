USE HomeShareDB
GO

CREATE VIEW V_Bien_Pays
AS
SELECT B.*,
		A.num,
		A.rue,
		A.ville,
		A.cp,
		A.boite,
		A.id_pays,
		Pa.nom
		FROM Bien AS B LEFT JOIN Adresse AS A ON B.id_adresse = A.id_adresse
					LEFT JOIN Pays AS Pa ON A.id_pays = Pa.id_pays
GO

CREATE VIEW V_Dernier_5_Bien
AS
SELECT TOP 5 B.*
		FROM Bien AS B
			ORDER BY B.date_ajout
GO



CREATE VIEW V_Bien_Bonne_Note
AS
SELECT B.*,
		A.num,
		A.rue,
		A.ville,
		A.cp,
		A.boite,
		A.id_pays,
		Pa.nom
		FROM Bien AS B LEFT JOIN Adresse AS A ON B.id_adresse = A.id_adresse
					LEFT JOIN Pays AS Pa ON A.id_pays = Pa.id_pays
					LEFT JOIN Commentaire AS C ON  B.id_bien = id_commentaire
WHERE C.note >= 6
GO