USE [Venus]
GO
/****** Object:  Table [dbo].[Articles]    Script Date: 2015/9/17 17:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Articles](
	[articlesId] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[pubTime] [datetime] NULL DEFAULT (getdate()),
	[author] [varchar](10) NULL,
	[content] [ntext] NULL,
	[content2] [ntext] NULL,
	[articleKindId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[articlesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Blogger]    Script Date: 2015/9/17 17:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Blogger](
	[bloggerID] [int] IDENTITY(1,1) NOT NULL,
	[pictureUrl] [nvarchar](50) NULL,
	[occupation] [text] NULL,
	[name] [varchar](10) NULL,
	[introduction] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[bloggerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[kindArticles]    Script Date: 2015/9/17 17:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kindArticles](
	[kindId] [int] IDENTITY(1,1) NOT NULL,
	[kindName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[kindId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Links]    Script Date: 2015/9/17 17:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Links](
	[linkID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](10) NULL,
	[url] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[linkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2015/9/17 17:05:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](50) NULL,
	[pwd] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD FOREIGN KEY([articleKindId])
REFERENCES [dbo].[kindArticles] ([kindId])
GO
