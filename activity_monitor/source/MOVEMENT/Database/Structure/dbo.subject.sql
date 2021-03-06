IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[subject]') AND type in (N'U'))
DROP TABLE [dbo].[subject]
GO
/****** Object:  Table [dbo].[subject]    Script Date: 05/04/2007 13:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject](
	[subject_id] [uniqueidentifier] NOT NULL,
	[created] [smalldatetime] NOT NULL,
	[sex] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[dob] [smalldatetime] NOT NULL,
	[handedness] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_subject] PRIMARY KEY CLUSTERED 
(
	[subject_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Index [IX_subject_dob]    Script Date: 05/04/2007 13:17:56 ******/
CREATE NONCLUSTERED INDEX [IX_subject_dob] ON [dbo].[subject] 
(
	[dob] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[subject] TO [db_researcher]
GO
