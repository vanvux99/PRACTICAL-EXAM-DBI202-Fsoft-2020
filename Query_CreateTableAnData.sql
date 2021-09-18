USE [master]
GO

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'PE_DBI202_Sp2020')
BEGIN
	ALTER DATABASE [PE_DBI202_Sp2020] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [PE_DBI202_Sp2020] SET ONLINE;
	DROP DATABASE [PE_DBI202_Sp2020];
END

GO

/*******************************************************************************
   Create database
********************************************************************************/
CREATE DATABASE [PE_DBI202_Sp2020]
GO

/*******************************************************************************
   Create database objects
********************************************************************************/
USE [PE_DBI202_Sp2020]
GO

/****** Object:  Table [dbo].[ACCOUNT]    Script Date: 12/02/2020 14:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCOUNT](
	[ACCOUNT_ID] [int] NOT NULL,
	[AVAIL_BALANCE] [float] NULL,
	[CLOSE_DATE] [datetime] NULL,
	[LAST_ACTIVITY_DATE] [datetime] NULL,
	[OPEN_DATE] [datetime] NOT NULL,
	[PENDING_BALANCE] [float] NULL,
	[STATUS] [varchar](10) NULL,
	[CUST_ID] [int] NULL,
	[OPEN_BRANCH_ID] [int] NOT NULL,
	[OPEN_EMP_ID] [int] NOT NULL,
	[PRODUCT_CD] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ACCOUNT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BRANCH]    Script Date: 12/02/2020 14:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BRANCH](
	[BRANCH_ID] [int] NOT NULL,
	[ADDRESS] [varchar](30) NULL,
	[CITY] [varchar](20) NULL,
	[NAME] [varchar](20) NOT NULL,
	[STATE] [varchar](10) NULL,
	[ZIP_CODE] [varchar](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[BRANCH_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BUSINESS]    Script Date: 12/02/2020 14:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BUSINESS](
	[INCORP_DATE] [datetime] NULL,
	[NAME] [varchar](255) NOT NULL,
	[STATE_ID] [varchar](10) NOT NULL,
	[CUST_ID] [int] NOT NULL,
	[CONTACT_FirstName] [varchar](30) NULL,
	[CONTACT_LastName] [varchar](30) NULL,
	[CONTACT_Title] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CUST_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 12/02/2020 14:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[CUST_ID] [int] NOT NULL,
	[ADDRESS] [varchar](30) NULL,
	[CITY] [varchar](20) NULL,
	[CUST_TYPE_CD] [varchar](1) NOT NULL,
	[POSTAL_CODE] [varchar](10) NULL,
	[STATE] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CUST_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[EMPLOYEE]    Script Date: 12/02/2020 14:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLOYEE](
	[EMP_ID] [int] NOT NULL,
	[END_DATE] [datetime] NULL,
	[FIRST_NAME] [varchar](20) NOT NULL,
	[LAST_NAME] [varchar](20) NOT NULL,
	[START_DATE] [datetime] NOT NULL,
	[TITLE] [varchar](20) NULL,
	[ASSIGNED_BRANCH_ID] [int] NULL,
	[DEPARTMENT] [varchar](20) NULL,
	[SUPERIOR_EMP_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EMP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[INDIVIDUAL]    Script Date: 12/02/2020 14:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INDIVIDUAL](
	[CUST_ID] [int] NOT NULL,
	[FIRST_NAME] [varchar](30) NOT NULL,
	[LAST_NAME] [varchar](30) NOT NULL,
	[BIRTH_DATE] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CUST_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PRODUCT]    Script Date: 12/02/2020 14:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[PRODUCT_CD] [varchar](10) NOT NULL,
	[NAME] [varchar](50) NOT NULL,
	[PRODUCT_TYPE] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[PRODUCT_CD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/********************************************************************
Insert data
********************************************************************/
INSERT [dbo].[ACCOUNT] ([ACCOUNT_ID], [AVAIL_BALANCE], [CLOSE_DATE], [LAST_ACTIVITY_DATE], [OPEN_DATE], [PENDING_BALANCE], [STATUS], [CUST_ID], [OPEN_BRANCH_ID], [OPEN_EMP_ID], [PRODUCT_CD]) VALUES (1, 1057.75, NULL, CAST(N'2005-01-04T00:00:00.000' AS DateTime), CAST(N'2000-01-15T00:00:00.000' AS DateTime), 1057.75, N'ACTIVE', 1, 2, 10, N'CHK')
INSERT [dbo].[ACCOUNT] ([ACCOUNT_ID], [AVAIL_BALANCE], [CLOSE_DATE], [LAST_ACTIVITY_DATE], [OPEN_DATE], [PENDING_BALANCE], [STATUS], [CUST_ID], [OPEN_BRANCH_ID], [OPEN_EMP_ID], [PRODUCT_CD]) VALUES (2, 500, NULL, CAST(N'2004-12-19T00:00:00.000' AS DateTime), CAST(N'2000-01-15T00:00:00.000' AS DateTime), 500, N'ACTIVE', 1, 2, 10, N'SAV')
INSERT [dbo].[ACCOUNT] ([ACCOUNT_ID], [AVAIL_BALANCE], [CLOSE_DATE], [LAST_ACTIVITY_DATE], [OPEN_DATE], [PENDING_BALANCE], [STATUS], [CUST_ID], [OPEN_BRANCH_ID], [OPEN_EMP_ID], [PRODUCT_CD]) VALUES (3, 3000, NULL, CAST(N'2004-06-30T00:00:00.000' AS DateTime), CAST(N'2004-06-30T00:00:00.000' AS DateTime), 3000, N'ACTIVE', 1, 2, 10, N'CD')
INSERT [dbo].[ACCOUNT] ([ACCOUNT_ID], [AVAIL_BALANCE], [CLOSE_DATE], [LAST_ACTIVITY_DATE], [OPEN_DATE], [PENDING_BALANCE], [STATUS], [CUST_ID], [OPEN_BRANCH_ID], [OPEN_EMP_ID], [PRODUCT_CD]) VALUES (4, 2258.02, NULL, CAST(N'2004-12-27T00:00:00.000' AS DateTime), CAST(N'2001-03-12T00:00:00.000' AS DateTime), 2258.02, N'ACTIVE', 2, 2, 10, N'CHK')
INSERT [dbo].[ACCOUNT] ([ACCOUNT_ID], [AVAIL_BALANCE], [CLOSE_DATE], [LAST_ACTIVITY_DATE], [OPEN_DATE], [PENDING_BALANCE], [STATUS], [CUST_ID], [OPEN_BRANCH_ID], [OPEN_EMP_ID], [PRODUCT_CD]) VALUES (5, 200, NULL, CAST(N'2004-12-11T00:00:00.000' AS DateTime), CAST(N'2001-03-12T00:00:00.000' AS DateTime), 200, N'ACTIVE', 2, 2, 10, N'SAV')
INSERT [dbo].[ACCOUNT] ([ACCOUNT_ID], [AVAIL_BALANCE], [CLOSE_DATE], [LAST_ACTIVITY_DATE], [OPEN_DATE], [PENDING_BALANCE], [STATUS], [CUST_ID], [OPEN_BRANCH_ID], [OPEN_EMP_ID], [PRODUCT_CD]) VALUES (6, 1057.75, NULL, CAST(N'2004-11-30T00:00:00.000' AS DateTime), CAST(N'2002-11-23T00:00:00.000' AS DateTime), 1057.75, N'ACTIVE', 3, 3, 13, N'CHK')
INSERT [dbo].[ACCOUNT] ([ACCOUNT_ID], [AVAIL_BALANCE], [CLOSE_DATE], [LAST_ACTIVITY_DATE], [OPEN_DATE], [PENDING_BALANCE], [STATUS], [CUST_ID], [OPEN_BRANCH_ID], [OPEN_EMP_ID], [PRODUCT_CD]) VALUES (7, 2212.5, NULL, CAST(N'2004-12-05T00:00:00.000' AS DateTime), CAST(N'2002-12-15T00:00:00.000' AS DateTime), 2212.5, N'ACTIVE', 3, 3, 13, N'MM')
INSERT [dbo].[ACCOUNT] ([ACCOUNT_ID], [AVAIL_BALANCE], [CLOSE_DATE], [LAST_ACTIVITY_DATE], [OPEN_DATE], [PENDING_BALANCE], [STATUS], [CUST_ID], [OPEN_BRANCH_ID], [OPEN_EMP_ID], [PRODUCT_CD]) VALUES (8, 534.12, NULL, CAST(N'2005-01-03T00:00:00.000' AS DateTime), CAST(N'2003-09-12T00:00:00.000' AS DateTime), 534.12, N'ACTIVE', 4, 1, 1, N'CHK')
INSERT [dbo].[ACCOUNT] ([ACCOUNT_ID], [AVAIL_BALANCE], [CLOSE_DATE], [LAST_ACTIVITY_DATE], [OPEN_DATE], [PENDING_BALANCE], [STATUS], [CUST_ID], [OPEN_BRANCH_ID], [OPEN_EMP_ID], [PRODUCT_CD]) VALUES (9, 767.77, NULL, CAST(N'2004-10-24T00:00:00.000' AS DateTime), CAST(N'2000-01-15T00:00:00.000' AS DateTime), 767.77, N'ACTIVE', 4, 1, 1, N'SAV')
INSERT [dbo].[ACCOUNT] ([ACCOUNT_ID], [AVAIL_BALANCE], [CLOSE_DATE], [LAST_ACTIVITY_DATE], [OPEN_DATE], [PENDING_BALANCE], [STATUS], [CUST_ID], [OPEN_BRANCH_ID], [OPEN_EMP_ID], [PRODUCT_CD]) VALUES (10, 5487.09, NULL, CAST(N'2004-11-11T00:00:00.000' AS DateTime), CAST(N'2004-09-30T00:00:00.000' AS DateTime), 5487.09, N'ACTIVE', 4, 1, 1, N'MM')
INSERT [dbo].[ACCOUNT] ([ACCOUNT_ID], [AVAIL_BALANCE], [CLOSE_DATE], [LAST_ACTIVITY_DATE], [OPEN_DATE], [PENDING_BALANCE], [STATUS], [CUST_ID], [OPEN_BRANCH_ID], [OPEN_EMP_ID], [PRODUCT_CD]) VALUES (11, 2237.97, NULL, CAST(N'2005-01-05T00:00:00.000' AS DateTime), CAST(N'2004-01-27T00:00:00.000' AS DateTime), 2897.97, N'ACTIVE', 5, 4, 16, N'CHK')
INSERT [dbo].[ACCOUNT] ([ACCOUNT_ID], [AVAIL_BALANCE], [CLOSE_DATE], [LAST_ACTIVITY_DATE], [OPEN_DATE], [PENDING_BALANCE], [STATUS], [CUST_ID], [OPEN_BRANCH_ID], [OPEN_EMP_ID], [PRODUCT_CD]) VALUES (12, 122.37, NULL, CAST(N'2004-11-29T00:00:00.000' AS DateTime), CAST(N'2002-08-24T00:00:00.000' AS DateTime), 122.37, N'ACTIVE', 6, 1, 1, N'CHK')
INSERT [dbo].[ACCOUNT] ([ACCOUNT_ID], [AVAIL_BALANCE], [CLOSE_DATE], [LAST_ACTIVITY_DATE], [OPEN_DATE], [PENDING_BALANCE], [STATUS], [CUST_ID], [OPEN_BRANCH_ID], [OPEN_EMP_ID], [PRODUCT_CD]) VALUES (13, 10000, NULL, CAST(N'2004-12-28T00:00:00.000' AS DateTime), CAST(N'2004-12-28T00:00:00.000' AS DateTime), 10000, N'ACTIVE', 6, 1, 1, N'CD')
INSERT [dbo].[ACCOUNT] ([ACCOUNT_ID], [AVAIL_BALANCE], [CLOSE_DATE], [LAST_ACTIVITY_DATE], [OPEN_DATE], [PENDING_BALANCE], [STATUS], [CUST_ID], [OPEN_BRANCH_ID], [OPEN_EMP_ID], [PRODUCT_CD]) VALUES (14, 5000, NULL, CAST(N'2004-01-12T00:00:00.000' AS DateTime), CAST(N'2004-01-12T00:00:00.000' AS DateTime), 5000, N'ACTIVE', 7, 2, 10, N'CD')
INSERT [dbo].[ACCOUNT] ([ACCOUNT_ID], [AVAIL_BALANCE], [CLOSE_DATE], [LAST_ACTIVITY_DATE], [OPEN_DATE], [PENDING_BALANCE], [STATUS], [CUST_ID], [OPEN_BRANCH_ID], [OPEN_EMP_ID], [PRODUCT_CD]) VALUES (15, 3487.19, NULL, CAST(N'2005-01-03T00:00:00.000' AS DateTime), CAST(N'2001-05-23T00:00:00.000' AS DateTime), 3487.19, N'ACTIVE', 8, 4, 16, N'CHK')
INSERT [dbo].[ACCOUNT] ([ACCOUNT_ID], [AVAIL_BALANCE], [CLOSE_DATE], [LAST_ACTIVITY_DATE], [OPEN_DATE], [PENDING_BALANCE], [STATUS], [CUST_ID], [OPEN_BRANCH_ID], [OPEN_EMP_ID], [PRODUCT_CD]) VALUES (16, 387.99, NULL, CAST(N'2004-10-12T00:00:00.000' AS DateTime), CAST(N'2001-05-23T00:00:00.000' AS DateTime), 387.99, N'ACTIVE', 8, 4, 16, N'SAV')
INSERT [dbo].[ACCOUNT] ([ACCOUNT_ID], [AVAIL_BALANCE], [CLOSE_DATE], [LAST_ACTIVITY_DATE], [OPEN_DATE], [PENDING_BALANCE], [STATUS], [CUST_ID], [OPEN_BRANCH_ID], [OPEN_EMP_ID], [PRODUCT_CD]) VALUES (17, 125.67, NULL, CAST(N'2004-12-15T00:00:00.000' AS DateTime), CAST(N'2003-07-30T00:00:00.000' AS DateTime), 125.67, N'ACTIVE', 9, 1, 1, N'CHK')
INSERT [dbo].[ACCOUNT] ([ACCOUNT_ID], [AVAIL_BALANCE], [CLOSE_DATE], [LAST_ACTIVITY_DATE], [OPEN_DATE], [PENDING_BALANCE], [STATUS], [CUST_ID], [OPEN_BRANCH_ID], [OPEN_EMP_ID], [PRODUCT_CD]) VALUES (18, 9345.55, NULL, CAST(N'2004-10-28T00:00:00.000' AS DateTime), CAST(N'2004-10-28T00:00:00.000' AS DateTime), 9845.55, N'ACTIVE', 9, 1, 1, N'MM')
INSERT [dbo].[ACCOUNT] ([ACCOUNT_ID], [AVAIL_BALANCE], [CLOSE_DATE], [LAST_ACTIVITY_DATE], [OPEN_DATE], [PENDING_BALANCE], [STATUS], [CUST_ID], [OPEN_BRANCH_ID], [OPEN_EMP_ID], [PRODUCT_CD]) VALUES (19, 1500, NULL, CAST(N'2004-06-30T00:00:00.000' AS DateTime), CAST(N'2004-06-30T00:00:00.000' AS DateTime), 1500, N'ACTIVE', 9, 1, 1, N'CD')
INSERT [dbo].[ACCOUNT] ([ACCOUNT_ID], [AVAIL_BALANCE], [CLOSE_DATE], [LAST_ACTIVITY_DATE], [OPEN_DATE], [PENDING_BALANCE], [STATUS], [CUST_ID], [OPEN_BRANCH_ID], [OPEN_EMP_ID], [PRODUCT_CD]) VALUES (20, 23575.12, NULL, CAST(N'2004-12-15T00:00:00.000' AS DateTime), CAST(N'2002-09-30T00:00:00.000' AS DateTime), 23575.12, N'ACTIVE', 10, 4, 16, N'CHK')
INSERT [dbo].[ACCOUNT] ([ACCOUNT_ID], [AVAIL_BALANCE], [CLOSE_DATE], [LAST_ACTIVITY_DATE], [OPEN_DATE], [PENDING_BALANCE], [STATUS], [CUST_ID], [OPEN_BRANCH_ID], [OPEN_EMP_ID], [PRODUCT_CD]) VALUES (21, 0, NULL, CAST(N'2004-08-28T00:00:00.000' AS DateTime), CAST(N'2002-10-01T00:00:00.000' AS DateTime), 0, N'ACTIVE', 10, 4, 16, N'BUS')
INSERT [dbo].[ACCOUNT] ([ACCOUNT_ID], [AVAIL_BALANCE], [CLOSE_DATE], [LAST_ACTIVITY_DATE], [OPEN_DATE], [PENDING_BALANCE], [STATUS], [CUST_ID], [OPEN_BRANCH_ID], [OPEN_EMP_ID], [PRODUCT_CD]) VALUES (22, 9345.55, NULL, CAST(N'2004-11-14T00:00:00.000' AS DateTime), CAST(N'2004-03-22T00:00:00.000' AS DateTime), 9345.55, N'ACTIVE', 11, 2, 10, N'BUS')
INSERT [dbo].[ACCOUNT] ([ACCOUNT_ID], [AVAIL_BALANCE], [CLOSE_DATE], [LAST_ACTIVITY_DATE], [OPEN_DATE], [PENDING_BALANCE], [STATUS], [CUST_ID], [OPEN_BRANCH_ID], [OPEN_EMP_ID], [PRODUCT_CD]) VALUES (23, 38552.05, NULL, CAST(N'2004-12-15T00:00:00.000' AS DateTime), CAST(N'2003-07-30T00:00:00.000' AS DateTime), 38552.05, N'ACTIVE', 12, 4, 16, N'CHK')
INSERT [dbo].[ACCOUNT] ([ACCOUNT_ID], [AVAIL_BALANCE], [CLOSE_DATE], [LAST_ACTIVITY_DATE], [OPEN_DATE], [PENDING_BALANCE], [STATUS], [CUST_ID], [OPEN_BRANCH_ID], [OPEN_EMP_ID], [PRODUCT_CD]) VALUES (24, 50000, NULL, CAST(N'2004-12-17T00:00:00.000' AS DateTime), CAST(N'2004-02-22T00:00:00.000' AS DateTime), 50000, N'ACTIVE', 13, 3, 13, N'SBL')

INSERT [dbo].[BRANCH] ([BRANCH_ID], [ADDRESS], [CITY], [NAME], [STATE], [ZIP_CODE]) VALUES (1, N'3882 Main St.', N'Waltham', N'Headquarters', N'MA', N'02451')
INSERT [dbo].[BRANCH] ([BRANCH_ID], [ADDRESS], [CITY], [NAME], [STATE], [ZIP_CODE]) VALUES (2, N'422 Maple St.', N'Woburn', N'Woburn Branch', N'MA', N'01801')
INSERT [dbo].[BRANCH] ([BRANCH_ID], [ADDRESS], [CITY], [NAME], [STATE], [ZIP_CODE]) VALUES (3, N'125 Presidential Way', N'Quincy', N'Quincy Branch', N'MA', N'02169')
INSERT [dbo].[BRANCH] ([BRANCH_ID], [ADDRESS], [CITY], [NAME], [STATE], [ZIP_CODE]) VALUES (4, N'378 Maynard Ln.', N'Salem', N'So. NH Branch', N'NH', N'03079')

INSERT [dbo].[BUSINESS] ([INCORP_DATE], [NAME], [STATE_ID], [CUST_ID], [CONTACT_FirstName], [CONTACT_LastName], [CONTACT_Title]) VALUES (CAST(N'1995-05-01T00:00:00.000' AS DateTime), N'Chilton Engineering', N'12-345-678', 10, N'John', N'Chilton', N'President')
INSERT [dbo].[BUSINESS] ([INCORP_DATE], [NAME], [STATE_ID], [CUST_ID], [CONTACT_FirstName], [CONTACT_LastName], [CONTACT_Title]) VALUES (CAST(N'2001-01-01T00:00:00.000' AS DateTime), N'Northeast Cooling Inc.', N'23-456-789', 11, N'Paul', N'Hardy', N'President')
INSERT [dbo].[BUSINESS] ([INCORP_DATE], [NAME], [STATE_ID], [CUST_ID], [CONTACT_FirstName], [CONTACT_LastName], [CONTACT_Title]) VALUES (CAST(N'2002-06-30T00:00:00.000' AS DateTime), N'Superior Auto Body', N'34-567-890', 12, N'Carl', N'Lutz', N'President')
INSERT [dbo].[BUSINESS] ([INCORP_DATE], [NAME], [STATE_ID], [CUST_ID], [CONTACT_FirstName], [CONTACT_LastName], [CONTACT_Title]) VALUES (CAST(N'1999-05-01T00:00:00.000' AS DateTime), N'AAA Insurance Inc.', N'45-678-901', 13, N'Stanley', N'Cheswick', N'President')

INSERT [dbo].[CUSTOMER] ([CUST_ID], [ADDRESS], [CITY], [CUST_TYPE_CD], [POSTAL_CODE], [STATE]) VALUES (1, N'47 Mockingbird Ln', N'Lynnfield', N'I', N'01940', N'MA')
INSERT [dbo].[CUSTOMER] ([CUST_ID], [ADDRESS], [CITY], [CUST_TYPE_CD], [POSTAL_CODE], [STATE]) VALUES (2, N'372 Clearwater Blvd', N'Woburn', N'I', N'01801', N'MA')
INSERT [dbo].[CUSTOMER] ([CUST_ID], [ADDRESS], [CITY], [CUST_TYPE_CD], [POSTAL_CODE], [STATE]) VALUES (3, N'18 Jessup Rd', N'Quincy', N'I', N'02169', N'MA')
INSERT [dbo].[CUSTOMER] ([CUST_ID], [ADDRESS], [CITY], [CUST_TYPE_CD], [POSTAL_CODE], [STATE]) VALUES (4, N'12 Buchanan Ln', N'Waltham', N'I', N'02451', N'MA')
INSERT [dbo].[CUSTOMER] ([CUST_ID], [ADDRESS], [CITY], [CUST_TYPE_CD], [POSTAL_CODE], [STATE]) VALUES (5, N'2341 Main St', N'Salem', N'I', N'03079', N'NH')
INSERT [dbo].[CUSTOMER] ([CUST_ID], [ADDRESS], [CITY], [CUST_TYPE_CD], [POSTAL_CODE], [STATE]) VALUES (6, N'12 Blaylock Ln', N'Waltham', N'I', N'02451', N'MA')
INSERT [dbo].[CUSTOMER] ([CUST_ID], [ADDRESS], [CITY], [CUST_TYPE_CD], [POSTAL_CODE], [STATE]) VALUES (7, N'29 Admiral Ln', N'Wilmington', N'I', N'01887', N'MA')
INSERT [dbo].[CUSTOMER] ([CUST_ID], [ADDRESS], [CITY], [CUST_TYPE_CD], [POSTAL_CODE], [STATE]) VALUES (8, N'472 Freedom Rd', N'Salem', N'I', N'03079', N'NH')
INSERT [dbo].[CUSTOMER] ([CUST_ID], [ADDRESS], [CITY], [CUST_TYPE_CD], [POSTAL_CODE], [STATE]) VALUES (9, N'29 Maple St', N'Newton', N'I', N'02458', N'MA')
INSERT [dbo].[CUSTOMER] ([CUST_ID], [ADDRESS], [CITY], [CUST_TYPE_CD], [POSTAL_CODE], [STATE]) VALUES (10, N'7 Industrial Way', N'Salem', N'B', N'03079', N'NH')
INSERT [dbo].[CUSTOMER] ([CUST_ID], [ADDRESS], [CITY], [CUST_TYPE_CD], [POSTAL_CODE], [STATE]) VALUES (11, N'287A Corporate Ave', N'Wilmington', N'B', N'01887', N'MA')
INSERT [dbo].[CUSTOMER] ([CUST_ID], [ADDRESS], [CITY], [CUST_TYPE_CD], [POSTAL_CODE], [STATE]) VALUES (12, N'789 Main St', N'Salem', N'B', N'03079', N'NH')
INSERT [dbo].[CUSTOMER] ([CUST_ID], [ADDRESS], [CITY], [CUST_TYPE_CD], [POSTAL_CODE], [STATE]) VALUES (13, N'4772 Presidential Way', N'Quincy', N'B', N'02169', N'MA')

INSERT [dbo].[EMPLOYEE] ([EMP_ID], [END_DATE], [FIRST_NAME], [LAST_NAME], [START_DATE], [TITLE], [ASSIGNED_BRANCH_ID], [DEPARTMENT], [SUPERIOR_EMP_ID]) VALUES (1, NULL, N'Michael', N'Smith', CAST(N'2001-06-22T00:00:00.000' AS DateTime), N'President', 1, N'Administration', NULL)
INSERT [dbo].[EMPLOYEE] ([EMP_ID], [END_DATE], [FIRST_NAME], [LAST_NAME], [START_DATE], [TITLE], [ASSIGNED_BRANCH_ID], [DEPARTMENT], [SUPERIOR_EMP_ID]) VALUES (2, NULL, N'Susan', N'Barker', CAST(N'2002-09-12T00:00:00.000' AS DateTime), N'Vice President', 1, N'Administration', 1)
INSERT [dbo].[EMPLOYEE] ([EMP_ID], [END_DATE], [FIRST_NAME], [LAST_NAME], [START_DATE], [TITLE], [ASSIGNED_BRANCH_ID], [DEPARTMENT], [SUPERIOR_EMP_ID]) VALUES (3, NULL, N'Robert', N'Tyler', CAST(N'2000-02-09T00:00:00.000' AS DateTime), N'Treasurer', 1, N'Administration', 2)
INSERT [dbo].[EMPLOYEE] ([EMP_ID], [END_DATE], [FIRST_NAME], [LAST_NAME], [START_DATE], [TITLE], [ASSIGNED_BRANCH_ID], [DEPARTMENT], [SUPERIOR_EMP_ID]) VALUES (4, NULL, N'Susan', N'Hawthorne', CAST(N'2002-04-24T00:00:00.000' AS DateTime), N'Operations Manager', 1, N'Operations', 2)
INSERT [dbo].[EMPLOYEE] ([EMP_ID], [END_DATE], [FIRST_NAME], [LAST_NAME], [START_DATE], [TITLE], [ASSIGNED_BRANCH_ID], [DEPARTMENT], [SUPERIOR_EMP_ID]) VALUES (5, NULL, N'John', N'Gooding', CAST(N'2003-11-14T00:00:00.000' AS DateTime), N'Loan Manager', 1, N'Loans', 2)
INSERT [dbo].[EMPLOYEE] ([EMP_ID], [END_DATE], [FIRST_NAME], [LAST_NAME], [START_DATE], [TITLE], [ASSIGNED_BRANCH_ID], [DEPARTMENT], [SUPERIOR_EMP_ID]) VALUES (6, NULL, N'Helen', N'Fleming', CAST(N'2004-03-17T00:00:00.000' AS DateTime), N'Head Teller', 1, N'Operations', NULL)
INSERT [dbo].[EMPLOYEE] ([EMP_ID], [END_DATE], [FIRST_NAME], [LAST_NAME], [START_DATE], [TITLE], [ASSIGNED_BRANCH_ID], [DEPARTMENT], [SUPERIOR_EMP_ID]) VALUES (7, NULL, N'Chris', N'Tucker', CAST(N'2004-09-15T00:00:00.000' AS DateTime), N'Teller', 1, N'Operations', NULL)
INSERT [dbo].[EMPLOYEE] ([EMP_ID], [END_DATE], [FIRST_NAME], [LAST_NAME], [START_DATE], [TITLE], [ASSIGNED_BRANCH_ID], [DEPARTMENT], [SUPERIOR_EMP_ID]) VALUES (8, NULL, N'Sarah', N'Parker', CAST(N'2002-12-02T00:00:00.000' AS DateTime), N'Teller', 1, N'Operations', NULL)
INSERT [dbo].[EMPLOYEE] ([EMP_ID], [END_DATE], [FIRST_NAME], [LAST_NAME], [START_DATE], [TITLE], [ASSIGNED_BRANCH_ID], [DEPARTMENT], [SUPERIOR_EMP_ID]) VALUES (9, NULL, N'Jane', N'Grossman', CAST(N'2002-05-03T00:00:00.000' AS DateTime), N'Teller', 1, N'Operations', NULL)
INSERT [dbo].[EMPLOYEE] ([EMP_ID], [END_DATE], [FIRST_NAME], [LAST_NAME], [START_DATE], [TITLE], [ASSIGNED_BRANCH_ID], [DEPARTMENT], [SUPERIOR_EMP_ID]) VALUES (10, NULL, N'Paula', N'Roberts', CAST(N'2002-07-27T00:00:00.000' AS DateTime), N'Head Teller', 2, N'Operations', NULL)
INSERT [dbo].[EMPLOYEE] ([EMP_ID], [END_DATE], [FIRST_NAME], [LAST_NAME], [START_DATE], [TITLE], [ASSIGNED_BRANCH_ID], [DEPARTMENT], [SUPERIOR_EMP_ID]) VALUES (11, NULL, N'Thomas', N'Ziegler', CAST(N'2000-10-23T00:00:00.000' AS DateTime), N'Teller', 2, N'Operations', NULL)
INSERT [dbo].[EMPLOYEE] ([EMP_ID], [END_DATE], [FIRST_NAME], [LAST_NAME], [START_DATE], [TITLE], [ASSIGNED_BRANCH_ID], [DEPARTMENT], [SUPERIOR_EMP_ID]) VALUES (12, NULL, N'Samantha', N'Jameson', CAST(N'2003-01-08T00:00:00.000' AS DateTime), N'Teller', 2, N'Operations', NULL)
INSERT [dbo].[EMPLOYEE] ([EMP_ID], [END_DATE], [FIRST_NAME], [LAST_NAME], [START_DATE], [TITLE], [ASSIGNED_BRANCH_ID], [DEPARTMENT], [SUPERIOR_EMP_ID]) VALUES (13, NULL, N'John', N'Blake', CAST(N'2000-05-11T00:00:00.000' AS DateTime), N'Head Teller', 3, N'Operations', NULL)
INSERT [dbo].[EMPLOYEE] ([EMP_ID], [END_DATE], [FIRST_NAME], [LAST_NAME], [START_DATE], [TITLE], [ASSIGNED_BRANCH_ID], [DEPARTMENT], [SUPERIOR_EMP_ID]) VALUES (14, NULL, N'Cindy', N'Mason', CAST(N'2002-08-09T00:00:00.000' AS DateTime), N'Teller', 3, N'Operations', NULL)
INSERT [dbo].[EMPLOYEE] ([EMP_ID], [END_DATE], [FIRST_NAME], [LAST_NAME], [START_DATE], [TITLE], [ASSIGNED_BRANCH_ID], [DEPARTMENT], [SUPERIOR_EMP_ID]) VALUES (15, NULL, N'Frank', N'Portman', CAST(N'2003-04-01T00:00:00.000' AS DateTime), N'Teller', 3, N'Operations', NULL)
INSERT [dbo].[EMPLOYEE] ([EMP_ID], [END_DATE], [FIRST_NAME], [LAST_NAME], [START_DATE], [TITLE], [ASSIGNED_BRANCH_ID], [DEPARTMENT], [SUPERIOR_EMP_ID]) VALUES (16, NULL, N'Theresa', N'Markham', CAST(N'2001-03-15T00:00:00.000' AS DateTime), N'Head Teller', 4, N'Operations', NULL)
INSERT [dbo].[EMPLOYEE] ([EMP_ID], [END_DATE], [FIRST_NAME], [LAST_NAME], [START_DATE], [TITLE], [ASSIGNED_BRANCH_ID], [DEPARTMENT], [SUPERIOR_EMP_ID]) VALUES (17, NULL, N'Beth', N'Fowler', CAST(N'2002-06-29T00:00:00.000' AS DateTime), N'Teller', 4, N'Operations', NULL)
INSERT [dbo].[EMPLOYEE] ([EMP_ID], [END_DATE], [FIRST_NAME], [LAST_NAME], [START_DATE], [TITLE], [ASSIGNED_BRANCH_ID], [DEPARTMENT], [SUPERIOR_EMP_ID]) VALUES (18, NULL, N'Rick', N'Tulman', CAST(N'2002-12-12T00:00:00.000' AS DateTime), N'Teller', 4, N'Operations', NULL)

INSERT [dbo].[INDIVIDUAL] ([BIRTH_DATE], [FIRST_NAME], [LAST_NAME], [CUST_ID]) VALUES (CAST(N'1972-04-22T00:00:00.000' AS DateTime), N'James', N'Hadley', 1)
INSERT [dbo].[INDIVIDUAL] ([BIRTH_DATE], [FIRST_NAME], [LAST_NAME], [CUST_ID]) VALUES (CAST(N'1968-08-15T00:00:00.000' AS DateTime), N'Susan', N'Tingley', 2)
INSERT [dbo].[INDIVIDUAL] ([BIRTH_DATE], [FIRST_NAME], [LAST_NAME], [CUST_ID]) VALUES (CAST(N'1958-02-06T00:00:00.000' AS DateTime), N'Frank', N'Tucker', 3)
INSERT [dbo].[INDIVIDUAL] ([BIRTH_DATE], [FIRST_NAME], [LAST_NAME], [CUST_ID]) VALUES (CAST(N'1966-12-22T00:00:00.000' AS DateTime), N'John', N'Hayward', 4)
INSERT [dbo].[INDIVIDUAL] ([BIRTH_DATE], [FIRST_NAME], [LAST_NAME], [CUST_ID]) VALUES (CAST(N'1971-08-25T00:00:00.000' AS DateTime), N'Charles', N'Frasier', 5)
INSERT [dbo].[INDIVIDUAL] ([BIRTH_DATE], [FIRST_NAME], [LAST_NAME], [CUST_ID]) VALUES (CAST(N'1962-09-14T00:00:00.000' AS DateTime), N'John', N'Spencer', 6)
INSERT [dbo].[INDIVIDUAL] ([BIRTH_DATE], [FIRST_NAME], [LAST_NAME], [CUST_ID]) VALUES (CAST(N'1947-03-19T00:00:00.000' AS DateTime), N'Margaret', N'Young', 7)
INSERT [dbo].[INDIVIDUAL] ([BIRTH_DATE], [FIRST_NAME], [LAST_NAME], [CUST_ID]) VALUES (CAST(N'1977-07-01T00:00:00.000' AS DateTime), N'Louis', N'Blake', 8)
INSERT [dbo].[INDIVIDUAL] ([BIRTH_DATE], [FIRST_NAME], [LAST_NAME], [CUST_ID]) VALUES (CAST(N'1968-06-16T00:00:00.000' AS DateTime), N'Richard', N'Farley', 9)

INSERT [dbo].[PRODUCT] ([PRODUCT_CD], [NAME], [PRODUCT_TYPE]) VALUES (N'AUT', N'auto loan', N'LOAN')
INSERT [dbo].[PRODUCT] ([PRODUCT_CD], [NAME], [PRODUCT_TYPE]) VALUES (N'BUS', N'business line of credit', N'LOAN')
INSERT [dbo].[PRODUCT] ([PRODUCT_CD], [NAME], [PRODUCT_TYPE]) VALUES (N'CD', N'certificate of deposit', N'ACCOUNT')
INSERT [dbo].[PRODUCT] ([PRODUCT_CD], [NAME], [PRODUCT_TYPE]) VALUES (N'CHK', N'checking account', N'ACCOUNT')
INSERT [dbo].[PRODUCT] ([PRODUCT_CD], [NAME], [PRODUCT_TYPE]) VALUES (N'MM', N'money market account', N'ACCOUNT')
INSERT [dbo].[PRODUCT] ([PRODUCT_CD], [NAME], [PRODUCT_TYPE]) VALUES (N'MRT', N'home mortgage', N'LOAN')
INSERT [dbo].[PRODUCT] ([PRODUCT_CD], [NAME], [PRODUCT_TYPE]) VALUES (N'SAV', N'savings account', N'ACCOUNT')
INSERT [dbo].[PRODUCT] ([PRODUCT_CD], [NAME], [PRODUCT_TYPE]) VALUES (N'SBL', N'small business loan', N'LOAN')
ALTER TABLE [dbo].[ACCOUNT]  WITH CHECK ADD  CONSTRAINT [ACCOUNT_BRANCH_FK] FOREIGN KEY([OPEN_BRANCH_ID])
REFERENCES [dbo].[BRANCH] ([BRANCH_ID])
GO
ALTER TABLE [dbo].[ACCOUNT] CHECK CONSTRAINT [ACCOUNT_BRANCH_FK]
GO
ALTER TABLE [dbo].[ACCOUNT]  WITH CHECK ADD  CONSTRAINT [ACCOUNT_CUSTOMER_FK] FOREIGN KEY([CUST_ID])
REFERENCES [dbo].[CUSTOMER] ([CUST_ID])
GO
ALTER TABLE [dbo].[ACCOUNT] CHECK CONSTRAINT [ACCOUNT_CUSTOMER_FK]
GO
ALTER TABLE [dbo].[ACCOUNT]  WITH CHECK ADD  CONSTRAINT [ACCOUNT_EMPLOYEE_FK] FOREIGN KEY([OPEN_EMP_ID])
REFERENCES [dbo].[EMPLOYEE] ([EMP_ID])
GO
ALTER TABLE [dbo].[ACCOUNT] CHECK CONSTRAINT [ACCOUNT_EMPLOYEE_FK]
GO
ALTER TABLE [dbo].[ACCOUNT]  WITH CHECK ADD  CONSTRAINT [ACCOUNT_PRODUCT_FK] FOREIGN KEY([PRODUCT_CD])
REFERENCES [dbo].[PRODUCT] ([PRODUCT_CD])
GO
ALTER TABLE [dbo].[ACCOUNT] CHECK CONSTRAINT [ACCOUNT_PRODUCT_FK]
GO
ALTER TABLE [dbo].[BUSINESS]  WITH CHECK ADD  CONSTRAINT [BUSINESS_EMPLOYEE_FK] FOREIGN KEY([CUST_ID])
REFERENCES [dbo].[CUSTOMER] ([CUST_ID])
GO
ALTER TABLE [dbo].[BUSINESS] CHECK CONSTRAINT [BUSINESS_EMPLOYEE_FK]
GO
ALTER TABLE [dbo].[EMPLOYEE]  WITH CHECK ADD  CONSTRAINT [EMPLOYEE_BRANCH_FK] FOREIGN KEY([ASSIGNED_BRANCH_ID])
REFERENCES [dbo].[BRANCH] ([BRANCH_ID])
GO
ALTER TABLE [dbo].[EMPLOYEE] CHECK CONSTRAINT [EMPLOYEE_BRANCH_FK]
GO
ALTER TABLE [dbo].[EMPLOYEE]  WITH CHECK ADD  CONSTRAINT [EMPLOYEE_EMPLOYEE_FK] FOREIGN KEY([SUPERIOR_EMP_ID])
REFERENCES [dbo].[EMPLOYEE] ([EMP_ID])
GO
ALTER TABLE [dbo].[EMPLOYEE] CHECK CONSTRAINT [EMPLOYEE_EMPLOYEE_FK]
GO
ALTER TABLE [dbo].[INDIVIDUAL]  WITH CHECK ADD  CONSTRAINT [INDIVIDUAL_CUSTOMER_FK] FOREIGN KEY([CUST_ID])
REFERENCES [dbo].[CUSTOMER] ([CUST_ID])
GO
ALTER TABLE [dbo].[INDIVIDUAL] CHECK CONSTRAINT [INDIVIDUAL_CUSTOMER_FK]
GO
USE [master]
GO
ALTER DATABASE [PE_DBI202_Sp2020] SET  READ_WRITE 
GO