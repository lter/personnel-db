CREATE TRIGGER statusupdate  ON dbo.person
FOR  UPDATE
AS

IF @@ROWCOUNT = 0
   RETURN

DECLARE @personid int ,  @status int

if ( update(status))

BEGIN 
   
  SELECT @personid = personid, @status = status
  FROM inserted

  IF exists ( select * from dbo.person_group where personid = @personid)  AND @status = 4
  
  BEGIN

    UPDATE dbo.person_group set status = @status where personid=@personid
  END
  
 END 
/*
This trigger fires when person.status column is updated.  It updates the person_group
table status column so that mail lists will reflect when a person has been given a status
4, that is deleted from the database.  Scripts from the Unix side that run every 5 minutes
will update the majordomo lists to take out emails of deleted people
17 Nov 2003 - Troy Maddux

*/









