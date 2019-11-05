USE HomeShareDB
go

INSERT INTO Pays (nom)
VALUES ('Belgique'),('France'),('Allemagne'),('Suisse'),('Hollande')

INSERT INTO Membre (nom,prenom,email,tel,is_admin,mdp,id_pays)
VALUES ('Jean','Charle','jean.charle@gmail.com','012962657',0,'1234', (SELECT id_pays FROM Pays WHERE nom ='France')),
('Goovaerts','Corentin','corentin.goovaerts@gmail.com','080378420',1,'4321',(SELECT id_pays FROM Pays WHERE nom ='Belgique')),
('Surin','Thomas','ythomas@gmail.com','04086403',1,'0000',(SELECT id_pays FROM Pays WHERE nom ='Belgique')),
('Lerusse','Alexandre','alex@gmail.com','065257361',1,'1111',(SELECT id_pays FROM Pays WHERE nom ='Belgique'))

INSERT INTO Piece (nom)
VALUES ('salle d''eau'),
('salon'),
('chambre'),
('cuisine'),
('cave'),
('grenier')

Insert INTO Adresse (ville,cp,rue,num,boite,id_pays)
VALUES ('namur',2232,' rue de lEglise',312,null,1),
		('bruxelles',1432,' Ch de Waterloo',32,'3a',1),
		('charleroi',2250,' rue de Pierre',89,'2',1),
		('paris',9576,' Place de revolution',12,'4',2)

Insert INTO Options(nom)
Values ('intenet'),('TV'),('piscine'),('booling'),('terasse'),('garage'),('placeParking'),('billard'),
		('terrin de tennis'),('niche de chien')

Insert INTO Assurance(type, prix)
Values ('degradation',15),('inondation',5),('insondie',10),('dessee',5),('assistanceAuto',10),('vole',5),('perte',10)

INSERT INTO Bien(titre,desc_courte,
				desc_longue,
				nb_personne,disponible,date_desactivation,id_adresse,id_membre)
VALUES ('maison de campagne','iam impotentia fines mediocrium delictorum nefanda Clematii cuiusdam Alexandrini nobilis mors repentina',
'Eminuit autem inter humilia supergressa iam impotentia fines mediocrium delictorum nefanda Clematii cuiusdam Alexandrini nobilis mors repentina',
  3,1,null,1,(SELECT id_membre FROM Membre WHERE nom ='Jean')),
('appartement centre ville','iam impotentia fines mediocrium delictorum nefanda Clematii cuiusdam Alexandrini nobilis mors repentina',
'Eminuit autem inter humilia supergressa iam impotentia fines mediocrium delictorum nefanda Clematii cuiusdam Alexandrini nobilis mors repentina',
  2,0,null,2,(SELECT id_membre FROM Membre WHERE nom ='Goovaerts')),
('chalet de montagne','iam impotentia fines mediocrium delictorum nefanda Clematii cuiusdam Alexandrini nobilis mors repentina',
'Eminuit autem inter humilia supergressa iam impotentia fines mediocrium delictorum nefanda Clematii cuiusdam Alexandrini nobilis mors repentina',
  5,1,null,3,(SELECT id_membre FROM Membre WHERE nom ='Surin'))

INSERT INTO Echange (date_debut,date_fin,valide,id_bien,id_membre)
VALUES ('2019-04-11','2019-04-21',0,1,2),
('2018-07-29','2019-01-05',0,2,1),
('2019-12-03','2020-01-15',1,3,4)

INSERT INTO Commentaire (message,note,valide) 
VALUES ('super sauf les voisins',3,1),
	   ('le propietaire est un gros radin',0,0),
	   ('exelent , je retournerai l an prochain',5,1)

INSERT INTO contien (id_bien,id_piece,nombre)
VALUES (1,2,3),(2,1,1)
