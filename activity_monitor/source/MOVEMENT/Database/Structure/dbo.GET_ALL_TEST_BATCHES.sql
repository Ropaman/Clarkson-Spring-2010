IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_ALL_TEST_BATCHES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GET_ALL_TEST_BATCHES]
GO
/****** Object:  StoredProcedure [dbo].[GET_ALL_TEST_BATCHES]    Script Date: 05/04/2007 13:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael Petito
-- Create date: Dec 05 2006
-- Description:	Gets all the test batches stored in the database.
-- =============================================
CREATE PROCEDURE GET_ALL_TEST_BATCHES 
	
AS
	SET NOCOUNT ON
	
	SELECT batch_id FROM test_batch
	
	RETURN

GO
GRANT EXECUTE ON [dbo].[GET_ALL_TEST_BATCHES] TO [movement_app]
GO
