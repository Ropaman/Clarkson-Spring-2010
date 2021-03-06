IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[normative_analysis]') AND type in (N'U'))
DROP TABLE [dbo].[normative_analysis]
GO
/****** Object:  Table [dbo].[normative_analysis]    Script Date: 05/04/2007 13:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[normative_analysis](
	[script_id] [int] NOT NULL,
	[metric_id] [int] NOT NULL,
	[metric_field_id] [int] NOT NULL,
	[min] [float] NOT NULL,
	[max] [float] NOT NULL,
 CONSTRAINT [PK_normative_analysis] PRIMARY KEY CLUSTERED 
(
	[script_id] ASC,
	[metric_id] ASC,
	[metric_field_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]

GO
GRANT SELECT ON [dbo].[normative_analysis] TO [db_researcher]
GO
ALTER TABLE [dbo].[normative_analysis]  WITH CHECK ADD  CONSTRAINT [FK_normative_analysis_metric] FOREIGN KEY([metric_id])
REFERENCES [dbo].[metric] ([metric_id])
GO
ALTER TABLE [dbo].[normative_analysis] CHECK CONSTRAINT [FK_normative_analysis_metric]
GO
ALTER TABLE [dbo].[normative_analysis]  WITH CHECK ADD  CONSTRAINT [FK_normative_analysis_metric_field] FOREIGN KEY([metric_field_id])
REFERENCES [dbo].[metric_field] ([metric_field_id])
GO
ALTER TABLE [dbo].[normative_analysis] CHECK CONSTRAINT [FK_normative_analysis_metric_field]
GO
ALTER TABLE [dbo].[normative_analysis]  WITH CHECK ADD  CONSTRAINT [FK_normative_analysis_test_script] FOREIGN KEY([script_id])
REFERENCES [dbo].[test_script] ([script_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[normative_analysis] CHECK CONSTRAINT [FK_normative_analysis_test_script]
GO
