USE HomeShareDB
GO
--TODO ameliorer l'order/group by de la view
SELECT VIEW V_Bien_Pays
AS
SELECT  id_pays,B.*
		FROM Adresse AS A LEFT JOIN Bien AS B ON B.id_adresse = A.id_adresse
					GROUP BY A.id_pays, 
							B.id_bien,
							B.id_membre,
							B.id_adresse,
							B.disponible,
							B.titre,
							B.nb_personne,
							B.date_ajout,
							B.desc_courte,
							B.desc_longue,
							B.date_desactivation,
							B.is_delete
GO
CREATE VIEW V_Dernier_5_Bien
AS
SELECT TOP 5 B.*
		FROM Bien AS B
			ORDER BY B.date_ajout
GO



CREATE VIEW V_Bien_Bonne_Note
AS
SELECT B.*
		FROM Bien AS B LEFT JOIN Commentaire AS C ON  B.id_bien = id_commentaire
WHERE C.note >= 6
GO