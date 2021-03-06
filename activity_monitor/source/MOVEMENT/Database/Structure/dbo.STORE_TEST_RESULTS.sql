IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[STORE_TEST_RESULTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[STORE_TEST_RESULTS]
GO
/****** Object:  StoredProcedure [dbo].[STORE_TEST_RESULTS]    Script Date: 05/04/2007 13:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christopher Pope
-- Create date: Oct 27 2006
-- Description:	Store the results of an administererd test.
-- =============================================
CREATE PROCEDURE [dbo].[STORE_TEST_RESULTS] 
	-- Add the parameters for the stored procedure here
	@scriptID	int,
	@patientID  int,	--MPP 11/12/06: modified to take a patientID
	@userID		int,
	--MPP 11/12/06: modified to take hand, mode, and rotation
	@hand char(1),
	@mode char(1),
	@rotation smallint,
	-- Provided so that they can optional supply a time in the past
	-- when they administered the test.
	@date		smalldatetime = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @testID int;

	IF (@date IS NULL)	--MPP 11/12/06: use IS / IS NOT for doing compares against NULL
	BEGIN
		SELECT @date = getutcdate();
	END

	-- Error checking, do they already exist?
	IF NOT EXISTS ( SELECT * FROM [user] WHERE [user_id] = @userID)
	BEGIN
		RAISERROR('The specified user does not exists.', 16, 1);
		RETURN 0
	END

	--MPP 11/12/06: modified to check for patient existence, not subject existence
	IF NOT EXISTS ( SELECT * FROM [patient] WHERE patient_id = @patientID)
	BEGIN
		RAISERROR('The specified patient/subject does not exists.', 16, 1);
		RETURN 0
	END	
	
	IF NOT EXISTS ( SELECT script_id FROM test_script WHERE script_id = @scriptID)
	BEGIN
		RAISERROR('The specified test type does not exists.', 16, 1);
		RETURN 0
	END

	--MPP 11/12/06: modified to determine the subjectID from patientID
	DECLARE @subjectID uniqueidentifier
	SELECT @subjectID = subject_id
	FROM patient_subject
	WHERE patient_id = @patientID
	

	-- Actually create test entry now.
	INSERT INTO test (timestamp, [user_id], subject_id, script_id, hand, mode, rotation)
	VALUES (@date, @userID, @subjectID, @scriptID, @hand, @mode, @rotation);

	-- Basically, we're returing the testid of the newly created test we are inserting.
	RETURN @@IDENTITY

	--MPP 11/12/06: removed the check for @@ROWCOUNT -- if no row was inserted, SQL exception would occur
END






GO
GRANT EXECUTE ON [dbo].[STORE_TEST_RESULTS] TO [movement_app]
GO
