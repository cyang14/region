Create Database test
go
USE [test]
GO
/****** Object:  Table [dbo].[Table_1]    Script Date: 10/01/2013 19:37:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table_1](
	[RegionID] [int] IDENTITY(1,1) NOT NULL,
	[RegionName] [varchar](50) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Table_1] ON
INSERT [dbo].[Table_1] ([RegionID], [RegionName]) VALUES (1, N'China')
INSERT [dbo].[Table_1] ([RegionID], [RegionName]) VALUES (2, N'US')
INSERT [dbo].[Table_1] ([RegionID], [RegionName]) VALUES (3, N'CA')
INSERT [dbo].[Table_1] ([RegionID], [RegionName]) VALUES (4, N'lola')
SET IDENTITY_INSERT [dbo].[Table_1] OFF
/****** Object:  StoredProcedure [dbo].[updateRegion]    Script Date: 10/01/2013 19:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateRegion]
	(
	 @RegionID int,
	 @RegionName varchar(50)
	 )
	  As
	  Begin
	  update dbo.Table_1
	  set
	  RegionName=@RegionName
	 Where  RegionID= @RegionID

	  
	  End
	  Return
GO
/****** Object:  StoredProcedure [dbo].[GetRegion]    Script Date: 10/01/2013 19:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetRegion]
	
AS
BEGIN

Select * From Table_1;
END
GO
/****** Object:  StoredProcedure [dbo].[AddRegion]    Script Date: 10/01/2013 19:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddRegion]
	(
	
	 @RegionName varchar(50)
	 )as
	 insert into Table_1
	 values(@RegionName)
GO
CREATE PROCEDURE [dbo].[DeleteRegion]
	(
	
	 @RegionID varchar(50)
	 )as
	delete from Table_1
	where RegionID=@RegionID
GO