IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_CURRENT_TEST_SCRIPT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GET_CURRENT_TEST_SCRIPT]
GO
/****** Object:  StoredProcedure [dbo].[GET_CURRENT_TEST_SCRIPT]    Script Date: 05/04/2007 13:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Christopher Pope
-- Create date: Nov 12 2006
-- Description:	Retrieves the most recent version of a test script.
-- =============================================
CREATE PROCEDURE GET_CURRENT_TEST_SCRIPT 
	-- Add the parameters for the stored procedure here
	@typeID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT TOP 1 * FROM test_script 
	WHERE type_id = @typeID ORDER BY version DESC;
	
END

GO
GRANT EXECUTE ON [dbo].[GET_CURRENT_TEST_SCRIPT] TO [movement_app]
GO
