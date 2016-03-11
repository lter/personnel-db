CREATE TRIGGER update_email ON person
AFTER UPDATE 
AS

if update(primaryemail)
begin

UPDATE  pg
set pg.status = 3
FROM person_group pg
inner join inserted i on i.personid = pg.personid
end
/* Trigger created 17 Oct 2003 by Troy Maddux to 
   update person_group records so mail lists will 
   get updated when someone changes their email 
   address					*/



