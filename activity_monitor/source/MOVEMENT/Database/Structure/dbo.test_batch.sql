IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[test_batch]') AND type in (N'U'))
DROP TABLE [dbo].[test_batch]
GO
/****** Object:  Table [dbo].[test_batch]    Script Date: 05/04/2007 13:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_batch](
	[batch_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[description] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_test_batch] PRIMARY KEY CLUSTERED 
(
	[batch_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
GRANT SELECT ON [dbo].[test_batch] TO [db_researcher]
GO
