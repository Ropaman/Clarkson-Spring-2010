IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REMOVE_CLINICIAN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[REMOVE_CLINICIAN]
GO
/****** Object:  StoredProcedure [dbo].[REMOVE_CLINICIAN]    Script Date: 05/04/2007 13:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christopher Pope
-- Create date: Oct 25 2006
-- Description:	Removes a specified Clinician (user) from the database.
-- =============================================
CREATE PROCEDURE [dbo].[REMOVE_CLINICIAN] 
	-- Add the parameters for the stored procedure here
	@userID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT * FROM [user] WHERE [user_id] = @userID)
	BEGIN
		RAISERROR('No such user exists.', 16,1);
		RETURN
	END

	BEGIN TRANSACTION

    -- Insert statements for procedure here
	DELETE FROM [user] WHERE [user_id] = @userID;
	
	IF (@@ROWCOUNT = 0)
	BEGIN
		RAISERROR('We cannot remove the specified user; they stil exists.', 16,1);
		ROLLBACK TRANSACTION
		RETURN
	END

	COMMIT TRANSACTION;
END


GO
GRANT EXECUTE ON [dbo].[REMOVE_CLINICIAN] TO [movement_app]
GO
