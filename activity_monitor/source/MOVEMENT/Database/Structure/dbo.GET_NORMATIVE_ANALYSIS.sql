IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_NORMATIVE_ANALYSIS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GET_NORMATIVE_ANALYSIS]
GO
/****** Object:  StoredProcedure [dbo].[GET_NORMATIVE_ANALYSIS]    Script Date: 05/04/2007 13:16:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mike Petito
-- Create date: 12/1/2006
-- Description:	Retrieves a set of normative analysis data for a specific test script.
-- =============================================
CREATE PROCEDURE GET_NORMATIVE_ANALYSIS 
	@script_id int 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM normative_analysis
	WHERE script_id = @script_id
END

GO
GRANT EXECUTE ON [dbo].[GET_NORMATIVE_ANALYSIS] TO [movement_app]
GO
