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