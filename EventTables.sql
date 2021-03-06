

CREATE TABLE [dbo].[Event](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Location] [nvarchar](100) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[Days] [int] NOT NULL,
	[AudienceId] [tinyint] NOT NULL,
	[OwnerId] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Registration]    Script Date: 9/6/2014 1:17:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[UserId] [nvarchar](100) NOT NULL,
	[EventId] [int] NOT NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[HasAttended] [bit] NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET IDENTITY_INSERT [dbo].[Event] ON 


declare @attendDate1 datetime, @attendDate2 datetime, @attendDate3 datetime
SET @attendDate1 = GETDATE()
SET @attendDate2 = GETDATE()
SET @attendDate3 = GETDATE()

Set @attendDate1 = DATEADD (mm, 1, @attendDate1)
Set @attendDate2 = DATEADD (mm, 2, @attendDate2)
Set @attendDate3 = DATEADD (mm, 3, @attendDate3)

INSERT [dbo].[Event] ([Id], [Title], [Description], [Location], [StartDate], [Days], [AudienceId], [OwnerId]) VALUES (1, N'Introductory Troubleshooting with Sysinternals Tools', N'Learn how to use tools such as Process Monitor to troubleshoot common problems.', N'Redmond', @attendDate1 , 3, 0, N'admin')
INSERT [dbo].[Event] ([Id], [Title], [Description], [Location], [StartDate], [Days], [AudienceId], [OwnerId]) VALUES (2, N'Windows Azure IaaS Virtual Machines and Virtual Networks', N'Learn how to build and configure Virtual Machines and Virtual Networks in the Cloud.', N'Orlando', @attendDate2, 1, 0, N'admin')
INSERT [dbo].[Event] ([Id], [Title], [Description], [Location], [StartDate], [Days], [AudienceId], [OwnerId]) VALUES (3, N'What’s new in ASP.NET', N'Learn some of the new functionality in the next release of ASP.NET.', N'Redmond', @attendDate3, 4, 1, N'admin')
INSERT [dbo].[Event] ([Id], [Title], [Description], [Location], [StartDate], [Days], [AudienceId], [OwnerId]) VALUES (4, N'Introduction to Solution Selling', N'Learn how to sell solutions instead of features.', N'Redmond', @attendDate3, 2, 3, N'admin')
SET IDENTITY_INSERT [dbo].[Event] OFF
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Event_EventId] FOREIGN KEY([EventId])
REFERENCES [dbo].[Event] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Event_EventId]
GO
