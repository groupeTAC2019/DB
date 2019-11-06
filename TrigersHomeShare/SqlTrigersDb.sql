--CREATE TRIGGER isDelete
--ON Adresse
--INSTEAD OF DELETE
--AS
--begin
--	UPDATE Adresse 
--	set isDelete = 1
--	where id_adresse in (select id_adresse from deleted)
--end

--ALTER TABLE Adresse ADD isDelete bit default 0

--update Adresse 
--set isDelete = 0

--begin transaction
--delete from Adresse where id_adresse = 2
--select * from Adresse
--rollback transaction

--CREATE TRIGGER DeleteTrigger
--ON Bien
--INSTEAD OF DELETE
--AS
--begin
--	UPDATE Bien 
--	set isDelete = 1
--	where id_bien in (select id_bien from deleted)
--end

--ALTER TABLE Bien ADD isDelete bit default 0

--update Bien 
--set isDelete = 0

--begin transaction
--delete from Bien where id_bien = 2
--select * from Bien
--rollback transaction

CREATE TRIGGER DeleteTriggerMembre
ON Membre
INSTEAD OF DELETE
AS
begin
	UPDATE Membre 
	set isDelete = 1
	where id_membre in (select id_membre from deleted)
end

ALTER TABLE Membre ADD isDelete bit default 0

update Membre 
set isDelete = 0

begin transaction
delete from Membre where id_membre = 2
select * from Membre
rollback transaction