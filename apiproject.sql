IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'APIProject')
  BEGIN
    CREATE DATABASE [APIProject]


    END
    GO
       USE [APIProject]
    GO
--You need to check if the table exists
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Users' and xtype='U')
BEGIN
    CREATE TABLE Users (
        Id INT PRIMARY KEY IDENTITY (1, 1),
        Email VARCHAR(100),
		Password VARCHAR(20),
		Status bit
    )
END

GO

CREATE PROC sp_registerUser(@Email varchar(100),@Password varchar(20))
As
BEGIN
  IF NOT EXISTS (SELECT * FROM Users u WHERE u.Email=@Email)
  BEGIN
  INSERT INTO Users VALUES (@Email,@Password,0)
END
END

GO



CREATE PROC sp_activateuser(@email varchar(100))
AS
BEGIN
IF EXISTS (select * from users u where u.Email=email)
BEGIN
update users set status=1 where Email=email
END
END


go