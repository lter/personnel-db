CREATE TRIGGER [modifydateperson] ON dbo.person 
FOR  UPDATE
AS 
UPDATE M
set moddate =GetDate()
from person M INNER JOIN inserted I on M.personid=I.personid


