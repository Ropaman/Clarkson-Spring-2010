IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SET_CLINICIAN_FULL_NAME]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SET_CLINICIAN_FULL_NAME]
GO
/****** Object:  StoredProcedure [dbo].[SET_CLINICIAN_FULL_NAME]    Script Date: 05/04/2007 13:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christopher Pope
-- Create date: Oct 31 2006
-- Description:	Sets the clinician full name.
-- =============================================
CREATE PROCEDURE SET_CLINICIAN_FULL_NAME 
	-- Add the parameters for the stored procedure here
	@userID int,
	@fullName varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Error checking, do they already exist?
	IF NOT EXISTS ( SELECT * FROM  [user] WHERE [user_id] = @userID )
	BEGIN
		RAISERROR('No such user exists.', 16, 1);
		RETURN 0
	END

	UPDATE [user] SET name = @fullName WHERE [user_id] = @userID;
END

GO
GRANT EXECUTE ON [dbo].[SET_CLINICIAN_FULL_NAME] TO [movement_app]
GO
