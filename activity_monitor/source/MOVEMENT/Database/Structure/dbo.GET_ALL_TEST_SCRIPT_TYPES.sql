IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_ALL_TEST_SCRIPT_TYPES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GET_ALL_TEST_SCRIPT_TYPES]
GO
/****** Object:  StoredProcedure [dbo].[GET_ALL_TEST_SCRIPT_TYPES]    Script Date: 05/04/2007 13:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael Petito
-- Create date: Nov 12 2006
-- Description:	Retrieve all of the test script types.
-- =============================================
CREATE PROCEDURE [dbo].[GET_ALL_TEST_SCRIPT_TYPES] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT type_id
	FROM test_script_type
	
END


GO
GRANT EXECUTE ON [dbo].[GET_ALL_TEST_SCRIPT_TYPES] TO [movement_app]
GO
