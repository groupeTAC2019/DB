CREATE TRIGGER DeleteTrigger
ON Bien
INSTEAD OF DELETE
AS
begin
	UPDATE Bien 
	set is_delete = 1
	where id_bien in (select id_bien from deleted)
end
GO

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
	set is_delete = 1
	where id_membre in (select id_membre from deleted)
end
GO

--update Membre 
--set isDelete = 0

--begin transaction
--delete from Membre where id_membre = 2
--select * from Membre
--rollback transaction