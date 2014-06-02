USE [msdb]
GO

/****** Object:  Table [dbo].[sysoperators]    Script Date: 2014-06-02 15:22:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sysoperators](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [sysname] NOT NULL,
	[enabled] [tinyint] NOT NULL,
	[email_address] [nvarchar](100) NULL,
	[last_email_date] [int] NOT NULL,
	[last_email_time] [int] NOT NULL,
	[pager_address] [nvarchar](100) NULL,
	[last_pager_date] [int] NOT NULL,
	[last_pager_time] [int] NOT NULL,
	[weekday_pager_start_time] [int] NOT NULL,
	[weekday_pager_end_time] [int] NOT NULL,
	[saturday_pager_start_time] [int] NOT NULL,
	[saturday_pager_end_time] [int] NOT NULL,
	[sunday_pager_start_time] [int] NOT NULL,
	[sunday_pager_end_time] [int] NOT NULL,
	[pager_days] [tinyint] NOT NULL,
	[netsend_address] [nvarchar](100) NULL,
	[last_netsend_date] [int] NOT NULL,
	[last_netsend_time] [int] NOT NULL,
	[category_id] [int] NOT NULL
) ON [PRIMARY]

GO


