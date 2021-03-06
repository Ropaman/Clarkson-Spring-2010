IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[STORE_PATIENT_NOTE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[STORE_PATIENT_NOTE]
GO
/****** Object:  StoredProcedure [dbo].[STORE_PATIENT_NOTE]    Script Date: 05/04/2007 13:17:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christopher Pope
-- Create date: Oct 27 2006
-- Description:	Creates a new patient note for the specified patient.
-- =============================================
CREATE PROCEDURE STORE_PATIENT_NOTE 
	-- Add the parameters for the stored procedure here
	@patientID int,
	@userID int, 
	@note text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @pname varchar(50);
	SELECT @pname = name FROM patient WHERE patient_id = @patientID;

	-- Error checking, do they already exist?
	IF NOT EXISTS ( SELECT * FROM patient WHERE patient_id = @patientID )
	BEGIN
		RAISERROR('The specified patient does not exist.', 16, 1);
		RETURN
	END

	IF NOT EXISTS ( SELECT * FROM [user] WHERE [user_id] = @userID )
	BEGIN
		RAISERROR('The specified user does not exist.', 16, 1);
		RETURN
	END

	-- Set a ROLLBACK POINT
	BEGIN TRANSACTION
	
	INSERT INTO patient_note (patient_id, timestamp, [user_id], note)
	VALUES (@patientID, getutcdate(), @userID, @note);

	IF @@error <> 0 
	BEGIN 
		ROLLBACK TRANSACTION
		RAISERROR('An error occurred while attempting to add a note for patient %s',16,1, @pname);
		RETURN 
	END
	-- Return results.
	COMMIT TRANSACTION
	RETURN 0
END

GO
GRANT EXECUTE ON [dbo].[STORE_PATIENT_NOTE] TO [movement_app]
GO
