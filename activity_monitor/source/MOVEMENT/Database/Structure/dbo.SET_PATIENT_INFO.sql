IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SET_PATIENT_INFO]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SET_PATIENT_INFO]
GO
/****** Object:  StoredProcedure [dbo].[SET_PATIENT_INFO]    Script Date: 05/04/2007 13:17:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christopher Pope
-- Create date: Oct 31 2006
-- Description:	Set the patient's contact information.
-- =============================================
CREATE PROCEDURE SET_PATIENT_INFO 
	-- Add the parameters for the stored procedure here
	@patientID int, 
	@info text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Error checking, do they already exist?
	IF NOT EXISTS ( SELECT * FROM patient WHERE patient_id = @patientID)
	BEGIN
		RAISERROR('The patient does not exists.', 16, 1);
		RETURN 0
	END

	UPDATE patient SET contact_info = @info WHERE patient_id = @patientID;
END

GO
GRANT EXECUTE ON [dbo].[SET_PATIENT_INFO] TO [movement_app]
GO
