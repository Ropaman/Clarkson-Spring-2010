IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_helpdiagrams]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_helpdiagrams]
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagrams]    Script Date: 05/04/2007 13:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE dbo.sp_helpdiagrams
	(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
	
GO
DENY EXECUTE ON [dbo].[sp_helpdiagrams] TO [guest]
GO
GRANT EXECUTE ON [dbo].[sp_helpdiagrams] TO [movement_app]
GO
GRANT EXECUTE ON [dbo].[sp_helpdiagrams] TO [public]
GO
