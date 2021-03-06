IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHANGE_PASSWORD]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CHANGE_PASSWORD]
GO
/****** Object:  StoredProcedure [dbo].[CHANGE_PASSWORD]    Script Date: 05/04/2007 13:16:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christopher Pope
-- Create date: Oct 25, 2006
-- Description:	Change a Clinician(user) password.
-- =============================================
CREATE PROCEDURE [dbo].[CHANGE_PASSWORD] 
	-- Add the parameters for the stored procedure here
	@userID int, 
	@newPasswd char(32)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT * FROM [user] WHERE [user_id] = @userID)
	BEGIN 
		RAISERROR('Password change failed. No such user.',16,1);
	END
    -- Insert statements for procedure here
	UPDATE [user] SET password = @newPasswd WHERE [user_id] = @userID;

END


GO
GRANT EXECUTE ON [dbo].[CHANGE_PASSWORD] TO [movement_app]
GO
