IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_TEST_BATCH]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GET_TEST_BATCH]
GO
/****** Object:  StoredProcedure [dbo].[GET_TEST_BATCH]    Script Date: 05/04/2007 13:16:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael Petito
-- Create date: Nov 14 2006
-- Description:	Retrieve all of a patient's information.
-- =============================================
CREATE PROCEDURE [dbo].[GET_TEST_BATCH] 
	@batchID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--select the batch metadata
	SELECT *
	FROM test_batch
	WHERE batch_id = @batchID	

	-- Error checking, do they already exist?
	IF @@ROWCOUNT = 0
	BEGIN
		RAISERROR('The test batch does not exist.', 16, 1);
		RETURN 0
	END

	--select the batch sequence
	SELECT script_id
	FROM test_batch_tests
	WHERE batch_id = @batchID
	ORDER BY sequence ASC
END


GO
GRANT EXECUTE ON [dbo].[GET_TEST_BATCH] TO [movement_app]
GO
