IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_TEST_ANALYSIS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GET_TEST_ANALYSIS]
GO
/****** Object:  StoredProcedure [dbo].[GET_TEST_ANALYSIS]    Script Date: 05/04/2007 13:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mike Petito
-- Create date: 12/1/2006
-- Description:	Retrieves a set of test analysis data for a specific test.
-- =============================================
CREATE PROCEDURE GET_TEST_ANALYSIS 
	@test_id int 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM test_analysis
	WHERE test_id = @test_id 
END

GO
GRANT EXECUTE ON [dbo].[GET_TEST_ANALYSIS] TO [movement_app]
GO
