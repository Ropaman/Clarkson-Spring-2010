IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CREATE_TEST_BATCH]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CREATE_TEST_BATCH]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_TEST_BATCH]    Script Date: 05/04/2007 13:16:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael Petito
-- Create date: Nov 14 2006
-- Description:	Create a new test batch.
-- =============================================
CREATE PROCEDURE [dbo].[CREATE_TEST_BATCH] 
	@name varchar(50),
	@description varchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO test_batch (name, description)
	VALUES (@name, @description)

	RETURN @@IDENTITY
END



GO
GRANT EXECUTE ON [dbo].[CREATE_TEST_BATCH] TO [movement_app]
GO
