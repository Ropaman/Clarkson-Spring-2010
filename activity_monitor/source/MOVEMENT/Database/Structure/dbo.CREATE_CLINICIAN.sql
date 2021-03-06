IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_CLINICIAN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CREATE_CLINICIAN]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_CLINICIAN]    Script Date: 05/04/2007 13:16:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christopher Pope
-- Create date: October 24, 2006
-- Description:	A procedure for creating a Clinician.
-- =============================================
CREATE PROCEDURE [dbo].[CREATE_CLINICIAN] 
	-- Add the parameters for the stored procedure here
	@uname		varchar(50),
	@upass		binary(20),
	@realname	varchar(50),
	@info		text	= NULL,
	-- TODO: We haven't implement user roles yet.
	@role		char(1) = 'a'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO "user" (role, created, username, password, name,		contact_info)
	VALUES			  (@role, getdate(),   @uname,   @upass,   @realname,	@info);
	
	--MPP 11/2/06: return the new user's id
	RETURN @@IDENTITY
END





GO
GRANT EXECUTE ON [dbo].[CREATE_CLINICIAN] TO [movement_app]
GO
