IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADD_TEST_ANALYSIS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ADD_TEST_ANALYSIS]
GO
/****** Object:  StoredProcedure [dbo].[ADD_TEST_ANALYSIS]    Script Date: 05/04/2007 13:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael Petito
-- Create date: 12 1 2006
-- Description:	Insert a test analysis component for a given test.
-- =============================================
CREATE PROCEDURE ADD_TEST_ANALYSIS
(
	@test_id int,
	@metric_id int,
	@count int = 0,
	@sum float = 0,
	@mean float = 0,
	@stddev float = 0,
	@min float = 0,
	@max float = 0
)
AS
	SET NOCOUNT ON
	
	INSERT INTO test_analysis (test_id, metric_id, "count", "sum", mean, stddev, "min", "max")
	VALUES (@test_id, @metric_id, @count, @sum, @mean, @stddev, @min, @max)
	
	RETURN

GO
GRANT EXECUTE ON [dbo].[ADD_TEST_ANALYSIS] TO [movement_app]
GO
