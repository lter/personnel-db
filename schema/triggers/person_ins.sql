CREATE TRIGGER [PERSON_INS] ON [PERSON] 
FOR INSERT
AS

DECLARE @newpersonid int;  


SELECT @newpersonid = personid from inserted
 
BEGIN 
   
 INSERT INTO contact (PERSONID) VALUES(@newpersonid);       
 
END






