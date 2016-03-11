****** Object:  Stored Procedure dbo.uniqueid    Script Date: 5/15/2002 11:24:28 AM ******/
/****** Object:  Stored Procedure dbo.uniqueid    Script Date: 9/23/97 8:14:17 AM ******/
/****** Object:  Stored Procedure dbo.uniqueid    Script Date: 4/18/97 11:28:56 AM ******/
/****** Object:  Stored Procedure dbo.uniqueid    Script Date: 4/17/97 10:35:43 AM ******/
/****** Object:  Stored Procedure dbo.uniqueid    Script Date: 4/17/97 8:51:17 AM ******/
/******Generated from SQL created from OBFS DB on SQL Server 6.5 on the machine SQL - Troy Maddux 15 May 2002 ******/
/******This procedure generates the unique id of the first letter of the first name concatenated ******/
/****** with the last name plus a number if needed - Troy Maddux 18 May 2002 ******/

CREATE PROCEDURE uniqueid @nl varchar(40), @nf varchar(20), @tempid varchar(43) output
AS
DECLARE @num int
IF (@nl IS NULL)
   SELECT @tempid = 'NoName'
ELSE
   SELECT @tempid = RTRIM (SUBSTRING (LOWER (LTRIM (@nf)), 1, 1) + LOWER (LTRIM (@nl)))
IF EXISTS (SELECT * FROM pers WHERE id=@tempid)
BEGIN
   IF EXISTS (SELECT id FROM duplid WHERE id=@tempid)
   BEGIN
      SELECT @num=nextid FROM duplid WHERE id=@tempid
      UPDATE duplid SET nextid=@num+1 WHERE id=@tempid
      SELECT @tempid = @tempid + LTRIM (STR (@num))
      RETURN
   END
   SELECT @num = 1
   INSERT duplid (id, nextid) VALUES (@tempid, @num+1)
   SELECT @tempid = @tempid + ltrim (STR (@num))
   RETURN
END
RETURN
GO

