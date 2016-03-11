REATE TRIGGER [PERSON_UPDATE] ON [PERSON] 
FOR  UPDATE
AS

DECLARE @emailalias varchar(50)
DECLARE @person_id int  
DECLARE @newfirstname varchar(30)
DECLARE @newlastname varchar(50)
DECLARE @newprimaryemail varchar(80)
DECLARE @newpassword varchar(26)

SELECT @person_id=0

IF ( update(firstname) or update(lastname) or update(primaryemail)
     or update(password))

BEGIN

 	 SELECT @person_id =personid,@newfirstname=firstname,@newlastname=lastname,@newpassword=password,@newprimaryemail=primaryemail
 		 from inserted

	 SELECT @emailalias = (SELECT  emailalias from ltertable where personid=@person_id )

 	IF (@emailalias is not null)
 	
     	

    	INSERT INTO ldap(PERSONID,EMAILALIAS,ACTIONTYPE,FIRSTNAME,LASTNAME,PRIMARYEMAIL,PASSWORD) 
		VALUES(@person_id,@emailalias,3,@newfirstname,@newlastname,@newprimaryemail,@newpassword);    
 END 














