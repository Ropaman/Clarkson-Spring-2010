IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[test_analysis]') AND type in (N'U'))
DROP TABLE [dbo].[test_analysis]
GO
/****** Object:  Table [dbo].[test_analysis]    Script Date: 05/04/2007 13:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_analysis](
	[test_id] [int] NOT NULL,
	[metric_id] [int] NOT NULL,
	[count] [int] NOT NULL,
	[sum] [float] NOT NULL,
	[mean] [float] NOT NULL,
	[stddev] [float] NOT NULL,
	[min] [float] NOT NULL,
	[max] [float] NOT NULL,
 CONSTRAINT [PK_test_analysis] PRIMARY KEY CLUSTERED 
(
	[test_id] ASC,
	[metric_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]

GO
GRANT SELECT ON [dbo].[test_analysis] TO [db_researcher]
GO
ALTER TABLE [dbo].[test_analysis]  WITH CHECK ADD  CONSTRAINT [FK_test_analysis_metric] FOREIGN KEY([metric_id])
REFERENCES [dbo].[metric] ([metric_id])
GO
ALTER TABLE [dbo].[test_analysis] CHECK CONSTRAINT [FK_test_analysis_metric]
GO
ALTER TABLE [dbo].[test_analysis]  WITH CHECK ADD  CONSTRAINT [FK_test_analysis_test] FOREIGN KEY([test_id])
REFERENCES [dbo].[test] ([test_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[test_analysis] CHECK CONSTRAINT [FK_test_analysis_test]
GO
