USE [master]
GO
/****** Object:  Database [BPMSProject]    Script Date: 06/08/2017 15:53:02 ******/
CREATE DATABASE [BPMSProject] ON  PRIMARY 
( NAME = N'BizagiProject', FILENAME = N'D:\MSSQLSERVERS\MSSQL10_50.BIZAGIPROJECT\MSSQL\DATA\BizagiProject.mdf' , SIZE = 21760KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BizagiProject_log', FILENAME = N'D:\MSSQLSERVERS\MSSQL10_50.BIZAGIPROJECT\MSSQL\DATA\BizagiProject_1.LDF' , SIZE = 36288KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BPMSProject] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BPMSProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BPMSProject] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [BPMSProject] SET ANSI_NULLS OFF
GO
ALTER DATABASE [BPMSProject] SET ANSI_PADDING OFF
GO
ALTER DATABASE [BPMSProject] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [BPMSProject] SET ARITHABORT OFF
GO
ALTER DATABASE [BPMSProject] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [BPMSProject] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [BPMSProject] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [BPMSProject] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [BPMSProject] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [BPMSProject] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [BPMSProject] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [BPMSProject] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [BPMSProject] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [BPMSProject] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [BPMSProject] SET  DISABLE_BROKER
GO
ALTER DATABASE [BPMSProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [BPMSProject] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [BPMSProject] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [BPMSProject] SET ALLOW_SNAPSHOT_ISOLATION ON
GO
ALTER DATABASE [BPMSProject] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [BPMSProject] SET READ_COMMITTED_SNAPSHOT ON
GO
ALTER DATABASE [BPMSProject] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [BPMSProject] SET  READ_WRITE
GO
ALTER DATABASE [BPMSProject] SET RECOVERY FULL
GO
ALTER DATABASE [BPMSProject] SET  MULTI_USER
GO
ALTER DATABASE [BPMSProject] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [BPMSProject] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'BPMSProject', N'ON'
GO
USE [BPMSProject]
GO
/****** Object:  User [bizagi]    Script Date: 06/08/2017 15:53:02 ******/
CREATE USER [bizagi] FOR LOGIN [bizagi] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Role [rlBA_SQL_BizAgiWebApp]    Script Date: 06/08/2017 15:53:02 ******/
CREATE ROLE [rlBA_SQL_BizAgiWebApp] AUTHORIZATION [dbo]
GO
/****** Object:  Role [rlBA_SQL_ExecuteBizAgiSPs]    Script Date: 06/08/2017 15:53:02 ******/
CREATE ROLE [rlBA_SQL_ExecuteBizAgiSPs] AUTHORIZATION [dbo]
GO
/****** Object:  Table [dbo].[GRDATE_OFFSET_TYPE]    Script Date: 06/08/2017 15:53:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRDATE_OFFSET_TYPE](
	[idDateOffsetType] [int] NOT NULL,
	[rtName] [nvarchar](16) NOT NULL,
 CONSTRAINT [GRDATE_OFFSET_TYPE_PK] PRIMARY KEY CLUSTERED 
(
	[idDateOffsetType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FUNCTIONALAREA]    Script Date: 06/08/2017 15:53:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FUNCTIONALAREA](
	[idFunctionalArea] [int] IDENTITY(1,1) NOT NULL,
	[faName] [nvarchar](26) NULL,
	[faDisplayName] [nvarchar](40) NULL,
	[faDescription] [nvarchar](4000) NULL,
	[guidFunctionalArea] [uniqueidentifier] NOT NULL,
	[DiagramYPos] [int] NULL,
	[dplyFunctionalArea] [tinyint] NOT NULL,
	[idParentFunctionalArea] [int] NULL,
 CONSTRAINT [FUNCTIONALAREA_PK] PRIMARY KEY CLUSTERED 
(
	[idFunctionalArea] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [FUNCTIONALAREA_UKG] UNIQUE NONCLUSTERED 
(
	[guidFunctionalArea] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [FUNCTIONALAREA_FK_IDX_1] ON [dbo].[FUNCTIONALAREA] 
(
	[idParentFunctionalArea] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FORMTYPE]    Script Date: 06/08/2017 15:53:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FORMTYPE](
	[idFormType] [tinyint] NOT NULL,
	[formTypeName] [nvarchar](25) NOT NULL,
 CONSTRAINT [FORMTYPE_PK] PRIMARY KEY CLUSTERED 
(
	[idFormType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ENVIRONMENTTYPE]    Script Date: 06/08/2017 15:53:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ENVIRONMENTTYPE](
	[idEnvType] [tinyint] NOT NULL,
	[envTypeName] [nvarchar](25) NOT NULL,
 CONSTRAINT [ENVIRONMENTTYPE_PK] PRIMARY KEY CLUSTERED 
(
	[idEnvType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ENTLOGOPTYPE]    Script Date: 06/08/2017 15:53:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ENTLOGOPTYPE](
	[idEntLogOpType] [tinyint] NOT NULL,
	[EntLogOpTypeName] [nvarchar](26) NOT NULL,
 CONSTRAINT [ENTLOGOPTYPE_PK] PRIMARY KEY CLUSTERED 
(
	[idEntLogOpType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedTableType [dbo].[IETagsTable]    Script Date: 06/08/2017 15:53:10 ******/
CREATE TYPE [dbo].[IETagsTable] AS TABLE(
	[rootObject] [uniqueidentifier] NULL,
	[tagType] [uniqueidentifier] NOT NULL,
	[tagName] [varchar](50) NOT NULL,
	[taggedObject] [uniqueidentifier] NOT NULL,
	[value] [varchar](4000) NOT NULL,
	[deleted] [bit] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[IEReferencesTable]    Script Date: 06/08/2017 15:53:10 ******/
CREATE TYPE [dbo].[IEReferencesTable] AS TABLE(
	[rootObject] [uniqueidentifier] NULL,
	[guidPointer] [uniqueidentifier] NULL,
	[guidObjectRef] [uniqueidentifier] NULL,
	[guidObjectTarget] [uniqueidentifier] NOT NULL,
	[deleted] [bit] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[IEObjectsTable]    Script Date: 06/08/2017 15:53:10 ******/
CREATE TYPE [dbo].[IEObjectsTable] AS TABLE(
	[guidObject] [uniqueidentifier] NULL,
	[guidObjectParent] [uniqueidentifier] NULL,
	[objName] [varchar](256) NOT NULL,
	[objContent] [varbinary](max) NULL,
	[objType] [int] NOT NULL,
	[objTypeName] [varchar](50) NULL,
	[deployOnParent] [bit] NOT NULL,
	[modifiedDate] [datetime] NULL,
	[modifiedByUser] [varchar](100) NULL,
	[mtdVersion] [int] NULL,
	[rootObject] [uniqueidentifier] NULL,
	[changeSetId] [int] NULL,
	[objContentResolved] [varbinary](max) NULL,
	[deleted] [bit] NOT NULL,
	[contentFormat] [tinyint] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[IEIndexesTable]    Script Date: 06/08/2017 15:53:10 ******/
CREATE TYPE [dbo].[IEIndexesTable] AS TABLE(
	[rootObject] [uniqueidentifier] NULL,
	[name] [varchar](36) NOT NULL,
	[sourceGuid] [uniqueidentifier] NOT NULL,
	[targetGuid] [uniqueidentifier] NOT NULL,
	[deleted] [bit] NULL
)
GO
/****** Object:  Table [dbo].[HOLIDAYSCHEMA]    Script Date: 06/08/2017 15:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOLIDAYSCHEMA](
	[idHolidaySchema] [int] IDENTITY(1,1) NOT NULL,
	[HolidaySchemaName] [nvarchar](26) NULL,
	[guidHolidaySchema] [uniqueidentifier] NOT NULL,
	[dplyHolidaySchema] [tinyint] NOT NULL,
 CONSTRAINT [HOLIDAYSCHEMA_PK] PRIMARY KEY CLUSTERED 
(
	[idHolidaySchema] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [HOLIDAYSCHEMA_UK1] UNIQUE NONCLUSTERED 
(
	[HolidaySchemaName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [HOLIDAYSCHEMA_UKG] UNIQUE NONCLUSTERED 
(
	[guidHolidaySchema] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedTableType [dbo].[GuidList]    Script Date: 06/08/2017 15:53:10 ******/
CREATE TYPE [dbo].[GuidList] AS TABLE(
	[guidObject] [uniqueidentifier] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[guidObject] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[GRREPORTSET]    Script Date: 06/08/2017 15:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRREPORTSET](
	[idReportSet] [int] NOT NULL,
	[rsName] [nvarchar](50) NOT NULL,
 CONSTRAINT [GRREPORTSET_PK] PRIMARY KEY CLUSTERED 
(
	[idReportSet] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_DB_IdentitySeed]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_DB_IdentitySeed]( @sTableName SYSNAME ) RETURNS INT AS
	BEGIN
		RETURN IDENT_SEED( @sTableName )
	END
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_SQL_ScriptDropIndex]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_SQL_ScriptDropIndex]
	( 
		@tableName sysname,
		@indexName sysname
	) returns varchar(max)
	AS
	BEGIN
		DECLARE @sqlScript varchar(max)

		select  @sqlScript = case when is_unique_constraint = 1
				then 
					'ALTER TABLE ['+SCHEMA_NAME(o.schema_id)+'].['+o.name +'] DROP CONSTRAINT [' + i.name +']'
				else 
					'DROP INDEX [' + i.name +'] ON ['+SCHEMA_NAME(o.schema_id)+'].['+o.name +']' end
		from sys.indexes i
			inner join sys.objects o on i.object_id = o.object_id
		where i.is_primary_key = 0
			and o.is_ms_shipped = 0
			and i.type <> 0 --dont care about heaps
			
			and @indexName = i.name and @tableName = o.name
		;
		
		return @sqlScript;
	END
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_SQL_ScriptDropDefault]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_SQL_ScriptDropDefault]
	( 
		@tableName sysname,
		@defaultName sysname
	) returns varchar(max)
	AS
	BEGIN
		DECLARE @sqlScript varchar(max)

		select @sqlScript = 'ALTER TABLE [' + owner + '].[' + table_name + '] DROP CONSTRAINT [' + default_name + ']'
		from (
			SELECT o.[name] [table_name]
					, s.[name] [owner]
					, dc.[name] [default_name]
					, c.[name] [col_name]
					, dc.definition
			FROM sys.default_constraints dc
				join sys.columns c on c.[object_id] = dc.parent_object_id and c.column_id = dc.parent_column_id
				join sys.objects o on o.[object_id] = dc.parent_object_id
				join sys.schemas s on s.schema_id = o.schema_id
			where o.[name] = @tableName and dc.[name] = @defaultName
		) dfs;
		
		return @sqlScript;
	END
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_SQL_ScriptDropCheck]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_SQL_ScriptDropCheck]
	( 
		@tableName sysname,
		@checkName sysname
	) returns varchar(max)
	AS
	BEGIN
		DECLARE @sqlScript varchar(max)

		select @sqlScript = 'ALTER TABLE [' + owner + '].[' + table_name + '] DROP CONSTRAINT [' + constraint_name + ']'
		from (
			SELECT cc.[name] constraint_name
				, o.[name] table_name
				, s.[name] owner
				, cc.definition
				, (case cc.is_not_trusted when 1 then 'WITH NOCHECK' else '' end) [with_check]
			FROM sys.check_constraints cc
				join sys.objects o on o.[object_id] = cc.parent_object_id
				join sys.schemas s on s.schema_id = o.schema_id
			where cc.[name] = @checkName and o.[name] = @tableName
		) cks;
		
		return @sqlScript;
	END
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_SQL_ScriptCreateIndex]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_SQL_ScriptCreateIndex]
	( 
		@tableName sysname,
		@indexName sysname
	) returns varchar(max)
	AS
	BEGIN
		declare @sqlScript varchar(max)

		declare
			@column_list varchar(max),
			@included_column_list varchar(max)
		set @column_list = ''
		set @included_column_list = ''

		declare
			@columsCursor cursor,
			@columnDefinition varchar(8000),
			@is_included_column bit

		-- sql query to get columns list
		set @columsCursor = cursor for
			select '['+c.name+']' + case when (i.type in (1,2) and is_included_column=0) then case when ic.is_descending_key=1 then ' DESC' else ' ASC' end else '' end as definition,
				is_included_column
			from sys.indexes i
				join sys.index_columns ic on ic.object_id = i.object_id and ic.index_id = i.index_id
				join sys.columns c on ic.object_id = c.object_id and ic.column_id = c.column_id
			where 
				i.name = @indexName
				and object_name(i.object_id) = @tableName
			order by ic.key_ordinal
		;

		open @columsCursor
		fetch next from @columsCursor into @columnDefinition, @is_included_column

		-- get included columns list
		-- and get columns list
		while @@fetch_status=0
		begin
			if @is_included_column=1
			begin
				if len(@included_column_list) > 0
					set @included_column_list = @included_column_list + ', '
				set @included_column_list = @included_column_list + @columnDefinition
			end
			else
			begin
				if len(@column_list) > 0
					set @column_list = @column_list + ', '
				set @column_list = @column_list + @columnDefinition
			end

			fetch next from @columsCursor into @columnDefinition, @is_included_column
			
		end

		close @columsCursor
		deallocate @columsCursor
		

		-- Build DDL
		declare 
				@object_id int,
				@index_id int,
				@index_name sysname,
				@schema_name sysname,
				@table_name sysname,
				@type tinyint,
				@type_desc nvarchar(60),
				@is_unique bit,
				@data_space_name sysname,
				@ignore_dup_key bit,
				@is_primary_key bit,
				@is_unique_constraint bit,
				@fill_factor tinyint,
				@is_padded bit,
				@is_disabled bit,
				@is_hypothetical bit,
				@allow_row_locks bit,
				@allow_page_locks bit

		-- get index attributes
		select	@object_id				= i.object_id,
				@index_id				= i.index_id,
				@index_name				= i.name,
				@schema_name			= SCHEMA_NAME(o.schema_id),
				@table_name				= o.name,
				@type					= i.type,
				@type_desc				= i.type_desc,
				@is_unique				= i.is_unique,
				@data_space_name		= d.name,
				@ignore_dup_key			= i.ignore_dup_key,
				@is_primary_key			= i.is_primary_key,
				@is_unique_constraint	= i.is_unique_constraint,
				@fill_factor			= i.fill_factor,
				@is_padded				= i.is_padded,
				@is_disabled			= i.is_disabled,
				@is_hypothetical		= i.is_hypothetical,
				@allow_row_locks		= i.allow_row_locks,
				@allow_page_locks		= i.allow_page_locks
		from sys.indexes i
			join sys.objects o on i.object_id = o.object_id
			join sys.data_spaces d on d.data_space_id = i.data_space_id
		where 
			i.name = @indexName
			and o.name = @tableName
			and o.is_ms_shipped = 0
			and i.type <> 0 --dont care about heaps
		;

		-- build sql for index creation
		if @is_unique_constraint = 1
		begin
			set @sqlScript ='ALTER TABLE ['+@schema_name+'].[' + @table_name + '] WITH NOCHECK ADD CONSTRAINT ['
					+ @index_name + '] UNIQUE ' + case when @type=1 then 'CLUSTERED' else 'NONCLUSTERED' end + 
					' ('+@column_list+')'				
		end
		else
		begin
			set @sqlScript ='CREATE '+ case when @is_unique=1 then 'UNIQUE ' else '' end 
					+ case when @type=1 then 'CLUSTERED' else 'NONCLUSTERED' end + ' INDEX ['
					+ @index_name + '] ON ['+@schema_name+'].[' + @table_name + '] ('+@column_list+')'
		end
			
		if len(@included_column_list)>0
			set @sqlScript = @sqlScript + ' INCLUDE ('+@included_column_list+')'

		set @sqlScript = @sqlScript +	' WITH ('

		set @sqlScript = @sqlScript + 'IGNORE_DUP_KEY = ' + case when @ignore_dup_key=1 then 'ON' else 'OFF' end + ', '
		
		--Common index options
		set @sqlScript = @sqlScript + 'PAD_INDEX = ' + case when @is_padded=1 then 'ON' else 'OFF' end
		
		if @fill_factor>0
			set @sqlScript = @sqlScript + ', FILLFACTOR =' + ltrim(str(@fill_factor))
			
		set @sqlScript = @sqlScript + ', STATISTICS_NORECOMPUTE = ' + case when (select no_recompute from sys.stats where object_id = @object_id and stats_id = @index_id ) = 1 then 'ON' else 'OFF' end
		set @sqlScript = @sqlScript + ', ALLOW_ROW_LOCKS = ' + case when @allow_row_locks=1 then 'ON' else 'OFF' end
		set @sqlScript = @sqlScript + ', ALLOW_PAGE_LOCKS = ' + case when @allow_page_locks=1 then 'ON' else 'OFF' end + ')'

		if @type <> 3
			set @sqlScript = @sqlScript + ' ON ['+@data_space_name+']'

		return @sqlScript;
	END
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_SQL_ScriptCreateDefault]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_SQL_ScriptCreateDefault]
	( 
		@tableName sysname,
		@defaultName sysname
	) returns varchar(max)
	AS
	BEGIN
		declare @sqlScript varchar(max)

		select @sqlScript = 'ALTER TABLE [' + owner + '].[' + table_name + '] ADD CONSTRAINT [' + 
					[default_name] + '] DEFAULT ' + definition + ' FOR ['  + col_name + ']'
		from (
			SELECT o.[name] [table_name]
					, s.[name] [owner]
					, dc.[name] [default_name]
					, c.[name] [col_name]
					, dc.definition
			FROM sys.default_constraints dc
				join sys.columns c on c.[object_id] = dc.parent_object_id and c.column_id = dc.parent_column_id
				join sys.objects o on o.[object_id] = dc.parent_object_id
				join sys.schemas s on s.schema_id = o.schema_id
			where o.[name] = @tableName and dc.[name] = @defaultName
		) dfs;

		return @sqlScript;
	END
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_SQL_ScriptCreateCheck]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_SQL_ScriptCreateCheck]
	( 
		@tableName sysname,
		@checkName sysname
	) returns varchar(max)
	AS
	BEGIN
		declare @sqlScript varchar(max)

		select @sqlScript = 'ALTER TABLE [' + owner + '].[' + table_name + '] ' + with_check + ' ADD CONSTRAINT [' + 
				constraint_name + '] CHECK ' + definition
		from (
			SELECT cc.[name] constraint_name
				, o.[name] table_name
				, s.[name] owner
				, cc.definition
				, (case cc.is_not_trusted when 1 then 'WITH NOCHECK' else '' end) [with_check]
			FROM sys.check_constraints cc
				join sys.objects o on o.[object_id] = cc.parent_object_id
				join sys.schemas s on s.schema_id = o.schema_id
			where cc.[name] = @checkName and o.[name] = @tableName
		) cks;

		return @sqlScript;
	END
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_DB_UnqouteDBName]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_DB_UnqouteDBName](@sDBName sysname) RETURNS sysname AS 
BEGIN 
	return replace(replace(@sDBName, '[', ''), ']', '') 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_DB_IsValidIndexName]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_DB_IsValidIndexName]( @sIndexName sysname, @sTableName sysname, @sSuffix sysname ) RETURNS bit AS
	BEGIN
		declare @sIndexPrefix sysname
		declare @sIndexSuffix sysname
		set @sIndexPrefix = replace(replace(@sTableName, '[', ''), ']', '') + @sSuffix
		set @sIndexSuffix = stuff(@sIndexName, 1, len(@sIndexPrefix), '')
		return case when ( patindex(@sIndexPrefix + '%', @sIndexName) <> 0  and  
			isnumeric(@sIndexSuffix) = 1  and  
			charindex('.', @sIndexSuffix) = 0  
			and  charindex('e', @sIndexSuffix) = 0 ) then 1 else 0 end
	END
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_UTL_BitwiseXOR]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_UTL_BitwiseXOR](@iVal1 int, @iVal2 int) RETURNS int AS
	BEGIN
		return @iVal1 ^ @iVal2
	END
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_UTL_BitwiseTurnON]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_UTL_BitwiseTurnON](@iVal int, @iMask int) RETURNS int AS
	BEGIN
		-- return fnBA_UTL_BitwiseOR(iVal, mask)
		return @iVal | @iMask
	END
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_UTL_BitwiseTurnOFF]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_UTL_BitwiseTurnOFF](@iVal int, @iMask int) RETURNS int AS
	BEGIN
		-- return fnBA_UTL_BitwiseXOR(fnBA_UTL_BitwiseOR(iVal, iMask), iMask)
		return (@iVal | @iMask) ^ @iMask;

		-- Also is valid:
		-- return fnBA_UTL_BitwiseAND(@iVal, fnBA_UTL_BitwiseNOT(@iMask))
		-- return (@iVal & ~@iMask);
	END
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_UTL_BitwiseOR]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_UTL_BitwiseOR](@iVal1 int, @iVal2 int) RETURNS int AS
	BEGIN
		return @iVal1 | @iVal2
	END
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_UTL_BitwiseNOT]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_UTL_BitwiseNOT](@iVal int) RETURNS int AS
	BEGIN
		return ~@iVal

		-- Also is valid :
		-- (-1) is two`s complement number with all bits set to 1
		-- return fnBA_UTL_BitwiseXOR(-1, @iVal)
		-- return ((-1) ^ @iVal);
	END
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_UTL_BitwiseIsMasked]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_UTL_BitwiseIsMasked](@iVal int, @iMask int) RETURNS int AS
	BEGIN
		declare @iResp int

		-- return fnBA_UTL_BitwiseAND(iVal, iMask) = iMask
		set @iResp = case when ( (@iVal & @iMask) = @iMask ) then 1 else 0 end
		return @iResp
	END
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_UTL_BitwiseAND]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_UTL_BitwiseAND](@iVal1 int, @iVal2 int) RETURNS int AS
	BEGIN
		return @iVal1 & @iVal2
	END
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_Sync_allpkeys]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_Sync_allpkeys]( ) RETURNS @retfnBA_Sync_allpkeys
	   TABLE ( TABLE_QUALIFIER sysname, TABLE_OWNER sysname, TABLE_NAME sysname, COLUMN_NAME sysname, ORDINAL smallint, PK_NAME sysname )
	AS
	BEGIN
		delete @retfnBA_Sync_allpkeys

		INSERT INTO @retfnBA_Sync_allpkeys 
		select
			TABLE_QUALIFIER = convert(sysname,db_name()),
			TABLE_OWNER = convert(sysname,user_name(o.uid)),
			TABLE_NAME = convert(sysname,o.name),
			COLUMN_NAME = convert(sysname,c.name),
			--KEY_SEQ = convert(smallint,c.colid),
			--KEY_SEQ =
			ORDINAL =
				case
					when c.name = index_col(o.name, i.indid,  1) then convert (smallint,1)
					when c.name = index_col(o.name, i.indid,  2) then convert (smallint,2)
					when c.name = index_col(o.name, i.indid,  3) then convert (smallint,3)
					when c.name = index_col(o.name, i.indid,  4) then convert (smallint,4)
					when c.name = index_col(o.name, i.indid,  5) then convert (smallint,5)
					when c.name = index_col(o.name, i.indid,  6) then convert (smallint,6)
					when c.name = index_col(o.name, i.indid,  7) then convert (smallint,7)
					when c.name = index_col(o.name, i.indid,  8) then convert (smallint,8)
					when c.name = index_col(o.name, i.indid,  9) then convert (smallint,9)
					when c.name = index_col(o.name, i.indid, 10) then convert (smallint,10)
					when c.name = index_col(o.name, i.indid, 11) then convert (smallint,11)
					when c.name = index_col(o.name, i.indid, 12) then convert (smallint,12)
					when c.name = index_col(o.name, i.indid, 13) then convert (smallint,13)
					when c.name = index_col(o.name, i.indid, 14) then convert (smallint,14)
					when c.name = index_col(o.name, i.indid, 15) then convert (smallint,15)
					when c.name = index_col(o.name, i.indid, 16) then convert (smallint,16)
				end,
			PK_NAME = convert(sysname,i.name)
		from
			sysindexes i, syscolumns c, sysobjects o --, syscolumns c1
		where
			--o.id = @table_id and 
			o.id = c.id
			and o.id = i.id
			and (i.status & 0x800) = 0x800
			--and c.name = index_col (@full_table_name, i.indid, c1.colid)
			and (c.name = index_col (o.name, i.indid,  1) or
				 c.name = index_col (o.name, i.indid,  2) or
				 c.name = index_col (o.name, i.indid,  3) or
				 c.name = index_col (o.name, i.indid,  4) or
				 c.name = index_col (o.name, i.indid,  5) or
				 c.name = index_col (o.name, i.indid,  6) or
				 c.name = index_col (o.name, i.indid,  7) or
				 c.name = index_col (o.name, i.indid,  8) or
				 c.name = index_col (o.name, i.indid,  9) or
				 c.name = index_col (o.name, i.indid, 10) or
				 c.name = index_col (o.name, i.indid, 11) or
				 c.name = index_col (o.name, i.indid, 12) or
				 c.name = index_col (o.name, i.indid, 13) or
				 c.name = index_col (o.name, i.indid, 14) or
				 c.name = index_col (o.name, i.indid, 15) or
				 c.name = index_col (o.name, i.indid, 16)
				)
			--and c1.colid <= i.keycnt	/* create rows from 1 to keycnt */
			--and c1.id = @table_id
		--order by 1, 2, 3, 5
   
	   RETURN
	END
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_Sync_allfkeys]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_Sync_allfkeys]( ) RETURNS @retfnBA_Sync_allfkeys
	   TABLE ( 
		PKTABLE_QUALIFIER sysname, PKTABLE_OWNER sysname, PKTABLE_NAME sysname, PKCOLUMN_NAME sysname,
		FKTABLE_QUALIFIER sysname, FKTABLE_OWNER sysname, FKTABLE_NAME sysname, FKCOLUMN_NAME sysname,
		KEY_SEQ smallint, UPDATE_RULE smallint, DELETE_RULE smallint, FK_NAME sysname, PK_NAME sysname, 
		DEFERRABILITY smallint )
	AS
	BEGIN

		DECLARE @pktable_name		sysname
		DECLARE @pktable_owner		sysname
		DECLARE @pktable_qualifier	sysname
		DECLARE @fktable_name		sysname
		DECLARE @fktable_owner		sysname
		DECLARE @fktable_qualifier	sysname

		set @pktable_name		  = null
		set @pktable_owner	  = null
		set @pktable_qualifier = null
		set @fktable_name		  = null
		set @fktable_owner	  = null
		set @fktable_qualifier = null


		DECLARE @pktable_id			int
		DECLARE @pkfull_table_name	nvarchar(257) /* 2*128 + 1 */
		DECLARE @fktable_id			int
		DECLARE @fkfull_table_name	nvarchar(257) /* 2*128 + 1 */
		declare	@order_by_pk		int

		/* select XXX starting table creation */

		-- create table #fkeysall(
		declare @fkeysall table(
				rkeyid int NOT NULL,
				rkey1 int NOT NULL,
					rkey2 int NOT NULL,
					rkey3 int NOT NULL,
					rkey4 int NOT NULL,
					rkey5 int NOT NULL,
					rkey6 int NOT NULL,
					rkey7 int NOT NULL,
					rkey8 int NOT NULL,
					rkey9 int NOT NULL,
					rkey10 int NOT NULL,
					rkey11 int NOT NULL,
					rkey12 int NOT NULL,
					rkey13 int NOT NULL,
					rkey14 int NOT NULL,
					rkey15 int NOT NULL,
					rkey16 int NOT NULL,
				fkeyid int NOT NULL,
				fkey1 int NOT NULL,
					fkey2 int NOT NULL,
					fkey3 int NOT NULL,
					fkey4 int NOT NULL,
					fkey5 int NOT NULL,
					fkey6 int NOT NULL,
					fkey7 int NOT NULL,
					fkey8 int NOT NULL,
					fkey9 int NOT NULL,
					fkey10 int NOT NULL,
					fkey11 int NOT NULL,
					fkey12 int NOT NULL,
					fkey13 int NOT NULL,
					fkey14 int NOT NULL,
					fkey15 int NOT NULL,
					fkey16 int NOT NULL,
				constid int NOT NULL,
				name sysname collate database_default NOT NULL)

		--create table #fkeys(
		declare @fkeys table(
				pktable_id		int NOT NULL,
				pkcolid 		int NOT NULL,
				fktable_id		int NOT NULL,
				fkcolid 		int NOT NULL,
				KEY_SEQ 		smallint NOT NULL,
				fk_id			int NOT NULL,
				PK_NAME			sysname collate database_default NOT NULL)

		--create table #fkeysout(
		declare @fkeysout table(
				PKTABLE_QUALIFIER sysname collate database_default NULL,
				PKTABLE_OWNER sysname collate database_default NULL,
				PKTABLE_NAME sysname collate database_default NOT NULL,
				PKCOLUMN_NAME sysname collate database_default NOT NULL,
				FKTABLE_QUALIFIER sysname collate database_default NULL,
				FKTABLE_OWNER sysname collate database_default NULL,
				FKTABLE_NAME sysname collate database_default NOT NULL,
				FKCOLUMN_NAME sysname collate database_default NOT NULL,
				KEY_SEQ smallint NOT NULL,
				UPDATE_RULE smallint NULL,
				DELETE_RULE smallint NULL,
				FK_NAME sysname collate database_default NULL,
				PK_NAME sysname collate database_default NULL,
				DEFERRABILITY smallint null)

		/* select XXX starting parameter analysis */

		select  @order_by_pk = 0

	/*
		if (@pktable_name is null) and (@fktable_name is null)
		begin	-- If neither primary key nor foreign key table names given 
			raiserror (15252,-1,-1)
			return
		end
	*/
		if @fktable_qualifier is not null
		begin
			if db_name() <> @fktable_qualifier
			begin	/* If qualifier doesnt match current database */
				-- raiserror (15250, -1,-1)
				return
			end
		end
		if @pktable_qualifier is not null
		begin
			if db_name() <> @pktable_qualifier
			begin	/* If qualifier doesnt match current database */
				-- raiserror (15250, -1,-1)
				return
			end
		end

		if @pktable_owner is null
		begin	/* If unqualified primary key table name */
			SELECT @pkfull_table_name = quotename(@pktable_name)
		end
		else
		begin	/* Qualified primary key table name */
			if @pktable_owner = ''
			begin	/* If empty owner name */
				SELECT @pkfull_table_name = quotename(@pktable_owner)
			end
			else
			begin
				SELECT @pkfull_table_name = quotename(@pktable_owner) +
					'.' + quotename(@pktable_name)
			end
		end
		/*	Get Object ID */
		SELECT @pktable_id = object_id(@pkfull_table_name)

		if @fktable_owner is null
		begin	/* If unqualified foreign key table name */
			SELECT @fkfull_table_name = quotename(@fktable_name)
		end
		else
		begin	/* Qualified foreign key table name */
			if @fktable_owner = ''
			begin	/* If empty owner name */
				SELECT @fkfull_table_name = quotename(@fktable_owner)
			end
			else
			begin
				SELECT @fkfull_table_name = quotename(@fktable_owner) +
					'.' + quotename(@fktable_name)
			end
		end
		/*	Get Object ID */
		SELECT @fktable_id = object_id(@fkfull_table_name)

		if @fktable_name is not null
		begin
			if @fktable_id is null
				SELECT @fktable_id = 0	/* fk table not found, empty result */
		end

		if @pktable_name is null
		begin /*  If table name not supplied, match all */
			select @order_by_pk = 1
		end
		else
		begin
			if @pktable_id is null
			begin
				SELECT @pktable_id = 0	/* pk table not found, empty result */
			end
		end

		/*	SQL Server supports upto 16 PK/FK relationships between 2 tables */
		/*	Process syskeys for each relationship */
		/*  First, attempt to get all 16 keys for each relship, then sort
			them out with a 16-way "insert select ... union select ..." */

		/* select XXX starting data analysis */

		--insert into #fkeysall
		insert into @fkeysall
			select
				r.rkeyid,
				r.rkey1, r.rkey2, r.rkey3, r.rkey4,
					r.rkey5, r.rkey6, r.rkey7, r.rkey8,
					r.rkey9, r.rkey10, r.rkey11, r.rkey12,
					r.rkey13, r.rkey14, r.rkey15, r.rkey16,
				r.fkeyid,
				r.fkey1, r.fkey2, r.fkey3, r.fkey4,
					r.fkey5, r.fkey6, r.fkey7, r.fkey8,
					r.fkey9, r.fkey10, r.fkey11, r.fkey12,
					r.fkey13, r.fkey14, r.fkey15, r.fkey16,
				r.constid,
				i.name
			from
				sysreferences r, sysobjects o, sysindexes i
			where	r.constid = o.id
				AND o.xtype = 'F'
				AND r.rkeyindid = i.indid
				AND r.rkeyid = i.id
				AND r.rkeyid between isnull(@pktable_id, 0)
								and isnull(@pktable_id, 0x7fffffff)
				AND r.fkeyid between isnull(@fktable_id, 0)
								and isnull(@fktable_id, 0x7fffffff)

		/* select count (*) as XXX countall from #fkeysall */

		--insert into #fkeys
		insert into @fkeys
				select rkeyid, rkey1, fkeyid, fkey1, 1, constid, name
				from @fkeysall
			union all
				select rkeyid, rkey2, fkeyid, fkey2, 2, constid, name
				from @fkeysall
			union all
				select rkeyid, rkey3, fkeyid, fkey3, 3, constid, name
				from @fkeysall
			union all
				select rkeyid, rkey4, fkeyid, fkey4, 4, constid, name
				from @fkeysall
			union all
				select rkeyid, rkey5, fkeyid, fkey5, 5, constid, name
				from @fkeysall
			union all
				select rkeyid, rkey6, fkeyid, fkey6, 6, constid, name
				from @fkeysall
			union all
				select rkeyid, rkey7, fkeyid, fkey7, 7, constid, name
				from @fkeysall
			union all
				select rkeyid, rkey8, fkeyid, fkey8, 8, constid, name
				from @fkeysall
			union all
				select rkeyid, rkey9, fkeyid, fkey9, 9, constid, name
				from @fkeysall
			union all
				select rkeyid, rkey10, fkeyid, fkey10, 10, constid, name
				from @fkeysall
			union all
				select rkeyid, rkey11, fkeyid, fkey11, 11, constid, name
				from @fkeysall
			union all
				select rkeyid, rkey12, fkeyid, fkey12, 12, constid, name
				from @fkeysall
			union all
				select rkeyid, rkey13, fkeyid, fkey13, 13, constid, name
				from @fkeysall
			union all
				select rkeyid, rkey14, fkeyid, fkey14, 14, constid, name
				from @fkeysall
			union all
				select rkeyid, rkey15, fkeyid, fkey15, 15, constid, name
				from @fkeysall
			union all
				select rkeyid, rkey16, fkeyid, fkey16, 16, constid, name
				from @fkeysall

		/* select count (*) as XXX count from #fkeys */

		--insert into #fkeysout
		insert into @fkeysout
			select
				PKTABLE_QUALIFIER = convert(sysname,db_name()),
				PKTABLE_OWNER = convert(sysname,USER_NAME(o1.uid)),
				PKTABLE_NAME = convert(sysname,o1.name),
				PKCOLUMN_NAME = convert(sysname,c1.name),
				FKTABLE_QUALIFIER = convert(sysname,db_name()),
				FKTABLE_OWNER = convert(sysname,USER_NAME(o2.uid)),
				FKTABLE_NAME = convert(sysname,o2.name),
				FKCOLUMN_NAME = convert(sysname,c2.name),
				KEY_SEQ,
				UPDATE_RULE = CASE WHEN (ObjectProperty(fk_id, 'CnstIsUpdateCascade')=1) THEN 
					convert(smallint,0) ELSE convert(smallint,1) END,
				DELETE_RULE = CASE WHEN (ObjectProperty(fk_id, 'CnstIsDeleteCascade')=1) THEN 
					convert(smallint,0) ELSE convert(smallint,1) END,
				FK_NAME = convert(sysname,OBJECT_NAME(fk_id)),
				PK_NAME,
				DEFERRABILITY = 7	/* SQL_NOT_DEFERRABLE */
			from @fkeys f,
				sysobjects o1, sysobjects o2,
				syscolumns c1, syscolumns c2
			where	o1.id = f.pktable_id
				AND o2.id = f.fktable_id
				AND c1.id = f.pktable_id
				AND c2.id = f.fktable_id
				AND c1.colid = f.pkcolid
				AND c2.colid = f.fkcolid
		/* select count (*) as XXX countout from #fkeysout */

		if @order_by_pk = 1 /*	If order by PK fields */
		  insert @retfnBA_Sync_allfkeys
			select
				PKTABLE_QUALIFIER, PKTABLE_OWNER, PKTABLE_NAME, PKCOLUMN_NAME,
				FKTABLE_QUALIFIER, FKTABLE_OWNER, FKTABLE_NAME, FKCOLUMN_NAME,
				KEY_SEQ, UPDATE_RULE, DELETE_RULE, FK_NAME, PK_NAME, DEFERRABILITY
			from @fkeysout
			order by 1,2,3,9,4
		else		/*	Order by FK fields */
		  insert @retfnBA_Sync_allfkeys
			select
				PKTABLE_QUALIFIER, PKTABLE_OWNER, PKTABLE_NAME, PKCOLUMN_NAME,
				FKTABLE_QUALIFIER, FKTABLE_OWNER, FKTABLE_NAME, FKCOLUMN_NAME,
				KEY_SEQ, UPDATE_RULE, DELETE_RULE, FK_NAME, PK_NAME, DEFERRABILITY
			from @fkeysout
			order by 5,6,7,9,8

	   RETURN
	END
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_Sync_alldefaults]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_Sync_alldefaults]( ) RETURNS @retfnBA_Sync_alldefaults
		 TABLE ( CONSTRAINT_CATALOG sysname, TABLE_NAME sysname, CONSTRAINT_SCHEMA sysname, CONSTRAINT_NAME sysname, 
			     COLUMN_NAME sysname, ORDINAL_POSITION smallint, DEFAULT_CLAUSE nvarchar(4000) )
	      AS
	      BEGIN
		    delete @retfnBA_Sync_alldefaults

		    INSERT INTO @retfnBA_Sync_alldefaults 
		      select db_name( ) as CONSTRAINT_CATALOG, t_obj.name as TABLE_NAME, user_name( c_obj.uid ) as CONSTRAINT_SCHEMA, 
			   c_obj.name as CONSTRAINT_NAME, col.name as COLUMN_NAME, col.colid as ORDINAL_POSITION, com.text as DEFAULT_CLAUSE
		      from sysobjects c_obj join syscomments com on c_obj.id = com.id
			   join sysobjects t_obj on c_obj.parent_obj = t_obj.id  
			   join sysconstraints con on c_obj.id = con.constid
			   join syscolumns col on t_obj.id = col.id and con.colid = col.colid
		      where c_obj.xtype = 'D'
		    RETURN
	END
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_Sync_allComputedColumns]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_Sync_allComputedColumns]( ) RETURNS @retfnBA_Sync_allComputedColumns
	   TABLE ( TABLE_CATALOG sysname, TABLE_SCHEMA sysname, TABLE_NAME sysname, COLUMN_NAME sysname, FORMULA nvarchar(4000) )
	AS
	BEGIN
		delete @retfnBA_Sync_allComputedColumns

		INSERT INTO @retfnBA_Sync_allComputedColumns 
         SELECT db_name() as TABLE_CATALOG, user_name(obj.uid) as TABLE_SCHEMA, 
            obj.name as TABLE_NAME, col.name as COLUMN_NAME, com.text as FORMULA
         FROM sysobjects obj, syscolumns col LEFT OUTER JOIN syscomments com 
            on col.id = com.id  AND  com.number = col.colid
         WHERE permissions(obj.id, col.name) != 0  AND  obj.id = col.id  AND  
            obj.xtype in ('U', 'V')  AND  col.iscomputed = 1
		RETURN
	END
GO
/****** Object:  Table [dbo].[RENDERTAB]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RENDERTAB](
	[idRenderTab] [int] IDENTITY(1,1) NOT NULL,
	[rdrTabName] [nvarchar](50) NOT NULL,
	[rdrTabDisplayName] [nvarchar](50) NOT NULL,
	[rdrTabDescription] [nvarchar](100) NULL,
	[rdrTabHelpText] [nvarchar](100) NULL,
	[rdrTabDisplayOrder] [int] NULL,
	[guidRenderTab] [uniqueidentifier] NOT NULL,
	[dplyRenderTab] [tinyint] NOT NULL,
 CONSTRAINT [RENDERTAB_PK] PRIMARY KEY CLUSTERED 
(
	[idRenderTab] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [RENDERTAB_UKG] UNIQUE NONCLUSTERED 
(
	[guidRenderTab] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RENDERGROUP]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RENDERGROUP](
	[idRenderGroup] [int] IDENTITY(1,1) NOT NULL,
	[rdrGrpName] [nvarchar](50) NOT NULL,
	[rdrGrpDisplayName] [nvarchar](100) NOT NULL,
	[rdrGrpDescription] [nvarchar](100) NULL,
	[rdrGrpHelpText] [nvarchar](100) NULL,
	[rdrGrpDisplayOrder] [int] NULL,
	[idRdrGrpParent] [int] NULL,
	[guidRenderGroup] [uniqueidentifier] NOT NULL,
	[dplyRenderGroup] [tinyint] NOT NULL,
 CONSTRAINT [RENDERGROUP_PK] PRIMARY KEY CLUSTERED 
(
	[idRenderGroup] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [RENDERGROUP_UKG] UNIQUE NONCLUSTERED 
(
	[guidRenderGroup] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RENDERGROUP_FK_IDX_1] ON [dbo].[RENDERGROUP] 
(
	[idRdrGrpParent] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PVCLApp]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PVCLApp](
	[idCase] [bigint] NOT NULL,
	[finalEnt] [int] NULL,
	[ZhiznennyyTsiklKursovogo] [bigint] NULL,
	[ProtsessZhiznennyyTsiklU] [bigint] NULL,
	[ZhiznennyyTsiklStudenta] [bigint] NULL,
	[ProtsessZaneseniyaStuden] [bigint] NULL,
 CONSTRAINT [PVCLApp_PK] PRIMARY KEY CLUSTERED 
(
	[idCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PVApp]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PVApp](
	[idCase] [bigint] NOT NULL,
	[finalEnt] [int] NOT NULL,
	[ZhiznennyyTsiklKursovogo] [bigint] NULL,
	[ProtsessZhiznennyyTsiklU] [bigint] NULL,
	[ZhiznennyyTsiklStudenta] [bigint] NULL,
	[ProtsessZaneseniyaStuden] [bigint] NULL,
 CONSTRAINT [PVApp_PK] PRIMARY KEY CLUSTERED 
(
	[idCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProtsessZhiznennyyTsiklU]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProtsessZhiznennyyTsiklU](
	[idProtsessZhiznennyyTsiklU] [bigint] NOT NULL,
	[finalEnt] [int] NOT NULL,
	[Faylsdannyminasemestr] [tinyint] NULL,
	[Zadachi] [bigint] NULL,
 CONSTRAINT [ProtsessZhiznennyyTsiklU_PK] PRIMARY KEY CLUSTERED 
(
	[idProtsessZhiznennyyTsiklU] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ProtsessZhiznennyyTsiklU_F1] ON [dbo].[ProtsessZhiznennyyTsiklU] 
(
	[Zadachi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProtsessZaneseniyaStuden]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProtsessZaneseniyaStuden](
	[idProtsessZaneseniyaStuden] [bigint] NOT NULL,
	[finalEnt] [int] NOT NULL,
	[Spisokstudentov] [tinyint] NULL,
	[Vsestudentyzaregestrirovan] [bit] NULL,
 CONSTRAINT [ProtsessZaneseniyaStuden_PK] PRIMARY KEY CLUSTERED 
(
	[idProtsessZaneseniyaStuden] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedTableType [dbo].[ReferencesTable]    Script Date: 06/08/2017 15:53:13 ******/
CREATE TYPE [dbo].[ReferencesTable] AS TABLE(
	[rootObject] [uniqueidentifier] NULL,
	[guidPointer] [uniqueidentifier] NOT NULL,
	[guidObjectRef] [uniqueidentifier] NOT NULL,
	[guidObjectTarget] [uniqueidentifier] NOT NULL
)
GO
/****** Object:  Table [dbo].[REASSIGNLOG]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REASSIGNLOG](
	[idReassignLog] [bigint] IDENTITY(1,1) NOT NULL,
	[idWorkflow] [int] NOT NULL,
	[idCase] [int] NOT NULL,
	[idTask] [int] NOT NULL,
	[idWorkItem] [bigint] NOT NULL,
	[idOldUser] [int] NOT NULL,
	[idNewUser] [int] NOT NULL,
	[idAdmonUser] [int] NOT NULL,
	[rlOldAssignDate] [datetime] NOT NULL,
 CONSTRAINT [REASSIGNLOG_PK] PRIMARY KEY CLUSTERED 
(
	[idReassignLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [REASSIGNLOG_IX1] ON [dbo].[REASSIGNLOG] 
(
	[idCase] ASC,
	[idWorkItem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHASETYPE]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHASETYPE](
	[idPhaseType] [int] NOT NULL,
	[phaseTypeName] [nvarchar](26) NOT NULL,
 CONSTRAINT [PHASETYPE_PK] PRIMARY KEY CLUSTERED 
(
	[idPhaseType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LGMETADATA]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LGMETADATA](
	[idLgMetadata] [int] NOT NULL,
	[fieldName] [nvarchar](50) NOT NULL,
	[idBizagiTable] [int] NOT NULL,
	[nameMetadata] [nvarchar](50) NOT NULL,
 CONSTRAINT [LGMETADATA_PK] PRIMARY KEY CLUSTERED 
(
	[idLgMetadata] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [LGMETADATA_FK_IDX_1] ON [dbo].[LGMETADATA] 
(
	[idBizagiTable] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JOBTYPE]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JOBTYPE](
	[idJobType] [tinyint] NOT NULL,
	[jobTypeName] [nvarchar](26) NOT NULL,
	[jobTypeEnabled] [bit] NOT NULL,
 CONSTRAINT [JOBTYPE_PK] PRIMARY KEY CLUSTERED 
(
	[idJobType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JOBSCHFREQUENCY]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JOBSCHFREQUENCY](
	[idJobSchFrequency] [tinyint] NOT NULL,
	[jsfName] [nvarchar](26) NOT NULL,
 CONSTRAINT [JOBSCHFREQUENCY_PK] PRIMARY KEY CLUSTERED 
(
	[idJobSchFrequency] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LGLANGUAGE]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LGLANGUAGE](
	[idLgLanguage] [int] IDENTITY(10000,1) NOT NULL,
	[cultureName] [nvarchar](10) NOT NULL,
	[language] [nvarchar](50) NOT NULL,
	[country] [nvarchar](50) NOT NULL,
	[state] [bit] NOT NULL,
	[cultureDisplayName] [nvarchar](100) NOT NULL,
	[guidLGLanguage] [uniqueidentifier] NOT NULL,
	[dplyLGLanguage] [tinyint] NOT NULL,
	[finalEnt] [int] NOT NULL,
 CONSTRAINT [LGLANGUAGE_PK] PRIMARY KEY CLUSTERED 
(
	[idLgLanguage] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [LGLANGUAGE_UKG] UNIQUE NONCLUSTERED 
(
	[guidLGLanguage] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ONENDSTEP]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ONENDSTEP](
	[idOnEndStep] [tinyint] NOT NULL,
	[oesName] [nvarchar](26) NOT NULL,
 CONSTRAINT [ONENDSTEP_PK] PRIMARY KEY CLUSTERED 
(
	[idOnEndStep] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedTableType [dbo].[NewContentsTable]    Script Date: 06/08/2017 15:53:13 ******/
CREATE TYPE [dbo].[NewContentsTable] AS TABLE(
	[rootObject] [uniqueidentifier] NOT NULL,
	[guidObject] [uniqueidentifier] NOT NULL,
	[objContentExpanded] [varbinary](max) NULL
)
GO
/****** Object:  Table [dbo].[MULTIINSTANCEEXITMODE]    Script Date: 06/08/2017 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MULTIINSTANCEEXITMODE](
	[idMultiInstanceExitMode] [int] NOT NULL,
	[miEmName] [nvarchar](26) NOT NULL,
 CONSTRAINT [MULTIINSTANCEEXITMODE_PK] PRIMARY KEY CLUSTERED 
(
	[idMultiInstanceExitMode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spBA_Sync_ExecQueries]    Script Date: 06/08/2017 15:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_Sync_ExecQueries]( @sSqlQuery varchar(8000), @bExecQueries bit = 1, @bPrintQueries bit = 0 )
	AS
		declare @_sSqlSpTmp varchar(8000)
		set @_sSqlSpTmp = '
			DECLARE @_sSqlTmp varchar(8000)
			DECLARE @idQuery integer

			-- execute query to retrieve query strings
			DECLARE @tmpQueries table( idQuery integer, sqlQuery varchar(8000) null )

			-- Allocate a cursor variable. 
			DECLARE @_CrsrVarQry CURSOR

			set @idQuery = 0
			-- execute query to run query strings
			SET @_CrsrVarQry = CURSOR FAST_FORWARD FOR 
				{0};
			OPEN @_CrsrVarQry
			FETCH NEXT FROM @_CrsrVarQry INTO @_sSqlTmp
			WHILE( @@FETCH_STATUS <> -1 )
			BEGIN
				IF( @@FETCH_STATUS <> -2 )
				BEGIN
					set @idQuery = @idQuery + 1
					insert into @tmpQueries values (@idQuery, @_sSqlTmp)
				END
				FETCH NEXT FROM @_CrsrVarQry INTO @_sSqlTmp
			END
			CLOSE @_CrsrVarQry
			DEALLOCATE @_CrsrVarQry


			-- Allocate a cursor variable. 
			DECLARE @_CrsrVar CURSOR

			-- execute query to run query strings
			SET @_CrsrVar = CURSOR FAST_FORWARD FOR 
				select sqlQuery from @tmpQueries order by idQuery;
			OPEN @_CrsrVar
			FETCH NEXT FROM @_CrsrVar INTO @_sSqlTmp
			WHILE( @@FETCH_STATUS <> -1 )
			BEGIN
				IF( @@FETCH_STATUS <> -2 )
				BEGIN
					IF( {2} = 1 ) print @_sSqlTmp
					IF( {1} = 1 ) exec ( @_sSqlTmp )
				END
				FETCH NEXT FROM @_CrsrVar INTO @_sSqlTmp
			END
			CLOSE @_CrsrVar
			DEALLOCATE @_CrsrVar
		'
		set @_sSqlSpTmp = replace( replace( replace( @_sSqlSpTmp, '{2}', @bPrintQueries ), 
			'{1}', @bExecQueries ), '{0}', @sSqlQuery )
		EXEC( @_sSqlSpTmp )
GO
/****** Object:  StoredProcedure [dbo].[spBA_MonitorExit]    Script Date: 06/08/2017 15:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spBA_MonitorExit](@SyncObject nvarchar(255))
	as
	begin
		begin try
			exec sp_releaseapplock @Resource = @SyncObject, @LockOwner = 'Session'
		end try
		begin catch
			-- I dont care exceptions here
		end catch
	end
GO
/****** Object:  StoredProcedure [dbo].[spBA_MonitorEnter]    Script Date: 06/08/2017 15:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spBA_MonitorEnter] (@SyncObject nvarchar(255), @timeout int = null)
	as
	begin
		declare @ret int
		exec @ret = sp_getapplock @Resource = @SyncObject, @LockMode = 'Exclusive', @LockOwner = 'Session',  @LockTimeout = @timeout
		return @ret
	end
GO
/****** Object:  StoredProcedure [dbo].[spBA_EM_ExistsEntityInstance]    Script Date: 06/08/2017 15:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_EM_ExistsEntityInstance](@sEntSource sysname, @sSurrogateKey varchar(30), @sKeyValue varchar(30), @bExists integer output)
	AS
	BEGIN
		declare @iCount integer
		declare @sSql nvarchar(500)
		set @sSql = 'select @_iCount = count(*) from ' + @sEntSource + ' WITH (NOLOCK) where ' + @sSurrogateKey + '=' + @sKeyValue
		exec sp_executesql @sSql, N'@_iCount integer output', @_iCount = @iCount out
		set @bExists = case when @iCount > 0 then 1 else 0 end
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_SQL_FixUniqueNamesNCols]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_SQL_FixUniqueNamesNCols](@sTableName sysname, @iNumCols integer, @sUniqueColumnsIdsNames varchar(4000), @sUniqueColumnName sysname, @sAppendChar varchar(1) = '_')
	AS
	BEGIN
		declare @iCounter integer
		declare @sqlAux varchar(max)
		declare @sqlVariablesDeclaration varchar(max)
		declare @sqlValidations varchar(max)
		declare @sqlVariablesList varchar(1000)
		declare @sqlNamesCondition varchar(max)
		declare @sqlFindRepCondition varchar(max)
		declare @sqlReplaceColumns varchar(max)

		-- variables declarations
		set @iCounter = 1;
		set @sqlVariablesDeclaration = ' ';
		while (@iCounter < @iNumCols)
		begin
			set @sqlAux = '
			declare @sUniqueColumnId{0} sysname ';
			set @sqlAux = REPLACE(@sqlAux, '{0}', @iCounter)
			set @sqlVariablesDeclaration = @sqlVariablesDeclaration + @sqlAux
			set @iCounter = @iCounter + 1
		end

		-- columns validations
		set @iCounter = 1;
		set @sqlValidations = ' ';
		while (@iCounter < @iNumCols)
		begin
			set @sqlAux = '
			-- validate column {0}
			if not exists(select 1 from information_schema.columns where table_name = @sTableName and column_name = @sUniqueColumnId{0})
			begin
				set @sqlTmp = replace(replace(''Column "{sTableName}.{sUniqueColumnId{0}}" does not exists.'', ''{sTableName}'', @sTableName), ''{sUniqueColumnId{0}}'', @sUniqueColumnId{0});
				RAISERROR (@sqlTmp, 16, 1);
				return;
			end
			';
			set @sqlAux = REPLACE(@sqlAux, '{0}', @iCounter)
			set @sqlValidations = @sqlValidations + @sqlAux
			set @iCounter = @iCounter + 1
		end

		-- variables list
		set @iCounter = 1;
		set @sqlVariablesList = ' ';
		while (@iCounter < @iNumCols)
		begin
			set @sqlAux = REPLACE('<sUniqueColumnId{0}>, ', '{0}', @iCounter)

			set @sqlVariablesList = @sqlVariablesList + @sqlAux
			set @iCounter = @iCounter + 1
		end

		-- conditions to find new name
		set @iCounter = 1;
		set @sqlNamesCondition = ' ';
		while (@iCounter < @iNumCols)
		begin
			set @sqlAux = '
												and ((chlds.<sUniqueColumnId{0}> = rw.<sUniqueColumnId{0}>) or (chlds.<sUniqueColumnId{0}> is null and rw.<sUniqueColumnId{0}> is null)) ';
			set @sqlAux = REPLACE(@sqlAux, '{0}', @iCounter)
			set @sqlNamesCondition = @sqlNamesCondition + @sqlAux
			set @iCounter = @iCounter + 1
		end

		-- conditions to find repeated names
		set @iCounter = 1;
		set @sqlFindRepCondition = ' ';
		while (@iCounter < @iNumCols)
		begin
			set @sqlAux = '
						and ((f.<sUniqueColumnId{0}> = rep.<sUniqueColumnId{0}>) or (f.<sUniqueColumnId{0}> is null and rep.<sUniqueColumnId{0}> is null)) ';
			set @sqlAux = REPLACE(@sqlAux, '{0}', @iCounter)
			set @sqlFindRepCondition = @sqlFindRepCondition + @sqlAux
			set @iCounter = @iCounter + 1
		end

		-- replace column names
		set @iCounter = 1;
		set @sqlReplaceColumns = ' ';
		while (@iCounter < @iNumCols)
		begin
			set @sqlAux = '
			set @sqlTmp = replace(@sqlTmp, ''<sUniqueColumnId{0}>'', @sUniqueColumnId{0}); ';
			set @sqlAux = REPLACE(@sqlAux, '{0}', @iCounter)
			set @sqlReplaceColumns = @sqlReplaceColumns + @sqlAux
			set @iCounter = @iCounter + 1
		end

		declare @sqlFix varchar(max)
		set @sqlFix = '
			declare @sTableName sysname
			declare @sUniqueColumnName sysname
			declare @sAppendChar varchar(1)

			declare @sqlTmp varchar(max)
			declare @sPkColumnName sysname
			declare @iNameMaxLen int

			[{sqlVariablesDeclaration}]

			set @sTableName = ''[{sTableName}]''
			set @sUniqueColumnName = ''[{sUniqueColumnName}]''
			set @sAppendChar = ''[{sAppendChar}]''

			[{sUniqueColumnsIdsNames}]

			-- validate table
			if not exists(select 1 from information_schema.tables where table_name = @sTableName)
			begin
				set @sqlTmp = replace(''Table "{sTableName}" does not exists.'', ''{sTableName}'', @sTableName);
				RAISERROR (@sqlTmp, 16, 1);
				return;
			end

			[{sqlValidations}]

			-- validate column name
			if not exists(select 1 from information_schema.columns where table_name = @sTableName and column_name = @sUniqueColumnName)
			begin
				set @sqlTmp = replace(replace(''Column "{sTableName}.{sUniqueColumnName}" does not exists.'', ''{sTableName}'', @sTableName), ''{sUniqueColumnName}'', @sUniqueColumnName);
				RAISERROR (@sqlTmp, 16, 1);
				return;
			end

			if (@sAppendChar is null)
				set @sAppendChar = ''''

			-- get primary key
			select @sPkColumnName = column_name

			from vwba_sync_allpkeys
			where table_name = @sTableName;

			-- get max length
			select @iNameMaxLen = CHARACTER_MAXIMUM_LENGTH
			from vwba_sync_allcolumns
			where table_name = @sTableName and column_name = @sUniqueColumnName;

			-- Fix repeated names, assign an unused name appending a suffix
			set @sqlTmp = ''
				select replace(replace(''''
						print (''''''''Setting unique name on [{sqlVariablesList}]<sUniqueColumnName> to <sTableName> Id {idTable}.'''''''');

						update <sTableName>
						set <sUniqueColumnName> = (
								select top 1 newName
								from (
										select (case when len(currentName + suffixText) <= <iNameMaxLen> then currentName + suffixText
											else substring(currentName, 1, <iNameMaxLen> - len(suffixText)) + suffixText end) newName, currentName, suffixNumber
										from (
												select ''''''''{currentName}'''''''' currentName,
													(''''''''<sAppendChar>'''''''' + cast(nums.num as varchar)) suffixText, nums.num suffixNumber
												from (
														select ROW_NUMBER() over (order by name) num from sys.objects
													) nums
												where nums.num <> 1
											) sfxs
									) names
									left outer join (
										select chlds.*
										from <sTableName> rw
											inner join <sTableName> chlds on
												1=1 [{sqlNamesCondition}]
										where rw.<sPkColumnName> = {idTable}
									) p on names.newName = p.<sUniqueColumnName>
								where p.<sUniqueColumnName> is null
								order by suffixNumber asc
							)
						where <sPkColumnName> = {idTable};
					'''',
					''''{currentName}'''', <sUniqueColumnName>),
					''''{idTable}'''', <sPkColumnName>)
				from (
					select f.<sPkColumnName>, f.<sUniqueColumnName>
					from <sTableName> f, (
							select [{sqlVariablesList}]<sUniqueColumnName>, min(<sPkColumnName>) minIdWfClass, count(*) num
							from <sTableName>
							group by [{sqlVariablesList}]<sUniqueColumnName>
							having count(*) > 1
						) rep
					where 1=1 [{sqlFindRepCondition}]
						and f.<sUniqueColumnName> = rep.<sUniqueColumnName>
						and f.<sPkColumnName> <> rep.minIdWfClass
				) b
				order by <sPkColumnName>
			'';
			set @sqlTmp = replace(@sqlTmp, ''<sTableName>'', @sTableName);
			set @sqlTmp = replace(@sqlTmp, ''<sPkColumnName>'', @sPkColumnName);
			set @sqlTmp = replace(@sqlTmp, ''<sUniqueColumnName>'', @sUniqueColumnName);
			set @sqlTmp = replace(@sqlTmp, ''<sAppendChar>'', @sAppendChar);
			set @sqlTmp = replace(@sqlTmp, ''<iNameMaxLen>'', @iNameMaxLen);
			[{sqlReplaceColumns}]

			-- print (@sqlTmp);
			exec spBA_Sync_ExecQueries @sqlTmp, 1, 0
		';
		set @sqlFix = replace(@sqlFix, '[{sTableName}]', @sTableName);
		set @sqlFix = replace(@sqlFix, '[{sUniqueColumnName}]', @sUniqueColumnName);
		set @sqlFix = replace(@sqlFix, '[{sAppendChar}]', @sAppendChar);

		set @sqlFix = replace(@sqlFix, '[{sqlVariablesDeclaration}]', @sqlVariablesDeclaration);

		set @sqlFix = replace(@sqlFix, '[{sUniqueColumnsIdsNames}]', @sUniqueColumnsIdsNames);
		set @sqlFix = replace(@sqlFix, '[{sqlValidations}]', @sqlValidations);
		set @sqlFix = replace(@sqlFix, '[{sqlVariablesList}]', @sqlVariablesList);
		set @sqlFix = replace(@sqlFix, '[{sqlNamesCondition}]', @sqlNamesCondition);
		set @sqlFix = replace(@sqlFix, '[{sqlFindRepCondition}]', @sqlFindRepCondition);
		set @sqlFix = replace(@sqlFix, '[{sqlReplaceColumns}]', @sqlReplaceColumns);

		-- print (@sqlFix);
		exec (@sqlFix);
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_SQL_GrantWebAppPrivsToUser]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- @sUserName can be sql server login or windows user (domain\user)
	CREATE PROCEDURE [dbo].[spBA_SQL_GrantWebAppPrivsToUser](@sUserName varchar(256)) AS
	BEGIN
		-- set default language to ensure correct date formats
		exec sp_defaultlanguage @sUserName, 'us_english'
		-- grant access to database
		if not exists (select * from dbo.sysusers where name = @sUserName and uid < 16382)
		begin
			exec sp_grantdbaccess @sUserName, @sUserName
		end
		-- set database as default
		declare @sDBName varchar(256)
		set @sDBName = DB_NAME()
		exec sp_defaultdb @sUserName, @sDBName

		-- grant necessary privileges
		exec sp_addrolemember 'rlBA_SQL_BizAgiWebApp', @sUserName
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_SQL_ScriptCreateTable]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_SQL_ScriptCreateTable]
	( 
		@sTableName sysname,
		@sSqlScript varchar(8000) output
	)
	AS
	BEGIN
		-- WARNING!!!: SqlDMO Object Run from another connections, therefore locks over table schema can result
		-- in deadlocks, be sure that table schema is not locked

		declare @exec_str varchar(1000), @sBuffer varchar(8000)

		-- Test that object is not locked
		if object_id('tempdb..#tbBA_Tmp_ScriptTable_Locks') is not null begin drop table #tbBA_Tmp_ScriptTable_Locks end
		create table #tbBA_Tmp_ScriptTable_Locks ( spid smallint, dbid smallint, ObjId int, IndId smallint, Type nchar(4), Resource nchar(16), Mode nvarchar(8), Status nvarchar(16) )
		truncate table #tbBA_Tmp_ScriptTable_Locks
		insert into #tbBA_Tmp_ScriptTable_Locks execute sp_lock
		declare @iNumSchemaLocks integer
		select @iNumSchemaLocks = count(*) from #tbBA_Tmp_ScriptTable_Locks lck where dbid = DB_ID()  and  lck.Type = 'TAB'  and  Mode = 'Sch-M'
		drop table #tbBA_Tmp_ScriptTable_Locks
		if (@iNumSchemaLocks > 0)
		begin
			set @exec_str = 'Table ' + @sTableName + ' has locks over its Schema. Unable to generate creation script for table.'
			RAISERROR (@exec_str, 16, 1)
			return
		end

		-- Start script generation
		declare @rc int, @objDMO int
		declare @sMsgError varchar(1000)

		-- prepare scripting object
		exec @rc = sp_OACreate 'SQLDMO.SQLServer', @objDMO OUT
		if @rc <> 0 or @@error <> 0 begin set @sMsgError = 'Cannot create SQLDMO.SQLServer' goto ErrorHnd end

		exec @rc = sp_OASetProperty @objDMO, 'loginsecure', 'true'

		exec @rc = sp_OAMethod @objDMO , 'Connect', NULL, @@SERVERNAME
		if @rc <> 0 or @@error <> 0 begin set @sMsgError = 'Cannot connect to Database in SQLDMO.SQLServer.Connect' goto ErrorHnd end

		exec @rc = sp_OAMethod @objDMO, 'VerifyConnection', @exec_str OUTPUT
		if @rc <> 0 or @@error <> 0 begin set @sMsgError = 'Unable to validate connection to Database in SQLDMO.SQLServer.VerifyConnection' goto ErrorHnd end

		declare @ScriptType int
		-- SQLDMOScript_Drops | SQLDMOScript_Default | SQLDMOScript_Indexes
		set @ScriptType = 1|4|73736
		set @exec_str = 'Databases("'+ db_name() +'").Tables("' + upper(@sTableName) + '").Script'
		exec @rc = sp_OAMethod @objDMO, @exec_str, @sBuffer OUTPUT, @ScriptType
		if @rc <> 0 or @@error <> 0 begin set @sMsgError = 'Cannot generate table script in SQLDMO.SQLServer.Database.Table.Script' goto ErrorHnd end

		set @sBuffer = replace(@sBuffer, char(13) + char(10) + 'GO' + char(13) + char(10), char(13))
		set @sBuffer = replace(@sBuffer, ' COLLATE ' + cast(DATABASEPROPERTYEX(DB_NAME(), 'Collation') as sysname) + ' ', ' ')

		set @sSqlScript = @sBuffer

		-- clear up dmo
		exec @rc = sp_OAMethod @objDMO, 'Disconnect'
		if @rc <> 0 or @@error <> 0 begin set @sMsgError = 'Cannot disconnect from Database in SQLDMO.SQLServer.Disconnect' goto ErrorHnd end

		exec @rc = sp_OADestroy @objDMO
		if @rc <> 0 or @@error <> 0 begin set @sMsgError = 'Cannot destroy SQLDMO.SQLServer' goto ErrorHnd end

		return
	ErrorHnd:
		set @exec_str = 'Unable to generate creation script for table "' + @sTableName + '". ' + @sMsgError
		RAISERROR (@exec_str, 16, 1)
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_Visio_UpdParentId]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_Visio_UpdParentId]( @sUpdateTable sysname, @sParentTable sysname, @sUpdateCol sysname, @sParentCol sysname, @sUpdateGuidCol sysname, @sParentGuidCol sysname, @sUpdateIdVal varchar(38), @sParentIdVal varchar(38) )
	AS
		DECLARE @sParentWhere VARCHAR(100)
		IF @sParentIdVal IS NULL OR LEN(@sParentIdVal) = 0
			SET @sParentWhere = ' IS NULL'
		ELSE
			SET @sParentWhere = ' = ''' + @sParentIdVal + ''''

		EXEC( '
		UPDATE T 
		SET T.' + @sUpdateCol + ' = PARENT.' + @sParentCol + ' 
		FROM ' + @sUpdateTable + ' T, ' + @sParentTable + ' PARENT 
		WHERE T.' + @sUpdateGuidCol + ' = ''' + @sUpdateIdVal + ''' AND PARENT.' + @sParentGuidCol + @sParentWhere
		)
GO
/****** Object:  StoredProcedure [dbo].[spBA_Visio_DelParentId]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_Visio_DelParentId]( @sDeleteTable sysname, @sParentTable sysname, @sDeleteCol sysname, @sParentCol sysname, @sDeleteGuidCol sysname, @sParentGuidCol sysname, @sDeleteIdVal varchar(38))
	AS
		EXEC( '
		UPDATE T 
		SET T.' + @sDeleteCol + ' = NULL  
		FROM ' + @sDeleteTable + ' T, ' + @sParentTable + ' PARENT 
		WHERE T.' + @sDeleteCol + ' = PARENT.' + @sParentCol + ' AND PARENT.' + @sParentGuidCol + ' = ''' + @sDeleteIdVal + ''''
		)
GO
/****** Object:  StoredProcedure [dbo].[spBA_UpdateBAGeneratorTable]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spBA_UpdateBAGeneratorTable] 
		( @sequenceName as VARCHAR(100),
		  @sTableName as sysname,
		  @sSurrogateKey as VARCHAR(100)
		) as
		BEGIN
			declare @sql as VARCHAR(8000);
			set @sql = replace(replace(replace('
				begin
					declare @maxValue integer;
					select @maxValue = max({sSurrogateKey}) from {sTableName};
					if (not @maxValue IS NULL) 
					begin
					   if not exists (select * from BAGeneratorTable where sequenceName = ''{sequenceName}'')
					      INSERT INTO BAGeneratorTable VALUES (''{sequenceName}'', @maxValue);
					end
				end;
				', 
				'{sSurrogateKey}', @sSurrogateKey),
				'{sequenceName}', @sequenceName),
				'{sTableName}', @sTableName);
			exec (@sql);
		end;
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_DropGuidFormatCK]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_DropGuidFormatCK](@sTableName sysname, @sGuidColumnName sysname, @bPrintMessages bit = 0)
	AS
		-- Nothing to do
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_DeleteIdentityObj]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_DeleteIdentityObj]( @sTableName sysname )
	AS
		-- Nothing to do
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_CreateIdentityObj]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_CreateIdentityObj]( @sTableName sysname, @sColumnName sysname )
	AS
		-- Nothing to do
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_CreateGuidUK]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_CreateGuidUK](@sTableName sysname, @sGuidColumnName sysname, @sIdColumnName sysname, @bPrintMessages bit = 0)
	AS
	BEGIN
 		declare @sSql varchar(8000)
		set @sSql = REPLACE( REPLACE( REPLACE( REPLACE('
			begin
				if ({3} = 1) begin
					print(''Adding unique constraint to {0}.{1}'')
				end

				update a
				set a.{1} = newid()
				from {0} a, (
						select {1}, min({2}) idFirst
						from {0}
						where {1} is not null
						group by {1}
						having count(*) > 1
					) f
				where a.{1} = f.{1}  and  a.{2} <> f.idFirst

				alter table {0} add constraint {0}_UKG unique ({1})
			end
			',
			'{0}', @sTableName),
			'{1}', @sGuidColumnName),
			'{2}', @sIdColumnName),
			'{3}', @bPrintMessages)

		exec( @sSql )
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_CreateGuidFormatCK]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_CreateGuidFormatCK](@sTableName sysname, @sGuidColumnName sysname, @bPrintMessages bit = 0)
	AS
		-- Nothing to do
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_CreateGuidDefault]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_CreateGuidDefault] ( @sTableName sysname, @sColumnName sysname )
	AS
	BEGIN
		DECLARE @sNewTableName sysname
		SET @sNewTableName = REPLACE(REPLACE(@sTableName, '[', ''), ']', '')
		EXEC( 'ALTER TABLE ' + @sTableName + ' ADD CONSTRAINT DF_' + @sNewTableName + '_' + @sColumnName + ' DEFAULT NEWID() FOR ' + @sColumnName )
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_CreateEntityTempTable]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_CreateEntityTempTable] ( @sTableName sysname, @sTempTableName sysname )
	AS
	BEGIN
		EXEC( 'SELECT * INTO ' + @sTempTableName + ' FROM ' + @sTableName )
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_CreateAllGuidFormatCKs]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_CreateAllGuidFormatCKs]
	AS
		-- Nothing to do
GO
/****** Object:  Table [dbo].[SCHTYPE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCHTYPE](
	[idSchType] [int] NOT NULL,
	[schtName] [nvarchar](26) NOT NULL,
 CONSTRAINT [SCHTYPE_PK] PRIMARY KEY CLUSTERED 
(
	[idSchType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SCHEDRUNNINGSTATE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCHEDRUNNINGSTATE](
	[idSchedRunningState] [tinyint] NOT NULL,
	[stateName] [nvarchar](100) NOT NULL,
 CONSTRAINT [SCHEDRUNNINGSTATE_PK] PRIMARY KEY CLUSTERED 
(
	[idSchedRunningState] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROLLBACKSTACK]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLLBACKSTACK](
	[idRollbackStack] [int] NOT NULL,
	[idCase] [int] NOT NULL,
	[idWorkItem] [bigint] NOT NULL,
	[idUser] [int] NOT NULL,
 CONSTRAINT [ROLLBACKSTACK_PK] PRIMARY KEY CLUSTERED 
(
	[idRollbackStack] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROLE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLE](
	[idRole] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](26) NOT NULL,
	[guidRole] [uniqueidentifier] NOT NULL,
	[roleDisplayName] [nvarchar](40) NULL,
	[roleDescription] [nvarchar](100) NULL,
	[dplyRole] [tinyint] NOT NULL,
	[finalEnt] [int] NOT NULL,
 CONSTRAINT [ROLE_PK] PRIMARY KEY CLUSTERED 
(
	[idRole] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ROLE_UK1] UNIQUE NONCLUSTERED 
(
	[roleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ROLE_UK2] UNIQUE NONCLUSTERED 
(
	[roleDisplayName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ROLE_UKG] UNIQUE NONCLUSTERED 
(
	[guidRole] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SKILL]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SKILL](
	[idSkill] [int] IDENTITY(1,1) NOT NULL,
	[skillName] [nvarchar](26) NOT NULL,
	[guidSkill] [uniqueidentifier] NOT NULL,
	[skillDisplayName] [nvarchar](40) NULL,
	[skillDescription] [nvarchar](100) NULL,
	[dplySkill] [tinyint] NOT NULL,
	[finalEnt] [int] NOT NULL,
 CONSTRAINT [SKILL_PK] PRIMARY KEY CLUSTERED 
(
	[idSkill] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [SKILL_UK1] UNIQUE NONCLUSTERED 
(
	[skillName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [SKILL_UK2] UNIQUE NONCLUSTERED 
(
	[skillDisplayName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [SKILL_UKG] UNIQUE NONCLUSTERED 
(
	[guidSkill] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_ConcatRows]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_ConcatRows]
	( 
		@sSQL varchar(4000) ,
		@sConcatStr varchar(8000) output
	)
	AS
	BEGIN
		-- Execute the procedure to fill the cursor with tables that reference the table
		declare @nsSql nvarchar(4000)
		set @nsSql = 'SET @TmpCrsrVar = CURSOR FAST_FORWARD FOR ' + @sSQL + '
			OPEN @TmpCrsrVar'
		-- Allocate a cursor variable. 
		DECLARE @_CrsrVar CURSOR
		exec sp_executesql @nsSql, N'@TmpCrsrVar CURSOR output', @TmpCrsrVar = @_CrsrVar out

		declare @sBuffer varchar(8000), @sTmp varchar(8000)
		set @sBuffer = ''
		FETCH NEXT FROM @_CrsrVar INTO @sTmp
		WHILE (@@fetch_status <> -1)
		BEGIN
			SET @sBuffer = @sBuffer + @sTmp
			FETCH NEXT FROM @_CrsrVar INTO @sTmp
		END
		CLOSE @_CrsrVar
		DEALLOCATE @_CrsrVar

		SET @sConcatStr = @sBuffer
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_RenameColumn]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_RenameColumn]( @sTableName sysname, @sOldColumnName sysname, @sNewColumnName sysname )
	AS
		DECLARE @sFullName sysname
		SET @sFullName = @sTableName + '.' + @sOldColumnName
		EXEC sp_rename @sFullName, @sNewColumnName, 'COLUMN'
GO
/****** Object:  StoredProcedure [dbo].[spBA_Dply_DropMtdUpdtTrg]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_Dply_DropMtdUpdtTrg](@sTableName sysname, @bTrace bit = 0)
	AS
	BEGIN
		declare @sSqlSpTmp varchar(8000)
		declare @sTriggerName sysname
		declare @iTmp int

		set @sTriggerName = 'TMD_' + upper(@sTableName)

		SELECT @iTmp = count(*) FROM sysobjects WHERE name = @sTriggerName AND type = 'TR'
		IF (@iTmp > 0) BEGIN
			set @sSqlSpTmp = 'DROP TRIGGER {0}'
			set @sSqlSpTmp = replace(@sSqlSpTmp, '{0}', @sTriggerName)

			if(@bTrace = 1) begin
				print('Droping Metadata Update trigger for ' + @sTableName)
			end
			exec(@sSqlSpTmp)
		END
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_FixTableNotNullNames]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_FixTableNotNullNames](@sTableName sysname, @bPrintMessages bit = 0)
	AS
		-- Nothing to do. Not Null constraints does not have names in Sql Server
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_ExecSPIfExists]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_ExecSPIfExists](@sSPName sysname, @sSPParams sysname = null)
	AS
	BEGIN
		DECLARE @iTmpCount int
		select @iTmpCount = count(*) from dbo.sysobjects where id = object_id(@sSPName) and OBJECTPROPERTY(id, N'IsProcedure') = 1
		if (@iTmpCount > 0)
		begin
			if (@sSPParams is null) begin
				exec( 'exec ' + @sSPName )
			end
			else begin
				exec( 'exec ' + @sSPName + ' ' + @sSPParams )
			end
		end
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_DropTableIfExists]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_DropTableIfExists](@sTableName sysname)
	AS
	BEGIN
		if exists (select * from dbo.sysobjects where id = object_id(@sTableName) and OBJECTPROPERTY(id, N'IsUserTable') = 1) begin
			exec('drop table ' + @sTableName)
		end
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_FixAllNotNullNames]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_FixAllNotNullNames]
	AS
		-- Nothing to do. Not Null constraints does not have names in Sql Server
GO
/****** Object:  Table [dbo].[ALLOCPRINCIPLE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALLOCPRINCIPLE](
	[idAllocPrinciple] [int] NOT NULL,
	[aprinName] [nvarchar](26) NOT NULL,
 CONSTRAINT [ALLOCPRINCIPLE_PK] PRIMARY KEY CLUSTERED 
(
	[idAllocPrinciple] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALARMSENDMODE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALARMSENDMODE](
	[idAlarmSendMode] [tinyint] NOT NULL,
	[asmName] [nvarchar](26) NOT NULL,
 CONSTRAINT [ALARMSENDMODE_PK] PRIMARY KEY CLUSTERED 
(
	[idAlarmSendMode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALARMRECURMODE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALARMRECURMODE](
	[idAlarmRecurMode] [tinyint] NOT NULL,
	[armName] [nvarchar](26) NOT NULL,
 CONSTRAINT [ALARMRECURMODE_PK] PRIMARY KEY CLUSTERED 
(
	[idAlarmRecurMode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ASSIGNATIONLOG]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASSIGNATIONLOG](
	[idAssigLog] [bigint] IDENTITY(1,1) NOT NULL,
	[idWorkflow] [int] NOT NULL,
	[idCase] [int] NOT NULL,
	[idTask] [int] NOT NULL,
	[idWorkItem] [bigint] NOT NULL,
	[idUser] [int] NOT NULL,
	[alEntryDate] [datetime] NOT NULL,
	[idAssignationLogType] [tinyint] NULL,
 CONSTRAINT [ASSIGNATIONLOG_PK] PRIMARY KEY CLUSTERED 
(
	[idAssigLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ASSIGNATIONLOG_IX2] ON [dbo].[ASSIGNATIONLOG] 
(
	[idCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ASSIGNATIONLOG_IX3] ON [dbo].[ASSIGNATIONLOG] 
(
	[idWorkItem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ALIDTASKIDUSERIDCASE] ON [dbo].[ASSIGNATIONLOG] 
(
	[idTask] ASC,
	[idUser] ASC,
	[idCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AREA]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AREA](
	[idArea] [int] IDENTITY(1,1) NOT NULL,
	[areaName] [nvarchar](26) NOT NULL,
	[guidArea] [uniqueidentifier] NOT NULL,
	[areaDisplayName] [nvarchar](40) NULL,
	[areaDescription] [nvarchar](100) NULL,
	[costArea] [numeric](11, 2) NULL,
	[dplyArea] [tinyint] NOT NULL,
	[finalEnt] [int] NOT NULL,
 CONSTRAINT [AREA_PK] PRIMARY KEY CLUSTERED 
(
	[idArea] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [AREA_UK1] UNIQUE NONCLUSTERED 
(
	[areaName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [AREA_UK2] UNIQUE NONCLUSTERED 
(
	[areaDisplayName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [AREA_UKG] UNIQUE NONCLUSTERED 
(
	[guidArea] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ARCHIVINGLOG]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARCHIVINGLOG](
	[idArchivingLog] [uniqueidentifier] NOT NULL,
	[idPackage] [uniqueidentifier] NOT NULL,
	[idCase] [uniqueidentifier] NULL,
	[isSuccess] [bit] NOT NULL,
	[logData] [datetime] NOT NULL,
	[logMessage] [text] NULL,
 CONSTRAINT [ARCHIVINGLOG_PK] PRIMARY KEY CLUSTERED 
(
	[idArchivingLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ARCHIVINGLOG_IDX1] ON [dbo].[ARCHIVINGLOG] 
(
	[idPackage] ASC,
	[idCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALARMLAPSEMODE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALARMLAPSEMODE](
	[idLapseMode] [tinyint] NOT NULL,
	[lmName] [nvarchar](26) NOT NULL,
 CONSTRAINT [ALARMLAPSEMODE_PK] PRIMARY KEY CLUSTERED 
(
	[idLapseMode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALARMJOBRECIPIENTLOG]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALARMJOBRECIPIENTLOG](
	[idAlarmJobRecipientLog] [int] IDENTITY(1,1) NOT NULL,
	[idAlarmJobLog] [int] NOT NULL,
	[idUser] [int] NOT NULL,
 CONSTRAINT [ALARMJOBRECIPIENTLOG_PK] PRIMARY KEY CLUSTERED 
(
	[idAlarmJobRecipientLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BACATALOGTAGDEFINITION]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BACATALOGTAGDEFINITION](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[source] [nvarchar](100) NOT NULL,
	[type] [nvarchar](36) NOT NULL,
	[dataType] [nvarchar](36) NOT NULL,
	[objType] [int] NOT NULL,
 CONSTRAINT [BACATALOGTAGDEFINITION_PK] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_BACATALOGTAGDEFINITION] ON [dbo].[BACATALOGTAGDEFINITION] 
(
	[name] ASC,
	[objType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BACATALOGREFERENCE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BACATALOGREFERENCE](
	[rootObject] [uniqueidentifier] NULL,
	[guidPointer] [uniqueidentifier] NULL,
	[guidObjectRef] [uniqueidentifier] NULL,
	[guidObjectTarget] [uniqueidentifier] NOT NULL,
	[deleted] [bit] NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [BACATALOGREFERENCE_CIDX] ON [dbo].[BACATALOGREFERENCE] 
(
	[rootObject] ASC,
	[guidObjectRef] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BACATALOGREF_GUIDOBJREF_IDX] ON [dbo].[BACATALOGREFERENCE] 
(
	[guidObjectRef] ASC,
	[guidPointer] ASC,
	[guidObjectTarget] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BACATALOGREFERENCE_IDX] ON [dbo].[BACATALOGREFERENCE] 
(
	[guidPointer] ASC,
	[guidObjectRef] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BACATALOGREFERENCE_IDX2] ON [dbo].[BACATALOGREFERENCE] 
(
	[guidObjectTarget] ASC
)
INCLUDE ( [guidObjectRef]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BACATALOGINDEXEDOBJECTS]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BACATALOGINDEXEDOBJECTS](
	[rootObject] [uniqueidentifier] NULL,
	[name] [varchar](36) NOT NULL,
	[sourceGuid] [uniqueidentifier] NOT NULL,
	[targetGuid] [uniqueidentifier] NOT NULL,
	[deleted] [bit] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE CLUSTERED INDEX [BACATALOGINDEXEDOBJECTS_CIDX] ON [dbo].[BACATALOGINDEXEDOBJECTS] 
(
	[rootObject] ASC,
	[targetGuid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BACATALOGINDEXEDOBJECTS_IDX] ON [dbo].[BACATALOGINDEXEDOBJECTS] 
(
	[sourceGuid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BACATALOGINDEXEDOBJECTS_IDX2] ON [dbo].[BACATALOGINDEXEDOBJECTS] 
(
	[targetGuid] ASC,
	[sourceGuid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BACATALOGINDEXEDOBJECTS_IDX3] ON [dbo].[BACATALOGINDEXEDOBJECTS] 
(
	[targetGuid] ASC,
	[deleted] ASC
)
INCLUDE ( [name],
[sourceGuid]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BACATALOGINDEXDEFINITION]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BACATALOGINDEXDEFINITION](
	[indexName] [varchar](36) NOT NULL,
	[objectType] [int] NOT NULL,
	[sourceObjectType] [int] NOT NULL,
 CONSTRAINT [BACATALOGINDEXDEFINITION_PK] PRIMARY KEY CLUSTERED 
(
	[indexName] ASC,
	[objectType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BACATALOGI18NDEFINITION]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BACATALOGI18NDEFINITION](
	[objType] [int] NOT NULL,
	[type] [nvarchar](36) NOT NULL,
	[name] [nvarchar](250) NOT NULL,
 CONSTRAINT [BACATALOGI18NDEFINITION_PK] PRIMARY KEY CLUSTERED 
(
	[objType] ASC,
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BACASERESOURCE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BACASERESOURCE](
	[idCaseRes] [uniqueidentifier] NOT NULL,
	[caseResType] [int] NOT NULL,
	[caseResContent] [ntext] NOT NULL,
	[caseResDate] [bigint] NOT NULL,
	[globalParent] [nvarchar](40) NULL,
	[idParent] [uniqueidentifier] NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [BACASERESOURCE_PK] PRIMARY KEY CLUSTERED 
(
	[idCaseRes] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BACASERESOURCE_IDX_1] ON [dbo].[BACASERESOURCE] 
(
	[caseResType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BACASERESOURCE_IDX_2] ON [dbo].[BACASERESOURCE] 
(
	[caseResDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BACASERESOURCE_IDX_3] ON [dbo].[BACASERESOURCE] 
(
	[globalParent] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BACASERESOURCE_IDX_4] ON [dbo].[BACASERESOURCE] 
(
	[idParent] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BACASERESOURCE_IDX_5] ON [dbo].[BACASERESOURCE] 
(
	[isDeleted] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BACASEATTACHMENT]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BACASEATTACHMENT](
	[idCaseAttach] [uniqueidentifier] NOT NULL,
	[caseAttachFile] [image] NULL,
	[storage] [int] NOT NULL,
	[caseAttachPath] [nvarchar](100) NULL,
	[caseAttachDate] [bigint] NOT NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [BACASEATTACHMENT_PK] PRIMARY KEY CLUSTERED 
(
	[idCaseAttach] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BACASEATTACHMENT_IDX_1] ON [dbo].[BACASEATTACHMENT] 
(
	[caseAttachDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BACASEATTACHMENT_IDX_2] ON [dbo].[BACASEATTACHMENT] 
(
	[isDeleted] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BACASEACCESSTYPE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BACASEACCESSTYPE](
	[caType] [int] NOT NULL,
	[caTypeName] [nvarchar](25) NOT NULL,
 CONSTRAINT [BACASEACCESSTYPE_PK] PRIMARY KEY CLUSTERED 
(
	[caType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BACASEACCESSTYPE_UK1] UNIQUE NONCLUSTERED 
(
	[caTypeName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BACACHESYNC]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BACACHESYNC](
	[idBACacheSync] [int] IDENTITY(1,1) NOT NULL,
	[cscommand] [nvarchar](10) NOT NULL,
	[csprefix] [varchar](50) NULL,
	[cskey] [nvarchar](100) NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [BACACHESYNC_PK] PRIMARY KEY CLUSTERED 
(
	[idBACacheSync] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BABIZRULEAUDITLOG]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BABIZRULEAUDITLOG](
	[idBABizRuleAuditLog] [int] IDENTITY(1,1) NOT NULL,
	[actionType] [char](1) NULL,
	[fieldName] [nvarchar](30) NULL,
	[oldValue] [ntext] NULL,
	[newValue] [ntext] NULL,
	[updateDate] [datetime] NULL,
 CONSTRAINT [BABIZRULEAUDITLOG_PK] PRIMARY KEY CLUSTERED 
(
	[idBABizRuleAuditLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BABIZAGICATALOG]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BABIZAGICATALOG](
	[guidObject] [uniqueidentifier] NULL,
	[guidObjectParent] [uniqueidentifier] NULL,
	[objName] [varchar](256) NOT NULL,
	[objContent] [varbinary](max) NULL,
	[objType] [int] NOT NULL,
	[objTypeName] [varchar](50) NULL,
	[deployOnParent] [bit] NOT NULL,
	[modifiedDate] [datetime] NULL,
	[modifiedByUser] [varchar](100) NULL,
	[mtdVersion] [int] NULL,
	[rootObject] [uniqueidentifier] NULL,
	[changeSetId] [int] NULL,
	[objContentResolved] [varbinary](max) NULL,
	[deleted] [bit] NULL,
	[contentFormat] [tinyint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE CLUSTERED INDEX [BABIZAGICATALOG_CIDX] ON [dbo].[BABIZAGICATALOG] 
(
	[rootObject] ASC,
	[guidObject] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BABIZAGICATALOG_IDX2] ON [dbo].[BABIZAGICATALOG] 
(
	[rootObject] ASC,
	[changeSetId] ASC
)
INCLUDE ( [guidObject],
[guidObjectParent],
[objName],
[objType],
[objTypeName],
[deleted]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BABIZAGICATALOG_IDX3] ON [dbo].[BABIZAGICATALOG] 
(
	[guidObject] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BABIZAGICATALOG_IDX4] ON [dbo].[BABIZAGICATALOG] 
(
	[objType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAAUDITLOG]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BAAUDITLOG](
	[idBAAuditLog] [int] IDENTITY(1,1) NOT NULL,
	[actionType] [char](1) NULL,
	[tableName] [nvarchar](30) NULL,
	[pKField] [nvarchar](30) NULL,
	[pKValue] [nvarchar](30) NULL,
	[fieldName] [nvarchar](30) NULL,
	[updateDate] [datetime] NULL,
	[oldValue] [nvarchar](4000) NULL,
	[newValue] [nvarchar](4000) NULL,
 CONSTRAINT [BAAUDITLOG_PK] PRIMARY KEY CLUSTERED 
(
	[idBAAuditLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BAASSIGNATIONLOGTYPE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAASSIGNATIONLOGTYPE](
	[idAssignationLogType] [tinyint] NOT NULL,
	[assigLogType] [nvarchar](26) NOT NULL,
 CONSTRAINT [BAASSIGNATIONLOGTYPE_PK] PRIMARY KEY CLUSTERED 
(
	[idAssignationLogType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAASSERTIONSESSIONHANDLER]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAASSERTIONSESSIONHANDLER](
	[idAssertionSessionHandler] [int] IDENTITY(1,1) NOT NULL,
	[httpSessionId] [nvarchar](250) NOT NULL,
	[sessionIndex] [nvarchar](250) NULL,
	[idSamlRequest] [nvarchar](250) NULL,
	[expirationTimeAssertion] [bigint] NOT NULL,
	[logoutVerificationCode] [nvarchar](250) NULL,
	[entityId] [nvarchar](250) NULL,
	[username] [nvarchar](250) NULL,
	[relayState] [nvarchar](250) NULL,
	[assertionId] [nvarchar](250) NULL,
	[creationTime] [bigint] NOT NULL,
	[assertion] [image] NULL,
	[request] [image] NULL,
 CONSTRAINT [BAASSERTIONSESSIONHANDLER_PK] PRIMARY KEY CLUSTERED 
(
	[idAssertionSessionHandler] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAASSERTIONSESSIONHANDLER_X1] ON [dbo].[BAASSERTIONSESSIONHANDLER] 
(
	[assertionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAASSERTIONSESSIONHANDLER_X2] ON [dbo].[BAASSERTIONSESSIONHANDLER] 
(
	[relayState] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAASSERTIONSESSIONHANDLER_X3] ON [dbo].[BAASSERTIONSESSIONHANDLER] 
(
	[httpSessionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAASSERTIONSAMLREQUEST]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAASSERTIONSAMLREQUEST](
	[idAssertionSamlRequest] [int] IDENTITY(1,1) NOT NULL,
	[samlRequestId] [nvarchar](250) NOT NULL,
	[entityId] [nvarchar](250) NOT NULL,
	[creationTime] [bigint] NOT NULL,
	[expirationTime] [bigint] NOT NULL,
 CONSTRAINT [BAASSERTIONSAMLREQUEST_PK] PRIMARY KEY CLUSTERED 
(
	[idAssertionSamlRequest] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAASSERTIONSAMLREQUEST_X1] ON [dbo].[BAASSERTIONSAMLREQUEST] 
(
	[entityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAACTIVITY]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAACTIVITY](
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](1000) NULL,
	[guidActivity] [uniqueidentifier] NOT NULL,
	[allowEdition] [bit] NOT NULL,
	[guidPlan] [uniqueidentifier] NOT NULL,
	[idUser] [int] NOT NULL,
	[duration] [int] NULL,
	[progress] [int] NULL,
	[startDate] [datetime] NULL,
	[finishDate] [datetime] NULL,
	[items] [ntext] NULL,
	[estimatedFinishDate] [datetime] NULL,
 CONSTRAINT [BAACTIVITY_PK] PRIMARY KEY NONCLUSTERED 
(
	[guidActivity] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAACTIVITY_IX1] ON [dbo].[BAACTIVITY] 
(
	[guidPlan] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAGACUBE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAGACUBE](
	[idCube] [int] IDENTITY(1,1) NOT NULL,
	[idStoredQuery] [int] NULL,
	[cubeName] [nvarchar](26) NULL,
	[cubeDescription] [nvarchar](255) NULL,
	[idStoredQueryForm] [int] NULL,
 CONSTRAINT [BAGACUBE_PK] PRIMARY KEY CLUSTERED 
(
	[idCube] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAGACUBE_FK_IDX_1] ON [dbo].[BAGACUBE] 
(
	[idStoredQuery] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAFILEUPLOG]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAFILEUPLOG](
	[IDBAFILEUPLOG] [bigint] NOT NULL,
	[IDFILEUPLOAD] [bigint] NOT NULL,
	[FULLOG] [image] NOT NULL,
	[FULDISABLED] [bit] NOT NULL,
	[FULIDSCOPE] [bigint] NULL,
 CONSTRAINT [BAFILEUPLOG_PK] PRIMARY KEY CLUSTERED 
(
	[IDBAFILEUPLOG] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_BAFILEUPLOG_FULIDESCOPE] ON [dbo].[BAFILEUPLOG] 
(
	[FULIDSCOPE] ASC,
	[IDFILEUPLOAD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAFAVORITES]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAFAVORITES](
	[idFavorite] [int] NOT NULL,
	[guidFavorite] [uniqueidentifier] NOT NULL,
	[xmlFavoriteDefinition] [image] NOT NULL,
 CONSTRAINT [BAFAVORITES_PK] PRIMARY KEY CLUSTERED 
(
	[idFavorite] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAFARMNODE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAFARMNODE](
	[IdBAFarmNode] [int] IDENTITY(1,1) NOT NULL,
	[NodeIdentifier] [nvarchar](100) NULL,
	[IsMasterNode] [bit] NULL,
	[LicenseKey] [nvarchar](2048) NULL,
	[ClusterKey] [nvarchar](2048) NULL,
	[ClusterManagerKey] [nvarchar](2048) NULL,
 CONSTRAINT [BAFARMNODE_PK] PRIMARY KEY CLUSTERED 
(
	[IdBAFarmNode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAFARMNODE_UK1] UNIQUE NONCLUSTERED 
(
	[NodeIdentifier] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAEXTENDEDLOG]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAEXTENDEDLOG](
	[idExtendedLog] [int] IDENTITY(1,1) NOT NULL,
	[idCase] [int] NULL,
	[elEntryDate] [datetime] NULL,
	[elEntry] [text] NULL,
 CONSTRAINT [BAEXTENDEDLOG_PK] PRIMARY KEY CLUSTERED 
(
	[idExtendedLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAERRORCODE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BAERRORCODE](
	[idErrorCode] [int] IDENTITY(10000,1) NOT NULL,
	[ercdName] [varchar](26) NOT NULL,
	[ercdDisplayName] [nvarchar](40) NOT NULL,
	[ercdDescription] [nvarchar](100) NULL,
	[guidErrorCode] [uniqueidentifier] NOT NULL,
	[dplyErrorCode] [tinyint] NOT NULL,
 CONSTRAINT [BAERRORCODE_PK] PRIMARY KEY CLUSTERED 
(
	[idErrorCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAERRORCODE_UKG] UNIQUE NONCLUSTERED 
(
	[guidErrorCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BAMETADATAVERSION]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAMETADATAVERSION](
	[objectType] [int] NOT NULL,
	[mtdVersion] [int] NOT NULL,
 CONSTRAINT [BAMETADATAVERSION_PK] PRIMARY KEY CLUSTERED 
(
	[objectType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAMETADATASTATE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAMETADATASTATE](
	[objectId] [uniqueidentifier] NOT NULL,
	[mtdState] [int] NOT NULL,
 CONSTRAINT [BAMETADATASTATE_PK] PRIMARY KEY CLUSTERED 
(
	[objectId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAOAUTH2SERVERAPP]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BAOAUTH2SERVERAPP](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[description] [nvarchar](512) NULL,
	[website] [varchar](250) NULL,
	[redirectUri] [varchar](512) NOT NULL,
	[redirectUriStrategy] [varchar](50) NOT NULL,
	[clientId] [varchar](256) NULL,
	[clientSecret] [varchar](256) NULL,
	[usernameCreator] [nvarchar](256) NOT NULL,
	[defaultUserDomain] [nvarchar](256) NULL,
	[defaultUserName] [varchar](256) NULL,
	[authorizationGrantType] [varchar](50) NOT NULL,
	[tokenLifetimeInMinutes] [int] NOT NULL,
	[allowedScope] [varchar](50) NOT NULL,
 CONSTRAINT [BAOAUTH2SERVERAPP_PK] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAOAUTH2SERVAPP_UK1] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BALOCALIZATIONOVERRIDE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BALOCALIZATIONOVERRIDE](
	[idObject] [uniqueidentifier] NOT NULL,
	[uri] [varchar](500) NOT NULL,
	[objOverride] [ntext] NOT NULL,
 CONSTRAINT [BALOCALIZATIONOVERRIDE_PK] PRIMARY KEY CLUSTERED 
(
	[idObject] ASC,
	[uri] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BALOCALIZATION]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BALOCALIZATION](
	[idObject] [uniqueidentifier] NOT NULL,
	[uri] [varchar](500) NOT NULL,
	[objContent] [ntext] NOT NULL,
 CONSTRAINT [BALOCALIZATION_PK] PRIMARY KEY CLUSTERED 
(
	[idObject] ASC,
	[uri] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BAGENERATORTABLE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BAGENERATORTABLE](
	[idBAGeneratorTable] [int] IDENTITY(1,1) NOT NULL,
	[sequenceName] [varchar](100) NOT NULL,
	[sequenceValue] [bigint] NOT NULL,
 CONSTRAINT [BAGENERATORTABLE_PK] PRIMARY KEY CLUSTERED 
(
	[idBAGeneratorTable] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [BAGENERATORTABLE_IX1] ON [dbo].[BAGENERATORTABLE] 
(
	[sequenceName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ASYNCSTATE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASYNCSTATE](
	[ID] [int] NOT NULL,
	[State] [int] NOT NULL,
	[idWorkitem] [bigint] NOT NULL,
	[idCase] [int] NOT NULL,
 CONSTRAINT [ASYNCSTATE_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ASYNCSTATE_IDWORKITEM] ON [dbo].[ASYNCSTATE] 
(
	[idWorkitem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAENTITYFORMLOG]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BAENTITYFORMLOG](
	[idEntityFormLog] [int] IDENTITY(1,1) NOT NULL,
	[entFrmLogKey] [varchar](500) NOT NULL,
	[entFrmLogValue] [varchar](7400) NOT NULL,
	[idEnt] [int] NOT NULL,
	[idSurrogateKey] [int] NOT NULL,
	[idWorkItem] [bigint] NOT NULL,
	[idCase] [int] NOT NULL,
	[idTask] [int] NOT NULL,
	[idUser] [int] NOT NULL,
	[entryDateTime] [datetime] NOT NULL,
 CONSTRAINT [BAENTITYFORMLOG_PK] PRIMARY KEY CLUSTERED 
(
	[idEntityFormLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BAEMAILINTEGRATIONDATA]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAEMAILINTEGRATIONDATA](
	[idEmail] [int] IDENTITY(1,1) NOT NULL,
	[body] [image] NULL,
	[subject] [nvarchar](1000) NULL,
	[fromAddress] [nvarchar](200) NULL,
	[readDate] [datetime] NOT NULL,
	[processingTries] [int] NOT NULL,
	[status] [int] NOT NULL,
	[mailId] [nvarchar](11) NULL,
 CONSTRAINT [BAEMAILINTEGRATIONDATA_PK] PRIMARY KEY CLUSTERED 
(
	[idEmail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAENVPARAMENTITYEX]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BAENVPARAMENTITYEX](
	[idEnvParamEntityEx] [int] IDENTITY(10000,1) NOT NULL,
	[paramName] [varchar](50) NOT NULL,
	[paramDefaultValue] [nvarchar](4000) NULL,
	[CommonToAllEnvsDefault] [bit] NOT NULL,
	[guidEnvParamEntityEx] [uniqueidentifier] NOT NULL,
	[dplyEnvParamEntityEx] [tinyint] NOT NULL,
	[paramRequired] [bit] NOT NULL,
	[displayOrder] [tinyint] NOT NULL,
 CONSTRAINT [BAENVPARAMENTITYEX_PK] PRIMARY KEY CLUSTERED 
(
	[idEnvParamEntityEx] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAENVPARAMENTITYEX_UK1] UNIQUE NONCLUSTERED 
(
	[paramName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAENVPARAMENTITYEX_UKG] UNIQUE NONCLUSTERED 
(
	[guidEnvParamEntityEx] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BADSWORKFLOW]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BADSWORKFLOW](
	[idWorkflow] [int] NOT NULL,
	[guidWorkflow] [uniqueidentifier] NOT NULL,
	[wfActive] [bit] NULL,
	[wfVersion] [nvarchar](20) NULL,
	[idCreationDate] [bigint] NULL,
	[wfCreationDate] [datetime] NULL,
	[wfEstimatedDuration] [int] NULL,
	[idWfClass] [int] NOT NULL,
	[guidWfClass] [uniqueidentifier] NOT NULL,
	[wfClsDisplayName] [nvarchar](80) NULL,
 CONSTRAINT [BADSWORKFLOW_PK] PRIMARY KEY CLUSTERED 
(
	[guidWorkflow] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSWORKFLOW_X1] ON [dbo].[BADSWORKFLOW] 
(
	[idWorkflow] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSWORKFLOW_X2] ON [dbo].[BADSWORKFLOW] 
(
	[idWfClass] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSWORKFLOW_X3] ON [dbo].[BADSWORKFLOW] 
(
	[guidWfClass] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSWORKFLOW_X4] ON [dbo].[BADSWORKFLOW] 
(
	[wfActive] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BADSUSERCOST]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BADSUSERCOST](
	[guidCost] [uniqueidentifier] NOT NULL,
	[fromDate] [datetime] NULL,
	[toDate] [datetime] NULL,
	[normalCost] [money] NULL,
	[overtimeCost] [money] NULL,
	[idUser] [int] NULL,
	[guidUser] [uniqueidentifier] NULL,
 CONSTRAINT [BADSUSERCOST_PK] PRIMARY KEY CLUSTERED 
(
	[guidCost] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSUSERCOST_X1] ON [dbo].[BADSUSERCOST] 
(
	[guidUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSUSERCOST_X2] ON [dbo].[BADSUSERCOST] 
(
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSUSERCOST_X3] ON [dbo].[BADSUSERCOST] 
(
	[fromDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSUSERCOST_X4] ON [dbo].[BADSUSERCOST] 
(
	[toDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BADSTRANSITIONHISTORY]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BADSTRANSITIONHISTORY](
	[idTransitionHistory] [int] NOT NULL,
	[guidTransitionHistory] [uniqueidentifier] NOT NULL,
	[guidTransition] [uniqueidentifier] NOT NULL,
	[guidCase] [uniqueidentifier] NOT NULL,
	[guidUser] [uniqueidentifier] NOT NULL,
	[guidWorkitemFrom] [uniqueidentifier] NOT NULL,
	[guidWorkitemTo] [uniqueidentifier] NOT NULL,
	[entryDate] [datetime] NOT NULL,
	[idTransition] [int] NOT NULL,
	[idTransitionType] [int] NULL,
 CONSTRAINT [BADSTRANSITIONHISTORY_PK] PRIMARY KEY CLUSTERED 
(
	[guidTransitionHistory] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSTRANSITIONHISTORY_X1] ON [dbo].[BADSTRANSITIONHISTORY] 
(
	[guidTransition] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSTRANSITIONHISTORY_X2] ON [dbo].[BADSTRANSITIONHISTORY] 
(
	[guidUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSTRANSITIONHISTORY_X3] ON [dbo].[BADSTRANSITIONHISTORY] 
(
	[entryDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSTRANSITIONHISTORY_X4] ON [dbo].[BADSTRANSITIONHISTORY] 
(
	[guidWorkitemFrom] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSTRANSITIONHISTORY_X5] ON [dbo].[BADSTRANSITIONHISTORY] 
(
	[guidWorkitemTo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSTRANSITIONHISTORY_X6] ON [dbo].[BADSTRANSITIONHISTORY] 
(
	[idTransition] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BADSDATE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BADSDATE](
	[id] [bigint] NOT NULL,
	[guid] [uniqueidentifier] NOT NULL,
	[fullDate] [datetime] NOT NULL,
	[day] [int] NOT NULL,
	[week] [int] NOT NULL,
	[monthNumber] [int] NOT NULL,
	[monthName] [nvarchar](30) NOT NULL,
	[quarter] [int] NOT NULL,
	[third] [int] NOT NULL,
	[semester] [int] NOT NULL,
	[year] [int] NOT NULL,
 CONSTRAINT [BADSDATE_PK] PRIMARY KEY CLUSTERED 
(
	[guid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSDATE_X1] ON [dbo].[BADSDATE] 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BADSCLOSEDCASES]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BADSCLOSEDCASES](
	[idCase] [int] NOT NULL,
	[guidCase] [uniqueidentifier] NOT NULL,
	[idCreationDate] [bigint] NULL,
	[idSolutionDate] [bigint] NULL,
	[idEstimatedSolutionDate] [bigint] NULL,
	[casCreationDate] [datetime] NULL,
	[casSolutionDate] [datetime] NULL,
	[casEstimatedSolutionDate] [datetime] NULL,
	[idCreatorUser] [int] NULL,
	[guidCreatorUser] [uniqueidentifier] NULL,
	[idWorkflow] [int] NULL,
	[guidWorkflow] [uniqueidentifier] NULL,
	[idCaseState] [int] NULL,
	[duration] [int] NULL,
	[durationHours] [int] NULL,
	[durationDays] [int] NULL,
	[radNumber] [nvarchar](40) NULL,
	[caseClosed] [tinyint] NULL,
	[hasCaseNumber] [bit] NULL,
 CONSTRAINT [BADSCLOSEDCASES_PK] PRIMARY KEY CLUSTERED 
(
	[guidCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSCLOSEDCASES_X1] ON [dbo].[BADSCLOSEDCASES] 
(
	[idCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSCLOSEDCASES_X2] ON [dbo].[BADSCLOSEDCASES] 
(
	[casCreationDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSCLOSEDCASES_X3] ON [dbo].[BADSCLOSEDCASES] 
(
	[casSolutionDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSCLOSEDCASES_X4] ON [dbo].[BADSCLOSEDCASES] 
(
	[casEstimatedSolutionDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSCLOSEDCASES_X5] ON [dbo].[BADSCLOSEDCASES] 
(
	[idCreatorUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSCLOSEDCASES_X6] ON [dbo].[BADSCLOSEDCASES] 
(
	[guidCreatorUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSCLOSEDCASES_X7] ON [dbo].[BADSCLOSEDCASES] 
(
	[idWorkflow] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSCLOSEDCASES_X8] ON [dbo].[BADSCLOSEDCASES] 
(
	[guidWorkflow] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSCLOSEDCASES_X9] ON [dbo].[BADSCLOSEDCASES] 
(
	[radNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BADSCLOSEDCASEACTIVITIES]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BADSCLOSEDCASEACTIVITIES](
	[idWorkitem] [bigint] NOT NULL,
	[guidWorkitem] [uniqueidentifier] NOT NULL,
	[idEntryDate] [bigint] NULL,
	[idEstimatedSolutionDate] [bigint] NULL,
	[idSolutionDate] [bigint] NULL,
	[wiEntryDate] [datetime] NULL,
	[wiEstimatedSolutionDate] [datetime] NULL,
	[wiSolutionDate] [datetime] NULL,
	[idWorkflow] [int] NULL,
	[guidWorkflow] [uniqueidentifier] NULL,
	[idUser] [int] NULL,
	[guidUser] [uniqueidentifier] NULL,
	[idCase] [int] NULL,
	[guidCase] [uniqueidentifier] NULL,
	[idTask] [int] NULL,
	[guidTask] [uniqueidentifier] NULL,
	[idState] [int] NULL,
	[wiDuration] [int] NULL,
	[durationHours] [int] NULL,
	[durationDays] [int] NULL,
 CONSTRAINT [BADSCLOSEDCASEACTIVITIES_PK] PRIMARY KEY CLUSTERED 
(
	[guidWorkitem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSCLOSEDCASEACTIVITIES_IDX1] ON [dbo].[BADSCLOSEDCASEACTIVITIES] 
(
	[idWorkitem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSCLOSEDCASEACTIVITIES_IDX10] ON [dbo].[BADSCLOSEDCASEACTIVITIES] 
(
	[guidCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSCLOSEDCASEACTIVITIES_IDX11] ON [dbo].[BADSCLOSEDCASEACTIVITIES] 
(
	[idTask] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSCLOSEDCASEACTIVITIES_IDX12] ON [dbo].[BADSCLOSEDCASEACTIVITIES] 
(
	[guidTask] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSCLOSEDCASEACTIVITIES_IDX2] ON [dbo].[BADSCLOSEDCASEACTIVITIES] 
(
	[wiEntryDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSCLOSEDCASEACTIVITIES_IDX3] ON [dbo].[BADSCLOSEDCASEACTIVITIES] 
(
	[wiEstimatedSolutionDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSCLOSEDCASEACTIVITIES_IDX4] ON [dbo].[BADSCLOSEDCASEACTIVITIES] 
(
	[wiSolutionDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSCLOSEDCASEACTIVITIES_IDX5] ON [dbo].[BADSCLOSEDCASEACTIVITIES] 
(
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSCLOSEDCASEACTIVITIES_IDX6] ON [dbo].[BADSCLOSEDCASEACTIVITIES] 
(
	[guidUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSCLOSEDCASEACTIVITIES_IDX7] ON [dbo].[BADSCLOSEDCASEACTIVITIES] 
(
	[idWorkflow] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSCLOSEDCASEACTIVITIES_IDX8] ON [dbo].[BADSCLOSEDCASEACTIVITIES] 
(
	[guidWorkflow] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADSCLOSEDCASEACTIVITIES_IDX9] ON [dbo].[BADSCLOSEDCASEACTIVITIES] 
(
	[idCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AUTHEVENTTYPE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AUTHEVENTTYPE](
	[idAuthEventType] [int] NOT NULL,
	[AuthEventTypeName] [nvarchar](25) NOT NULL,
 CONSTRAINT [AUTHEVENTTYPE_PK] PRIMARY KEY CLUSTERED 
(
	[idAuthEventType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AUTHEVENTSUBTYPE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AUTHEVENTSUBTYPE](
	[idAuthEventSubType] [int] NOT NULL,
	[AuthEventSubTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [AUTHEVENTSUBTYPE_PK] PRIMARY KEY CLUSTERED 
(
	[idAuthEventSubType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BACOLLABFOLDER]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BACOLLABFOLDER](
	[idCollabFolder] [int] IDENTITY(1,1) NOT NULL,
	[guidCollabFolder] [uniqueidentifier] NOT NULL,
	[folderName] [nvarchar](255) NOT NULL,
	[idParentFolder] [int] NULL,
	[dplyCollabFolder] [tinyint] NOT NULL,
 CONSTRAINT [BACOLLABFOLDER_PK] PRIMARY KEY CLUSTERED 
(
	[idCollabFolder] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BACOLLABFOLDER_UK1] UNIQUE NONCLUSTERED 
(
	[idParentFolder] ASC,
	[folderName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BACOLLABFOLDER_UKG] UNIQUE NONCLUSTERED 
(
	[guidCollabFolder] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BADATATRIGGERJOB]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BADATATRIGGERJOB](
	[idJob] [int] NOT NULL,
	[createdOn] [datetime] NOT NULL,
	[guidEntity] [uniqueidentifier] NOT NULL,
	[entitySurrogateKey] [int] NOT NULL,
	[guidDataTrigger] [uniqueidentifier] NULL,
	[eventType] [smallint] NOT NULL,
	[status] [bit] NOT NULL,
	[triggerType] [smallint] NOT NULL,
	[data] [ntext] NULL,
 CONSTRAINT [BADATATRIGGERJOB_PK] PRIMARY KEY CLUSTERED 
(
	[idJob] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BADATATRIGGEREXECUTIONLOG]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BADATATRIGGEREXECUTIONLOG](
	[idJobLog] [int] NOT NULL,
	[guidEntity] [uniqueidentifier] NOT NULL,
	[entitySurrogateKey] [int] NOT NULL,
	[guidDataTrigger] [uniqueidentifier] NOT NULL,
	[guidAction] [uniqueidentifier] NOT NULL,
	[executionDate] [datetime] NULL,
	[executionResult] [bit] NOT NULL,
	[executionMessage] [nvarchar](500) NOT NULL,
	[eventType] [smallint] NOT NULL,
 CONSTRAINT [BADATATRIGGEREXECUTIONLOG_PK] PRIMARY KEY CLUSTERED 
(
	[idJobLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BACONFIGFILESCATALOG]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BACONFIGFILESCATALOG](
	[objTypeName] [varchar](256) NOT NULL,
	[fileHash] [varchar](256) NOT NULL,
 CONSTRAINT [BACONFIGFILESCATALOG_PK] PRIMARY KEY CLUSTERED 
(
	[objTypeName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BADPLYPACKAGE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BADPLYPACKAGE](
	[idDeploymentPackage] [int] IDENTITY(10000,1) NOT NULL,
	[guidDeploymentPackage] [uniqueidentifier] NOT NULL,
	[dpkName] [varchar](100) NOT NULL,
	[dpkCreationDate] [datetime] NOT NULL,
	[dpkOptions] [image] NULL,
	[dplyDeploymentPackage] [tinyint] NOT NULL,
 CONSTRAINT [BADPLYPACKAGE_PK] PRIMARY KEY CLUSTERED 
(
	[idDeploymentPackage] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BADPLYPACKAGE_UK1] UNIQUE NONCLUSTERED 
(
	[dpkName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BADPLYPACKAGE_UK2] UNIQUE NONCLUSTERED 
(
	[dpkCreationDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BADPLYPACKAGE_UKG] UNIQUE NONCLUSTERED 
(
	[guidDeploymentPackage] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BADPLYDATABLOBS]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BADPLYDATABLOBS](
	[idDplyDataBlob] [int] IDENTITY(10000,1) NOT NULL,
	[bContents] [image] NOT NULL,
 CONSTRAINT [BADPLYDATABLOBS_PK] PRIMARY KEY CLUSTERED 
(
	[idDplyDataBlob] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BADPLYCONFIG]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BADPLYCONFIG](
	[idBaDplyConfig] [int] IDENTITY(10000,1) NOT NULL,
	[baDplyConfigFile] [image] NOT NULL,
	[guidBADplyConfig] [uniqueidentifier] NOT NULL,
	[dplyBADplyConfig] [tinyint] NOT NULL,
	[dcFileVersion] [tinyint] NOT NULL,
	[dcMapType] [tinyint] NOT NULL,
 CONSTRAINT [BADPLYCONFIG_PK] PRIMARY KEY CLUSTERED 
(
	[idBaDplyConfig] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BADPLYCONFIG_UKG] UNIQUE NONCLUSTERED 
(
	[guidBADplyConfig] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BADPLENVOPTION]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BADPLENVOPTION](
	[idEnvOption] [int] NOT NULL,
	[eoName] [varchar](100) NOT NULL,
	[eoIntValue] [int] NOT NULL,
	[eoStrValue] [nvarchar](4000) NOT NULL,
	[eoDateValue] [datetime] NOT NULL,
 CONSTRAINT [BADPLENVOPTION_PK] PRIMARY KEY CLUSTERED 
(
	[idEnvOption] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BAPOOL]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAPOOL](
	[idPool] [int] IDENTITY(10000,1) NOT NULL,
	[poolName] [nvarchar](26) NOT NULL,
	[poolDisplayName] [nvarchar](40) NOT NULL,
	[poolDescription] [nvarchar](100) NULL,
	[guidPool] [uniqueidentifier] NOT NULL,
	[dplyPool] [tinyint] NOT NULL,
 CONSTRAINT [BAPOOL_PK] PRIMARY KEY CLUSTERED 
(
	[idPool] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAPOOL_UK1] UNIQUE NONCLUSTERED 
(
	[poolName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAPOOL_UK2] UNIQUE NONCLUSTERED 
(
	[poolDisplayName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAPOOL_UKG] UNIQUE NONCLUSTERED 
(
	[guidPool] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAPOLICYCHANGES]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAPOLICYCHANGES](
	[idBAPolicyChanges] [int] IDENTITY(1,1) NOT NULL,
	[changeType] [int] NOT NULL,
	[idUser] [int] NOT NULL,
	[changeDate] [datetime] NOT NULL,
	[xmlCodeBefore] [image] NOT NULL,
	[xmlCodeAfter] [image] NOT NULL,
	[idBAPolicyRule] [int] NULL,
	[idBADecisionTable] [int] NULL,
	[idBAPolicy] [int] NULL,
	[idBAPolicyVersion] [int] NULL,
	[idBADefinition] [int] NULL,
 CONSTRAINT [BAPOLICYCHANGES_PK] PRIMARY KEY CLUSTERED 
(
	[idBAPolicyChanges] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAPLANTEMPLATE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAPLANTEMPLATE](
	[idPlanTemplate] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](100) NULL,
	[objectPlan] [ntext] NULL,
	[idTask] [uniqueidentifier] NULL,
	[isContextualized] [bit] NOT NULL,
	[description] [nvarchar](1000) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAOVERRIDETAGVALUE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BAOVERRIDETAGVALUE](
	[rootObject] [uniqueidentifier] NULL,
	[tagType] [uniqueidentifier] NOT NULL,
	[tagName] [varchar](50) NOT NULL,
	[taggedObject] [uniqueidentifier] NOT NULL,
	[value] [nvarchar](4000) NULL,
	[deleted] [bit] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE CLUSTERED INDEX [BAOVERRIDETAGVALUE_CIDX] ON [dbo].[BAOVERRIDETAGVALUE] 
(
	[rootObject] ASC,
	[taggedObject] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAOVERRIDETAGVALUE_IDX] ON [dbo].[BAOVERRIDETAGVALUE] 
(
	[taggedObject] ASC,
	[deleted] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAOVERRIDETAGVALUE_IDX2] ON [dbo].[BAOVERRIDETAGVALUE] 
(
	[taggedObject] ASC,
	[tagType] ASC
)
INCLUDE ( [value],
[deleted]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAOVERRIDEREFERENCE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAOVERRIDEREFERENCE](
	[rootObject] [uniqueidentifier] NULL,
	[guidPointer] [uniqueidentifier] NULL,
	[guidObjectRef] [uniqueidentifier] NULL,
	[guidObjectTarget] [uniqueidentifier] NOT NULL,
	[deleted] [bit] NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [BAOVERRIDEREFERENCE_CIDX] ON [dbo].[BAOVERRIDEREFERENCE] 
(
	[rootObject] ASC,
	[guidObjectRef] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAOVERRIDEREFERENCE_IDX] ON [dbo].[BAOVERRIDEREFERENCE] 
(
	[guidPointer] ASC,
	[guidObjectRef] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAOVERRIDEREFERENCE_IDX2] ON [dbo].[BAOVERRIDEREFERENCE] 
(
	[guidObjectTarget] ASC
)
INCLUDE ( [guidObjectRef]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAOVERRIDE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BAOVERRIDE](
	[guidObject] [uniqueidentifier] NULL,
	[guidObjectParent] [uniqueidentifier] NULL,
	[objName] [varchar](256) NOT NULL,
	[objContent] [varbinary](max) NULL,
	[objType] [int] NOT NULL,
	[objTypeName] [varchar](50) NULL,
	[deployOnParent] [bit] NOT NULL,
	[modifiedDate] [datetime] NULL,
	[modifiedByUser] [varchar](100) NULL,
	[mtdVersion] [int] NULL,
	[rootObject] [uniqueidentifier] NULL,
	[changeSetId] [int] NULL,
	[objContentResolved] [varbinary](max) NULL,
	[deleted] [bit] NULL,
	[contentFormat] [tinyint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE CLUSTERED INDEX [BAOVERRIDE_CIDX] ON [dbo].[BAOVERRIDE] 
(
	[rootObject] ASC,
	[guidObject] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAOVERRIDE_IDX2] ON [dbo].[BAOVERRIDE] 
(
	[rootObject] ASC,
	[changeSetId] ASC
)
INCLUDE ( [guidObject],
[guidObjectParent],
[objName],
[objType],
[objTypeName],
[deleted]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAOVERRIDE_IDX3] ON [dbo].[BAOVERRIDE] 
(
	[guidObject] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAOVERRIDE_IDX4] ON [dbo].[BAOVERRIDE] 
(
	[objType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAOAUTHTOKEN]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAOAUTHTOKEN](
	[idOAuthToken] [int] IDENTITY(1,1) NOT NULL,
	[assertionId] [nvarchar](250) NULL,
	[accessToken] [nvarchar](250) NOT NULL,
	[refreshToken] [nvarchar](250) NULL,
	[grantType] [nvarchar](250) NULL,
	[clientId] [nvarchar](512) NULL,
	[redirectUri] [nvarchar](512) NULL,
	[tokenType] [nvarchar](50) NULL,
	[scope] [nvarchar](512) NULL,
	[state] [nvarchar](512) NULL,
	[expirationTime] [bigint] NOT NULL,
	[creationTime] [bigint] NOT NULL,
 CONSTRAINT [BAOAUTHTOKEN_PK] PRIMARY KEY CLUSTERED 
(
	[idOAuthToken] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAOAUTHTOKEN_X1] ON [dbo].[BAOAUTHTOKEN] 
(
	[assertionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAOAUTHTOKEN_X2] ON [dbo].[BAOAUTHTOKEN] 
(
	[accessToken] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAOAUTHAUTHORIZATIONCODE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAOAUTHAUTHORIZATIONCODE](
	[idOAuthAuthorizationCode] [int] IDENTITY(1,1) NOT NULL,
	[assertionId] [nvarchar](250) NULL,
	[authorizationCode] [nvarchar](250) NOT NULL,
	[responseType] [nvarchar](50) NULL,
	[clientId] [nvarchar](512) NULL,
	[redirectUri] [nvarchar](512) NULL,
	[scope] [nvarchar](512) NULL,
	[state] [nvarchar](512) NULL,
	[expirationTime] [bigint] NOT NULL,
	[creationTime] [bigint] NOT NULL,
 CONSTRAINT [BAOAUTHAUTHORIZATIONCODE_PK] PRIMARY KEY CLUSTERED 
(
	[idOAuthAuthorizationCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAOAUTHAUTHORIZATIONCODE_X1] ON [dbo].[BAOAUTHAUTHORIZATIONCODE] 
(
	[assertionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAOAUTHAUTHORIZATIONCODE_X2] ON [dbo].[BAOAUTHAUTHORIZATIONCODE] 
(
	[authorizationCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAOFFLINECHANGESET]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAOFFLINECHANGESET](
	[idBaOfflineChangeSet] [int] IDENTITY(1,1) NOT NULL,
	[changeSetType] [int] NULL,
	[changeSet] [int] NULL,
	[idUser] [int] NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [BAOFFLINECHANGESET_PK] PRIMARY KEY CLUSTERED 
(
	[idBaOfflineChangeSet] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAUNICODEEXCEPTION]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BAUNICODEEXCEPTION](
	[idUnicodeException] [int] NOT NULL,
	[tableName] [varchar](100) NOT NULL,
	[columnName] [varchar](100) NOT NULL,
	[fixedDataType] [varchar](50) NOT NULL,
 CONSTRAINT [BAUNICODEEXCEPTION_PK] PRIMARY KEY CLUSTERED 
(
	[idUnicodeException] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAUNICODEEXCEPTION_UK1] UNIQUE NONCLUSTERED 
(
	[tableName] ASC,
	[columnName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BATRANSITIONPLAN]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BATRANSITIONPLAN](
	[guidTransitionPlan] [uniqueidentifier] NOT NULL,
	[guidActivityFrom] [uniqueidentifier] NOT NULL,
	[guidActivityTo] [uniqueidentifier] NOT NULL,
	[guidPlan] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BATRACE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BATRACE](
	[idBATrace] [int] IDENTITY(10000,1) NOT NULL,
	[BaTraceFile] [image] NULL,
 CONSTRAINT [BaTrace_PK] PRIMARY KEY CLUSTERED 
(
	[idBATrace] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BATIMEZONE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BATIMEZONE](
	[idBATimeZone] [int] IDENTITY(10000,1) NOT NULL,
	[tzName] [nvarchar](50) NOT NULL,
	[tzDisplayName] [nvarchar](100) NOT NULL,
	[guidBATimeZone] [uniqueidentifier] NOT NULL,
	[dplyBATimeZone] [tinyint] NOT NULL,
	[finalEnt] [int] NOT NULL,
 CONSTRAINT [BATIMEZONE_PK] PRIMARY KEY CLUSTERED 
(
	[idBATimeZone] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BATIMEZONE_UKG] UNIQUE NONCLUSTERED 
(
	[guidBATimeZone] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BATESTWFCASE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BATESTWFCASE](
	[idBaTestWfCase] [int] IDENTITY(1,1) NOT NULL,
	[idCase] [int] NOT NULL,
	[idTestCase] [int] NOT NULL,
 CONSTRAINT [BATESTWFCASE_PK] PRIMARY KEY CLUSTERED 
(
	[idBaTestWfCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BATESTWFCASE_UK1] UNIQUE NONCLUSTERED 
(
	[idCase] ASC,
	[idTestCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BATESTASSERTIONTYPE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BATESTASSERTIONTYPE](
	[idTestAssertionType] [tinyint] NOT NULL,
	[testAssertionType] [nvarchar](26) NOT NULL,
 CONSTRAINT [BATESTASSERTIONTYPE_PK] PRIMARY KEY CLUSTERED 
(
	[idTestAssertionType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BATAGVALUE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BATAGVALUE](
	[rootObject] [uniqueidentifier] NULL,
	[tagType] [uniqueidentifier] NOT NULL,
	[tagName] [varchar](50) NOT NULL,
	[taggedObject] [uniqueidentifier] NOT NULL,
	[value] [nvarchar](4000) NULL,
	[deleted] [bit] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE CLUSTERED INDEX [BATAGVALUE_CIDX] ON [dbo].[BATAGVALUE] 
(
	[rootObject] ASC,
	[taggedObject] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BATAGVALUE_IDX] ON [dbo].[BATAGVALUE] 
(
	[taggedObject] ASC,
	[deleted] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BATAGVALUE_IDX2] ON [dbo].[BATAGVALUE] 
(
	[taggedObject] ASC,
	[tagType] ASC
)
INCLUDE ( [value],
[deleted]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BATAGS]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BATAGS](
	[IdBATag] [int] IDENTITY(1,1) NOT NULL,
	[IdTagDefinition] [int] NULL,
	[guidTaggedObject] [uniqueidentifier] NULL,
	[TagValue] [varchar](150) NULL,
 CONSTRAINT [BATAGS_PK] PRIMARY KEY CLUSTERED 
(
	[IdBATag] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BASYSTEMTAGVALUE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BASYSTEMTAGVALUE](
	[rootObject] [uniqueidentifier] NULL,
	[tagType] [uniqueidentifier] NOT NULL,
	[tagName] [varchar](50) NOT NULL,
	[taggedObject] [uniqueidentifier] NOT NULL,
	[value] [nvarchar](4000) NULL,
	[deleted] [bit] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE CLUSTERED INDEX [BASYSTEMTAGVALUE_CIDX] ON [dbo].[BASYSTEMTAGVALUE] 
(
	[rootObject] ASC,
	[taggedObject] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BASYSTEMTAGVALUE_IDX] ON [dbo].[BASYSTEMTAGVALUE] 
(
	[taggedObject] ASC,
	[deleted] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BASYSTEMTAGVALUE_IDX2] ON [dbo].[BASYSTEMTAGVALUE] 
(
	[taggedObject] ASC,
	[tagType] ASC
)
INCLUDE ( [value],
[deleted]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BASYSTEMCATALOG]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BASYSTEMCATALOG](
	[guidObject] [uniqueidentifier] NULL,
	[guidObjectParent] [uniqueidentifier] NULL,
	[objName] [varchar](256) NOT NULL,
	[objContent] [varbinary](max) NULL,
	[objType] [int] NOT NULL,
	[objTypeName] [varchar](50) NULL,
	[deployOnParent] [bit] NOT NULL,
	[modifiedDate] [datetime] NULL,
	[modifiedByUser] [varchar](100) NULL,
	[mtdVersion] [int] NULL,
	[rootObject] [uniqueidentifier] NULL,
	[changeSetId] [int] NULL,
	[objContentResolved] [varbinary](max) NULL,
	[deleted] [bit] NULL,
	[contentFormat] [tinyint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE CLUSTERED INDEX [BASYSTEMCATALOG_CIDX] ON [dbo].[BASYSTEMCATALOG] 
(
	[rootObject] ASC,
	[guidObject] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BASYSTEMCATALOG_IDX2] ON [dbo].[BASYSTEMCATALOG] 
(
	[rootObject] ASC,
	[changeSetId] ASC
)
INCLUDE ( [guidObject],
[guidObjectParent],
[objName],
[objType],
[objTypeName],
[deleted]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BASYSTEMCATALOG_IDX3] ON [dbo].[BASYSTEMCATALOG] 
(
	[guidObject] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BASYSTEMCATALOG_IDX4] ON [dbo].[BASYSTEMCATALOG] 
(
	[objType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BASTAKEHOLDERUSER]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BASTAKEHOLDERUSER](
	[idEnt] [int] NOT NULL,
	[idStakeHolder] [int] NOT NULL,
	[idUser] [int] NOT NULL,
	[autoMapping] [bit] NOT NULL,
	[disabled] [bit] NOT NULL,
 CONSTRAINT [BASTAKEHOLDERUSER_PK] PRIMARY KEY CLUSTERED 
(
	[idEnt] ASC,
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BASTAKEHOLDERUSER_IDX] ON [dbo].[BASTAKEHOLDERUSER] 
(
	[idEnt] ASC,
	[disabled] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BASCOPELOG]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BASCOPELOG](
	[id] [bigint] NOT NULL,
	[idScope] [bigint] NULL,
	[disabled] [bit] NULL,
	[historyLog] [image] NULL,
	[version] [int] NOT NULL,
	[slOrder] [int] NULL,
 CONSTRAINT [BASCOPELOG_PK] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_BASCOPELOG_IDSCOPE] ON [dbo].[BASCOPELOG] 
(
	[idScope] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BASCOPEDEF]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BASCOPEDEF](
	[idScopeDef] [int] IDENTITY(1,1) NOT NULL,
	[sdScopeDefName] [nvarchar](40) NULL,
	[guidScopeDef] [uniqueidentifier] NOT NULL,
	[dplyScopeDef] [tinyint] NOT NULL,
 CONSTRAINT [BASCOPEDEF_PK] PRIMARY KEY CLUSTERED 
(
	[idScopeDef] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BASCOPEDEF_UKG] UNIQUE NONCLUSTERED 
(
	[guidScopeDef] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BASCOPE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BASCOPE](
	[idScope] [bigint] NOT NULL,
	[speScopeType] [tinyint] NOT NULL,
	[speContent] [image] NOT NULL,
	[idCase] [int] NULL,
	[SPESCOPEVER] [int] NOT NULL,
	[DISABLED] [bit] NOT NULL,
	[idParentScope] [bigint] NULL,
 CONSTRAINT [BASCOPE_PK] PRIMARY KEY CLUSTERED 
(
	[idScope] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BASCOPE_IX1] ON [dbo].[BASCOPE] 
(
	[idCase] ASC,
	[speScopeType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_BASCOPE_IDPARENTSCOPE] ON [dbo].[BASCOPE] 
(
	[idParentScope] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BASCHEDULELOG]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BASCHEDULELOG](
	[idSchedLog] [int] IDENTITY(1,1) NOT NULL,
	[schedExecutionDate] [datetime] NOT NULL,
	[schedExecutionResult] [bit] NOT NULL,
	[schedExecutionMessage] [nvarchar](4000) NULL,
	[guidSchedule] [uniqueidentifier] NULL,
 CONSTRAINT [BASCHEDULELOG_PK] PRIMARY KEY CLUSTERED 
(
	[idSchedLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BASCHEDULEDATA]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BASCHEDULEDATA](
	[idSchedData] [int] IDENTITY(1,1) NOT NULL,
	[schedNextRunTime] [datetime] NULL,
	[guidSchedule] [uniqueidentifier] NULL,
 CONSTRAINT [BASCHEDULEDATA_PK] PRIMARY KEY CLUSTERED 
(
	[idSchedData] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BARETURNURL]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BARETURNURL](
	[idBAReturnURL] [int] IDENTITY(1,1) NOT NULL,
	[ReturnURL] [image] NULL,
 CONSTRAINT [BARETURNURL_PK] PRIMARY KEY CLUSTERED 
(
	[idBAReturnURL] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAREPLOG]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BAREPLOG](
	[idRepLog] [int] IDENTITY(1,1) NOT NULL,
	[repExecutionDate] [datetime] NOT NULL,
	[repExecutionResult] [bit] NOT NULL,
	[repExecutionMessage] [varchar](7600) NULL,
	[guidReplication] [uniqueidentifier] NULL,
 CONSTRAINT [BAREPLOG_PK] PRIMARY KEY CLUSTERED 
(
	[idRepLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BAREPDATA]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAREPDATA](
	[idRepData] [int] IDENTITY(1,1) NOT NULL,
	[repNextRunTime] [datetime] NULL,
	[guidReplication] [uniqueidentifier] NULL,
 CONSTRAINT [BAREPDATA_PK] PRIMARY KEY CLUSTERED 
(
	[idRepData] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAUSERSACTIVITY]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAUSERSACTIVITY](
	[entryDate] [datetime] NOT NULL,
	[UserActivity] [image] NOT NULL,
 CONSTRAINT [BAUSERSACTIVITY_PK] PRIMARY KEY CLUSTERED 
(
	[entryDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAWFCASELOG]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAWFCASELOG](
	[idWfCaseLog] [int] IDENTITY(1,1) NOT NULL,
	[idCase] [int] NOT NULL,
	[radNumber] [nvarchar](40) NOT NULL,
	[wfCaseLogEntryDate] [datetime] NOT NULL,
 CONSTRAINT [BAWFCASELOG_PK] PRIMARY KEY CLUSTERED 
(
	[idWfCaseLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAWICLOSED]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAWICLOSED](
	[idWIClosed] [bigint] NOT NULL,
	[idWorkItem] [bigint] NOT NULL,
	[idParentWorkitem] [bigint] NOT NULL,
 CONSTRAINT [BAWICLOSED_PK] PRIMARY KEY CLUSTERED 
(
	[idWIClosed] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BIZAGIINFO]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BIZAGIINFO](
	[BAInfo] [varchar](20) NOT NULL,
	[BAValue] [varchar](40) NULL,
 CONSTRAINT [BIZAGIINFO_PK] PRIMARY KEY CLUSTERED 
(
	[BAInfo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedTableType [dbo].[BizagiCatalogType]    Script Date: 06/08/2017 15:53:17 ******/
CREATE TYPE [dbo].[BizagiCatalogType] AS TABLE(
	[guidObject] [uniqueidentifier] NOT NULL,
	[guidObjectParent] [uniqueidentifier] NULL,
	[objName] [varchar](256) NOT NULL,
	[objContent] [varbinary](max) NULL,
	[objType] [int] NOT NULL,
	[objTypeName] [varchar](50) NULL,
	[deployOnParent] [bit] NOT NULL,
	[modifiedDate] [datetime] NULL,
	[modifiedByUser] [varchar](100) NULL,
	[mtdVersion] [int] NULL,
	[rootObject] [uniqueidentifier] NOT NULL,
	[changeSetId] [int] NULL,
	[objContentResolved] [varbinary](max) NULL,
	[deleted] [bit] NULL,
	[contentFormat] [tinyint] NULL,
	[updateContent] [bit] NULL,
	PRIMARY KEY CLUSTERED 
(
	[rootObject] ASC,
	[guidObject] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[BAXPATHLOG]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAXPATHLOG](
	[idXPathLog] [int] IDENTITY(1,1) NOT NULL,
	[xlBeanClass] [nvarchar](100) NULL,
	[xlBeanId] [int] NULL,
	[xlXPath] [nvarchar](255) NULL,
	[xlOldValue] [text] NULL,
	[xlNewValue] [text] NULL,
	[xlEntryDate] [datetime] NULL,
	[idWorkItem] [bigint] NULL,
	[xlPBeanClass] [nvarchar](100) NULL,
	[xlPBeanId] [int] NULL,
	[xlXpTarget] [nvarchar](100) NULL,
	[xlFormData] [bit] NULL,
 CONSTRAINT [BAXPATHLOG_PK] PRIMARY KEY CLUSTERED 
(
	[idXPathLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DWEVALUATIONTYPE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DWEVALUATIONTYPE](
	[idEvaluationType] [tinyint] NOT NULL,
	[evTypeDisplayName] [nvarchar](50) NULL,
 CONSTRAINT [DWEVALUATIONTYPE_PK] PRIMARY KEY CLUSTERED 
(
	[idEvaluationType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dolzhnost]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dolzhnost](
	[idDolzhnost] [bigint] NOT NULL,
	[finalEnt] [int] NOT NULL,
	[Menedzher] [nvarchar](50) NULL,
	[Razrabotchik] [nvarchar](50) NULL,
 CONSTRAINT [Dolzhnost_PK] PRIMARY KEY CLUSTERED 
(
	[idDolzhnost] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMJOBRUNNING]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMJOBRUNNING](
	[idJobRunning] [int] IDENTITY(1,1) NOT NULL,
	[jobNextRunTime] [datetime] NOT NULL,
	[runningState] [tinyint] NOT NULL,
	[jobStartRunTime] [datetime] NULL,
	[guidJob] [uniqueidentifier] NULL,
 CONSTRAINT [CUSTOMJOBRUNNING_PK] PRIMARY KEY CLUSTERED 
(
	[idJobRunning] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CUSTOMJOBRUNNING_FK_IDX_1] ON [dbo].[CUSTOMJOBRUNNING] 
(
	[runningState] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMJOBLOG]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUSTOMJOBLOG](
	[idJobLog] [int] IDENTITY(1,1) NOT NULL,
	[jobExecutionDate] [datetime] NOT NULL,
	[jobExecutionResult] [bit] NOT NULL,
	[jobExecutionMessage] [varchar](8000) NULL,
	[guidJob] [uniqueidentifier] NULL,
 CONSTRAINT [CUSTOMJOBLOG_PK] PRIMARY KEY CLUSTERED 
(
	[idJobLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CUSTOMJOBDATA]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMJOBDATA](
	[idJobData] [int] IDENTITY(1,1) NOT NULL,
	[jobNextRunTime] [datetime] NULL,
	[guidJob] [uniqueidentifier] NULL,
 CONSTRAINT [CUSTOMJOBDATA_PK] PRIMARY KEY CLUSTERED 
(
	[idJobData] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BIZSEQUENCEVALUE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BIZSEQUENCEVALUE](
	[idSequenceValue] [int] IDENTITY(10000,1) NOT NULL,
	[sequenceCurrentValue] [int] NOT NULL,
	[guidSequence] [uniqueidentifier] NULL,
 CONSTRAINT [BIZSEQUENCEVALUE_PK] PRIMARY KEY CLUSTERED 
(
	[idSequenceValue] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_DB_DateDifference]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_DB_DateDifference] (@firstDate datetime, @secondDate datetime)
		RETURNS datetime 
	AS
	BEGIN
		return @firstDate - @secondDate
	END
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_DB_ClobToBlob]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_DB_ClobToBlob]( @contentAsString NVARCHAR(MAX) ) RETURNS VARBINARY(MAX) AS
	BEGIN
		RETURN CONVERT(VARBINARY(MAX),CONVERT(nvarchar(MAX),@contentAsString)) 
	END
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_DB_BlobToClob]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_DB_BlobToClob]( @contentAsBinary VARBINARY(MAX) ) RETURNS NVARCHAR(MAX) AS
	BEGIN
		RETURN CONVERT(NVARCHAR(MAX),CONVERT(VARBINARY(MAX),@contentAsBinary)) 
	END
GO
/****** Object:  Table [dbo].[FACTRELATIONTYPE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACTRELATIONTYPE](
	[idFactRelationType] [tinyint] NOT NULL,
	[FactRelationTypeName] [nvarchar](26) NOT NULL,
 CONSTRAINT [FACTRELATIONTYPE_PK] PRIMARY KEY CLUSTERED 
(
	[idFactRelationType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACTLOGOPTYPE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACTLOGOPTYPE](
	[idFactLogOpType] [tinyint] NOT NULL,
	[factLogOpTypeName] [nvarchar](26) NOT NULL,
 CONSTRAINT [FACTLOGOPTYPE_PK] PRIMARY KEY CLUSTERED 
(
	[idFactLogOpType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACTLOG]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACTLOG](
	[idFactLog] [bigint] IDENTITY(1,1) NOT NULL,
	[idFact] [int] NOT NULL,
	[idLeftEntityKey] [int] NOT NULL,
	[idSurrogateKey] [bigint] NOT NULL,
	[idUser] [int] NOT NULL,
	[idFactLogOpType] [tinyint] NOT NULL,
	[flEntryDate] [datetime] NULL,
 CONSTRAINT [FACTLOG_PK] PRIMARY KEY CLUSTERED 
(
	[idFactLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedTableType [dbo].[CatalogIndexedObjectsType]    Script Date: 06/08/2017 15:53:17 ******/
CREATE TYPE [dbo].[CatalogIndexedObjectsType] AS TABLE(
	[rootObject] [uniqueidentifier] NULL,
	[name] [varchar](36) NOT NULL,
	[sourceGuid] [uniqueidentifier] NOT NULL,
	[targetGuid] [uniqueidentifier] NOT NULL,
	[deleted] [bit] NULL
)
GO
/****** Object:  Table [dbo].[CASESTATELOG]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CASESTATELOG](
	[idCaseStateLog] [bigint] IDENTITY(1,1) NOT NULL,
	[idCase] [int] NOT NULL,
	[idState] [int] NOT NULL,
	[idUser] [int] NOT NULL,
	[cslEntryDate] [datetime] NOT NULL,
	[duration] [int] NULL,
 CONSTRAINT [CASESTATELOG_PK] PRIMARY KEY CLUSTERED 
(
	[idCaseStateLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CSLIDCASECLSENTRYDATE] ON [dbo].[CASESTATELOG] 
(
	[idCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CASESTATE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CASESTATE](
	[idCaseState] [int] NOT NULL,
	[csName] [nvarchar](26) NOT NULL,
 CONSTRAINT [CASESTATE_PK] PRIMARY KEY CLUSTERED 
(
	[idCaseState] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CQL_INDEXINGINSERTSTAGING]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CQL_INDEXINGINSERTSTAGING](
	[IndexName] [varchar](36) NULL,
	[sourceGuid] [uniqueidentifier] NULL,
	[targetGuid] [uniqueidentifier] NULL,
	[executionId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CQL_INDEXINGINSERTRESOLVED]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CQL_INDEXINGINSERTRESOLVED](
	[IndexName] [varchar](36) NULL,
	[sourceGuid] [uniqueidentifier] NULL,
	[targetGuid] [uniqueidentifier] NULL,
	[executionId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CQL_INDEXINGINSERTINPUT]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CQL_INDEXINGINSERTINPUT](
	[IndexName] [varchar](36) NULL,
	[sourceGuid] [uniqueidentifier] NULL,
	[targetGuid] [uniqueidentifier] NULL,
	[executionId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CQL_INDEXINGDELETESTAGING]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CQL_INDEXINGDELETESTAGING](
	[IndexName] [varchar](36) NULL,
	[sourceGuid] [uniqueidentifier] NULL,
	[targetGuid] [uniqueidentifier] NULL,
	[executionId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CQL_INDEXINGDELETERESOLVED]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CQL_INDEXINGDELETERESOLVED](
	[IndexName] [varchar](36) NULL,
	[sourceGuid] [uniqueidentifier] NULL,
	[targetGuid] [uniqueidentifier] NULL,
	[executionId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CQL_INDEXINGDELETEINPUT]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CQL_INDEXINGDELETEINPUT](
	[guidObject] [uniqueidentifier] NULL,
	[executionId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ENTITY]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ENTITY](
	[idEnt] [int] IDENTITY(10000,1) NOT NULL,
	[entName] [varchar](50) NOT NULL,
	[entDisplayName] [nvarchar](50) NULL,
	[entType] [tinyint] NOT NULL,
	[entSrc] [varchar](26) NOT NULL,
	[entSrcType] [tinyint] NOT NULL,
	[entSurrogateKey] [nvarchar](28) NULL,
	[entDisplayAttrib] [nvarchar](26) NULL,
	[guidEnt] [uniqueidentifier] NOT NULL,
	[idParentEnt] [int] NULL,
	[AllowDelete] [bit] NOT NULL,
	[entSrcCacheTimeOut] [int] NULL,
	[idSrcAssembly] [int] NULL,
	[entDescription] [nvarchar](100) NULL,
	[entAdministrable] [bit] NOT NULL,
	[entSrcSystem] [nvarchar](128) NULL,
	[entContentType] [tinyint] NOT NULL,
	[entExtSrc] [nvarchar](128) NULL,
	[entSrcGlobalTimeOut] [int] NULL,
	[entLogged] [tinyint] NOT NULL,
	[entReplicated] [bit] NOT NULL,
	[dplyEnt] [tinyint] NOT NULL,
	[entEKSrc] [nvarchar](26) NULL,
	[formsVersion] [int] NULL,
	[idAddForm] [uniqueidentifier] NULL,
	[idDisplayForm] [uniqueidentifier] NULL,
	[idEditForm] [uniqueidentifier] NULL,
	[pkName] [nvarchar](30) NULL,
	[hasIdentity] [bit] NULL,
	[guidSystem] [uniqueidentifier] NULL,
	[extend] [int] NULL,
	[guidReplication] [uniqueidentifier] NULL,
	[guidSrcClass] [uniqueidentifier] NULL,
	[guidSrcProvider] [uniqueidentifier] NULL,
 CONSTRAINT [ENTITY_PK] PRIMARY KEY CLUSTERED 
(
	[idEnt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ENTITY_UK1] UNIQUE NONCLUSTERED 
(
	[entName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ENTITY_UK2] UNIQUE NONCLUSTERED 
(
	[entDisplayName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ENTITY_UK3] UNIQUE NONCLUSTERED 
(
	[entSrc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ENTITY_UKG] UNIQUE NONCLUSTERED 
(
	[guidEnt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [ENTITY_FK_IDX_2] ON [dbo].[ENTITY] 
(
	[idSrcAssembly] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ENTITY_FK_IDX_3] ON [dbo].[ENTITY] 
(
	[idParentEnt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WFPLAN]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WFPLAN](
	[guidPlan] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](1000) NULL,
	[creationDate] [datetime] NOT NULL,
	[currentState] [int] NOT NULL,
	[parentWorkItem] [uniqueidentifier] NULL,
	[startDate] [datetime] NULL,
	[dueDate] [datetime] NULL,
	[idUserCreator] [int] NOT NULL,
	[waitForCompletion] [bit] NOT NULL,
	[contextualized] [bit] NOT NULL,
 CONSTRAINT [WFPLAN_PK] PRIMARY KEY NONCLUSTERED 
(
	[guidPlan] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WORKINGTIMESCHEMA]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WORKINGTIMESCHEMA](
	[idWorkingTimeSchema] [int] IDENTITY(10000,1) NOT NULL,
	[wtsName] [nvarchar](50) NOT NULL,
	[guidWorkingTimeSchema] [uniqueidentifier] NOT NULL,
	[dplyWorkingTimeSchema] [tinyint] NOT NULL,
	[finalEnt] [int] NOT NULL,
 CONSTRAINT [WORKINGTIMESCHEMA_PK] PRIMARY KEY CLUSTERED 
(
	[idWorkingTimeSchema] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [WORKINGTIMESCHEMA_UK1] UNIQUE NONCLUSTERED 
(
	[wtsName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [WORKINGTIMESCHEMA_UKG] UNIQUE NONCLUSTERED 
(
	[guidWorkingTimeSchema] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZhiznennyyTsiklStudenta]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZhiznennyyTsiklStudenta](
	[idZhiznennyyTsiklStudenta] [bigint] NOT NULL,
	[finalEnt] [int] NOT NULL,
	[FIO] [nvarchar](100) NULL,
	[Adres] [nvarchar](160) NULL,
	[Fakultet] [nvarchar](100) NULL,
	[Napravlenie] [nvarchar](100) NULL,
	[Uchebnayagruppa] [nvarchar](10) NULL,
	[Formaobucheniya] [nvarchar](50) NULL,
	[Telefon] [nvarchar](18) NULL,
	[Obuchaetsya] [bit] NULL,
	[Perevestis] [bit] NULL,
	[Ustraivaetvuz] [bit] NULL,
 CONSTRAINT [ZhiznennyyTsiklStudenta_PK] PRIMARY KEY CLUSTERED 
(
	[idZhiznennyyTsiklStudenta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZhiznennyyTsiklKursovogo]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZhiznennyyTsiklKursovogo](
	[idZhiznennyyTsiklKursovogo] [bigint] NOT NULL,
	[finalEnt] [int] NOT NULL,
	[Uchastniki] [bigint] NULL,
	[Opisanie] [nvarchar](150) NULL,
	[Estnedochety] [bit] NULL,
	[Fayldannykh] [tinyint] NULL,
 CONSTRAINT [ZhiznennyyTsiklKursovogo_PK] PRIMARY KEY CLUSTERED 
(
	[idZhiznennyyTsiklKursovogo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ZhiznennyyTsiklKursovogo_F1] ON [dbo].[ZhiznennyyTsiklKursovogo] 
(
	[Uchastniki] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zadacha]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zadacha](
	[idZadacha] [bigint] NOT NULL,
	[finalEnt] [int] NOT NULL,
	[Estnedochyoty] [bit] NULL,
 CONSTRAINT [Zadacha_PK] PRIMARY KEY CLUSTERED 
(
	[idZadacha] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WORKITEMSTATE]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WORKITEMSTATE](
	[idWorkItemState] [int] NOT NULL,
	[wiName] [nvarchar](26) NOT NULL,
 CONSTRAINT [WORKITEMSTATE_PK] PRIMARY KEY CLUSTERED 
(
	[idWorkItemState] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WORKITEMSTACK]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WORKITEMSTACK](
	[idWIStack] [int] IDENTITY(1,1) NOT NULL,
	[idCase] [int] NOT NULL,
	[idWorkItem] [bigint] NOT NULL,
	[wisEntryDate] [datetime] NOT NULL,
	[counter] [int] NOT NULL,
 CONSTRAINT [WORKITEMSTACK_PK] PRIMARY KEY CLUSTERED 
(
	[idWIStack] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_WISIDCASECOUNTER] ON [dbo].[WORKITEMSTACK] 
(
	[idCase] ASC,
	[counter] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WORKITEMCL]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WORKITEMCL](
	[idWorkItem] [bigint] NOT NULL,
	[idCase] [int] NOT NULL,
	[idTask] [int] NULL,
	[idWorkItemState] [int] NOT NULL,
	[wiEntryDate] [datetime] NOT NULL,
	[wiDuration] [int] NOT NULL,
	[wiEstimatedSolutionDate] [datetime] NULL,
	[idParentWorkItem] [bigint] NULL,
	[wiSolutionDate] [datetime] NOT NULL,
	[wiSubProcMICurrCount] [int] NULL,
	[wiSubProcMICountToWaitFor] [int] NULL,
	[idDeferredByWorkItem] [bigint] NULL,
	[wiExtDuration] [int] NOT NULL,
	[wiExtEstimatedSolutionDate] [datetime] NULL,
	[wiClosed] [tinyint] NULL,
	[idWorkItemScope] [bigint] NULL,
	[wiMultiInstanceEnded] [bit] NULL,
	[wiParentMIId] [bigint] NULL,
	[guidWorkitem] [uniqueidentifier] NULL,
	[guidActivity] [uniqueidentifier] NULL,
 CONSTRAINT [WORKITEMCL_PK] PRIMARY KEY CLUSTERED 
(
	[idWorkItem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_WICLIDCASE] ON [dbo].[WORKITEMCL] 
(
	[idCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_WICLIDTASKIDCASE] ON [dbo].[WORKITEMCL] 
(
	[idTask] ASC,
	[idCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WICLIDCASE_IDX1] ON [dbo].[WORKITEMCL] 
(
	[idCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WORKITEMCL_FX_IDX_2] ON [dbo].[WORKITEMCL] 
(
	[guidActivity] ASC
)
WHERE ([guidActivity] IS NOT NULL)
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WISTATELOG]    Script Date: 06/08/2017 15:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WISTATELOG](
	[idWIStateLog] [bigint] IDENTITY(1,1) NOT NULL,
	[idWorkItem] [bigint] NOT NULL,
	[idState] [int] NOT NULL,
	[idUser] [int] NOT NULL,
	[wislEntryDate] [datetime] NOT NULL,
	[duration] [int] NULL,
 CONSTRAINT [WISTATELOG_PK] PRIMARY KEY CLUSTERED 
(
	[idWIStateLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WISTATELOG_IX2] ON [dbo].[WISTATELOG] 
(
	[idWorkItem] ASC,
	[idState] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwBA_Sync_AttribDescColumns]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwBA_Sync_AttribDescColumns]
	AS
	SELECT     TABLE_NAME, COLUMN_NAME, DATA_TYPE, NUMERIC_PRECISION, NUMERIC_SCALE
	FROM         INFORMATION_SCHEMA.COLUMNS
GO
/****** Object:  View [dbo].[vwBA_Sync_AllUKeys]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwBA_Sync_AllUKeys]
	AS
		select
			TABLE_CATALOG = cntr.TABLE_CATALOG,
			TABLE_SCHEMA = cntr.TABLE_SCHEMA,
			TABLE_NAME = cntr.TABLE_NAME,
			CONSTRAINT_NAME = cntr.CONSTRAINT_NAME
		from information_schema.table_constraints cntr
		where cntr.constraint_type = 'UNIQUE'
GO
/****** Object:  View [dbo].[vwBA_Sync_AllUKeyCols]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwBA_Sync_AllUKeyCols]
	AS
		select
			TABLE_CATALOG = cntr.TABLE_CATALOG,
			TABLE_SCHEMA = cntr.TABLE_SCHEMA,
			TABLE_NAME = cntr.TABLE_NAME,
			COLUMN_NAME = col.COLUMN_NAME,
			ORDINAL = col.ORDINAL_POSITION,
			CONSTRAINT_NAME = cntr.CONSTRAINT_NAME
		from information_schema.table_constraints cntr, information_schema.key_column_usage col
		where cntr.constraint_type = 'UNIQUE'  and  cntr.constraint_name = col.constraint_name  and
			cntr.table_catalog = col.table_catalog  and  cntr.table_schema = col.table_schema
GO
/****** Object:  View [dbo].[vwBA_Sync_AllTables]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwBA_Sync_AllTables] 
	AS 
	SELECT db_name() AS TABLE_CATALOG, user_name(o.uid) AS TABLE_SCHEMA, o.name AS TABLE_NAME
	FROM sysobjects o WHERE o.xtype = 'U' AND permissions(o.id) != 0 GROUP BY o.uid, o.name
GO
/****** Object:  View [dbo].[vwBA_Sync_AllPKeys]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwBA_Sync_AllPKeys] 
	AS 
		select
			TABLE_CATALOG = convert(sysname,db_name()),
			TABLE_SCHEMA = convert(sysname,user_name(o.uid)),
			TABLE_NAME = convert(sysname,o.name),
			COLUMN_NAME = convert(sysname,c.name),
			ORDINAL = convert (smallint,ic.keyno),
			PK_NAME = convert(sysname,i.name)
		from
			sysindexes i, syscolumns c, sysobjects o, sysindexkeys ic
		where
			o.id = c.id
			and o.id = i.id
			and (i.status & 0x800) = 0x800
			and i.indid = ic.indid  and  c.colid = ic.colid  and o.id = ic.id
GO
/****** Object:  View [dbo].[vwBA_Sync_AllIndexes]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwBA_Sync_AllIndexes] 
	AS 
	select db_name() AS TABLE_CATALOG, user_name( objectproperty( i.id, 'OwnerID' ) ) TABLE_SCHEMA, 
		i.name INDEX_NAME, object_name( i.id ) TABLE_NAME, indexproperty( i.id , i.name , 'IsUnique' ) IS_UNIQUE, 
		indexproperty( i.id , i.name , 'IsClustered' ) IS_CLUSTERED, stats_date( i.id , i.indid ) LAST_STATS_UPDATE
	from sysindexes i
	where (objectproperty( i.id, 'IsMSShipped' ) = 0)  and  (i.indid BETWEEN 1 And 250)  and  1 NOT IN ( 
		indexproperty( i.id , i.name , 'IsStatistics' ) ,
		indexproperty( i.id , i.name , 'IsAutoStatistics' ) ,
		indexproperty( i.id , i.name , 'IsHypothetical' ) )
GO
/****** Object:  View [dbo].[vwBA_Sync_AllIndexColumns]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwBA_Sync_AllIndexColumns] 
	AS 
	select db_name() AS TABLE_CATALOG, user_name( objectproperty( i.id, 'OwnerID' ) ) TABLE_SCHEMA, 
		i.name INDEX_NAME, object_name( i.id ) TABLE_NAME, c.name COLUMN_NAME, 
		ik.keyno ORDINAL_POSITION, 
		case indexkey_property( i.id, i.indid, ik.keyno, 'IsDescending' ) when 1 then 'DESC' when 0 then 'ASC' else null end ORDER_TYPE
	from sysindexes i, sysindexkeys ik, syscolumns c
	where (ik.id = i.id)  and  (ik.indid = i.indid)	and  (c.id = ik.id)  and  (c.colid = ik.colid)  and  
		(objectproperty( i.id, 'IsMSShipped' ) = 0)  and  (i.indid BETWEEN 1 And 250)  and  1 NOT IN ( 
		indexproperty( i.id , i.name , 'IsStatistics' ) ,
		indexproperty( i.id , i.name , 'IsAutoStatistics' ) ,
		indexproperty( i.id , i.name , 'IsHypothetical' ) )
GO
/****** Object:  View [dbo].[vwBA_Sync_AllIdentities]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwBA_Sync_AllIdentities] 
	AS 
	select db_name() AS TABLE_CATALOG, user_name(o.uid) AS TABLE_SCHEMA, o.name TABLE_NAME, 
		c.name COLUMN_NAME, ident_seed( o.name ) IDENTITY_SEED, ident_incr( o.name ) IDENTITY_INCR
	from syscolumns c, sysobjects o
	where c.id = o.id  and  (c.colstat & 1 = 1)  and  o.xtype = 'U'
GO
/****** Object:  Table [dbo].[WFACCESSTYPE]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WFACCESSTYPE](
	[idwfAccessType] [tinyint] NOT NULL,
	[wfAccessTypeName] [nvarchar](20) NOT NULL,
 CONSTRAINT [WFACCESSTYPE_PK] PRIMARY KEY CLUSTERED 
(
	[idwfAccessType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WEEKDAY]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WEEKDAY](
	[idWeekDay] [tinyint] NOT NULL,
	[WeekDayName] [nvarchar](26) NOT NULL,
 CONSTRAINT [WEEKDAY_PK] PRIMARY KEY CLUSTERED 
(
	[idWeekDay] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WFCASEUSER]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WFCASEUSER](
	[idCase] [int] NOT NULL,
	[idUser] [int] NOT NULL,
 CONSTRAINT [WFCASEUSER_PK] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC,
	[idCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WFCASECL]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WFCASECL](
	[idCase] [int] NOT NULL,
	[casCreationDate] [datetime] NOT NULL,
	[casSolutionDate] [datetime] NOT NULL,
	[casEstimatedSolutionDate] [datetime] NOT NULL,
	[priority] [tinyint] NULL,
	[severity] [tinyint] NULL,
	[idWorkflow] [int] NULL,
	[idCreatorUser] [int] NULL,
	[idCaseManager] [int] NULL,
	[idCaseState] [int] NOT NULL,
	[idParentCase] [int] NULL,
	[idParentTask] [int] NULL,
	[idSubProcType] [int] NULL,
	[radNumber] [nvarchar](20) NULL,
	[idParentWorkItem] [bigint] NULL,
	[casExtEstimatedSolutionDate] [datetime] NULL,
	[idCasePath] [int] NULL,
	[ancestorPath] [varchar](50) NULL,
	[CaseClosed] [tinyint] NULL,
	[amount] [money] NOT NULL,
	[idOrg] [int] NULL,
	[duration] [int] NULL,
	[idCaseAccess] [int] NULL,
	[CaseGUID] [uniqueidentifier] NULL,
	[hasCaseNumber] [bit] NULL,
	[caseArchived] [bit] NOT NULL,
	[guidPlan] [uniqueidentifier] NULL,
 CONSTRAINT [WFCASECL_PK] PRIMARY KEY CLUSTERED 
(
	[idCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [WFCASECL_ARCHIVING_IDX1] ON [dbo].[WFCASECL] 
(
	[casSolutionDate] ASC,
	[CaseClosed] ASC,
	[caseArchived] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WFCASECL_CASCREATIONDATE_IDX] ON [dbo].[WFCASECL] 
(
	[casCreationDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WFCASECL_FX_IDX_8] ON [dbo].[WFCASECL] 
(
	[guidPlan] ASC
)
WHERE ([guidPlan] IS NOT NULL)
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WFCASECL_IDPARENTCASE_IDX] ON [dbo].[WFCASECL] 
(
	[idParentCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WFCASECL_IDWORKFLOW_IDX] ON [dbo].[WFCASECL] 
(
	[idWorkflow] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WFCASECL_IX_GUID] ON [dbo].[WFCASECL] 
(
	[CaseGUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WFCASECL_RADNUMBER_IDX] ON [dbo].[WFCASECL] 
(
	[radNumber] ASC,
	[hasCaseNumber] ASC,
	[idCaseState] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WFCASEABORTREASON]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WFCASEABORTREASON](
	[idCase] [int] NOT NULL,
	[abortReason] [nvarchar](1000) NOT NULL,
 CONSTRAINT [WFCASEABORTREASON_PK] PRIMARY KEY CLUSTERED 
(
	[idCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwBA_Sync_AllCheckConstraints]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwBA_Sync_AllCheckConstraints]
		AS
			SELECT db_name() AS TABLE_CATALOG, user_name(so.uid) AS TABLE_SCHEMA,  NAME AS TABLE_NAME, CHECKCONSTRAINTNAME AS CHECK_CONSTRAINT_NAME
			FROM sysobjects so,
			(SELECT  cc.name as checkconstraintname, definition, parent_object_id FROM sys.check_constraints cc , sysobjects o WHERE o.id = cc.object_id) cc_subquery
			WHERE cc_subquery.parent_object_id = so.id
GO
/****** Object:  View [dbo].[vwBA_Dict_FKeysWithPKey]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwBA_Dict_FKeysWithPKey] 
	AS
	SELECT schema_name(pkcons.schema_id) PK_TABLE_SCHEMA, object_name(pkcons.parent_object_id) PK_TABLE_NAME, 
		schema_name(fkcons.schema_id) FK_TABLE_SCHEMA, object_name(fkcons.parent_object_id) FK_TABLE_NAME, 
		pkcons.name PK_NAME, fkcons.name FK_NAME
	FROM sys.foreign_keys fkcons
		inner join sys.key_constraints pkcons on 
			fkcons.referenced_object_id = pkcons.parent_object_id and 
			fkcons.key_index_id = pkcons.unique_index_id
GO
/****** Object:  View [dbo].[vwBA_Dict_FKeys]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwBA_Dict_FKeys] 
	AS
	SELECT schema_name(fkcons.schema_id) FK_TABLE_SCHEMA, object_name(fkcons.parent_object_id) FK_TABLE_NAME, 
		fkcons.name FK_NAME
	FROM sys.foreign_keys fkcons
GO
/****** Object:  UserDefinedTableType [dbo].[TagValueType]    Script Date: 06/08/2017 15:53:20 ******/
CREATE TYPE [dbo].[TagValueType] AS TABLE(
	[rootObject] [uniqueidentifier] NULL,
	[tagType] [uniqueidentifier] NOT NULL,
	[tagName] [varchar](50) NOT NULL,
	[taggedObject] [uniqueidentifier] NOT NULL,
	[value] [varchar](4000) NOT NULL,
	[deleted] [bit] NULL
)
GO
/****** Object:  Table [dbo].[SUBPROCTYPE]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUBPROCTYPE](
	[idSubProcType] [int] NOT NULL,
	[sptName] [nvarchar](26) NOT NULL,
 CONSTRAINT [SUBPROCTYPE_PK] PRIMARY KEY CLUSTERED 
(
	[idSubProcType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUBPROCMULTIINSTCOUNT]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUBPROCMULTIINSTCOUNT](
	[idCase] [int] NOT NULL,
	[idTask] [int] NOT NULL,
	[idKey] [bigint] NOT NULL,
	[spCreated] [bit] NULL,
	[spOrder] [int] NULL,
 CONSTRAINT [SUBPROCMULTIINSTCOUNT_PK] PRIMARY KEY CLUSTERED 
(
	[idCase] ASC,
	[idTask] ASC,
	[idKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUBPROCMAPPINGTYPE]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUBPROCMAPPINGTYPE](
	[idSubProcMappingType] [int] NOT NULL,
	[spmtName] [nvarchar](26) NOT NULL,
 CONSTRAINT [SUBPROCMAPPINGTYPE_PK] PRIMARY KEY CLUSTERED 
(
	[idSubProcMappingType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SPLITEXITCOUNTER]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPLITEXITCOUNTER](
	[idWorkItem] [bigint] NOT NULL,
	[exitCount] [int] NOT NULL,
 CONSTRAINT [SPLITEXITCOUNTER_PK] PRIMARY KEY CLUSTERED 
(
	[idWorkItem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TASKTYPE]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TASKTYPE](
	[idTaskType] [int] NOT NULL,
	[tskTpName] [nvarchar](26) NOT NULL,
 CONSTRAINT [TASKTYPE_PK] PRIMARY KEY CLUSTERED 
(
	[idTaskType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TASKSUBTYPE]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TASKSUBTYPE](
	[idTaskSubType] [int] NOT NULL,
	[tstName] [nvarchar](26) NOT NULL,
 CONSTRAINT [TASKSUBTYPE_PK] PRIMARY KEY CLUSTERED 
(
	[idTaskSubType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uchastniki]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uchastniki](
	[idUchastniki] [bigint] NOT NULL,
	[finalEnt] [int] NOT NULL,
	[FIO] [nvarchar](50) NULL,
	[Status] [bigint] NULL,
 CONSTRAINT [Uchastniki_PK] PRIMARY KEY CLUSTERED 
(
	[idUchastniki] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Uchastniki_F1] ON [dbo].[Uchastniki] 
(
	[Status] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRANSITIONTYPE]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRANSITIONTYPE](
	[idTransitionType] [tinyint] NOT NULL,
	[transitionTypeName] [nvarchar](26) NOT NULL,
 CONSTRAINT [TRANSITIONTYPE_PK] PRIMARY KEY CLUSTERED 
(
	[idTransitionType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRANSITIONLOG]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRANSITIONLOG](
	[idTransitionLog] [bigint] IDENTITY(1,1) NOT NULL,
	[idCase] [int] NOT NULL,
	[idTransition] [int] NOT NULL,
	[idUser] [int] NOT NULL,
	[tlEntryDate] [datetime] NOT NULL,
	[idWorkItemFrom] [bigint] NULL,
	[idWorkItemTo] [bigint] NULL,
	[idTransitionType] [tinyint] NULL,
 CONSTRAINT [TRANSITIONLOG_PK] PRIMARY KEY CLUSTERED 
(
	[idTransitionLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TRANSITIONLOG_IDX1] ON [dbo].[TRANSITIONLOG] 
(
	[idWorkItemFrom] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TRANSITIONLOG_IX1] ON [dbo].[TRANSITIONLOG] 
(
	[idCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TRANSITIONLOG_IX2] ON [dbo].[TRANSITIONLOG] 
(
	[idWorkItemTo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERSTARTPAGE]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USERSTARTPAGE](
	[idStartPage] [int] IDENTITY(10000,1) NOT NULL,
	[startPageValue] [varchar](30) NOT NULL,
	[guidUserStartPage] [uniqueidentifier] NOT NULL,
	[finalEnt] [int] NULL,
 CONSTRAINT [USERSTARTPAGE_PK] PRIMARY KEY CLUSTERED 
(
	[idStartPage] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USERFIELD]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USERFIELD](
	[idUserField] [int] IDENTITY(10000,1) NOT NULL,
	[userFieldName] [nvarchar](25) NULL,
	[userFieldDescription] [nvarchar](200) NULL,
	[userFieldCode] [varchar](7600) NULL,
	[guidUserField] [uniqueidentifier] NOT NULL,
	[idContextEnt] [int] NULL,
	[dplyUserField] [tinyint] NOT NULL,
	[userFieldCodeJson] [nvarchar](4000) NULL,
 CONSTRAINT [USERFIELD_PK] PRIMARY KEY CLUSTERED 
(
	[idUserField] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [USERFIELD_UK1] UNIQUE NONCLUSTERED 
(
	[userFieldName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [USERFIELD_UKG] UNIQUE NONCLUSTERED 
(
	[guidUserField] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [USERFIELD_FK_IDX_1] ON [dbo].[USERFIELD] 
(
	[idContextEnt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spBA_WFE_addtoworkitemstatelog]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_WFE_addtoworkitemstatelog]
		(
			@idWorkItem BIGINT, 
			@idState INT, 
			@idUser INT, 
			@duration INT
		)
		AS
		BEGIN
			INSERT INTO WISTATELOG
				(idWorkItem, idState, idUser, duration)
			VALUES
				(@idWorkItem, @idState, @idUser, @duration)
		END
GO
/****** Object:  StoredProcedure [dbo].[spBA_WFE_add_to_transitionlog]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_WFE_add_to_transitionlog]
	(
		@idCase INT,
		@idTransition BIGINT,
		@idUser INT,
		@idWorkItemFrom BIGINT,
		@idWorkItemTo BIGINT,
		@idTransitionType INT
	)
	AS
	BEGIN
		INSERT INTO TRANSITIONLOG
			(idCase, idTransition, idUser, idWorkItemFrom, idWorkItemTo, idTransitionType)
		VALUES
			(@idCase, @idTransition, @idUser, @idWorkItemFrom, @idWorkItemTo, @idTransitionType)
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_WFE_add_to_reassignlog]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_WFE_add_to_reassignlog]
	(
		@idWorkItem BIGINT, 
		@idOldUser INT,
		@idNewUser INT,
		@idAdmonUser INT,
		@idWorkflow INT,
		@idCase INT,
		@idTask INT
	)
	AS
	BEGIN
			INSERT INTO REASSIGNLOG(idWorkflow, idCase, idTask, idWorkItem, idOldUser, idNewUser, idAdmonUser) 
				VALUES (@idWorkflow, @idCase, @idTask, @idWorkItem, @idOldUser, @idNewUser, @idAdmonUser)
	END;
GO
/****** Object:  StoredProcedure [dbo].[spBA_WFE_add_to_factlog]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_WFE_add_to_factlog]
				(
					@idFact INT, 
					@idSurrogateKey BIGINT, 
					@idUser INT, 
					@idFactLogOpType TINYINT,
					@idLeftEntityKey INT,
					@RetVal BIGINT OUTPUT
				)
				AS
				BEGIN
					INSERT INTO FACTLOG 
						(idFact, idSurrogateKey,  idUser, idFactLogOpType, idLeftEntityKey)
					VALUES 
						(@idFact, @idSurrogateKey, @idUser, @idFactLogOpType, @idLeftEntityKey)

				SELECT @RetVal = @@IDENTITY
				END
GO
/****** Object:  StoredProcedure [dbo].[spBA_WFE_add_to_assignationlog]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_WFE_add_to_assignationlog]
	(
		@idWorkflow INT,
		@idCase INT,
		@idTask INT,
		@idWorkItem BIGINT,
		@idUser INT,
		@idAssignationLogType INT = 1
	)
	AS
	BEGIN
		INSERT INTO ASSIGNATIONLOG
			(idWorkflow, idCase, idTask, idWorkItem, idUser, idAssignationLogType)
		VALUES
			(@idWorkflow, @idCase, @idTask, @idWorkItem, @idUser, @idAssignationLogType)
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_WFE_add_to_assiglog_mu]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_WFE_add_to_assiglog_mu]
	(
		@idWorkflow INT, 
		@idCase INT, 
		@idTask INT, 
		@idWorkItem BIGINT, 
		@idUsersClause varchar(1000),
		@idAssignationLogType INT = 1
	)
	AS
	BEGIN
		DECLARE @Buffer varchar(1000)
		DECLARE @FieldNVI INTEGER
		DECLARE @FieldNI INTEGER
		DECLARE @FieldNV INTEGER

		SET NOCOUNT ON

		SET @Buffer = RTRIM(LTRIM(@idUsersClause))
		SET @FieldNVI = 0

		WHILE 1=1
		BEGIN
			-- Exit condition
			IF LEN(@Buffer) <= 0
				BREAK

			-- Extract user
			SET @FieldNVI = CHARINDEX(',', @Buffer, 0)
			IF @FieldNVI = 0
				SET @FieldNVI = LEN(@Buffer)+1

			SET @FieldNV = CAST(SUBSTRING(@Buffer, 1, @FieldNVI-1) AS INT)
			SET @Buffer = LTRIM(SUBSTRING(@Buffer, @FieldNVI+1, LEN(@Buffer)))

			-- Insert into LOG table
			INSERT INTO ASSIGNATIONLOG (idWorkflow, idCase, idTask, idWorkItem, idUser, idAssignationLogType)
				VALUES (@idWorkflow, @idCase, @idTask, @idWorkItem, @FieldNV, @idAssignationLogType)
		END	
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_WFE_add_to_casestatelog]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_WFE_add_to_casestatelog]
				(
					@idCase INT, 
					@idState INT, 
					@idUser INT, 
					@duration INT
				)
				AS
				BEGIN
					INSERT INTO CASESTATELOG
						(idCase, idState, idUser, duration)
					VALUES
						(@idCase, @idState, @idUser, @duration)
				END
GO
/****** Object:  View [dbo].[vwBA_Catalog_BATAGVALUE]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwBA_Catalog_BATAGVALUE] 
		AS
    SELECT NEWID() as id, tagType, taggedObject, value, deleted, '1' as 'IsOverride', '0' as 'IsSystem'
		  FROM BAOVERRIDETAGVALUE
      
		  UNION ALL
      
    SELECT NEWID() as id, BATAGVALUE.tagType, BATAGVALUE.taggedObject, BATAGVALUE.value, BATAGVALUE.deleted, '0' as 'IsOverride', '0' as 'IsSystem'
		  FROM BATAGVALUE
		  LEFT JOIN BAOVERRIDETAGVALUE ON BAOVERRIDETAGVALUE.taggedObject = BATAGVALUE.taggedObject
		  WHERE BAOVERRIDETAGVALUE.taggedObject IS NULL
      
		  UNION ALL
      
    SELECT NEWID() as id, BASYSTEMTAGVALUE.tagType, BASYSTEMTAGVALUE.taggedObject, BASYSTEMTAGVALUE.value, BASYSTEMTAGVALUE.deleted, '0' as 'IsOverride', '1' as 'IsSystem'
		  FROM BASYSTEMTAGVALUE
		  LEFT JOIN BAOVERRIDETAGVALUE ON BAOVERRIDETAGVALUE.taggedObject = BASYSTEMTAGVALUE.taggedObject
		  LEFT JOIN BATAGVALUE ON BATAGVALUE.taggedObject = BASYSTEMTAGVALUE.taggedObject
		  WHERE BAOVERRIDETAGVALUE.taggedObject IS NULL AND BATAGVALUE.taggedObject IS NULL
GO
/****** Object:  View [dbo].[vwBA_Catalog_BAREFERENCE]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwBA_Catalog_BAREFERENCE] 
AS
SELECT guidPointer, guidObjectRef, guidObjectTarget, '1' as 'IsOverride'
FROM BAOVERRIDEREFERENCE
UNION ALL
SELECT BACATALOGREFERENCE.guidPointer, BACATALOGREFERENCE.guidObjectRef, BACATALOGREFERENCE.guidObjectTarget, '0' as 'IsOverride'
FROM BACATALOGREFERENCE
LEFT JOIN BAOVERRIDEREFERENCE ON BAOVERRIDEREFERENCE.guidObjectRef = BACATALOGREFERENCE.guidObjectRef
WHERE BAOVERRIDEREFERENCE.guidObjectRef IS NULL
GO
/****** Object:  View [dbo].[vwBA_Catalog_BABIZAGICATALOG]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwBA_Catalog_BABIZAGICATALOG]
	AS
  SELECT guidObject, guidObjectParent, objName, objContent, objType, objTypeName, deployOnParent, modifiedDate, modifiedByUser, mtdVersion,
	  rootObject, changeSetId, objContentResolved, deleted, contentFormat, '1' as 'IsOverride', '0' as 'IsSystem', mtdState
	  FROM BAOVERRIDE LEFT JOIN BAMETADATASTATE ON (guidObject = objectId)
    
	  UNION ALL
    
  SELECT BABIZAGICATALOG.guidObject, BABIZAGICATALOG.guidObjectParent, BABIZAGICATALOG.objName, BABIZAGICATALOG.objContent, BABIZAGICATALOG.objType, 
    BABIZAGICATALOG.objTypeName, BABIZAGICATALOG.deployOnParent, BABIZAGICATALOG.modifiedDate, BABIZAGICATALOG.modifiedByUser, BABIZAGICATALOG.mtdVersion,
	  BABIZAGICATALOG.rootObject, BABIZAGICATALOG.changeSetId, BABIZAGICATALOG.objContentResolved, BABIZAGICATALOG.deleted, 
    BABIZAGICATALOG.contentFormat, '0' as 'IsOverride', '0' as 'IsSystem', BAMETADATASTATE.mtdState
	  FROM BABIZAGICATALOG LEFT JOIN BAMETADATASTATE ON (BABIZAGICATALOG.guidObject = objectId)
	  LEFT JOIN BAOVERRIDE ON BAOVERRIDE.guidObject = BABIZAGICATALOG.guidObject
    WHERE BAOVERRIDE.guidObject IS NULL
    
	  UNION ALL
    
  SELECT BASYSTEMCATALOG.guidObject, BASYSTEMCATALOG.guidObjectParent, BASYSTEMCATALOG.objName, BASYSTEMCATALOG.objContent, BASYSTEMCATALOG.objType, 
    BASYSTEMCATALOG.objTypeName, BASYSTEMCATALOG.deployOnParent, BASYSTEMCATALOG.modifiedDate, BASYSTEMCATALOG.modifiedByUser, BASYSTEMCATALOG.mtdVersion,
	  BASYSTEMCATALOG.rootObject, BASYSTEMCATALOG.changeSetId, BASYSTEMCATALOG.objContentResolved, BASYSTEMCATALOG.deleted, 
    BASYSTEMCATALOG.contentFormat, '0' as 'IsOverride', '1' as 'IsSystem', BAMETADATASTATE.mtdState
	  FROM BASYSTEMCATALOG LEFT JOIN BAMETADATASTATE ON (BASYSTEMCATALOG.guidObject = objectId)
	  LEFT JOIN BABIZAGICATALOG ON BABIZAGICATALOG.guidObject = BASYSTEMCATALOG.guidObject
    LEFT JOIN BAOVERRIDE ON BAOVERRIDE.guidObject = BASYSTEMCATALOG.guidObject
    WHERE BABIZAGICATALOG.guidObject IS NULL AND BAOVERRIDE.guidObject IS NULL
GO
/****** Object:  View [dbo].[vwBA_Sync_AllColsWithoutIdent]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwBA_Sync_AllColsWithoutIdent]
	AS
	SELECT cols.TABLE_CATALOG, cols.TABLE_SCHEMA, cols.TABLE_NAME, cols.COLUMN_NAME,
		cols.DATA_TYPE, cols.DATA_TYPE DATA_TYPE_NAME, cols.CHARACTER_MAXIMUM_LENGTH,
		cols.NUMERIC_PRECISION, cols.NUMERIC_SCALE,
		CONVERT(BIT,CASE WHEN cols.COLUMN_DEFAULT IS NULL THEN 0 ELSE 1 END) COLUMN_HASDEFAULT,
		cols.COLUMN_DEFAULT, defs.CONSTRAINT_NAME COLUMN_DEFAULT_NAME, cols.ORDINAL_POSITION,
		CONVERT(BIT,CASE WHEN cols.IS_NULLABLE = 'YES' THEN 1 ELSE 0 END) IS_NULLABLE, cols.DATETIME_PRECISION,
		CONVERT(BIT,CASE WHEN calc.TABLE_NAME IS NULL THEN 0 ELSE 1 END) IS_COMPUTED,
		calc.FORMULA
	FROM INFORMATION_SCHEMA.COLUMNS cols LEFT OUTER JOIN [fnBA_Sync_alldefaults]() defs
	ON cols.TABLE_NAME = defs.TABLE_NAME  AND  cols.COLUMN_NAME = defs.COLUMN_NAME
	LEFT OUTER JOIN [fnBA_Sync_allComputedColumns]() calc
		ON cols.TABLE_NAME = calc.TABLE_NAME  AND  cols.COLUMN_NAME = calc.COLUMN_NAME
GO
/****** Object:  View [dbo].[vwBA_Sync_AllFKeys]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwBA_Sync_AllFKeys] 
	AS
	SELECT PKTABLE_QUALIFIER PK_TABLE_CATALOG, PKTABLE_OWNER PK_TABLE_SCHEMA, PKTABLE_NAME PK_TABLE_NAME, PKCOLUMN_NAME PK_COLUMN_NAME, 
		FKTABLE_QUALIFIER FK_TABLE_CATALOG, FKTABLE_OWNER FK_TABLE_SCHEMA, FKTABLE_NAME FK_TABLE_NAME, FKCOLUMN_NAME FK_COLUMN_NAME, 
		KEY_SEQ ORDINAL, UPDATE_RULE, DELETE_RULE, PK_NAME, FK_NAME, DEFERRABILITY 
	FROM fnBA_Sync_AllFKeys( )
GO
/****** Object:  View [dbo].[vwBA_Sync_AllDefaults]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwBA_Sync_AllDefaults] 
	AS 
	select CONSTRAINT_CATALOG TABLE_CATALOG, CONSTRAINT_SCHEMA TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, DEFAULT_CLAUSE COLUMN_DEFAULT, CONSTRAINT_NAME COLUMN_DEFAULT_NAME, ORDINAL_POSITION
	from fnBA_Sync_alldefaults( )
GO
/****** Object:  Table [dbo].[DWUSERSEMAPHORE]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DWUSERSEMAPHORE](
	[idUserSemaphore] [int] IDENTITY(1,1) NOT NULL,
	[semName] [nvarchar](50) NOT NULL,
	[idReport] [int] NOT NULL,
	[idMeasure] [int] NOT NULL,
	[idUser] [int] NOT NULL,
	[idEvaluationType] [tinyint] NOT NULL,
	[goalValue] [float] NOT NULL,
	[evThres1] [float] NOT NULL,
	[evThres2] [float] NOT NULL,
	[evThres3] [float] NULL,
	[evThres4] [float] NULL,
	[requiredContext] [text] NULL,
	[semDisplayName] [nvarchar](50) NULL,
 CONSTRAINT [DWUSERSEMAPHORE_PK] PRIMARY KEY CLUSTERED 
(
	[idUserSemaphore] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DWUSERSEMAPHORE_FK_IDX_1] ON [dbo].[DWUSERSEMAPHORE] 
(
	[idEvaluationType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DWUSERSEMAPHORE_FK_IDX_2] ON [dbo].[DWUSERSEMAPHORE] 
(
	[idMeasure] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DWUSERSEMAPHORE_FK_IDX_3] ON [dbo].[DWUSERSEMAPHORE] 
(
	[idReport] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT](
	[idFact] [int] IDENTITY(10000,1) NOT NULL,
	[factName] [nvarchar](26) NOT NULL,
	[factDisplayName] [nvarchar](40) NOT NULL,
	[idFactRelationType] [tinyint] NOT NULL,
	[factSrc] [nvarchar](26) NULL,
	[idLeftEntity] [int] NOT NULL,
	[idRightEntity] [int] NOT NULL,
	[guidFact] [uniqueidentifier] NOT NULL,
	[dplyFact] [tinyint] NOT NULL,
	[factLogged] [bit] NOT NULL,
	[bidirectional] [bit] NOT NULL,
	[idParentRelation] [int] NULL,
	[factDisplayOrder] [int] NULL,
	[isVisible] [bit] NOT NULL,
	[automapped] [bit] NOT NULL,
 CONSTRAINT [FACT_PK] PRIMARY KEY CLUSTERED 
(
	[idFact] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [FACT_UK1] UNIQUE NONCLUSTERED 
(
	[idLeftEntity] ASC,
	[factName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [FACT_UK2] UNIQUE NONCLUSTERED 
(
	[idLeftEntity] ASC,
	[factDisplayName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [FACT_UKG] UNIQUE NONCLUSTERED 
(
	[guidFact] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [FACT_FK_IDX_1] ON [dbo].[FACT] 
(
	[idRightEntity] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [FACT_FK_IDX_2] ON [dbo].[FACT] 
(
	[idFactRelationType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [FACT_FK_IDX_3] ON [dbo].[FACT] 
(
	[idParentRelation] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ENTITYSCHEMA]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ENTITYSCHEMA](
	[idEntitySchema] [int] IDENTITY(10000,1) NOT NULL,
	[idEnt] [int] NULL,
	[entSchName] [nvarchar](26) NOT NULL,
	[entSchDescription] [nvarchar](100) NULL,
	[entSchXml] [image] NULL,
	[entSchDefault] [bit] NULL,
	[guidEntitySchema] [uniqueidentifier] NOT NULL,
	[dplyEntitySchema] [tinyint] NOT NULL,
 CONSTRAINT [ENTITYSCHEMA_PK] PRIMARY KEY CLUSTERED 
(
	[idEntitySchema] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ENTITYSCHEMA_UKG] UNIQUE NONCLUSTERED 
(
	[guidEntitySchema] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ENTITYSCHEMA_FK_IDX_1] ON [dbo].[ENTITYSCHEMA] 
(
	[idEnt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ENTITYEX]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ENTITYEX](
	[idEnt] [int] NOT NULL,
	[entXML] [nvarchar](4000) NOT NULL,
	[guidEntityEx] [uniqueidentifier] NOT NULL,
	[dplyEntityEx] [tinyint] NOT NULL,
	[idEntityEx] [int] IDENTITY(10000,1) NOT NULL,
 CONSTRAINT [ENTITYEX_PK] PRIMARY KEY CLUSTERED 
(
	[idEntityEx] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ENTITYEX_UK1] UNIQUE NONCLUSTERED 
(
	[idEnt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ENTITYEX_UKG] UNIQUE NONCLUSTERED 
(
	[guidEntityEx] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BIZLETTER]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BIZLETTER](
	[idBizLetter] [int] IDENTITY(1,1) NOT NULL,
	[blTemplateName] [nvarchar](26) NOT NULL,
	[guidBizLetter] [uniqueidentifier] NOT NULL,
	[blTemplateFile] [image] NULL,
	[idContextEnt] [int] NULL,
	[dplyBizLetter] [tinyint] NOT NULL,
 CONSTRAINT [BIZLETTER_PK] PRIMARY KEY CLUSTERED 
(
	[idBizLetter] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BIZLETTER_UKG] UNIQUE NONCLUSTERED 
(
	[guidBizLetter] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BIZLETTER_FK_IDX_1] ON [dbo].[BIZLETTER] 
(
	[idContextEnt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BARENDERCACHE]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BARENDERCACHE](
	[idRenderCache] [int] IDENTITY(10000,1) NOT NULL,
	[guidForm] [uniqueidentifier] NOT NULL,
	[data] [image] NULL,
	[idLanguage] [int] NULL,
 CONSTRAINT [BARENDERCACHE_PK] PRIMARY KEY CLUSTERED 
(
	[idRenderCache] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BARENDERCACHE_FK_IDX_1] ON [dbo].[BARENDERCACHE] 
(
	[idLanguage] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BASCOPEITEMDEF]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BASCOPEITEMDEF](
	[idScopeItemDef] [int] IDENTITY(1,1) NOT NULL,
	[sidName] [nvarchar](255) NULL,
	[sidItemType] [int] NOT NULL,
	[sidDataType] [int] NULL,
	[idEnt] [int] NULL,
	[idScopeDef] [int] NULL,
	[sidDisplayName] [nvarchar](40) NULL,
	[sidDescription] [nvarchar](100) NULL,
	[sidHelpText] [nvarchar](100) NULL,
	[sidDisplayType] [int] NULL,
	[guidScopeItemDef] [uniqueidentifier] NOT NULL,
	[dplyScopeItemDef] [tinyint] NOT NULL,
 CONSTRAINT [BASCOPEITEMDEF_PK] PRIMARY KEY CLUSTERED 
(
	[idScopeItemDef] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BASCOPEITEMDEF_UKG] UNIQUE NONCLUSTERED 
(
	[guidScopeItemDef] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BASCOPEITEMDEF_FK_IDX_1] ON [dbo].[BASCOPEITEMDEF] 
(
	[idScopeDef] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BASCOPEITEMDEF_FK_IDX_2] ON [dbo].[BASCOPEITEMDEF] 
(
	[idEnt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAOFFACCESS]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAOFFACCESS](
	[idBAOffAccess] [int] IDENTITY(1,1) NOT NULL,
	[idBaOfflineChangeSet] [int] NOT NULL,
	[idWFClass] [int] NOT NULL,
	[idWorkFlow] [int] NULL,
	[active] [bit] NOT NULL,
	[timeStamp] [datetime] NULL,
 CONSTRAINT [BAOFFACCESS_PK] PRIMARY KEY CLUSTERED 
(
	[idBAOffAccess] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAOAUTH2SERVERTOKEN]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BAOAUTH2SERVERTOKEN](
	[id] [uniqueidentifier] NOT NULL,
	[idApplication] [uniqueidentifier] NOT NULL,
	[userDomain] [nvarchar](256) NULL,
	[userName] [varchar](256) NULL,
	[accessToken] [varchar](256) NULL,
	[authorizationCode] [varchar](256) NULL,
	[refreshToken] [varchar](256) NULL,
	[tokenType] [varchar](50) NULL,
	[clientState] [nvarchar](256) NULL,
	[internalState] [varchar](256) NULL,
	[accessTokenExpirationTimeUTC] [datetime] NULL,
	[authCodeExpirationTimeUTC] [datetime] NULL,
	[scope] [varchar](250) NULL,
	[assertionId] [varchar](256) NULL,
	[synchronizationToken] [varchar](256) NULL,
	[syncTokenExpirationTimeUTC] [datetime] NULL,
	[creationTimeUTC] [datetime] NOT NULL,
 CONSTRAINT [BAOAUTH2SERVERTOKEN_PK] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [BAOAUTH2SERVERTOKEN_ACTOKEN_1] ON [dbo].[BAOAUTH2SERVERTOKEN] 
(
	[accessToken] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAOAUTH2SERVERTOKEN_AUTCODE_1] ON [dbo].[BAOAUTH2SERVERTOKEN] 
(
	[authorizationCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAOAUTH2SERVERTOKEN_IDAPP_1] ON [dbo].[BAOAUTH2SERVERTOKEN] 
(
	[idApplication] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAOAUTH2SERVERTOKEN_INSTATE_1] ON [dbo].[BAOAUTH2SERVERTOKEN] 
(
	[internalState] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAOAUTH2SERVERTOKEN_RFTOKEN_1] ON [dbo].[BAOAUTH2SERVERTOKEN] 
(
	[refreshToken] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAGAMEASURE]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAGAMEASURE](
	[idMeasure] [int] IDENTITY(1,1) NOT NULL,
	[columnName] [nvarchar](40) NOT NULL,
	[idCube] [int] NOT NULL,
 CONSTRAINT [BAGAMEASURE_PK] PRIMARY KEY CLUSTERED 
(
	[idMeasure] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAGAMEASURE_FK_IDX_1] ON [dbo].[BAGAMEASURE] 
(
	[idCube] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BADATATRIGGERJOBRUNNING]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BADATATRIGGERJOBRUNNING](
	[idJob] [int] NOT NULL,
	[runningState] [tinyint] NOT NULL,
	[startRunTime] [datetime] NULL,
	[endRunTime] [datetime] NULL,
	[retryingCount] [int] NOT NULL,
 CONSTRAINT [BADATATRIGGERJOBRUNNING_PK] PRIMARY KEY CLUSTERED 
(
	[idJob] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BACOLLABDIAGRAM]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BACOLLABDIAGRAM](
	[idCollabDiagram] [int] IDENTITY(1,1) NOT NULL,
	[guidCollabDiagram] [uniqueidentifier] NOT NULL,
	[diagramName] [nvarchar](255) NOT NULL,
	[messageAttribs] [image] NOT NULL,
	[idContainingFolder] [int] NULL,
	[dplyCollabDiagram] [tinyint] NOT NULL,
 CONSTRAINT [BACOLLABDIAGRAM_PK] PRIMARY KEY CLUSTERED 
(
	[idCollabDiagram] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BACOLLABDIAGRAM_UK1] UNIQUE NONCLUSTERED 
(
	[idContainingFolder] ASC,
	[diagramName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BACOLLABDIAGRAM_UKG] UNIQUE NONCLUSTERED 
(
	[guidCollabDiagram] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BADPLYPACKAGEDATA]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BADPLYPACKAGEDATA](
	[idDeploymentPackageData] [int] IDENTITY(10000,1) NOT NULL,
	[idDeploymentPackage] [int] NOT NULL,
	[dpkContent] [image] NOT NULL,
	[contentType] [int] NOT NULL,
 CONSTRAINT [BADPLYPACKAGEDATA_PK] PRIMARY KEY CLUSTERED 
(
	[idDeploymentPackageData] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BADPLYPACKAGEDATA_FK_IDX_1] ON [dbo].[BADPLYPACKAGEDATA] 
(
	[idDeploymentPackage] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAENVIRONMENT]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BAENVIRONMENT](
	[idBAEnvironment] [int] IDENTITY(10000,1) NOT NULL,
	[envName] [varchar](100) NULL,
	[idEnvType] [tinyint] NULL,
	[isCurrentEnv] [bit] NOT NULL,
	[connString] [nvarchar](4000) NULL,
	[guidBAEnvironment] [uniqueidentifier] NOT NULL,
	[dplyBAEnvironment] [tinyint] NOT NULL,
 CONSTRAINT [BAENVIRONMENT_PK] PRIMARY KEY CLUSTERED 
(
	[idBAEnvironment] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAENVIRONMENT_UK1] UNIQUE NONCLUSTERED 
(
	[envName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAENVIRONMENT_UKG] UNIQUE NONCLUSTERED 
(
	[guidBAEnvironment] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [BAENVIRONMENT_FK_IDX_1] ON [dbo].[BAENVIRONMENT] 
(
	[idEnvType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAGADIMENSION]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BAGADIMENSION](
	[idDimension] [int] IDENTITY(1,1) NOT NULL,
	[columnName] [varchar](250) NOT NULL,
	[idCube] [int] NOT NULL,
 CONSTRAINT [BAGADIMENSION_PK] PRIMARY KEY CLUSTERED 
(
	[idDimension] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [BAGADIMENSION_FK_IDX_1] ON [dbo].[BAGADIMENSION] 
(
	[idCube] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAENVPARAMENTITYEXFLAGS]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAENVPARAMENTITYEXFLAGS](
	[idEnvParamEntityExFlags] [int] IDENTITY(10000,1) NOT NULL,
	[idEnt] [int] NOT NULL,
	[idEnvParamEntityEx] [int] NOT NULL,
	[CommonToAllEnvs] [bit] NOT NULL,
	[guidEnvParamEntityExFlags] [uniqueidentifier] NOT NULL,
	[dplyEnvParamEntityExFlags] [tinyint] NOT NULL,
 CONSTRAINT [BAENVPARAMENTITYEXFLAGS_PK] PRIMARY KEY CLUSTERED 
(
	[idEnvParamEntityExFlags] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAENVPARAMENTITYEXFLAGS_UK1] UNIQUE NONCLUSTERED 
(
	[idEnvParamEntityEx] ASC,
	[idEnt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAENVPARAMENTITYEXFLAGS_UKG] UNIQUE NONCLUSTERED 
(
	[guidEnvParamEntityExFlags] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AUTHLOG]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AUTHLOG](
	[idAuthLog] [bigint] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NULL,
	[domain] [nvarchar](50) NULL,
	[userName] [varchar](50) NULL,
	[idAuthEventType] [int] NOT NULL,
	[idAuthEventSubType] [int] NULL,
	[ipAddress] [nvarchar](30) NULL,
	[awSubProcessContext] [image] NULL,
	[alEntryDate] [datetime] NULL,
 CONSTRAINT [AUTHLOG_PK] PRIMARY KEY CLUSTERED 
(
	[idAuthLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ATTRIB]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ATTRIB](
	[idAttrib] [int] IDENTITY(10000,1) NOT NULL,
	[attribName] [varchar](26) NOT NULL,
	[attribDisplayName] [nvarchar](40) NOT NULL,
	[attribDescription] [nvarchar](100) NULL,
	[attribHelpText] [nvarchar](100) NULL,
	[attribType] [int] NOT NULL,
	[attribSrc] [varchar](26) NOT NULL,
	[idEnt] [int] NOT NULL,
	[idEntRelated] [int] NULL,
	[guidAttrib] [uniqueidentifier] NOT NULL,
	[attribExtSrc] [nvarchar](128) NULL,
	[attribExclExtSrc] [int] NOT NULL,
	[attribAutoExtSrc] [int] NOT NULL,
	[dplyAttrib] [tinyint] NOT NULL,
	[attribDisplayOrder] [int] NULL,
	[attribAttributeType] [int] NOT NULL,
	[attribSize] [int] NOT NULL,
	[hasDefaultValue] [bit] NULL,
	[defaultValue] [text] NULL,
	[dataType] [nvarchar](106) NULL,
	[numericPrecision] [int] NULL,
	[numericScale] [int] NULL,
	[idContentType] [uniqueidentifier] NULL,
	[automapped] [bit] NOT NULL,
 CONSTRAINT [ATTRIB_PK] PRIMARY KEY CLUSTERED 
(
	[idAttrib] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ATTRIB_UK1] UNIQUE NONCLUSTERED 
(
	[idEnt] ASC,
	[attribName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ATTRIB_UK2] UNIQUE NONCLUSTERED 
(
	[idEnt] ASC,
	[attribSrc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ATTRIB_UK3] UNIQUE NONCLUSTERED 
(
	[idEnt] ASC,
	[attribDisplayName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ATTRIB_UKG] UNIQUE NONCLUSTERED 
(
	[guidAttrib] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [ATTRIB_IX1] ON [dbo].[ATTRIB] 
(
	[attribName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ATTRIB_IX2] ON [dbo].[ATTRIB] 
(
	[attribSrc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ATTRIB_IX3] ON [dbo].[ATTRIB] 
(
	[idEnt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ATTRIB_IX4] ON [dbo].[ATTRIB] 
(
	[idEntRelated] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_DropIndex]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_DropIndex]( @sTableName sysname, @sColumnName sysname, @bPrintMessages bit = 0 )
	AS
	BEGIN
		declare @sIndexName sysname
		declare @sSql varchar(1000)

		select @sIndexName = a.INDEX_NAME from vwBA_Sync_AllIndexColumns a,
			(select INDEX_NAME from vwBA_Sync_AllIndexColumns where TABLE_NAME = replace(replace(@sTableName, '[', ''), ']', '')  and  COLUMN_NAME = replace(replace(@sColumnName, '[', ''), ']', '') ) b
		where a.INDEX_NAME = b.INDEX_NAME  group by a.INDEX_NAME  having count(*) = 1

		if @sIndexName is not null
		begin
			set @sSql = replace(replace(
				'drop index {0}.{1}',
				'{0}', @sTableName),
				'{1}', @sIndexName)
			if(@bPrintMessages = 1) begin print(@sSql) end
			exec( @sSql )
		end
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_DropGuidUK]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_DropGuidUK](@sTableName sysname, @sGuidColumnName sysname, @bPrintMessages bit = 0)
	AS
	BEGIN
		-- delete unique constraint if exists anyone with standard name
		declare @aBaTmpCountVar integer
		SELECT @aBaTmpCountVar = COUNT(*) FROM vwba_sync_allindexes WHERE /*is_unique = 'U'  and*/  index_name = (@sTableName + '_UKG')
		IF @aBaTmpCountVar > 0 BEGIN
			if (@bPrintMessages = 1) begin
				print(replace(replace('Removing unique constraint from {0}.{1}', 
					'{0}', @sTableName), 
					'{1}', @sGuidColumnName))
			end

			declare @sSql varchar(500)
			set @sSql = replace('ALTER TABLE {0} DROP CONSTRAINT {0}_UKG', '{0}', @sTableName)
			EXEC(@sSql)
		END
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_FixUniqueNames4Cols]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_FixUniqueNames4Cols](@sTableName sysname, @sUniqueColumnId1 sysname, @sUniqueColumnId2 sysname, @sUniqueColumnId3 sysname, @sUniqueColumnName sysname, @sAppendChar varchar(1) = '_')
	AS
	BEGIN
		declare @sUniqueColumnsIdsNames varchar(1000)
		set @sUniqueColumnsIdsNames = ''
		set @sUniqueColumnsIdsNames = @sUniqueColumnsIdsNames + replace('set @sUniqueColumnId1 = ''{0}''; ', '{0}', @sUniqueColumnId1)
		set @sUniqueColumnsIdsNames = @sUniqueColumnsIdsNames + replace('set @sUniqueColumnId2 = ''{0}''; ', '{0}', @sUniqueColumnId2)
		set @sUniqueColumnsIdsNames = @sUniqueColumnsIdsNames + replace('set @sUniqueColumnId3 = ''{0}''; ', '{0}', @sUniqueColumnId3)
		exec spBA_SQL_FixUniqueNamesNCols @sTableName, 4, @sUniqueColumnsIdsNames, @sUniqueColumnName, @sAppendChar
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_FixUniqueNames3Cols]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_FixUniqueNames3Cols](@sTableName sysname, @sUniqueColumnId1 sysname, @sUniqueColumnId2 sysname, @sUniqueColumnName sysname, @sAppendChar varchar(1) = '_')
	AS
	BEGIN
		declare @sUniqueColumnsIdsNames varchar(1000)
		set @sUniqueColumnsIdsNames = ''
		set @sUniqueColumnsIdsNames = @sUniqueColumnsIdsNames + replace('set @sUniqueColumnId1 = ''{0}''; ', '{0}', @sUniqueColumnId1)
		set @sUniqueColumnsIdsNames = @sUniqueColumnsIdsNames + replace('set @sUniqueColumnId2 = ''{0}''; ', '{0}', @sUniqueColumnId2)
		exec spBA_SQL_FixUniqueNamesNCols @sTableName, 3, @sUniqueColumnsIdsNames, @sUniqueColumnName, @sAppendChar
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_FixUniqueNames2Cols]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_FixUniqueNames2Cols](@sTableName sysname, @sUniqueColumnId1 sysname, @sUniqueColumnName sysname, @sAppendChar varchar(1) = '_')
	AS
	BEGIN
		declare @sUniqueColumnsIdsNames varchar(1000)
		set @sUniqueColumnsIdsNames = replace('set @sUniqueColumnId1 = ''{0}''; ', '{0}', @sUniqueColumnId1)
		exec spBA_SQL_FixUniqueNamesNCols @sTableName, 2, @sUniqueColumnsIdsNames, @sUniqueColumnName, @sAppendChar
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_FixUniqueNames]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_FixUniqueNames](@sTableName sysname, @sUniqueColumnName sysname, @sAppendChar varchar(1) = '_')
	AS
	BEGIN
		exec spBA_SQL_FixUniqueNamesNCols @sTableName, 1, '', @sUniqueColumnName, @sAppendChar
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_Dply_DropAllMtdUpdtTrg]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_Dply_DropAllMtdUpdtTrg](@bTrace bit = 0)
	AS
	BEGIN
		declare @sSqlSpTmp varchar(8000)

		-- BizAgi metadata tables
		set @sSqlSpTmp = '
			select replace( ''
				begin
					exec spBA_Dply_DropMtdUpdtTrg ''''{0}'''', {bTrace}
				end
				'', 
				''{0}'', table_name )
			from (
					SELECT tb.name table_name
					FROM sysobjects tr, sysobjects tb 
					WHERE (tr.name like ''TMD[_]%'')  and  (tr.type = ''TR'')  and  (tr.parent_obj = tb.id)
						and  (tr.name = ''TMD_'' + tb.name)
				) A
			order by table_name
		'
		set @sSqlSpTmp = replace(@sSqlSpTmp, 
			'{bTrace}', @bTrace)
		exec spBA_Sync_ExecQueries @sSqlSpTmp, 1, 0
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_Dply_CreateMtdDplyCol]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_Dply_CreateMtdDplyCol]
		AS
		BEGIN

			declare @_sSqlSpTmp varchar(8000)
			set @_sSqlSpTmp = '
				select replace(replace(
					''
					DECLARE @nCol integer
					SELECT @nCol = COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = ''''{0}''''  AND  COLUMN_NAME = ''''{1}''''
					IF( @nCol = 0 )
					BEGIN

						PRINT( ''''BEGIN: Add Deployment State column to {0}'''' )
						ALTER TABLE {0} ADD {1} tinyint NOT NULL CONSTRAINT {0}_DFY DEFAULT (0)
						PRINT( ''''END: Add Deployment State column to {0}'''' )

					END
					'',
					''{0}'', table_name),
					''{1}'', column_name)
				from (
					select ba.*
					from ((
							select (case when ek.idEnt is not null then e.entEKSrc else e.entSrc end) tableName, + (''dply'' + e.entSrc) column_name, 2 ord_dummy
							from entity e left outer join entitykey ek on e.idEnt = ek.idEnt
							where e.entType = 2
							group by e.entSrc, e.entEKSrc, ek.idEnt
						)) ba left outer join INFORMATION_SCHEMA.COLUMNS dbcol  on  (ba.table_name = dbcol.table_name  and  ba.column_name = dbcol.column_name)
					where dbcol.table_name is null
				) A
				order by ord_dummy, table_name
			'
			exec spBA_Sync_ExecQueries @_sSqlSpTmp, 1, 0
		END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_FixPKName]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_FixPKName](@sTableName sysname, @bPrintMessages bit = 0)
	AS
	BEGIN
		declare @asCurrPkName varchar(100)
		declare @asNewPkName varchar(100)
		declare @asTmpPkName varchar(100)

		declare @asCurrIxPkName varchar(100)
		declare @asNewIxPkName varchar(100)
		declare @asTmpIxPkName varchar(100)

		declare @sSqlTmp varchar(8000)

		-- FIX CONSTRAINT NAME

		-- Generate valid names
		select @asNewPkName = substring(a.table_name, 1, 27) + '_PK' from information_schema.tables a where a.table_name = dbo.fnBA_DB_UnqouteDBName(@sTableName)

		-- Get current PK Name
		select @asCurrPkName = a.pk_name
		from vwBA_Sync_AllPKeys a
		where a.table_name = @sTableName  and  a.ordinal = 1

		-- Validate if current PK Name fullfill standard
		if(@asCurrPkName <> @asNewPkName) begin
			-- Ensure that name is not already used
			set @sSqlTmp = replace(replace('
				select replace(replace(replace(''
					if({PRINT_MESSAGES} = 1) begin
						print(''''Renaming primary key {2}.{0} to {1} '''')
					end
					exec sp_rename ''''{0}'''', ''''{1}'''', ''''OBJECT''''



					'',
					''{0}'', a.pk_name),
					''{1}'', a.tmpPkName),
					''{2}'', a.table_name)
				from (
					select b.table_name, b.pk_name, (''PK_'' + replace(newid(),''-'','''')) tmpPkName
					from vwBA_Sync_AllPKeys b 
					where b.ordinal = 1  and  b.pk_name = ''{PK_NAME_SEARCH}''
				) a

				',
				'{PK_NAME_SEARCH}', @asNewPkName),
				'{PRINT_MESSAGES}', @bPrintMessages)
			exec spBA_Sync_ExecQueries @sSqlTmp

			-- Fix PK Name
			if(@bPrintMessages = 1) begin
				set @sSqlTmp = replace(replace(replace(
					'Renaming primary key {2}.{0} to {1}',
					'{0}', @asCurrPkName),
					'{1}', @asNewPkName),
					'{2}', @sTableName)
				print(@sSqlTmp)
			end
			exec sp_rename @asCurrPkName, @asNewPkName, 'OBJECT'

		end
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_FixAllPKNames]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_FixAllPKNames]
	AS
		declare @sSqlTmp varchar(8000)
	BEGIN
		set @sSqlTmp = '
			select replace(''
				begin
					exec spBA_DB_FixPKName ''''{0}'''', 1
				end
				'',
				''{0}'', TABLE_NAME)
			from (
				select dbpk.*, substring(dbpk.table_name, 1, 27) + ''_PK'' new_pk_name 
				from vwBA_Sync_AllPKeys dbpk
				where dbpk.ordinal = 1
			) a
			where  a.pk_name <> a.new_pk_name
			'
		exec spBA_Sync_ExecQueries @sSqlTmp, 1, 0
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_EM_CreateMissingFactInds]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_EM_CreateMissingFactInds]
	AS
	BEGIN
		declare @sSql varchar(8000)
		-- Single-Multiple
		set @sSql = '
		SELECT REPLACE(REPLACE(REPLACE(''
				PRINT(''''Creating Index {1}.{2} for Single-Multiple Fact, Parent Entity (Single/Left/Pk): {0}, Child Entity (Multiple/Right/Fk): {1}.{2}'''')
				EXEC spBA_EM_CreateFactIndex ''''{1}'''', ''''{2}'''', 0
			'', 
			''{0}'', facts.entSrcParentLeftPk),
			''{1}'', facts.entSrcChildRightFk),
			''{2}'', facts.attribSrcChildRightFk)
		FROM (
			-- all facts 1:N that have valid column
			SELECT lent.idEnt idEntParentLeftPk, lent.entSrc entSrcParentLeftPk, 
				rent.idEnt idEntChildRightFk, rent.entSrc entSrcChildRightFk, att.attribSrc attribSrcChildRightFk
			FROM fact fct, entity lent, attrib att, entity rent, information_schema.columns rcol, vwBA_Sync_AllPkeys valRPk
			WHERE fct.idFactRelationType = 1  and  fct.idLeftEntity = lent.idEnt  and  fct.idRightEntity = rent.idEnt  and  
				rcol.table_name = rent.entSrc  and  rcol.column_name = att.attribSrc  and  
				att.idEnt = rent.idEnt and att.attribSrc = rcol.column_name and fct.factSrc = att.attribName and
				valRPk.table_name = rent.entSrc  and  valRPk.column_name != att.attribSrc
		) facts 
		WHERE NOT EXISTS (
						-- all valid fact indexes
						SELECT a.table_name, a.column_name
						FROM vwBA_Sync_AllIndexColumns a
						WHERE dbo.fnBA_DB_IsValidIndexName(a.index_name, a.table_name, ''_F'') = 1  
							AND a.index_name not in (SELECT b.index_name FROM vwBA_Sync_AllIndexColumns b WHERE b.ordinal_position <> 1)
							AND facts.entSrcChildRightFk = a.table_name
							AND facts.attribSrcChildRightFk = a.column_name
						)
		'
		exec spBA_Sync_ExecQueries @sSql
		-- Single-Single
		set @sSql = '
		select replace(replace(replace(''
				print(''''Creating Index {1}.{2} for Single-Single Fact, Parent Entity (Pk): {0}, Child Entity (Fk): {1}.{2}'''')
				-- invoke spBA_DB_CreateIndexSingle directly to avoid errors and continue
				exec spBA_DB_CreateIndexSingle ''''{1}'''', ''''{2}'''', 0, ''''_F'''', 1
			'', 
			''{0}'', facts.entSrcParentLeftPk),
			''{1}'', facts.entSrcChildRightFk),
			''{2}'', facts.colParentLeftPk)
		from (
			-- all facts 1:1, that have valid columns
			select pkEnt.idEnt idEntParentLeftPk, pkEnt.entSrc entSrcParentLeftPk, keyPkEnt.column_name colParentLeftPk, 
				fkEnt.idEnt idEntChildRightFk, fkEnt.entSrc entSrcChildRightFk, keyFkEnt.column_name colChildRightFk
			from (select f1.idLeftEntity idPkEnt, f1.idRightEntity idFkEnt from fact f1 where f1.idFactRelationType = 3 
					union all 
					select f2.idRightEntity idPkEnt, f2.idLeftEntity idFkEnt from fact f2 where f2.idFactRelationType = 3
				) fct, entity pkEnt, entity fkEnt, vwBA_Sync_AllPKeys keyPkEnt, vwBA_Sync_AllPKeys keyFkEnt, information_schema.columns fkCol
			where fct.idPkEnt = pkEnt.idEnt  and  fct.idFkEnt = fkEnt.idEnt  and  
				keyPkEnt.table_name = pkEnt.entSrc  and  keyFkEnt.table_name = fkEnt.entSrc  and  
				fkCol.table_name = fkEnt.entSrc  and  fkCol.column_name = keyPkEnt.column_name
		) facts 
		WHERE NOT EXISTS (
							-- all valid fact indexes 
							SELECT a.table_name, a.column_name
							FROM vwBA_Sync_AllIndexColumns a
							WHERE dbo.fnBA_DB_IsValidIndexName(a.index_name, a.table_name, ''_F'') = 1  AND  
								a.index_name NOT IN (SELECT b.index_name FROM vwBA_Sync_AllIndexColumns b WHERE b.ordinal_position <> 1)
								AND facts.entSrcChildRightFk = a.table_name  and  facts.colParentLeftPk = a.column_name
							)
		'
		exec spBA_Sync_ExecQueries @sSql
		-- Multiple-Multiple
		set @sSql = '
		select replace(replace(replace(replace(''
				print(''''Creating Index {2}.{3} for Multiple-Multiple Fact, Left Entity: {0}, Right Entity: {1}'''')
				exec spBA_EM_CreateFactIndex ''''{2}'''', ''''{3}'''', 0
			'', 
			''{0}'', facts.entSrcLeft),
			''{1}'', facts.entSrcRight),
			''{2}'', facts.factSrc),
			''{3}'', facts.factRigthCol)
		from (
			-- all facts M:N that have valid column
			select lent.idEnt idEntLeft, lent.entSrc entSrcLeft, 
				rent.idEnt idEntRight, rent.entSrc entSrcRight, 
				fct.factSrc factSrc, rPk.column_name factRigthCol
			from fact fct, entity lent, entity rent, vwBA_Sync_AllPKeys rPk, information_schema.columns rPkCol
			where fct.idFactRelationType = 2  and  fct.idLeftEntity = lent.idEnt  and  fct.idRightEntity = rent.idEnt  and  
				rPk.table_name = rent.entSrc  and  rPkCol.table_name = fct.factSrc  and  rPkCol.column_name = rPk.column_name
		) facts 
		WHERE NOT EXISTS (
						-- all valid fact indexes 
						select a.table_name, a.column_name
						from vwBA_Sync_AllIndexColumns a
						where dbo.fnBA_DB_IsValidIndexName(a.index_name, a.table_name, ''_F'') = 1  and  
							a.index_name not in (select b.index_name from vwBA_Sync_AllIndexColumns b where b.ordinal_position <> 1)
							AND facts.factSrc = a.table_name  and  facts.factRigthCol = a.column_name
						)
		'
		exec spBA_Sync_ExecQueries @sSql
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_EM_CreateMissBizKeyInds]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_EM_CreateMissBizKeyInds]
	AS
	BEGIN

	DECLARE @_sSql varchar(8000)

	-- Drop Indexes
	set @_sSql = 
	'
	select distinct replace(replace(''
		DECLARE @_sOutput varchar(8000), @_sTmp varchar(8000), @_sDropIndex varchar(8000)

		set @_sTmp = ''''select column_name + '''''''','''''''' from vwBA_Sync_AllIndexColumns where table_name = ''''''''{0}'''''''' and index_name = ''''''''{1}''''''''order by ordinal_position''''
		exec spBA_DB_ConcatRows @_sTmp, @_sOutput output;
		set @_sOutput = substring(@_sOutput, 1, len(@_sOutput)-1)
		set @_sDropIndex = ''''EXEC spBA_EM_DropKeyAttribIndex ''''''''{0}'''''''','''''''''''' + @_sOutput + ''''''''''''''''
		exec(@_sDropIndex)
		''
		, ''{0}'', table_name), ''{1}'', index_name)  /*distinct index_name, table_name*/
	from 
		(
			select entitybizkey.*, attrib.attribSrc, attrib.entSrc 
			from 
				(
					select attrib.*, entity.entSrc 
					from entity 
						inner join attrib on entity.ident = attrib.ident
				) attrib
				inner join entitybizkey on entitybizkey.idAttrib = attrib.idAttrib
		) bizkey
		full outer join
		(
			select * 
			from vwBA_Sync_AllIndexColumns a
			where dbo.fnBA_DB_IsValidIndexName(a.index_name, a.table_name, ''_EK'') = 1  and
				a.index_name not in (select i.Name from sysindexes i, sysobjects o where o.id = i.id and (i.status & 0x800) = 0x800)
		) inds
		on bizkey.attribSrc = inds.column_name and bizkey.entSrc = inds.table_name
	where entSrc is null
	'

	exec spBA_Sync_ExecQueries @_sSql

	-- Create Indexes

	set @_sSql = 
	'
	select distinct replace(''
		DECLARE @_sOutput varchar(8000), @_sTmp varchar(8000), @_sCreateIndex varchar(8000)

		set @_sTmp = ''''select attribSrc + '''''''','''''''' from entitybizkey inner join attrib on entitybizkey.idAttrib = attrib.idAttrib inner join entity on entity.idEnt = entityBizKey.idEnt and entity.entSrc = ''''''''{0}''''''''''''
		exec spBA_DB_ConcatRows @_sTmp, @_sOutput output;
		set @_sOutput = substring(@_sOutput, 1, len(@_sOutput)-1)
		set @_sCreateIndex = ''''EXEC spBA_EM_CreateKeyAttribIndex ''''''''{0}'''''''','''''''''''' + @_sOutput + ''''''''''''''''
		exec (@_sCreateIndex)
		''
		, ''{0}'', entSrc) /*distinct index_name, table_name*/
	from 
		(
			select entitybizkey.*, attrib.attribSrc, attrib.entSrc 
			from 
				(
					select attrib.*, entity.entSrc 
					from entity 
						inner join attrib on entity.ident = attrib.ident
				) attrib
				inner join entitybizkey on entitybizkey.idAttrib = attrib.idAttrib
		) bizkey
		full outer join
		(
			select * 
			from vwBA_Sync_AllIndexColumns a
			where dbo.fnBA_DB_IsValidIndexName(a.index_name, a.table_name, ''_EK'') = 1 and
				a.index_name not in (select i.Name from sysindexes i, sysobjects o where o.id = i.id and (i.status & 0x800) = 0x800)
		) inds
		on bizkey.attribSrc = inds.column_name and bizkey.entSrc = inds.table_name
	where table_name is null
	'
	exec spBA_Sync_ExecQueries @_sSql

	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_KeyGenerator]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_KeyGenerator]
		@GeneratorName	VARCHAR(100),
		@StackSize Int,
		@NextSequenceValue	BigInt OUT

		AS
		BEGIN 
			DECLARE @sGeneratorName VARCHAR(200)
			DECLARE @iCount bigint
			DECLARE @iReturnCode int
			DECLARE @sLockResourceName varchar(255)
			DECLARE @sErrMsg VARCHAR(4000)
			DECLARE @sQuery NVARCHAR(2000)
			DECLARE @sTableName VARCHAR(2000)
			DECLARE @sPkColumName VARCHAR(2000)
			DECLARE @iMaxIdEntity bigint

			BEGIN TRY     
			BEGIN TRAN	

			--neccesary for java
			SET NOCOUNT ON

			set @sGeneratorName = UPPER(@GeneratorName)
			set @sLockResourceName = 'CKEYGENERATORDA_' + @sGeneratorName; 	            		
			EXEC @iReturnCode = sp_getapplock @Resource = @sLockResourceName, @LockMode = 'Exclusive';
			
			IF @iReturnCode NOT IN (0, 1)
			BEGIN
				set @sErrMsg = 'Unable to acquire exclusive Lock on ' + @sLockResourceName
				RAISERROR (@sErrMsg, 16, 1 )        
				RETURN
			END 
			
			select @iCount = count(1) from BAGENERATORTABLE WITH (NOLOCK) where (SequenceName = @sGeneratorName); 
			if (@iCount = 0) 
			begin

				--TryGetEntityMetadata
				if exists(select 1 from ENTITY where upper(entName) = @sGeneratorName) 
				begin
					SELECT 
					@sTableName = case entSrcType when 3 then entEKSrc else entSrc end, 
					@sPkColumName = entSurrogatekey  
					FROM ENTITY WHERE upper(entName) = @sGeneratorName;
				end
				else
				begin
					set @sTableName = @sGeneratorName
					SELECT @sPkColumName=COLUMN_NAME FROM VWBA_SYNC_ALLPKEYS where upper(table_name) = UPPER(@sTableName)
				end

				set @iMaxIdEntity = @StackSize
				if (@sTableName IS NOT NULL AND LEN(@sTableName) > 0
					and @sPkColumName IS NOT NULL AND LEN(@sPkColumName) > 0)
				begin

					set @sTableName = UPPER(@sTableName)
					set @sPkColumName = UPPER(@sPkColumName)


					if(@sTableName in ('WFCASE','WORKITEM'))
					begin
						set @sQuery = N'SELECT @maxIdOUT = MAX(pk) FROM (SELECT MAX('+@sPkColumName+') pk FROM '+@sTableName+' WITH (NOLOCK) UNION SELECT MAX('+@sPkColumName+') pk FROM '+@sTableName+'CL WITH (NOLOCK)) t1'
					end
					else
					begin
						set @sQuery = N'SELECT @maxIdOUT = MAX('+@sPkColumName+') FROM '+@sTableName+' WITH (NOLOCK) '
					end

					EXEC sp_executesql @sQuery, N'@maxIdOUT bigint OUTPUT', @maxIdOUT=@iMaxIdEntity OUTPUT;

					if(@iMaxIdEntity is not null)
					begin
						set @iMaxIdEntity = @iMaxIdEntity + @StackSize
					end
					else
					begin
						set @iMaxIdEntity =  @StackSize
					end
				end
			 
				INSERT INTO BAGENERATORTABLE (SequenceName, SequenceValue) VALUES (@sGeneratorName, @iMaxIdEntity); 
				
			end 
			else if (@iCount = 1) 
			begin
				UPDATE BAGENERATORTABLE 
				SET SequenceValue = SequenceValue + @StackSize 
				WHERE SequenceName = @sGeneratorName; 
			end 
			else begin 
				RAISERROR('Duplicate key', 16, 1); 
			end 

			select @NextSequenceValue = sequenceValue from BAGENERATORTABLE WITH (NOLOCK) where (SequenceName = @sGeneratorName);
			set @NextSequenceValue = @NextSequenceValue - @StackSize + 1
			
				
			--release the lock on stored proc
			EXEC @iReturnCode = sp_releaseapplock @Resource = @sLockResourceName
			COMMIT
			
			END TRY      
			BEGIN CATCH
				set @NextSequenceValue = -1
				BEGIN TRY
					IF @iReturnCode IN (0, 1)
					BEGIN
						 EXEC @iReturnCode = sp_releaseapplock @Resource = @sLockResourceName
					END
				END TRY      
				BEGIN CATCH	
					SELECT @sErrMsg = ERROR_MESSAGE() 	    
					RAISERROR(@sErrMsg, 15, 50)   
				END CATCH 
				
				ROLLBACK
			
				SELECT @sErrMsg = ERROR_MESSAGE() 	    
				RAISERROR(@sErrMsg, 15, 50)        
			
			END CATCH  
				
		END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_CompleteCompKeyTable]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_CompleteCompKeyTable] AS
		BEGIN
			DECLARE @_sSqlSpTmp VARCHAR(8000)
			SET @_sSqlSpTmp = '
				SELECT replace(replace( ''
				DECLARE @nCol integer
				SELECT @nCol = COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = ''''{0}'''' AND  COLUMN_NAME = ''''BAInstanceVirtualState''''
				IF ( @nCol = 0 ) 
				BEGIN
					PRINT( ''''BEGIN: Add composite key indexes to {0}'''' )
					SET NOCOUNT ON
					DECLARE @sKeyAttribs varchar(8000)
					EXEC spBA_DB_ConcatRows ''''SELECT ATTRIB.attribSrc + '''''''','''''''' FROM ATTRIB INNER JOIN ENTITYKEY ON ATTRIB.idAttrib = ENTITYKEY.idAttrib  INNER JOIN ENTITY ON ENTITYKEY.idEnt = ENTITY.idEnt WHERE ENTITY.entSrc = ''''''''{1}'''''''''', @sKeyAttribs output
					SET @sKeyAttribs = LEFT(@sKeyAttribs, LEN(@sKeyAttribs) - 1)
					EXEC spBA_EM_CreateKeyAttribIndex ''''{0}'''', @sKeyAttribs
					SET NOCOUNT OFF
					PRINT( ''''END: Add composite key indexes to {0}'''' )

					PRINT( ''''BEGIN: Add VirtualState column to {0}'''' )
					ALTER TABLE {0} ADD BAInstanceVirtualState int NULL
					PRINT( ''''END: Add VirtualState column to {0}'''' )
				END
				''
				, ''{0}'', entEKSrc )
				, ''{1}'', entSrc )
				FROM	( 
							  SELECT entSrc, entEKSrc
							  FROM ENTITY
							  WHERE idEnt IN (SELECT DISTINCT idEnt FROM ENTITYKEY)
					) A
				'
	    
			EXEC spBA_Sync_ExecQueries @_sSqlSpTmp, 1, 0
		END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_AlterColumn]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_AlterColumn]( @sTableName sysname, @sColumnName sysname, @sDataType sysname, @bNull integer )
	AS
		DECLARE @sNullModifier sysname
		IF @bNull = 0
			SET @sNullModifier = ' NOT NULL'
		ELSE
			SET @sNullModifier = ' NULL'
		EXEC( 'ALTER TABLE ' + @sTableName + ' ALTER COLUMN ' + @sColumnName + ' ' + @sDataType + ' ' + @sNullModifier )
		EXEC spBA_DB_FixTableNotNullNames @sTableName, 0
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_CreateAllGuidUKs]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_CreateAllGuidUKs]
		AS
		BEGIN
			declare @_sSqlSpTmp varchar(8000)
			set @_sSqlSpTmp = '
				select REPLACE( REPLACE( REPLACE(''
					begin
						exec spBA_DB_CreateGuidUK ''''{0}'''', ''''{1}'''', ''''{2}'''', 1
					end
					'',
					''{0}'', tableName),
					''{1}'', guidColumnName),
					''{2}'', idColumnName) query
				from
					((
						select (case when e.entSrcType=3 then e.entEKSrc else e.entSrc end) tableName, 
							(''guid'' + e.entSrc) guidColumnName,
							epk.column_name idColumnName
						from entity e, vwba_sync_allpkeys epk
						where e.entType = 2  and  (case when e.entSrcType=3 then e.entEKSrc else e.entSrc end) = epk.table_name
					)) baguid left outer join (
						select dbix.*, dbixc.column_name, dbixc.ordinal_position
						from (
								select ix.table_name, ix.index_name, ix.is_unique, count(*) num_cols
								from vwba_sync_allindexes ix, vwba_sync_allindexcolumns ixc
								where ix.index_name = ixc.index_name  and  ix.table_name = ixc.table_name
								group by ix.table_name, ix.index_name, ix.is_unique
							) dbix, vwba_sync_allindexcolumns dbixc
						where dbix.index_name = dbixc.index_name  and  dbix.table_name = dbixc.table_name
							and  dbix.is_unique = 1  and  dbix.num_cols = 1  
					) ixu
					on ixu.table_name = baguid.tableName  and  ixu.column_name = baguid.guidColumnName
				where ixu.table_name is null
			'
			exec spBA_Sync_ExecQueries @_sSqlSpTmp, 1, 0
		END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_CreateAllGuidNotNulls]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_CreateAllGuidNotNulls]
		AS
		BEGIN
			declare @_sSqlSpTmp varchar(8000)
			set @_sSqlSpTmp = '
				select REPLACE( REPLACE(''
					begin
						print(''''Adding not null constraint to {0}.{1}'''')
						update {0} set {1} = newid() where {1} is null
						exec spBA_DB_DropGuidUK ''''{0}'''', ''''{1}'''', 1
						alter table {0} alter column {1} uniqueidentifier not null
					end
					'',
					''{0}'', tableName ),
					''{1}'', guidColumnName ) query
				from vwba_sync_allcolumns dbcol,
					(
						select (case when e.entSrcType=3 then e.entEKSrc else e.entSrc end) tableName, (''guid'' + e.entSrc) guidColumnName
						from entity e
						where e.entType = 2
					) baguid
				where dbcol.table_name = baguid.tableName  and  dbcol.column_name = baguid.guidColumnName
					and  (dbcol.is_nullable = 1)
			'
			exec spBA_Sync_ExecQueries @_sSqlSpTmp, 1, 0
		END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_CreateAllGuidDefaults]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_CreateAllGuidDefaults]
	AS
	BEGIN
		declare @_sSqlSpTmp varchar(8000)
		set @_sSqlSpTmp = '
			select REPLACE( REPLACE(''
				begin
					print(''''Adding guid default to {0}.{1}'''')
					exec spBA_DB_DeleteGuidDefault ''''{0}'''', ''''{1}''''
					exec spBA_DB_CreateGuidDefault ''''{0}'''', ''''{1}''''
				end
				'',
				''{0}'', tableName ),
				''{1}'', guidColumnName ) query
			from vwba_sync_allcolumns dbcol,
				(
					select (case when e.entSrcType=3 then e.entEKSrc else e.entSrc end) tableName, (''guid'' + e.entSrc) guidColumnName
					from entity e
					where e.entType = 2
				) baguid
			where dbcol.table_name = baguid.tableName  and  dbcol.column_name = baguid.guidColumnName
				and  (dbcol.column_hasdefault = 0  or  dbcol.column_default <> ''(newid())'')
		'
		exec spBA_Sync_ExecQueries @_sSqlSpTmp, 1, 0
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_CreateEntitiesDisabled]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_CreateEntitiesDisabled]
	AS
	BEGIN

		declare @_sSqlSpTmp varchar(8000)
		set @_sSqlSpTmp = '
			select replace( replace( replace( ''
			DECLARE @nCol integer
			SELECT @nCol = COUNT(*) FROM {1}INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = ''''{2}''''  AND  COLUMN_NAME = ''''dsbl{2}''''
			IF( @nCol = 0 )
			BEGIN

				PRINT( ''''BEGIN: Add Disable column to {0}'''' )

				ALTER TABLE {0} ADD dsbl{2} bit NOT NULL  CONSTRAINT {2}_DFD DEFAULT (0)
				PRINT( ''''END: Add Disable column to {0}'''' )
			END'', ''{0}'', entSrc ), ''{1}'', dbName ), ''{2}'', tableName )
			from ( select entSrc, entType, (case nPos when 0 then entSrc else right(entSrc,nPos) end) tableName, (case nPos when 0 then '''' else left(entSrc,charindex(''.'',entSrc)) end) dbName from (select entSrc, entType, (case nPos when 0 then 0 else nPos - 1 end) nPos from (select entSrc, entType, charindex(''.'',reverse(entSrc)) nPos from entity) A ) B ) C
			where entType = 2
		'
		set @_sSqlSpTmp = replace( @_sSqlSpTmp, '%''', '''''' )
		EXEC spBA_Sync_ExecQueries @_sSqlSpTmp, 1, 0
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_CreateIndexSingle]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_CreateIndexSingle]( @sTableName sysname, @sColumnName sysname, @bIsUnique bit, @sSuffix sysname, @bAvoidError bit, @bPrintMessages bit = 0 )
	AS
	BEGIN
		declare @sIndexName sysname
		declare @sIndexPrefix sysname
		declare @sNewIndexName sysname
		declare @sSql varchar(1000)
		declare @iInd integer
		declare @bOldIsUnique bit

		-- calculates index prefix
		set @sIndexPrefix = replace(replace(@sTableName, '[', ''), ']', '') + @sSuffix

		-- calculates next id
		select @iInd = max(cast(ind as integer))
		from (
			select stuff(index_name, 1, len(@sIndexPrefix), '') ind
			from vwBA_Sync_AllIndexes
			where dbo.fnBA_DB_IsValidIndexName(index_name, @sTableName, @sSuffix) = 1
		) a

		-- case when is first index
		set @iInd = case when @iInd is null then 1 else @iInd + 1 end

		-- calculates new name
		set @sNewIndexName = @sIndexPrefix + cast(@iInd as varchar(20))

		-- find if index is already created
		select @sIndexName = a.INDEX_NAME from vwBA_Sync_AllIndexColumns a,
			(select INDEX_NAME from vwBA_Sync_AllIndexColumns where TABLE_NAME = replace(replace(@sTableName, '[', ''), ']', '')  and  COLUMN_NAME = replace(replace(@sColumnName, '[', ''), ']', '') ) b
		where a.INDEX_NAME = b.INDEX_NAME  group by a.INDEX_NAME  having count(*) = 1

		-- validates if current index (if exists) is unique or not
		if @sIndexName is not null
		begin
			select @bOldIsUnique = is_unique from vwBA_Sync_AllIndexes where index_name = @sIndexName
			if @bOldIsUnique <> @bIsUnique
			begin
				-- index must be recreated with is unique specified flag

				-- drop index
				set @sSql = replace(replace(
					'drop index {0}.{1}',
					'{0}', @sTableName),
					'{1}', @sIndexName)
				if(@bPrintMessages = 1) begin print(@sSql) end
				exec( @sSql )

				-- reuse index name if is valid
				if dbo.fnBA_DB_IsValidIndexName(@sIndexName, @sTableName, @sSuffix) = 1
				begin
					set @sNewIndexName = @sIndexName
				end

				-- set to null, force create
				set @sIndexName = null
			end
		end

		if @sIndexName is null
		begin
			declare @bError bit
			set @bError = 0

			-- if unique and avoid errors, validate duplicate keys
			if @bIsUnique = 1  and  @bAvoidError = 1
			begin
				declare @nsSql nvarchar(1000)
				set @nsSql = replace(replace(
					'select @_iInd = count(*) from (select {1}, count(*) num_count_asterisk from {0} group by {1} having count(*) > 1) a',
					'{0}', @sTableName),
					'{1}', @sColumnName)
				exec sp_executesql @nsSql, N'@_iInd integer output', @_iInd = @iInd out

				if @iInd > 0
				begin
					-- duplicate keys found
					set @sSql = '**** ERROR: Cannot create unique index on ' + @sTableName + '.' + @sColumnName + ' because a duplicate key was found'
					raiserror( @sSql, 16, 1 )
					set @bError = 1
				end
			end

			-- if not unique, or unique and no errors, or not avoid errors
			if @bError = 0
			begin
				-- index doesn't exists, create it
				set @sSql = replace(replace(replace(replace(
					'create {3} index {0} on {1}( {2} ) on [PRIMARY]',
					'{0}', @sNewIndexName),
					'{1}', @sTableName),
					'{2}', @sColumnName),
					'{3}', case when @bIsUnique = 1 then 'UNIQUE' else '' end)
				if(@bPrintMessages = 1) begin print(@sSql) end
				exec( @sSql )
			end
		end
		else
		begin
			-- ensure that index has a standard name
			if dbo.fnBA_DB_IsValidIndexName(@sIndexName, @sTableName, @sSuffix) = 0
			begin
				-- rename index
				set @sIndexName = @sTableName + '.' + @sIndexName
				if(@bPrintMessages = 1) begin print('sp_rename ''' + @sIndexName + ''', ''' + @sNewIndexName + ''', ''INDEX''') end
				exec sp_rename @sIndexName, @sNewIndexName, 'INDEX'
			end
		end
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_SQL_UpdateRefsAndContents]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_SQL_UpdateRefsAndContents]
			@RefsTable ReferencesTable READONLY,
			@ContentsTable NewContentsTable  READONLY
			AS
			BEGIN
				SET NOCOUNT ON;
		
				SET TRANSACTION ISOLATION LEVEL SNAPSHOT
				BEGIN TRANSACTION;	 
		
				MERGE BABIZAGICATALOG BizagiCatalog
				USING @ContentsTable Tmp ON Tmp.rootObject = BizagiCatalog.rootObject AND Tmp.guidObject = BizagiCatalog.guidObject
				WHEN MATCHED THEN UPDATE SET objContent = Tmp.objContentExpanded;
			
				MERGE BACATALOGREFERENCE BizagiCatalogReference
				USING @RefsTable Tmp ON Tmp.rootObject = BizagiCatalogReference.rootObject AND Tmp.guidObjectRef = BizagiCatalogReference.guidObjectRef AND Tmp.guidObjectTarget = BizagiCatalogReference.guidObjectTarget
				WHEN MATCHED THEN UPDATE SET guidPointer = Tmp.guidPointer
				WHEN NOT MATCHED THEN
					INSERT (rootObject,guidPointer, guidObjectRef, guidObjectTarget) VALUES(
						Tmp.rootObject, Tmp.guidPointer, Tmp.guidObjectRef, Tmp.guidObjectTarget);
			
				IF NOT EXISTS(SELECT 1 FROM @ContentsTable WHERE guidObject IN( SELECT guidObjectRef from @RefsTable))
				BEGIN			
					UPDATE BACATALOGREFERENCE SET deleted = 1 WHERE guidObjectRef IN (SELECT guidObject FROM @ContentsTable WHERE guidObject NOT IN( SELECT guidObjectRef from @RefsTable));
				END
	
				COMMIT
						
			END
GO
/****** Object:  StoredProcedure [dbo].[spBA_SQL_ScriptRecreateTableWithoutIdentity]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_SQL_ScriptRecreateTableWithoutIdentity]
		( 
			@sTableName sysname,
			@sSqlScriptStart varchar(8000) output,
			@sSqlScriptCreate varchar(8000) output,
			@sSqlScriptEnd varchar(8000) output
		)
		AS
		BEGIN
			declare @sSqlDropFKs varchar(8000), @sSqlCreateFKs varchar(8000), @sSqlCreateTable varchar(8000)
			declare @sSql varchar(8000), @sTmp varchar(8000), @sTempTableName sysname
			declare @sBufferStart varchar(8000), @sBufferCreate varchar(8000), @sBufferEnd varchar(8000)
			set @sBufferStart = ''
			set @sBufferCreate = ''
			set @sBufferEnd = ''
			set @sTempTableName = 'tpBA_' + @sTableName
	
			--  1. Get Scripts for drop and create FKs where table is Parent
			-- drops
			set @sSql = '
				select replace(replace(
					''alter table {0} drop constraint {1}'' + char(13),
					''{0}'', fktable_name),
					''{1}'', fk_name)
				from fnba_sync_allfkeys() fks
				where fks.fk_name not in (select a.fk_name from fnba_sync_allfkeys() a where a.key_seq > 1) and
					pktable_name = ''' + @sTableName + '''  and  pktable_name <> fktable_name
				'
			exec spBA_DB_ConcatRows @sSql, @sSqlDropFKs output;
			-- creates
			set @sSql = '
				select replace(replace(replace(replace(replace(replace(replace(replace(
					''alter table {0} with check add constraint {1} foreign key ({2}) references {3} ({4}){5}{6}{7}'' + char(13),
					''{0}'', fktable_name),
					''{1}'', fk_name),
					''{2}'', fkcolumn_name),
					''{3}'', pktable_name),
					''{4}'', pkcolumn_name),
					''{5}'', case when update_rule = 0 then '' ON UPDATE CASCADE'' else '''' end),
					''{6}'', case when delete_rule = 0 then '' ON DELETE CASCADE'' else '''' end),
					''{7}'', case when objectproperty(object_id(fk_name),''CnstIsNotRepl'') = 1 then '' NOT FOR REPLICATION'' else '''' end)
				from fnba_sync_allfkeys() fks
				where fks.fk_name not in (select a.fk_name from fnba_sync_allfkeys() a where a.key_seq > 1) and
					pktable_name = ''' + @sTableName + '''  and  pktable_name <> fktable_name
				'
			exec spBA_DB_ConcatRows @sSql, @sSqlCreateFKs output;
	
			--  2. Write Script to drop FKs where table is Parent
			set @sBufferStart = @sBufferStart + char(13) + @sSqlDropFKs
	
			--  3. Get Script to create table
			exec spBA_SQL_ScriptCreateTable @sTableName, @sSqlCreateTable output;
	
			--  4. Write Script to create temporary table with contents
			set @sSql = replace(replace('
				if exists(select 1 from information_schema.tables where table_name = ''{0}'') begin drop table {0} end
				select * into {0} from {1}
				',
				'{0}', @sTempTableName),
				'{1}', @sTableName)
			set @sBufferStart = @sBufferStart + char(13) + @sSql
	
			--  5. Write Script to drop table
			-- Create object contains this drop
			-- set @sSql = 'drop table ' + @sTableName
			-- set @sBufferStart = @sBufferStart + char(13) + @sSql
	
			--  6. Write Script to create table
			set @sBufferCreate = @sBufferCreate + char(13) + @sSqlCreateTable
	
			--  7. Write Script to insert data from temporary to new table
			-- column list
			set @sSql = 'select ''['' + column_name + ''],'' from information_schema.columns where table_name = ''' + @sTableName + ''''
			exec spBA_DB_ConcatRows @sSql, @sTmp output;
			set @sTmp = substring(@sTmp, 1, len(@sTmp)-1)
			-- insert statement
			set @sTmp = replace(replace(replace(
				'insert into {0} ({2}) select {2} from {1}',
				'{0}', @sTableName),
				'{1}', @sTempTableName),
				'{2}', @sTmp)
			-- identity deactivation / activation
			if exists(select 1 from vwBA_Sync_AllIdentities where table_name = @sTableName)
			begin
				set @sBufferCreate = replace(@sBufferCreate, 'IDENTITY (1, 1) ', '')
			end
			set @sBufferEnd = @sBufferEnd + char(13) + @sTmp
	
			--  8. Write Script to create FKs where table is Parent
			set @sBufferEnd = @sBufferEnd + char(13) + @sSqlCreateFKs
	
			--  9. Write Script to drop temporary table
			set @sSql = 'drop table ' + @sTempTableName
			set @sBufferEnd = @sBufferEnd + char(13) + @sSql
	
			-- return value
			set @sSqlScriptStart = @sBufferStart
			set @sSqlScriptCreate = @sBufferCreate
			set @sSqlScriptEnd = @sBufferEnd
		END
GO
/****** Object:  StoredProcedure [dbo].[spBA_SQL_ScriptRecreateTable]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_SQL_ScriptRecreateTable]
	( 
		@sTableName sysname,
		@sSqlScriptStart varchar(8000) output,
		@sSqlScriptCreate varchar(8000) output,
		@sSqlScriptEnd varchar(8000) output
	)
	AS
	BEGIN
		declare @sSqlDropFKs varchar(8000), @sSqlCreateFKs varchar(8000), @sSqlCreateTable varchar(8000)
		declare @sSql varchar(8000), @sTmp varchar(8000), @sTempTableName sysname
		declare @sBufferStart varchar(8000), @sBufferCreate varchar(8000), @sBufferEnd varchar(8000)
		set @sBufferStart = ''
		set @sBufferCreate = ''
		set @sBufferEnd = ''
		set @sTempTableName = 'tpBA_' + @sTableName

		--  1. Get Scripts for drop and create FKs where table is Parent
		-- drops
		set @sSql = '
			select replace(replace(
				''alter table {0} drop constraint {1}'' + char(13),
				''{0}'', fktable_name),
				''{1}'', fk_name)
			from fnba_sync_allfkeys() fks
			where fks.fk_name not in (select a.fk_name from fnba_sync_allfkeys() a where a.key_seq > 1) and
				pktable_name = ''' + @sTableName + '''  and  pktable_name <> fktable_name
			'
		exec spBA_DB_ConcatRows @sSql, @sSqlDropFKs output;
		-- creates
		set @sSql = '
			select replace(replace(replace(replace(replace(replace(replace(replace(
				''alter table {0} with check add constraint {1} foreign key ({2}) references {3} ({4}){5}{6}{7}'' + char(13),
				''{0}'', fktable_name),
				''{1}'', fk_name),
				''{2}'', fkcolumn_name),
				''{3}'', pktable_name),
				''{4}'', pkcolumn_name),
				''{5}'', case when update_rule = 0 then '' ON UPDATE CASCADE'' else '''' end),
				''{6}'', case when delete_rule = 0 then '' ON DELETE CASCADE'' else '''' end),
				''{7}'', case when objectproperty(object_id(fk_name),''CnstIsNotRepl'') = 1 then '' NOT FOR REPLICATION'' else '''' end)
			from fnba_sync_allfkeys() fks
			where fks.fk_name not in (select a.fk_name from fnba_sync_allfkeys() a where a.key_seq > 1) and
				pktable_name = ''' + @sTableName + '''  and  pktable_name <> fktable_name
			'
		exec spBA_DB_ConcatRows @sSql, @sSqlCreateFKs output;

		--  2. Write Script to drop FKs where table is Parent
		set @sBufferStart = @sBufferStart + char(13) + @sSqlDropFKs

		--  3. Get Script to create table
		exec spBA_SQL_ScriptCreateTable @sTableName, @sSqlCreateTable output;

		--  4. Write Script to create temporary table with contents
		set @sSql = replace(replace('
			if exists(select 1 from information_schema.tables where table_name = ''{0}'') begin drop table {0} end
			select * into {0} from {1}
			',
			'{0}', @sTempTableName),
			'{1}', @sTableName)
		set @sBufferStart = @sBufferStart + char(13) + @sSql

		--  5. Write Script to drop table
		-- Create object contains this drop
		-- set @sSql = 'drop table ' + @sTableName
		-- set @sBufferStart = @sBufferStart + char(13) + @sSql

		--  6. Write Script to create table
		set @sBufferCreate = @sBufferCreate + char(13) + @sSqlCreateTable

		--  7. Write Script to insert data from temporary to new table
		-- column list
		set @sSql = 'select column_name + '','' from information_schema.columns where table_name = ''' + @sTableName + ''''
		exec spBA_DB_ConcatRows @sSql, @sTmp output;
		set @sTmp = substring(@sTmp, 1, len(@sTmp)-1)
		-- insert statement
		set @sTmp = replace(replace(replace(
			'insert into {0} ({2}) select {2} from {1}',
			'{0}', @sTableName),
			'{1}', @sTempTableName),
			'{2}', @sTmp)
		-- identity deactivation / activation
		if exists(select 1 from vwBA_Sync_AllIdentities where table_name = @sTableName)
		begin
			set @sTmp = 
				'set identity_insert ' + @sTableName + ' on' + char(13) + 
				@sTmp + char(13) + 
				'set identity_insert ' + @sTableName + ' off'
		end
		set @sBufferEnd = @sBufferEnd + char(13) + @sTmp

		--  8. Write Script to create FKs where table is Parent
		set @sBufferEnd = @sBufferEnd + char(13) + @sSqlCreateFKs

		--  9. Write Script to drop temporary table
		set @sSql = 'drop table ' + @sTempTableName
		set @sBufferEnd = @sBufferEnd + char(13) + @sSql

		-- return value
		set @sSqlScriptStart = @sBufferStart
		set @sSqlScriptCreate = @sBufferCreate
		set @sSqlScriptEnd = @sBufferEnd
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_Sync_ValBASch_WrongFKs]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_Sync_ValBASch_WrongFKs]
	AS
	BEGIN
		declare @_sSqlSpTmp varchar(8000)

		-- Invalid foreign key direction
		set @_sSqlSpTmp = '
		select replace(''
			print(''''***Warning BADBUpgrd-Gen-012: Foreign key {0} is invalid, it relates data table as parent with metadata table as child '''')
			RAISERROR (''''BADBUpgrd-Gen-012: Foreign key {0} is invalid, it relates data table as parent with metadata table as child '''', 16, 1)
			'',
			''{0}'', fk_name)
		from (
			select vf.*
			from vwba_sync_allfkeys vf
			where vf.ordinal = 1
		) a
		'
		exec spBA_Sync_ExecQueries @_sSqlSpTmp, 1, 0
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_Sync_ValBASch_TblsExists]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_Sync_ValBASch_TblsExists]
		AS

		BEGIN

			declare @_sSqlSpTmp varchar(8000)

			-- All BizAgi and Entity tables exists in DB
			set @_sSqlSpTmp = '
			select replace(''

				PRINT(''''***Warning BADBUpgrd-Gen-002: Table {0} does not exists in database '''')

				RAISERROR (''''BADBUpgrd-Gen-002: Table {0} does not exists in database '''', 16, 1)
				'',
				''{0}'', table_name)
			from (
				select a.TABLE_NAME

				from (
					(select entSrc TABLE_NAME from ENTITY)
					union all
					(select ''PVCL'' + SUBSTRING(entSrc,3,LEN(entSrc)-2) TABLE_NAME from ENTITY where entType = 0)
					union all
					(select compEnt.entEKSrc TABLE_NAME from entity compEnt, entitykey compKey where compEnt.idEnt = compKey.idEnt)
					union all
					(select factSrc TABLE_NAME from FACT where idFactRelationType = 2)

				) a
				where a.TABLE_NAME not in (select b.TABLE_NAME from information_schema.tables b)
			) c
			'
			exec spBA_Sync_ExecQueries @_sSqlSpTmp, 1, 0
		END
GO
/****** Object:  StoredProcedure [dbo].[spBA_Sync_ValBASch_SinglePKs]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_Sync_ValBASch_SinglePKs]
		AS
		BEGIN

			declare @_sSqlSpTmp varchar(8000)

			-- Tables have single column primary key
			set @_sSqlSpTmp = '
			select replace(''

				print(''''***Warning BADBUpgrd-Gen-004: Table {0} does not have single column primary key '''')

				RAISERROR (''''BADBUpgrd-Gen-004: Table {0} does not have single column primary key '''', 16, 1)
				'',
				''{0}'', table_name)

			from (

				select a.TABLE_NAME

				from (
					(select (case when compKey.idEnt is not null then compEnt.entEKSrc else compEnt.entSrc end) TABLE_NAME from entity compEnt left outer join entitykey compKey on compEnt.idEnt = compKey.idEnt group by compEnt.entSrc, compEnt.entEKSrc, compKey.idEnt )
					union
					(select ''PVCL'' + SUBSTRING(entSrc,3,LEN(entSrc)-2) TABLE_NAME from ENTITY where entType = 0)

				) a, vwBA_Sync_AllPkeys b

				where a.TABLE_NAME = b.TABLE_NAME
				group by a.TABLE_NAME
				having count(*) <> 1
			) c
			'
			exec spBA_Sync_ExecQueries @_sSqlSpTmp, 1, 0
		END
GO
/****** Object:  StoredProcedure [dbo].[spBA_Sync_ValBASch_PKsExists]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_Sync_ValBASch_PKsExists]
		AS

		BEGIN

			declare @_sSqlSpTmp varchar(8000)

			-- All BizAgi and Entity tables have primary key
			set @_sSqlSpTmp = '
			select replace(''

				PRINT(''''***Warning BADBUpgrd-Gen-003: Table {0} does not have primary key '''')

				RAISERROR (''''BADBUpgrd-Gen-003: Table {0} does not have primary key '''', 16, 1)
				'',
				''{0}'', table_name)

			from (

				select a.TABLE_NAME
				from (
					(select entSrc TABLE_NAME from ENTITY)
					union all
					(select ''PVCL'' + SUBSTRING(entSrc,3,abs(LEN(entSrc)-2)) TABLE_NAME from ENTITY where entType = 0)
					union all
					(select compEnt.entEKSrc TABLE_NAME from entity compEnt, entitykey compKey where compEnt.idEnt = compKey.idEnt)
					union all
					(select factSrc TABLE_NAME from FACT where idFactRelationType = 2)
				) a
				where a.TABLE_NAME not in (''BAFForumsRead'', ''BAFModerationAction'', ''BAFModerationAudit'', ''BAFPost_Archive'', ''BAFPostsRead'', ''BAFPrivateForums'', ''BAFUsersInRoles'', ''BAFVote'', ''USERCACHE'')  and
					a.TABLE_NAME not in (select b.table_name from vwBA_Sync_AllPkeys b)
			) c
			'
			exec spBA_Sync_ExecQueries @_sSqlSpTmp, 1, 0
		END
GO
/****** Object:  StoredProcedure [dbo].[spBA_Sync_ValBASch_NotPKAndFK]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_Sync_ValBASch_NotPKAndFK]
	AS
	BEGIN
		declare @_sSqlSpTmp varchar(8000)

		-- PKs that are FKs to another table simultaneously
		set @_sSqlSpTmp = '
		select replace(replace(''
			print(''''***Warning BADBUpgrd-Gen-013: Primary key {0}.{1} is invalid, it is primary key and foreign key to another table simultaneously '''')
			RAISERROR (''''BADBUpgrd-Gen-013: Primary key {0}.{1} is invalid, it is primary key and foreign key to another table simultaneously '''', 16, 1)
			'',
			''{0}'', table_name),
			''{1}'', column_name)
		from (
			select table_name, column_name
			from vwba_sync_allpkeys pk
			where upper(table_name + ''.'' + column_name) in (select upper(fk_table_name + ''.'' + fk_column_name) from vwba_sync_allfkeys)
		) a
		'
		exec spBA_Sync_ExecQueries @_sSqlSpTmp, 1, 0
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_Sync_ValBASch_ColTypeVal]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_Sync_ValBASch_ColTypeVal]
	AS
	BEGIN
		declare @_sSqlSpTmp varchar(8000)

		-- All Columns in BizAgi tables has valid (supported) data types
		set @_sSqlSpTmp = '
		select replace(replace(replace(''
			BEGIN
				print(''''***Warning BADBUpgrd-Gen-009: Column {1}.{2} has an unsupported data type - {3} '''')
				RAISERROR (''''BADBUpgrd-Gen-009: Column {1}.{2} has an unsupported data type - {3} '''', 16, 1)
			END
			'',
			''{1}'', table_name),
			''{2}'', column_name),
			''{3}'', data_Type)
		from (
			select table_name, column_name, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, NUMERIC_PRECISION, NUMERIC_SCALE
			from vwba_sync_allcolumns
			where
				DATA_TYPE not in (
					select sqlType
					from (
						select 1 attribType, ''bigint'' sqlDisplayType, ''bigint'' sqlType
						union all select 2, ''int'', ''int''
						union all select 3, ''smallint'', ''smallint''
						union all select 4, ''tinyint'', ''tinyint''
						union all select 5, ''bit'', ''bit''
						union all select 6, ''decimal'', ''decimal''
						union all select 7, ''numeric'', ''numeric''
						union all select 8, ''money'', ''money''
						union all select 10, ''float'', ''float''
						union all select 11, ''real'', ''real''
						union all select 12, ''datetime'', ''datetime''
						union all select 13, ''smalldatetime'', ''smalldatetime''
						union all select 14, ''char'', ''char''
						union all select 15, ''varchar'', ''varchar''
						union all select 16, ''text'', ''text''
						union all select 17, ''image'', ''image''
						union all select 18, ''binary'', ''binary''
						union all select 19, ''varbinary'', ''varbinary''
						union all select 20, ''uniqueidentifier'', ''uniqueidentifier''
						union all select 21, ''numeric'', ''numeric''
						union all select 22, ''nvarchar'', ''nvarchar''
						union all select 23, ''ntext'', ''ntext''
					) a
				)
		) c
		'
		exec spBA_Sync_ExecQueries @_sSqlSpTmp, 1, 0
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_SQL_ImportPackage]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_SQL_ImportPackage]
				@IEObjectsTable IEObjectsTable READONLY ,
				@IEReferencesTable IEReferencesTable READONLY,
				@IEIndexesTable IEIndexesTable READONLY , 
				@IDTagsTable IETagsTable READONLY,
				@TransaccionRequired BIT
			AS
			BEGIN
			SET NOCOUNT ON;
			IF @TransaccionRequired = 1
			BEGIN
				SET TRANSACTION ISOLATION LEVEL SNAPSHOT
				BEGIN TRANSACTION
			END
	
				DELETE FROM BABIZAGICATALOG WHERE rootObject IN (SELECT DISTINCT(rootObject) FROM @IEObjectsTable);
		
				INSERT INTO BABIZAGICATALOG (guidObject,guidObjectParent,objName,objContent,objType,objTypeName,deployOnParent,modifiedDate,
						   modifiedByUser,mtdVersion,rootObject,changeSetId,objContentResolved,deleted,contentFormat)
				SELECT 	   guidObject,guidObjectParent,objName,objContent,objType,objTypeName,deployOnParent,modifiedDate,modifiedByUser,
						   mtdVersion,rootObject,changeSetId,objContentResolved,deleted,contentFormat
				FROM @IEObjectsTable;

				DELETE FROM BACATALOGREFERENCE WHERE rootObject IN (SELECT DISTINCT(rootObject) FROM @IEObjectsTable);
			
				INSERT INTO BACATALOGREFERENCE(rootObject, guidPointer,guidObjectRef,guidObjectTarget,deleted)
				SELECT rootObject, guidPointer, guidObjectRef ,guidObjectTarget ,deleted FROM @IEReferencesTable;
			
				DELETE FROM BACATALOGINDEXEDOBJECTS WHERE rootObject IN (SELECT DISTINCT(rootObject) FROM @IEObjectsTable);
			
				INSERT INTO BACATALOGINDEXEDOBJECTS (rootObject, name,sourceGuid,targetGuid,deleted)
				SELECT rootObject,name,sourceGuid,targetGuid,deleted FROM @IEIndexesTable;
			
				DELETE FROM BATAGVALUE WHERE rootObject IN (SELECT DISTINCT(rootObject) FROM @IEObjectsTable);
			
				INSERT INTO BATAGVALUE (rootObject, tagType, tagName ,taggedObject ,value ,deleted)
				SELECT rootObject, tagType, tagName ,taggedObject ,value ,deleted FROM @IDTagsTable;
			IF @TransaccionRequired = 1
				COMMIT;					
		END
GO
/****** Object:  StoredProcedure [dbo].[spBA_SQL_GrantWebAppToWindowsUser]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- @sUserName must be a valid windows user (domain\user)
	CREATE PROCEDURE [dbo].[spBA_SQL_GrantWebAppToWindowsUser](@sUserName varchar(256)) AS
	BEGIN
		if not exists (select * from dbo.sysusers where name = @sUserName and uid < 16382)
		begin
			-- grant login
			exec sp_grantlogin @sUserName
		end

		-- grant privileges
		exec spBA_SQL_GrantWebAppPrivsToUser @sUserName
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_SQL_GrantExecBizAgiSPs]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- @sUserName can be sql server login, role or windows user (domain\user)
	CREATE PROCEDURE [dbo].[spBA_SQL_GrantExecBizAgiSPs](@sUserName varchar(256)) AS
	BEGIN
		-- UNDONE: Classify SPs by DDL/MDL criteria
		declare @sSql varchar(8000)
		set @sSql = '
		select replace(replace(replace(
			''GRANT {2} ON {0} TO {1}'', 
			''{0}'', missperm.name), 
			''{1}'', ''{sUserName}''),
			''{2}'', case when xtype in (''P'',''FN'') then ''EXECUTE'' when xtype in (''TF'',''IF'') then ''SELECT'' else ''EXECUTE'' end)
		from (
			select baspfn.*, prms.grantee, prms.EXEC_PERM
			from (
				select a.id, a.name, a.xtype
				from dbo.sysobjects a
				where (a.name like ''spba\_%'' escape ''\''  and  (OBJECTPROPERTY(id, N''IsProcedure'') = 1))  or
					(a.name like ''fnba\_%'' escape ''\''  and  (xtype in (N''FN'', N''IF'', N''TF'')))  or
					(a.name in (''Maintenance_ResetForumGroupsForInsert'',''Statistics_ResetForumStatistics'',''Statistics_ResetTopPosters'',''Statistics_UpdateForumStatistics'',''forums_DeletePostAndChildren'')  and  (OBJECTPROPERTY(id, N''IsProcedure'') = 1))  or
					(a.name in (''HasReadPost'')  and  (xtype in (N''FN'', N''IF'', N''TF'')))
			) baspfn left outer join (
				select o.id, o.name, user_name(grantee) grantee, 
					CASE 
						WHEN (actadd & 32) = 32 THEN ''Granted''
						WHEN (actmod & 32) = 32 THEN ''Denied''
						ELSE ''Revoked''
					END EXEC_PERM
				from syspermissions p inner join sysobjects o on p.id=o.id
				where ( ((OBJECTPROPERTY(o.id, N''IsProcedure'') = 1)  OR  (o.xtype in (N''FN'', N''IF'', N''TF''))) )  and
					user_name(grantee) = ''{sUserName}''
			) prms on baspfn.id = prms.id
		) missperm
		where grantee is null
		UNION
			select 
				CASE 
					WHEN (CONVERT(INT, SUBSTRING(ver, 1, CHARINDEX(''.'', ver) - 1)))  >= 9 THEN ''GRANT VIEW DEFINITION TO {sUserName}''
					else ''--NOTHING TODO'' 
				END
			from (select CONVERT(char(20), SERVERPROPERTY(''productversion'')) ver) a
		'
		set @sSql = replace(@sSql, '{sUserName}', @sUserName)
		exec spBA_Sync_ExecQueries @sSql
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_SQL_CreateWebAppSqlSrvUser]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- @sUserName must be a valid sql server login (without '\')
	CREATE PROCEDURE [dbo].[spBA_SQL_CreateWebAppSqlSrvUser](@sUserName varchar(256), @sUserPassword varchar(256)) AS
	BEGIN
		if not exists (select * from dbo.sysusers where name = @sUserName and uid < 16382)
		begin
			-- create login
			exec sp_addlogin @sUserName, @sUserPassword
		end
		else
		begin
			-- change password
			exec sp_password NULL, @sUserPassword, @sUserName
		end

		-- grant privileges
		exec spBA_SQL_GrantWebAppPrivsToUser @sUserName
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_SQL_CleanCatalog]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_SQL_CleanCatalog]
			AS
			BEGIN
			SET NOCOUNT ON;		
			SET TRANSACTION ISOLATION LEVEL SNAPSHOT
			DECLARE @Result AS BIT = 0
			BEGIN TRANSACTION
				
				IF OBJECT_ID('tempdb..#CatalogObjects') IS NOT NULL
					DROP TABLE #CatalogObjects

				CREATE TABLE #CatalogObjects
					(
						guidObject uniqueidentifier
					)
				
				INSERT INTO #CatalogObjects
				SELECT TOP(10000) guidObject from babizagicatalog
				WHERE deleted = 1
				
				DELETE FROM batagvalue
				WHERE taggedObject IN(SELECT guidObject FROM #CatalogObjects)
				
				DELETE FROM bacatalogindexedobjects
				WHERE targetGuid IN(SELECT guidObject FROM #CatalogObjects) or sourceGuid IN(SELECT guidObject FROM #CatalogObjects)
				
				DELETE FROM bacatalogreference
				WHERE guidObjectRef IN(SELECT guidObject FROM #CatalogObjects) 
				
				DELETE FROM babizagicatalog
				WHERE guidObject IN(SELECT guidObject FROM #CatalogObjects) 

				-------

				DELETE TOP(10000) FROM batagvalue
				WHERE deleted = 1
			
				DELETE TOP(10000) FROM bacatalogindexedobjects
				WHERE deleted = 1
			
				DELETE TOP(10000) FROM bacatalogreference
				WHERE deleted = 1
			
				DROP TABLE #CatalogObjects

				IF EXISTS (SELECT TOP (1) guidobject from babizagicatalog where deleted = 1) SET @Result = 1
				IF EXISTS (SELECT TOP (1) taggedObject from batagvalue where deleted = 1) SET @Result = 1
				IF EXISTS (SELECT TOP (1) targetGuid from bacatalogindexedobjects where deleted = 1) SET @Result = 1
				IF EXISTS (SELECT TOP (1) guidObjectRef from bacatalogreference where deleted = 1) SET @Result = 1

				SELECT @Result
			
			COMMIT;					
		END
GO
/****** Object:  StoredProcedure [dbo].[spBA_SQL_BizagiCatalogMerge]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_SQL_BizagiCatalogMerge]
								@ObjectCatalog BizagiCatalogType READONLY,
								@ObjectTags TagValueType READONLY,
								@ObjectIndexes CatalogIndexedObjectsType READONLY,
								@RootObject uniqueidentifier = NULL,
								@ChangeSetId INT = 0			
								AS
								DECLARE @Deleted int		
								SET @Deleted = 1;
								SET NOCOUNT ON;
								SET TRANSACTION ISOLATION LEVEL SNAPSHOT
								BEGIN TRANSACTION;
									MERGE BABIZAGICATALOG AS BizagiCatalog
									USING @ObjectCatalog Tmp ON Tmp.rootObject = BizagiCatalog.rootObject AND Tmp.guidObject = BizagiCatalog.guidObject
									WHEN MATCHED THEN
										UPDATE SET	guidObjectParent   = Case Tmp.updateContent when 0 then Tmp.guidObjectParent else BizagiCatalog.guidObjectParent end,
													objName			 = Case Tmp.updateContent when 0 then Tmp.objName else BizagiCatalog.objName end,               
													objContent         = Tmp.objContent,               								       
													deployOnParent     = Case Tmp.updateContent when 0 then Tmp.deployOnParent else BizagiCatalog.deployOnParent end,               
													modifiedDate       = Tmp.modifiedDate,       
													modifiedByUser     = Tmp.modifiedByUser,               
													mtdVersion         = Case Tmp.updateContent when 0 then Tmp.mtdVersion else BizagiCatalog.mtdVersion end,
													changeSetId        = Tmp.changeSetId, 
													objContentResolved = Tmp.objContentResolved, 
													deleted            = Case Tmp.updateContent when 0 then Tmp.deleted else BizagiCatalog.deleted end,
													contentFormat		 = Tmp.contentFormat      
									WHEN NOT MATCHED THEN
										INSERT (guidObject,guidObjectParent,objName,objContent,objType, objTypeName,deployOnParent,modifiedDate,
												modifiedByUser,mtdVersion,rootObject,changeSetId,objContentResolved,deleted, contentFormat)
										VALUES
												(Tmp.guidObject,Tmp.guidObjectParent,Tmp.objName,Tmp.objContent,Tmp.objType,Tmp.objTypeName,Tmp.deployOnParent,Tmp.modifiedDate,
												Tmp.modifiedByUser,Tmp.mtdVersion,Tmp.rootObject,Tmp.changeSetId,Tmp.objContentResolved,Tmp.deleted, Tmp.contentFormat)
				
									OPTION (LOOP JOIN);
		
									MERGE INTO BATAGVALUE A
									USING @ObjectCatalog Tmp ON Tmp.rootObject = A.rootObject AND Tmp.guidObject = A.taggedObject
									WHEN MATCHED THEN
										UPDATE SET deleted = @Deleted;
			
									INSERT INTO BATAGVALUE (rootObject,tagType,tagName,taggedObject,value) SELECT rootObject,tagType,tagName,taggedObject,value FROM  @ObjectTags;	
			
									MERGE INTO BACATALOGINDEXEDOBJECTS A
									USING @ObjectCatalog Tmp ON Tmp.rootObject = A.rootObject AND Tmp.guidObject = A.targetGuid
									WHEN MATCHED THEN
										UPDATE SET deleted = @Deleted;
		
									INSERT INTO BACATALOGINDEXEDOBJECTS (rootObject, name,sourceGuid,targetGuid) SELECT rootObject,name,sourceGuid,targetGuid FROM  @ObjectIndexes;
				
									--MERGE INTO BACATALOGREFERENCE A
									--USING @ObjectCatalog Tmp ON Tmp.rootObject = A.rootObject AND Tmp.guidObject = A.guidObjectRef
									--WHEN MATCHED THEN
									--	UPDATE SET deleted = @Delete
				
									IF @RootObject IS NOT NULL
									BEGIN
										UPDATE BABIZAGICATALOG SET changeSetId = @ChangeSetId WHERE rootObject = @RootObject AND guidObject = @RootObject;
									END

								COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[spBA_Sync_CreateEntityGuids]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_Sync_CreateEntityGuids]
	AS
	  declare @_sSqlSpTmp varchar(8000)
	  set @_sSqlSpTmp = 'select replace( replace( replace( ''
		 DECLARE @nCol integer
		 SELECT @nCol = COUNT(*) FROM {1}INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = %''{2}%''  AND  COLUMN_NAME = %''guid{2}%''
		 IF( @nCol = 0 )
		 BEGIN
			PRINT( %''BEGIN: Add Guid column to {0}%'' )
			ALTER TABLE {0} ADD guid{2} uniqueidentifier NULL
			ALTER TABLE {0} ADD CONSTRAINT {2}_DFG DEFAULT (newid()) FOR guid{2}
			EXEC( %''UPDATE {0} SET guid{2} = NEWID() WHERE guid{2} IS NULL%'' )
			PRINT( %''END: Add Guid column to {0}%'' )
		 END'', ''{0}'', entSrc ), ''{1}'', dbName ), ''{2}'', tableName ) 
		 from ( select entSrc, entType, (case nPos when 0 then entSrc else right(entSrc,nPos) end) tableName, (case nPos when 0 then '''' else left(entSrc,charindex(''.'',entSrc)) end) dbName from (select entSrc, entType, (case nPos when 0 then 0 else nPos - 1 end) nPos from (select entSrc, entType, charindex(''.'',reverse(entSrc)) nPos from entity) A ) B ) C 
		 where entType = 2
	  '
	  set @_sSqlSpTmp = replace( @_sSqlSpTmp, '%''', '''''' )
	  EXEC spBA_Sync_ExecQueries @_sSqlSpTmp, 1, 0
GO
/****** Object:  Table [dbo].[ORG]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORG](
	[idOrg] [int] IDENTITY(1,1) NOT NULL,
	[orgName] [nvarchar](26) NOT NULL,
	[orgCreationDate] [datetime] NOT NULL,
	[guidOrganization] [uniqueidentifier] NOT NULL,
	[idHolidaySchema] [int] NULL,
	[idWorkingTimeSchema] [int] NULL,
	[dplyOrganization] [tinyint] NOT NULL,
	[idTimeZone] [int] NULL,
	[finalEnt] [int] NOT NULL,
 CONSTRAINT [ORG_PK] PRIMARY KEY CLUSTERED 
(
	[idOrg] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ORG_UK1] UNIQUE NONCLUSTERED 
(
	[orgName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ORG_UKG] UNIQUE NONCLUSTERED 
(
	[guidOrganization] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ORG_FK_IDX_1] ON [dbo].[ORG] 
(
	[idTimeZone] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ORG_FK_IDX_2] ON [dbo].[ORG] 
(
	[idHolidaySchema] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ORG_FK_IDX_3] ON [dbo].[ORG] 
(
	[idWorkingTimeSchema] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LGMDDATA]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LGMDDATA](
	[idLgMdData] [int] IDENTITY(10000,1) NOT NULL,
	[idLgMetadata] [int] NOT NULL,
	[idLgLanguage] [int] NOT NULL,
	[idSurrogateKey] [int] NOT NULL,
	[resValue] [nvarchar](255) NOT NULL,
	[guidLgMdData] [uniqueidentifier] NOT NULL,
	[dplyLgMdData] [tinyint] NOT NULL,
 CONSTRAINT [LGMDDATA_PK] PRIMARY KEY CLUSTERED 
(
	[idLgMdData] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [LGMDDATA_UK1] UNIQUE NONCLUSTERED 
(
	[idLgMetadata] ASC,
	[idLgLanguage] ASC,
	[idSurrogateKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [LGMDDATA_UKG] UNIQUE NONCLUSTERED 
(
	[guidLgMdData] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_SqlSrv_IndexColDefTable]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_SqlSrv_IndexColDefTable](@sTableName sysname, @sColumnNamesList varchar(8000)) RETURNS @retfnBA_SqlSrv_IndexColDefTable
	   TABLE (iOrdinal int, sColumnName sysname, sOrderType sysname)
	AS
	BEGIN
		delete @retfnBA_SqlSrv_IndexColDefTable

		declare @sColumnNamesListTmp varchar(8000)
		set @sColumnNamesListTmp = @sColumnNamesList

		-- parse column list 'col1,col2,col3,...' to temporal table
		declare @iTmpOrdinal integer
		set @iTmpOrdinal = 1
		while(@sColumnNamesListTmp is not null  and  len(@sColumnNamesListTmp) > 0) begin
			declare @iTmpPosComma integer
			declare @iTmpPosSpace integer

			-- find ',' in 'colName,...'
			declare @sColumnDef varchar(1000)
			set @iTmpPosComma = charindex(',', @sColumnNamesListTmp)
			if(@iTmpPosComma is not null  and  @iTmpPosComma > 0) begin
				-- ',' found, extract column
				set @sColumnDef = substring(@sColumnNamesListTmp, 1, @iTmpPosComma - 1)
				set @sColumnNamesListTmp = substring(@sColumnNamesListTmp, @iTmpPosComma + 1, len(@sColumnNamesListTmp) - @iTmpPosComma)
			end
			else begin
				-- ',' not found, this is the last column
				set @sColumnDef = @sColumnNamesListTmp
				set @sColumnNamesListTmp = ''
			end
			set @sColumnDef = ltrim(rtrim(@sColumnDef))
			set @sColumnNamesListTmp = ltrim(rtrim(@sColumnNamesListTmp))

			-- find space ' ' in 'colName ORD'
			declare @sColumnName varchar(1000)
			declare @sOrderType varchar(1000)
			-- set @iTmpPosSpace = charindex(' ', @sColumnDef)
			-- if(@iTmpPosSpace is not null  and  @iTmpPosSpace > 0) begin
			-- 	-- ' ' found, extract column and order type
			-- 	set @sColumnName = substring(@sColumnDef, 1, @iTmpPosSpace - 1)
			-- 	set @sOrderType = upper(substring(@sColumnDef, @iTmpPosSpace + 1, len(@sColumnDef) - @iTmpPosSpace))
			-- end
			-- else begin
			-- 	-- ' ' not found, assume ASC
			-- 	set @sColumnName = @sColumnDef
			-- 	set @sOrderType = upper('ASC')
			-- end
			-- set @sColumnName = dbo.fnBA_DB_UnqouteDBName(ltrim(rtrim(@sColumnName)))
			-- set @sOrderType = ltrim(rtrim(@sOrderType))

			-- always use ASC order type (DESC is not supported because create hidden column)
			set @sColumnName = dbo.fnBA_DB_UnqouteDBName(ltrim(rtrim(@sColumnDef)))
			set @sOrderType = 'ASC'

			-- add column to table
			insert into @retfnBA_SqlSrv_IndexColDefTable (iOrdinal, sColumnName, sOrderType)
			values
			(@iTmpOrdinal, @sColumnName, @sOrderType)

			set @iTmpOrdinal = @iTmpOrdinal + 1
		end
		RETURN
	END
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_DB_IsValidConstraintName]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_DB_IsValidConstraintName](@sConstraintName sysname, @sTableName sysname, @sSuffix sysname) RETURNS bit AS
	BEGIN
		declare @asConstraintName varchar(50)
		declare @asTableName varchar(50)
		declare @asSuffix varchar(50)

		declare @asConstraintPrefix varchar(50)
		declare @asConstraintSuffix varchar(50)

		declare @aiMaxNameLength integer
		declare @aiPos integer
		declare @abIsSuffixNumeric bit
		declare @abResp bit

		set @aiMaxNameLength = 128

		set @asConstraintName = @sConstraintName
		set @asTableName = dbo.fnBA_DB_UnqouteDBName(@sTableName)
		set @asSuffix = @sSuffix

		-- Find last occurence of suffix in constraint name
		set @aiPos = charindex(reverse(@asSuffix), reverse(@asConstraintName))
		if(@aiPos is not null  and  @aiPos > 0) begin
			set @aiPos = len(@asConstraintName) - len(@asSuffix) - @aiPos + 2
		end

		if(@aiPos is not null  and  @aiPos > 0) begin
			-- Test if suffix is numeric
			set @asConstraintSuffix = substring(@asConstraintName, 
				@aiPos + len(@asSuffix), 
				len(@asConstraintName) - @aiPos - len(@asSuffix) + 1)
			set @abIsSuffixNumeric = case when (isnumeric(@asConstraintSuffix) = 1  and  
				charindex('-', @asConstraintSuffix) = 0  and  
				charindex('.', @asConstraintSuffix) = 0  and  
				charindex('e', @asConstraintSuffix) = 0  and  
				charindex('E', @asConstraintSuffix) = 0) then 1 else 0 end

			if(@abIsSuffixNumeric = 1) begin
				-- test if prefix is table name
				set @asConstraintPrefix = substring(@asConstraintName, 1, @aiPos - 1)

				if(@asConstraintPrefix = @asTableName) begin
					set @abResp = 1
				end
				else begin
					-- Test if is a substring of table name
					set @abResp = case when (substring(@asTableName, 1, len(@asConstraintPrefix)) = @asConstraintPrefix)  and
						(@aiMaxNameLength = len(@asConstraintName)) then 1 else 0 end
				end
			end
			else begin
				set @abResp = 0
			end
		end
		else begin
			set @abResp = 0
		end

		return @abResp
	END
GO
/****** Object:  UserDefinedFunction [dbo].[fnBA_DB_GetGuidColumnForTable]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBA_DB_GetGuidColumnForTable](@sTableName sysname) RETURNS sysname AS
	BEGIN
		declare @sGuidColumnName sysname
		select @sGuidColumnName = baguid.guidColumnName
		from
			(
				select (case when e.entSrcType=3 then e.entEKSrc else e.entSrc end) tableName, ('guid' + e.entSrc) guidColumnName
				from entity e
				where e.entType = 2
			) baguid
		where baguid.tableName = @sTableName

		-- if not exist guid return null
		return @sGuidColumnName
	END
GO
/****** Object:  Table [dbo].[FORMCLASS]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FORMCLASS](
	[idFormClass] [int] IDENTITY(1,1) NOT NULL,
	[frmClsName] [nvarchar](26) NOT NULL,
	[guidFormClass] [uniqueidentifier] NOT NULL,
	[idEnt] [int] NULL,
	[frmClsType] [tinyint] NULL,
	[idScopeDef] [int] NULL,
	[isScopeForm] [bit] NOT NULL,
	[dplyFormClass] [tinyint] NOT NULL,
	[guidScopeDef] [uniqueidentifier] NULL,
 CONSTRAINT [FORMCLASS_PK] PRIMARY KEY CLUSTERED 
(
	[idFormClass] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [FORMCLASS_UKG] UNIQUE NONCLUSTERED 
(
	[guidFormClass] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [FORMCLASS_FK_IDX_1] ON [dbo].[FORMCLASS] 
(
	[idScopeDef] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [FORMCLASS_FK_IDX_2] ON [dbo].[FORMCLASS] 
(
	[idEnt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [FORMCLASS_FK_IDX_3] ON [dbo].[FORMCLASS] 
(
	[frmClsType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FORM]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FORM](
	[idForm] [int] IDENTITY(1,1) NOT NULL,
	[frmDisplayName] [nvarchar](40) NOT NULL,
	[frmDescription] [nvarchar](100) NULL,
	[frmHelpText] [nvarchar](100) NULL,
	[frmJS] [varchar](7600) NULL,
	[guidForm] [uniqueidentifier] NOT NULL,
	[IsWizard] [bit] NULL,
	[frmPromptUsrConf] [bit] NULL,
	[frmTimestamp] [datetime] NULL,
	[frmVersion] [nvarchar](16) NULL,
	[idFormClass] [int] NOT NULL,
	[idFormParentVersion] [int] NULL,
	[dplyForm] [tinyint] NOT NULL,
	[IsAdministrable] [bit] NOT NULL,
	[IsReusable] [bit] NOT NULL,
	[qfSearchAllUsers] [bit] NOT NULL,
	[isQueryForm] [bit] NOT NULL,
	[idScopeDef] [int] NULL,
	[guidScopeDef] [uniqueidentifier] NULL,
 CONSTRAINT [FORM_PK] PRIMARY KEY CLUSTERED 
(
	[idForm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [FORM_UK1] UNIQUE NONCLUSTERED 
(
	[idFormClass] ASC,
	[frmVersion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [FORM_UKG] UNIQUE NONCLUSTERED 
(
	[guidForm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [FORM_FK_IDX_1] ON [dbo].[FORM] 
(
	[idScopeDef] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [FORM_FK_IDX_2] ON [dbo].[FORM] 
(
	[idFormParentVersion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ENTITYSCHEMAXSL]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ENTITYSCHEMAXSL](
	[idEntitySchemaXsl] [int] IDENTITY(10000,1) NOT NULL,
	[idEntitySchema] [int] NOT NULL,
	[xslName] [nvarchar](26) NOT NULL,
	[xslDescription] [nvarchar](100) NULL,
	[xslFile] [image] NOT NULL,
	[xslDirection] [tinyint] NOT NULL,
	[guidEntitySchemaXsl] [uniqueidentifier] NOT NULL,
	[dplyEntitySchemaXsl] [tinyint] NOT NULL,
 CONSTRAINT [ENTITYSCHEMAXSL_PK] PRIMARY KEY CLUSTERED 
(
	[idEntitySchemaXsl] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ENTITYSCHEMAXSL_UKG] UNIQUE NONCLUSTERED 
(
	[guidEntitySchemaXsl] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ENTITYSCHEMAXSL_FK_IDX_1] ON [dbo].[ENTITYSCHEMAXSL] 
(
	[idEntitySchema] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RENDERTYPE]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RENDERTYPE](
	[rdrType] [int] IDENTITY(10000,1) NOT NULL,
	[rdrTypeName] [varchar](25) NULL,
	[guidRenderType] [uniqueidentifier] NOT NULL,
	[dplyRenderType] [tinyint] NOT NULL,
	[idUserField] [int] NULL,
	[xmlDefinitionTemplate] [nvarchar](4000) NULL,
 CONSTRAINT [RENDERTYPE_PK] PRIMARY KEY CLUSTERED 
(
	[rdrType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [RENDERTYPE_UKG] UNIQUE NONCLUSTERED 
(
	[guidRenderType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [RENDERTYPE_FK_IDX_1] ON [dbo].[RENDERTYPE] 
(
	[idUserField] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORGPOSITION]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ORGPOSITION](
	[idPosition] [int] IDENTITY(1,1) NOT NULL,
	[posName] [nvarchar](26) NULL,
	[idParentPosition] [int] NULL,
	[guidPosition] [uniqueidentifier] NOT NULL,
	[posDisplayName] [nvarchar](40) NULL,
	[posDescription] [nvarchar](100) NULL,
	[costPosition] [numeric](11, 2) NULL,
	[ancestorPath] [varchar](150) NULL,
	[dplyPosition] [tinyint] NOT NULL,
	[idOrg] [int] NOT NULL,
	[finalEnt] [int] NOT NULL,
 CONSTRAINT [ORGPOSITION_PK] PRIMARY KEY CLUSTERED 
(
	[idPosition] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ORGPOSITION_UK1] UNIQUE NONCLUSTERED 
(
	[idOrg] ASC,
	[idParentPosition] ASC,
	[posName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ORGPOSITION_UK2] UNIQUE NONCLUSTERED 
(
	[idOrg] ASC,
	[idParentPosition] ASC,
	[posDisplayName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ORGPOSITION_UKG] UNIQUE NONCLUSTERED 
(
	[guidPosition] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOCATION]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOCATION](
	[idLocation] [int] IDENTITY(1,1) NOT NULL,
	[locName] [nvarchar](26) NOT NULL,
	[idParentLocation] [int] NULL,
	[guidLocation] [uniqueidentifier] NOT NULL,
	[locDisplayName] [nvarchar](40) NULL,
	[locDescription] [nvarchar](100) NULL,
	[costLocation] [numeric](11, 2) NULL,
	[ancestorPath] [varchar](150) NULL,
	[dplyLocation] [tinyint] NOT NULL,
	[idWorkingTimeSchema] [int] NULL,
	[idOrg] [int] NOT NULL,
	[idTimeZone] [int] NULL,
	[finalEnt] [int] NOT NULL,
 CONSTRAINT [LOCATION_PK] PRIMARY KEY CLUSTERED 
(
	[idLocation] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [LOCATION_UK1] UNIQUE NONCLUSTERED 
(
	[idOrg] ASC,
	[idParentLocation] ASC,
	[locName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [LOCATION_UK2] UNIQUE NONCLUSTERED 
(
	[idOrg] ASC,
	[idParentLocation] ASC,
	[locDisplayName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [LOCATION_UKG] UNIQUE NONCLUSTERED 
(
	[guidLocation] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [LOCATION_FK_IDX_1] ON [dbo].[LOCATION] 
(
	[idTimeZone] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [LOCATION_FK_IDX_2] ON [dbo].[LOCATION] 
(
	[idWorkingTimeSchema] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LGENTITYMETADATA]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LGENTITYMETADATA](
	[idLgEntityMetadata] [int] IDENTITY(10000,1) NOT NULL,
	[idAttrib] [int] NOT NULL,
	[guidLgEntityMetadata] [uniqueidentifier] NOT NULL,
	[dplyLgEntityMetadata] [tinyint] NOT NULL,
 CONSTRAINT [LGENTITYMETADATA_PK] PRIMARY KEY CLUSTERED 
(
	[idLgEntityMetadata] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [LGENTITYMETADATA_UKG] UNIQUE NONCLUSTERED 
(
	[guidLgEntityMetadata] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [LGENTITYMETADATA_FK_IDX_1] ON [dbo].[LGENTITYMETADATA] 
(
	[idAttrib] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spBA_SqlSrv_ValidateIndexCols]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_SqlSrv_ValidateIndexCols](@sTableName sysname, @sColumnNamesList varchar(8000), @bHasError bit output)
	AS
	BEGIN
		-- table to hold index columns
		declare @tIndexCols table (iOrdinal int, sColumnName sysname, sOrderType sysname)
		insert into @tIndexCols select * from dbo.fnBA_SqlSrv_IndexColDefTable(@sTableName, @sColumnNamesList)
		declare @nTmpNumCols integer
		select @nTmpNumCols = max(iOrdinal) from @tIndexCols

		declare @sTmp varchar(1000)
		declare @sMsg varchar(1000)
		declare @sTableNameUnQuoted sysname
		set @sTableNameUnQuoted = dbo.fnBA_DB_UnqouteDBName(@sTableName)

		-- validate index columns
		declare @k_Ind integer
		set @k_Ind = 1
		while(@k_Ind <= @nTmpNumCols) begin

			select @sTmp = a.sColumnName from @tIndexCols a where a.iOrdinal = @k_Ind
			declare @i_Tmp integer
			select @i_Tmp = count(*) from information_schema.columns a where a.table_name = @sTableNameUnQuoted  and  a.column_name = dbo.fnBA_DB_UnqouteDBName(@sTmp)
			if(@i_Tmp = 0) begin
				set @sMsg = replace(replace(
					'Column <{0}> does not belong to table <{1}>', 
					'{0}', @sTmp),
					'{1}', @sTableName)
				RAISERROR (@sMsg, 16, 1)
				set @bHasError = 1
				return
			end

			select @sTmp = a.sOrderType from @tIndexCols a where a.iOrdinal = @k_Ind
			if(@sTmp <> 'ASC') begin
				set @sMsg = replace(
					'Order type <{0}> is not supported, only ASC order type is supported', 
					'{0}', @sTmp)
				RAISERROR (@sMsg, 16, 1)
				set @bHasError = 1
				return
			end

			set @k_Ind = @k_Ind + 1
		end
		set @bHasError = 0
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_SqlSrv_FindIndexNameByCols]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_SqlSrv_FindIndexNameByCols](@sTableName sysname, @sColumnNamesList varchar(8000), @sIndexName sysname output)
	AS
	BEGIN
		declare @sTableNameUnQuoted sysname
		set @sTableNameUnQuoted = dbo.fnBA_DB_UnqouteDBName(@sTableName)

		-- table to hold index columns
		declare @tIndexCols table (iOrdinal int, sColumnName sysname, sOrderType sysname)
		insert into @tIndexCols select * from dbo.fnBA_SqlSrv_IndexColDefTable(@sTableName, @sColumnNamesList)
		declare @nTmpNumCols integer
		select @nTmpNumCols = max(iOrdinal) from @tIndexCols

		-- find if index is already created
		-- review columns, ordinal and order type (asc/desc)
		select top 1 @sIndexName = cols.index_name
		from vwBA_Sync_AllIndexColumns cols, @tIndexCols newIndCols,
			(
				-- select only indexes with same number of columns
				select indCount.index_name, indCount.table_name, count(*) nOrd
				from vwBA_Sync_AllIndexColumns indCount
				where indCount.table_name = @sTableNameUnQuoted
				group by indCount.index_name, indCount.table_name
				having count(*) = @nTmpNumCols 
			) indEqOrd
		where cols.table_name = @sTableNameUnQuoted  and  
			-- filter indexes with same number of columns 
			cols.index_name = indEqOrd.index_name  and  cols.table_name = indEqOrd.table_name  and
			-- filter indexes by equals columns and ordinal and order type
			cols.ordinal_position = newIndCols.iOrdinal  and  cols.column_name = newIndCols.sColumnName  and  
			cols.order_type = newIndCols.sOrderType
		group by cols.index_name, cols.table_name
		having count(*) = @nTmpNumCols -- filter indexes that all columns match
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_EM_DropFactIndex]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_EM_DropFactIndex]( @sTableName sysname, @sColumnName sysname )
	AS
	BEGIN
		exec spBA_DB_DropIndex @sTableName, @sColumnName
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_EM_CreateFactIndex]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_EM_CreateFactIndex]( @sTableName sysname, @sColumnName sysname, @bIsUnique bit )
	AS
	BEGIN
		exec spBA_DB_CreateIndexSingle @sTableName, @sColumnName, @bIsUnique, '_F', 0
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_SQL_DropIdentity]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_SQL_DropIdentity] (
			@sTable VARCHAR(50)
			)
			AS
			BEGIN
				DECLARE @sTableName nvarchar(128)
				DECLARE @sSqlScriptStart varchar(8000)
				DECLARE @sSqlScriptCreate varchar(8000)
				DECLARE @sSqlScriptEnd varchar(8000)
				-- Set parameter values
				exec spBA_SQL_ScriptRecreateTableWithoutIdentity @sTable, @sSqlScriptStart OUTPUT , @sSqlScriptCreate OUTPUT , @sSqlScriptEnd OUTPUT 
				
				DECLARE @fullSQL AS VARCHAR(8000)
				SET @fullSQL = @sSqlScriptStart + @sSqlScriptCreate + @sSqlScriptEnd
				exec (@fullSQL)
				if (@@Error <> 0) begin RAISERROR ('spBA_SQL_DropIdentity - Error removing identity.', 16, 1); return; end
			END;
GO
/****** Object:  StoredProcedure [dbo].[spBA_SQL_GetReferences]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_SQL_GetReferences]
			@GuidObjects GuidList READONLY
			AS
			SELECT guidPointer FROM vwBA_Catalog_BAREFERENCE WHERE guidObjectTarget IN (SELECT guidObject FROM @GuidObjects) AND guidObjectRef NOT IN (SELECT guidObject FROM @GuidObjects)
GO
/****** Object:  StoredProcedure [dbo].[spBA_SQL_GetDependencyTree]    Script Date: 06/08/2017 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_SQL_GetDependencyTree]
				@GuidObjects GuidList READONLY		
				AS
				WITH DependenciesChildren(guidObject,guidObjectParent,deployOnParent)
				AS
				(
            		SELECT guidObject,guidObjectParent,deployOnParent
            			FROM vwBA_Catalog_BABIZAGICATALOG
            			WHERE convert(varchar(100),guidObject) IN (SELECT guidObject from @GuidObjects) 
            		UNION ALL
            			SELECT depSource.guidObject,depSource.guidObjectParent,depSource.deployOnParent
            			FROM vwBA_Catalog_BABIZAGICATALOG depSource
            			INNER JOIN DependenciesChildren depTarget
            			ON depSource.guidObjectParent = depTarget.guidObject
				)
				select guidObject from DependenciesChildren option(maxrecursion 10000)
GO
/****** Object:  StoredProcedure [dbo].[spBA_Sync_ShiftKey_DeleteSP]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_Sync_ShiftKey_DeleteSP]
		( 
			@aTableName sysname,
			@aTableColumn varchar(2000),
			@bOnlyGenerateQueries bit
		)
		AS
		BEGIN
			-- Temporal table for inserts
			declare @sTempTableName sysname
			set @sTempTableName = 'tbBA_Tmp_ShiftKey_CreateSP'

			-- Temporal variables
			DECLARE @_SqlQuery varchar(max)

			-- Allocate a cursor variable. 
			DECLARE @_CrsrVar CURSOR
			-- Variables for sp_fkeys result set
			DECLARE @_PKTABLE_NAME sysname
			DECLARE @_PKCOLUMN_NAME sysname
			DECLARE @_FKTABLE_NAME sysname
			DECLARE @_FKCOLUMN_NAME varchar(32)
			DECLARE @_FK_NAME sysname
			DECLARE @_PK_NAME sysname

			-- Execute the procedure to fill the cursor with tables that reference the table
			SET @_CrsrVar = CURSOR FAST_FORWARD FOR ( SELECT pk_table_name, pk_column_name, fk_table_name, fk_column_name, fk_name, pk_name FROM vwBA_Sync_AllFKeys where pk_table_name = @aTableName )
			OPEN @_CrsrVar

			FETCH NEXT FROM @_CrsrVar INTO 
				@_PKTABLE_NAME, @_PKCOLUMN_NAME, 
				@_FKTABLE_NAME, @_FKCOLUMN_NAME, 
				@_FK_NAME, @_PK_NAME
			WHILE( @@FETCH_STATUS <> -1 )
			BEGIN
				IF( @@FETCH_STATUS <> -2 )
				BEGIN
					-- Check relations for related tables
					SET @_SqlQuery = 'ALTER TABLE ' + @_FKTABLE_NAME + ' WITH CHECK CHECK CONSTRAINT ' + @_FK_NAME
					insert into #tbBA_Tmp_ShiftQueries (textQuery) values ( @_SqlQuery );
				END

				FETCH NEXT FROM @_CrsrVar INTO 
					@_PKTABLE_NAME, @_PKCOLUMN_NAME, 
					@_FKTABLE_NAME, @_FKCOLUMN_NAME, 
					@_FK_NAME, @_PK_NAME
			END

			CLOSE @_CrsrVar
			DEALLOCATE @_CrsrVar

			--Allocate cursor
			DECLARE @_CrsrTables CURSOR
			DECLARE @_CrsrChecks CURSOR
			--Variable for CHECK CONSTRAINTS 
			DECLARE @_CHECKCONSTRING_NAME sysname
			DECLARE @_FKTABLE_NAME_WITHCHECK sysname

			SET  @_CrsrTables = CURSOR FAST_FORWARD FOR ( SELECT distinct(fk_table_name) FROM vwBA_Sync_AllFKeys where pk_table_name = @aTableName )
			OPEN @_CrsrTables

			FETCH NEXT FROM @_CrsrTables INTO @_FKTABLE_NAME_WITHCHECK
			WHILE( @@FETCH_STATUS <> -1 )
			BEGIN
				IF( @@FETCH_STATUS <> -2 )
				BEGIN		
					
					SET @_CrsrChecks = CURSOR FAST_FORWARD FOR ( SELECT sys.check_constraints.name FROM sys.check_constraints WHERE parent_object_id = object_id(@_FKTABLE_NAME_WITHCHECK) )
					OPEN @_CrsrChecks

					FETCH NEXT FROM @_CrsrChecks INTO @_CHECKCONSTRING_NAME
					WHILE( @@FETCH_STATUS <> -1 )
					BEGIN
						IF( @@FETCH_STATUS <> -2 )
						BEGIN
							SET @_SqlQuery = 'ALTER TABLE ' + @_FKTABLE_NAME_WITHCHECK + ' WITH CHECK CHECK CONSTRAINT ' + @_CHECKCONSTRING_NAME
							insert into #tbBA_Tmp_ShiftQueries (textQuery) values ( @_SqlQuery );
						END

						FETCH NEXT FROM @_CrsrChecks INTO 
							@_CHECKCONSTRING_NAME
					END

					CLOSE @_CrsrChecks
					DEALLOCATE @_CrsrChecks
					
				END

				FETCH NEXT FROM @_CrsrTables INTO 
					@_FKTABLE_NAME_WITHCHECK
			END

			CLOSE @_CrsrTables
			DEALLOCATE @_CrsrTables

			-- Drop temporal table
			SET @_SqlQuery = replace(replace(replace(
				'if exists (select * from dbo.sysobjects where id = object_id(N''{1}'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1) {2}' +
				'begin {2}' +
				'	drop table {1} {2}' +
				'end {2}',
				'{0}', @aTableName),
				'{1}', @sTempTableName),
				'{2}', char(13))
			insert into #tbBA_Tmp_ShiftQueries (textQuery) values ( @_SqlQuery )

			-- drop temporal SP
			SET @_SqlQuery = 'DROP PROCEDURE spBA_Tmp_ShiftId'
			insert into #tbBA_Tmp_ShiftQueries (textQuery) values ( @_SqlQuery );
		END
GO
/****** Object:  StoredProcedure [dbo].[spBA_Sync_ShiftKey_CreateSP]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_Sync_ShiftKey_CreateSP]
		( 
			@aTableName sysname,
			@aTableColumn varchar(2000),
			@bOnlyGenerateQueries bit,
			@bMassiveRangeShift bit = 0,
			@iMassiveRangeShiftValue integer = 0
		)
		AS
		BEGIN
			-- Temporal table for inserts
			declare @sTempTableName sysname
			set @sTempTableName = 'tbBA_Tmp_ShiftKey_CreateSP'

			-- set identity insert	
			declare @bHasIdentity bit
			select @bHasIdentity = case when count(*) > 0 then 1 else 0 end from vwBA_Sync_AllIdentities where table_name = @aTableName

			-- Temporal variables
			DECLARE @_SqlQuery varchar(max), @_sTmp varchar(max)
			declare @sSPCreateQuery varchar(max)
			set @sSPCreateQuery = ''

			-- Allocate a cursor variable. 
			DECLARE @_CrsrVar CURSOR		
			-- Variables for sp_fkeys result set
			DECLARE @_PKTABLE_NAME sysname
			DECLARE @_PKCOLUMN_NAME sysname
			DECLARE @_FKTABLE_NAME sysname
			DECLARE @_FKCOLUMN_NAME varchar(32)
			DECLARE @_FK_NAME sysname
			DECLARE @_PK_NAME sysname
			
			-- Execute the procedure to fill the cursor with tables that reference the table
			SET @_CrsrVar = CURSOR FAST_FORWARD FOR ( SELECT pk_table_name, pk_column_name, fk_table_name, fk_column_name, fk_name, pk_name FROM vwBA_Sync_AllFKeys where pk_table_name = @aTableName )
			OPEN @_CrsrVar

			FETCH NEXT FROM @_CrsrVar INTO 
				@_PKTABLE_NAME, @_PKCOLUMN_NAME, 
				@_FKTABLE_NAME, @_FKCOLUMN_NAME, 
				@_FK_NAME, @_PK_NAME
			WHILE( @@FETCH_STATUS <> -1 )
			BEGIN
				IF( @@FETCH_STATUS <> -2 )
				BEGIN
					-- No check relations for related tables
					SET @_SqlQuery = 'ALTER TABLE ' + @_FKTABLE_NAME + ' NOCHECK CONSTRAINT ' + @_FK_NAME
					insert into #tbBA_Tmp_ShiftQueries (textQuery) values ( @_SqlQuery );

					-- build create SP query
					if (@bMassiveRangeShift = 0)
					begin
						SET @sSPCreateQuery = @sSPCreateQuery + char(13) +
							'	UPDATE ' + @_FKTABLE_NAME + ' SET ' + @_FKCOLUMN_NAME + ' = @iNewId WHERE ' + @_FKCOLUMN_NAME + ' = @iOldId'
					end
					else
					begin
						SET @sSPCreateQuery = @sSPCreateQuery + char(13) +
							'	UPDATE ' + @_FKTABLE_NAME + ' SET ' + @_FKCOLUMN_NAME + ' = (' + @_FKCOLUMN_NAME + ' + ' + cast(@iMassiveRangeShiftValue as sysname) + ') WHERE ' + @_FKCOLUMN_NAME + ' is not null'
					end
				END

				FETCH NEXT FROM @_CrsrVar INTO 
					@_PKTABLE_NAME, @_PKCOLUMN_NAME, 
					@_FKTABLE_NAME, @_FKCOLUMN_NAME, 
					@_FK_NAME, @_PK_NAME
			END

			CLOSE @_CrsrVar
			DEALLOCATE @_CrsrVar

			--Allocate cursor
			DECLARE @_CrsrTables CURSOR
			DECLARE @_CrsrChecks CURSOR
			--Variable for CHECK CONSTRAINTS 
			DECLARE @_CHECKCONSTRING_NAME sysname
			DECLARE @_FKTABLE_NAME_WITHCHECK sysname

			SET  @_CrsrTables = CURSOR FAST_FORWARD FOR ( SELECT distinct(fk_table_name) FROM vwBA_Sync_AllFKeys where pk_table_name = @aTableName )
			OPEN @_CrsrTables

			FETCH NEXT FROM @_CrsrTables INTO @_FKTABLE_NAME_WITHCHECK
			WHILE( @@FETCH_STATUS <> -1 )
			BEGIN
				IF( @@FETCH_STATUS <> -2 )
				BEGIN		
					
					SET @_CrsrChecks = CURSOR FAST_FORWARD FOR ( SELECT sys.check_constraints.name FROM sys.check_constraints WHERE parent_object_id = object_id(@_FKTABLE_NAME_WITHCHECK) )
					OPEN @_CrsrChecks

					FETCH NEXT FROM @_CrsrChecks INTO @_CHECKCONSTRING_NAME
					WHILE( @@FETCH_STATUS <> -1 )
					BEGIN
						IF( @@FETCH_STATUS <> -2 )
						BEGIN
							SET @_SqlQuery = 'ALTER TABLE ' + @_FKTABLE_NAME_WITHCHECK + ' NOCHECK CONSTRAINT ' + @_CHECKCONSTRING_NAME
							insert into #tbBA_Tmp_ShiftQueries (textQuery) values ( @_SqlQuery );
						END

						FETCH NEXT FROM @_CrsrChecks INTO 
							@_CHECKCONSTRING_NAME
					END

					CLOSE @_CrsrChecks
					DEALLOCATE @_CrsrChecks
					
				END

				FETCH NEXT FROM @_CrsrTables INTO 
					@_FKTABLE_NAME_WITHCHECK
			END

			CLOSE @_CrsrTables
			DEALLOCATE @_CrsrTables


			-- Create temporal table
			SET @_SqlQuery = replace(replace(replace(
				'if exists (select * from dbo.sysobjects where id = object_id(N''{1}'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1) {2}' +
				'begin {2}' +
				'	drop table {1} {2}' +
				'end {2}',
				'{0}', @aTableName),
				'{1}', @sTempTableName),
				'{2}', char(13))
			insert into #tbBA_Tmp_ShiftQueries (textQuery) values ( @_SqlQuery )
			if(@bMassiveRangeShift = 0)
			begin
				SET @_SqlQuery = replace(replace(replace(
					'select * into {1} from {0} where 1=0 {2}',
					'{0}', @aTableName),
					'{1}', @sTempTableName),
					'{2}', char(13))
				insert into #tbBA_Tmp_ShiftQueries (textQuery) values ( @_SqlQuery )
			end

			-- build create SP query
			-- Operations for table
			begin
				-- Insert
				-- column list
				set @_sTmp = 'select ''['' + column_name + ''],'' from information_schema.columns where table_name = ''' + @aTableName + ''' order by ordinal_position'
				exec spBA_DB_ConcatRows @_sTmp, @_SqlQuery output;
				set @_SqlQuery = substring(@_SqlQuery, 1, len(@_SqlQuery)-1)
				-- insert statement
				if (@bMassiveRangeShift = 0)
				begin
					if(@bHasIdentity = 1)
					begin
						set @_sTmp = 
							'SET IDENTITY_INSERT {4} ON {5}' +
							'insert into {4} ({2}) {5}' + 
							'   select {2} from {0} where {1} = @iOldId {5}' +
							'SET IDENTITY_INSERT {4} OFF {5}' +
							'delete {0} where {1} = @iOldId {5}' +
							'SET IDENTITY_INSERT {0} ON {5}' +
							'insert into {0} ({2}) {5}' + 
							'   select {3} from {4} where {1} = @iOldId {5}' +
							'SET IDENTITY_INSERT {0} OFF'
					end
					else 
					begin
						set @_sTmp = 
							'insert into {4} ({2}) select * from {0} where {1} = @iOldId {5}' +
							'delete {0} where {1} = @iOldId {5}' +
							'insert into {0} ({2}) select {3} from {4} where {1} = @iOldId {5}'
					end

					set @_SqlQuery = replace(replace(replace(replace(replace(replace(@_sTmp,
						'{0}', @aTableName),
						'{1}', @aTableColumn),
						'{2}', @_SqlQuery),
						'{3}', replace(@_SqlQuery, '[' + @aTableColumn + ']', '@iNewId')),
						'{4}', @sTempTableName),
						'{5}', char(13) + '	')
				end
				else
				begin
					set @_SqlQuery = replace(replace(replace(replace(replace(
						'insert into {0} ({2}) select {3} from {4}',
						'{0}', @aTableName),
						'{1}', @aTableColumn),
						'{2}', @_SqlQuery),
						'{3}', replace(@_SqlQuery, '[' + @aTableColumn + ']', '[' + @aTableColumn + '] + ' + cast(@iMassiveRangeShiftValue as sysname))),
						'{4}', @sTempTableName)

					-- temporal table
					set @_SqlQuery = replace(replace(replace(replace(
						'select * into {1} from {0}; {3}delete from {0}; {3}{2}; {3}drop table {1}',
						'{0}', @aTableName),
						'{1}', @sTempTableName),
						'{2}', @_SqlQuery),
						'{3}', char(13) + '	')

					-- set identity insert	
					if( @bHasIdentity = 1 )
					begin
						SET @_SqlQuery = 
							'SET IDENTITY_INSERT ' + @aTableName + ' ON' + char(13) + 
							'	' + @_SqlQuery +  char(13) + 
							'	SET IDENTITY_INSERT ' + @aTableName + ' OFF'
					end
				end

				SET @sSPCreateQuery = @sSPCreateQuery + char(13) + 
					'	' + @_SqlQuery
							
			end

			-- drop SP if exists
			SET @_SqlQuery = 
				'IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N''[dbo].[spBA_Tmp_ShiftId]'') AND OBJECTPROPERTY(id, N''IsProcedure'') = 1)' + char(13) +
				'	DROP PROCEDURE [dbo].[spBA_Tmp_ShiftId]'
			insert into #tbBA_Tmp_ShiftQueries (textQuery) values ( @_SqlQuery );

			if (@bOnlyGenerateQueries = 1)
			begin
				SET @_SqlQuery = 'GO'
				insert into #tbBA_Tmp_ShiftQueries (textQuery) values ( @_SqlQuery );
			end

			-- create SP
			SET @_SqlQuery = 
				'CREATE PROCEDURE spBA_Tmp_ShiftId' + (case when @bMassiveRangeShift = 0 then '(@iOldId AS INT, @iNewId AS INT)' else '' end) + ' AS' + char(13) +
				'BEGIN' + char(13) +
				@sSPCreateQuery + char(13) +
				'END'
			insert into #tbBA_Tmp_ShiftQueries (textQuery) values ( @_SqlQuery );

			if (@bOnlyGenerateQueries = 1)
			begin
				SET @_SqlQuery = 'GO'
				insert into #tbBA_Tmp_ShiftQueries (textQuery) values ( @_SqlQuery );
			end

		END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_DeleteColumnDefault]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_DeleteColumnDefault] ( @sTableName sysname, @sColumnName sysname )
		AS
		BEGIN
			declare @sDefName varchar(100)
			select @sDefName = df.COLUMN_DEFAULT_NAME from vwBA_Sync_AllDefaults df where df.TABLE_NAME = REPLACE(REPLACE(@sTableName, '[', ''), ']', '')  AND  df.COLUMN_NAME = REPLACE(REPLACE(@sColumnName, '[', ''), ']', '')
			-- drop constraint
			IF @sDefName IS NOT NULL
			BEGIN
				EXEC( 'ALTER TABLE ' + @sTableName + ' DROP CONSTRAINT ' + @sDefName )
			END
			-- unbind default
			IF EXISTS (SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID(@sTableName) AND NAME=REPLACE(REPLACE(@sColumnName, '[', ''), ']', '') AND CDEFAULT>0) 
			BEGIN 
				EXEC ('sp_unbindefault ''' + @sTableName + '.' + @sColumnName + '''') 
			END
		END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_IndexedObjectsInsert]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_IndexedObjectsInsert] 	 @executionId uniqueidentifier
	AS
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
	
		
		WITH CTE AS(
			SELECT IndexName, sourceGuid,targetGuid,
				RN = ROW_NUMBER()OVER(PARTITION BY IndexName,sourceGuid,targetGuid ORDER BY IndexName,sourceGuid,targetGuid)
			FROM CQL_IndexingInsertInput where executionId = @executionId
		)
		DELETE FROM CTE WHERE RN > 1;
		
		insert into CQL_IndexingInsertResolved(IndexName, sourceGuid,targetGuid,executionId)
		select IndexName, sourceGuid,targetGuid,@executionId
		from 
			CQL_IndexingInsertInput
		WHERE 
			sourceGuid is not null and  executionId = @executionId
	
		DELETE FROM CQL_IndexingInsertInput WHERE sourceGuid is not null and  executionId = @executionId
		
		insert into CQL_IndexingInsertResolved(IndexName, sourceGuid,targetGuid,executionId)
		select tmp.IndexName,ix.sourceGuid,tmp.targetGuid,@executionId
		from 
			vwBA_Catalog_BABIZAGICATALOG cat inner join
			CQL_IndexingInsertInput tmp ON cat.guidObject = tmp.targetGuid and  tmp.executionId = @executionId inner join
			BaCatalogIndexedObjects ix ON ix.name = tmp.IndexName and ix.targetGuid = cat.guidObjectParent 


		DELETE FROM CQL_IndexingInsertInput where  executionId = @executionId
		DECLARE @varRows int 
		set @varRows = 0
		DECLARE @rootObject uniqueidentifier
    SELECT @rootObject = guidObject FROM BABIZAGICATALOG WHERE objType = 121
		insert into BaCatalogIndexedObjects(name,sourceGuid,targetGuid,rootObject)
		select distinct IndexName,tmp.sourceGuid,tmp.targetGuid,@rootObject
		from CQL_IndexingInsertResolved tmp left join
		BaCatalogIndexedObjects ix on tmp.IndexName = ix.name and ix.sourceGuid = tmp.sourceGuid and tmp.targetGuid = ix.targetGuid
		where ix.name is null and  tmp.executionId = @executionId

		insert into CQL_IndexingInsertStaging(IndexName,sourceGuid,targetGuid,executionId)
		select resolved.IndexName,resolved.sourceGuid,cat.guidObject , @executionId
		from 
			BaCatalogindexDefinition indeces inner join 
			CQL_IndexingInsertResolved resolved ON resolved.IndexName = indeces.indexName inner join
			vwBA_Catalog_BABIZAGICATALOG cat on cat.guidObjectParent = resolved.targetGuid and indeces.objectType = cat.objType left join
			BaCatalogIndexedObjects ix on ix.name = indeces.indexName and ix.targetGuid = cat.guidObject and ix.sourceGuid = resolved.sourceGuid
		where
			ix.name is null and  resolved.executionId = @executionId

		delete from CQL_IndexingInsertResolved where executionId = @executionId
		insert into CQL_IndexingInsertResolved(IndexName,sourceGuid,targetGuid,executionId)
		select IndexName,sourceGuid,targetGuid, @executionId from CQL_IndexingInsertStaging where  executionId = @executionId
		set @varRows = @@ROWCOUNT
		delete from CQL_IndexingInsertStaging where  executionId = @executionId

		while(@varRows>0)
		begin
			insert into BaCatalogIndexedObjects(name,sourceGuid,targetGuid,rootObject)
			select distinct IndexName,tmp.sourceGuid,tmp.targetGuid,@rootObject from CQL_IndexingInsertResolved tmp left join
			BaCatalogIndexedObjects ix on tmp.IndexName = ix.name and ix.sourceGuid = tmp.sourceGuid and tmp.targetGuid = ix.targetGuid
			where ix.name is null and  executionId = @executionId
			
			insert into CQL_IndexingInsertStaging(IndexName,sourceGuid,targetGuid,executionId)
			select resolved.IndexName,resolved.sourceGuid,cat.guidObject ,@executionId
			from 
				BaCatalogindexDefinition indeces inner join 
				CQL_IndexingInsertResolved resolved ON resolved.IndexName = indeces.indexName inner join
				vwBA_Catalog_BABIZAGICATALOG cat on cat.guidObjectParent = resolved.targetGuid and indeces.objectType = cat.objType left join
				BaCatalogIndexedObjects ix on ix.name = indeces.indexName and ix.targetGuid = cat.guidObject and ix.sourceGuid = resolved.sourceGuid
			where
				ix.name is null and  executionId = @executionId

			delete from CQL_IndexingInsertResolved where executionId = @executionId
			insert into CQL_IndexingInsertResolved(IndexName,sourceGuid,targetGuid,executionId)
			select IndexName,sourceGuid,targetGuid,executionId from CQL_IndexingInsertStaging where executionId = @executionId
			set @varRows = @@ROWCOUNT
			delete from CQL_IndexingInsertStaging where executionId = @executionId
		end
END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_IndexedObjectsDelete]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_IndexedObjectsDelete] @executionId uniqueidentifier
	AS
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
		
		DECLARE @varRows int
		set @varRows  = 0

		insert into CQL_IndexingDeleteResolved(IndexName,sourceGuid,targetGuid,executionId)
		select ixed.name, ixed.sourceGuid, ixed.targetGuid, @executionId
		from BaCatalogIndexedObjects ixed inner join
		CQL_IndexingDeleteInput tmp on tmp.guidObject = ixed.targetGuid and tmp.executionId = @executionId

		set @varRows = @@ROWCOUNT

		delete from CQL_IndexingDeleteInput where executionId = @executionId;
		while(@varRows>0)
		begin
			DELETE BaCatalogIndexedObjects
			FROM BaCatalogIndexedObjects ixed inner join
			CQL_IndexingDeleteResolved tmp ON ixed.name = tmp.IndexName and ixed.sourceGuid = tmp.sourceGuid and ixed.targetGuid = tmp.targetGuid and tmp.executionId = @executionId
			
			insert into CQL_IndexingDeleteStaging(IndexName,sourceGuid,targetGuid,executionId)
			select ixed.name,ixed.sourceGuid,ixed.targetGuid,@executionId
			from CQL_IndexingDeleteResolved tmp inner join
			vwBA_Catalog_BABIZAGICATALOG cat on cat.guidObjectParent = tmp.targetGuid inner join
			BaCatalogIndexedObjects ixed on ixed.name = tmp.IndexName and ixed.sourceGuid = tmp.sourceGuid and ixed.targetGuid = cat.guidObject and tmp.executionId = @executionId
				
			delete from CQL_IndexingDeleteResolved where executionId = @executionId;
			insert into CQL_IndexingDeleteResolved(IndexName,sourceGuid,targetGuid,executionId)
			select IndexName,sourceGuid,targetGuid,@executionId
			from CQL_IndexingDeleteStaging  where executionId = @executionId;
			
			set @varRows = @@ROWCOUNT		
			
			delete from CQL_IndexingDeleteStaging where executionId = @executionId;
		end
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_ValidateBizAgiSchema]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_ValidateBizAgiSchema]
	AS
	BEGIN
			exec spBA_Sync_ValBASch_TblsExists
			exec spBA_Sync_ValBASch_PKsExists
			exec spBA_Sync_ValBASch_SinglePKs
	END
GO
/****** Object:  Table [dbo].[APPLICATION]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APPLICATION](
	[idApplication] [int] IDENTITY(1,1) NOT NULL,
	[appName] [nvarchar](26) NOT NULL,
	[appDisplayName] [nvarchar](40) NULL,
	[appCreationDate] [datetime] NOT NULL,
	[idOrg] [int] NOT NULL,
	[idAllocPrinciple] [int] NOT NULL,
	[guidApplication] [uniqueidentifier] NOT NULL,
	[appDescription] [nvarchar](100) NULL,
	[appIcon] [image] NULL,
	[dplyApplication] [tinyint] NOT NULL,
	[idEntityPV] [int] NOT NULL,
	[guidCustomizedResult] [uniqueidentifier] NULL,
 CONSTRAINT [APPLICATION_PK] PRIMARY KEY CLUSTERED 
(
	[idApplication] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [APPLICATION_UK1] UNIQUE NONCLUSTERED 
(
	[appName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [APPLICATION_UK2] UNIQUE NONCLUSTERED 
(
	[appDisplayName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [APPLICATION_UKG] UNIQUE NONCLUSTERED 
(
	[guidApplication] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [APPLICATION_FK_IDX_1] ON [dbo].[APPLICATION] 
(
	[idAllocPrinciple] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [APPLICATION_FK_IDX_3] ON [dbo].[APPLICATION] 
(
	[idEntityPV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [APPLICATION_FK_IDX_4] ON [dbo].[APPLICATION] 
(
	[idOrg] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAMULTIINSTANCEPROPERTY]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAMULTIINSTANCEPROPERTY](
	[idMultiInstanceProperty] [int] IDENTITY(1,1) NOT NULL,
	[sequential] [bit] NOT NULL,
	[loopCardinalityXPath] [nvarchar](1000) NULL,
	[loopCardinalityInt] [int] NULL,
	[loopCardinalityType] [int] NOT NULL,
	[orderByAttrib] [int] NULL,
	[orderDirection] [tinyint] NULL,
	[canClearPrevious] [bit] NOT NULL,
	[targetXPath] [nvarchar](1000) NOT NULL,
	[guidMultiInstanceProperty] [uniqueidentifier] NOT NULL,
	[dplyMultiInstanceProperty] [tinyint] NOT NULL,
 CONSTRAINT [BAMULTIINSTANCEPROPERTY_PK] PRIMARY KEY CLUSTERED 
(
	[idMultiInstanceProperty] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAMULTIINSTANCEPROPERTY_UKG] UNIQUE NONCLUSTERED 
(
	[guidMultiInstanceProperty] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAMULTIINSTANCEPROPER_FK_IDX_1] ON [dbo].[BAMULTIINSTANCEPROPERTY] 
(
	[orderByAttrib] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAGAMEASUREAGGREGATE]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAGAMEASUREAGGREGATE](
	[idMeasureAggregate] [int] IDENTITY(1,1) NOT NULL,
	[idMeasure] [int] NOT NULL,
	[sFunctionName] [nvarchar](10) NOT NULL,
 CONSTRAINT [BAGAMEASUREAGGREGATE_PK] PRIMARY KEY CLUSTERED 
(
	[idMeasureAggregate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAGAMEASUREAGGREGATE_FK_IDX_1] ON [dbo].[BAGAMEASUREAGGREGATE] 
(
	[idMeasure] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAENVPARAMVALUEENTITYEX]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BAENVPARAMVALUEENTITYEX](
	[idEnvParamValueEntityEx] [int] IDENTITY(10000,1) NOT NULL,
	[idEnvParamEntityEx] [int] NOT NULL,
	[idBAEnvironment] [int] NOT NULL,
	[idEnt] [int] NOT NULL,
	[paramValue] [varchar](4000) NULL,
	[guidBAEnvParamValueEntityEx] [uniqueidentifier] NOT NULL,
	[dplyBAEnvParamValueEntityEx] [tinyint] NOT NULL,
 CONSTRAINT [BAENVPARAMVALUEENTITYEX_PK] PRIMARY KEY CLUSTERED 
(
	[idEnvParamValueEntityEx] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAENVPARAMVALUEENTITYEX_UK1] UNIQUE NONCLUSTERED 
(
	[idEnvParamEntityEx] ASC,
	[idBAEnvironment] ASC,
	[idEnt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAENVPARAMVALUEENTITYEX_UKG] UNIQUE NONCLUSTERED 
(
	[guidBAEnvParamValueEntityEx] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BAFILEUPLOAD]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAFILEUPLOAD](
	[idFileUpload] [bigint] NOT NULL,
	[fuIdParent] [bigint] NULL,
	[idAttrib] [int] NULL,
	[fuFileName] [nvarchar](255) NULL,
	[ecmFileId] [nvarchar](200) NULL,
	[idCheckoutWorkitem] [bigint] NULL,
 CONSTRAINT [BAFILEUPLOAD_PK] PRIMARY KEY CLUSTERED 
(
	[idFileUpload] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAFILEUPLOAD_FK_IDX_1] ON [dbo].[BAFILEUPLOAD] 
(
	[idAttrib] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAGADIMENSIONFILTER]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAGADIMENSIONFILTER](
	[idDimensionFilter] [int] IDENTITY(1,1) NOT NULL,
	[value] [nvarchar](40) NOT NULL,
	[idDimension] [int] NOT NULL,
 CONSTRAINT [BAGADIMENSIONFILTER_PK] PRIMARY KEY CLUSTERED 
(
	[idDimensionFilter] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAGADIMENSIONFILTER_FK_IDX_1] ON [dbo].[BAGADIMENSIONFILTER] 
(
	[idDimension] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ENTITYBIZKEY]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ENTITYBIZKEY](
	[idEntityBizKey] [int] IDENTITY(10000,1) NOT NULL,
	[idEnt] [int] NOT NULL,
	[idAttrib] [int] NOT NULL,
	[guidEntityBizKey] [uniqueidentifier] NOT NULL,
	[dplyEntityBizKey] [tinyint] NOT NULL,
 CONSTRAINT [ENTITYBIZKEY_PK] PRIMARY KEY CLUSTERED 
(
	[idEntityBizKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ENTITYBIZKEY_UK1] UNIQUE NONCLUSTERED 
(
	[idEnt] ASC,
	[idAttrib] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ENTITYBIZKEY_UKG] UNIQUE NONCLUSTERED 
(
	[guidEntityBizKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ENTITYKEY]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ENTITYKEY](
	[idEntityKey] [int] IDENTITY(1,1) NOT NULL,
	[idEnt] [int] NOT NULL,
	[guidEntityKey] [uniqueidentifier] NOT NULL,
	[idAttrib] [int] NOT NULL,
	[dplyEntityKey] [tinyint] NOT NULL,
 CONSTRAINT [ENTITYKEY_PK] PRIMARY KEY CLUSTERED 
(
	[idEntityKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ENTITYKEY_UK1] UNIQUE NONCLUSTERED 
(
	[idEnt] ASC,
	[idAttrib] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ENTITYKEY_UKG] UNIQUE NONCLUSTERED 
(
	[guidEntityKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwBA_Sync_AllColumns]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwBA_Sync_AllColumns]
AS
SELECT        c.TABLE_CATALOG, c.TABLE_SCHEMA, c.TABLE_NAME, c.COLUMN_NAME, c.DATA_TYPE, c.DATA_TYPE_NAME, CASE c.DATA_TYPE_NAME WHEN 'image' THEN NULL WHEN 'text' THEN NULL 
                         WHEN 'ntext' THEN NULL ELSE c.CHARACTER_MAXIMUM_LENGTH END AS CHARACTER_MAXIMUM_LENGTH, c.NUMERIC_PRECISION, c.NUMERIC_SCALE, c.COLUMN_HASDEFAULT, c.COLUMN_DEFAULT, 
                         c.COLUMN_DEFAULT_NAME, c.ORDINAL_POSITION, c.IS_NULLABLE, c.DATETIME_PRECISION, c.IS_COMPUTED, c.FORMULA, (CASE WHEN i.IDENTITY_SEED IS NULL THEN 0 ELSE 1 END) 
                         AS COLUMN_ISIDENTITY, i.IDENTITY_SEED, i.IDENTITY_INCR
FROM            dbo.vwBA_Sync_AllColsWithoutIdent AS c LEFT OUTER JOIN
                         dbo.vwBA_Sync_AllIdentities AS i ON c.TABLE_NAME = i.TABLE_NAME AND c.COLUMN_NAME = i.COLUMN_NAME
GO
/****** Object:  Table [dbo].[USERFIELDPARAMETERS]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERFIELDPARAMETERS](
	[idUserFieldParameters] [int] IDENTITY(10000,1) NOT NULL,
	[idUserField] [int] NOT NULL,
	[userFieldParamName] [nvarchar](50) NOT NULL,
	[guidUserFieldParameters] [uniqueidentifier] NOT NULL,
	[dplyUserFieldParameters] [tinyint] NOT NULL,
 CONSTRAINT [USERFIELDPARAMETERS_PK] PRIMARY KEY CLUSTERED 
(
	[idUserFieldParameters] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [USERFIELDPARAMETERS_UK1] UNIQUE NONCLUSTERED 
(
	[idUserField] ASC,
	[userFieldParamName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [USERFIELDPARAMETERS_UKG] UNIQUE NONCLUSTERED 
(
	[guidUserFieldParameters] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERFIELDATTRIBUTETYPE]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERFIELDATTRIBUTETYPE](
	[idUserFieldAttributeType] [int] IDENTITY(10000,1) NOT NULL,
	[idUserField] [int] NOT NULL,
	[idAttributeType] [int] NOT NULL,
	[guidUserFieldAttributeType] [uniqueidentifier] NOT NULL,
	[dplyUserFieldAttributeType] [tinyint] NOT NULL,
 CONSTRAINT [USERFIELDATTRIBUTETYPE_PK] PRIMARY KEY CLUSTERED 
(
	[idUserFieldAttributeType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [USERFIELDATTRIBUTETYPE_UKG] UNIQUE NONCLUSTERED 
(
	[guidUserFieldAttributeType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [USERFIELDATTRIBUTETYP_FK_IDX_1] ON [dbo].[USERFIELDATTRIBUTETYPE] 
(
	[idUserField] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spBA_WFE_add_to_authlog]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_WFE_add_to_authlog]
			(
				@idUser INT,
				@domain varchar(25),
				@userName varchar(100),
				@ipAddress varchar(30),
				@idAuthEventType INT,
				@idAuthEventSubType INT
			)
			AS
			BEGIN
				INSERT INTO AUTHLOG (idUser, domain,userName, IpAddress, idAuthEventType, idAuthEventSubType)
					VALUES (@idUser, @domain, @userName, @ipAddress, @idAuthEventType, @idAuthEventSubType)
			END;
GO
/****** Object:  Table [dbo].[WFUSER]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WFUSER](
	[idUser] [int] NOT NULL,
	[fullName] [nvarchar](200) NOT NULL,
	[userName] [varchar](100) NULL,
	[domain] [nvarchar](25) NOT NULL,
	[idArea] [int] NULL,
	[idLocation] [int] NULL,
	[enabled] [bit] NOT NULL,
	[idBossUser] [int] NULL,
	[enabledForAssignation] [tinyint] NULL,
	[notifByEmail] [bit] NULL,
	[notifByMessenger] [bit] NULL,
	[notifByCell] [bit] NULL,
	[contactEmail] [nvarchar](100) NULL,
	[contactMessenger] [nvarchar](100) NULL,
	[contactCell] [nvarchar](20) NULL,
	[wfClassAccessCacheExpiry] [smalldatetime] NULL,
	[idWorkingTimeSchema] [int] NULL,
	[idDelegate] [int] NULL,
	[DelegateEnabled] [tinyint] NULL,
	[idTimeZone] [int] NULL,
	[language] [int] NULL,
	[createdCasesSkipAssigRules] [bit] NULL,
	[userPicture] [tinyint] NULL,
	[offlineForms] [bit] NULL,
	[guidUser] [uniqueidentifier] NULL,
	[normalCost] [money] NULL,
	[overtimeCost] [money] NULL,
	[finalEnt] [int] NOT NULL,
	[userStartPage] [int] NOT NULL,
 CONSTRAINT [WFUSER_PK] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [WFUSER_FK_IDX_1] ON [dbo].[WFUSER] 
(
	[idArea] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WFUSER_FK_IDX_2] ON [dbo].[WFUSER] 
(
	[idTimeZone] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WFUSER_FK_IDX_3] ON [dbo].[WFUSER] 
(
	[language] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WFUSER_FK_IDX_4] ON [dbo].[WFUSER] 
(
	[idLocation] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WFUSER_FK_IDX_5] ON [dbo].[WFUSER] 
(
	[idBossUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WFUSER_FK_IDX_6] ON [dbo].[WFUSER] 
(
	[idDelegate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WFUSER_FK_IDX_7] ON [dbo].[WFUSER] 
(
	[idWorkingTimeSchema] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WFUSER_GUIDUSER_IDX] ON [dbo].[WFUSER] 
(
	[guidUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WFUSER_USERNAME_IDX] ON [dbo].[WFUSER] 
(
	[userName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[idCategory] [int] IDENTITY(1,1) NOT NULL,
	[catName] [nvarchar](26) NOT NULL,
	[catDisplayName] [nvarchar](40) NOT NULL,
	[catDescription] [nvarchar](100) NULL,
	[catHelpText] [nvarchar](100) NULL,
	[catDisplayOrder] [smallint] NULL,
	[catCreationDate] [datetime] NOT NULL,
	[idParentCategory] [int] NULL,
	[idApplication] [int] NOT NULL,
	[guidCategory] [uniqueidentifier] NOT NULL,
	[dplyCategory] [tinyint] NOT NULL,
 CONSTRAINT [CATEGORY_PK] PRIMARY KEY CLUSTERED 
(
	[idCategory] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [CATEGORY_UKG] UNIQUE NONCLUSTERED 
(
	[guidCategory] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CATEGORY_FK_IDX_1] ON [dbo].[CATEGORY] 
(
	[idParentCategory] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CATEGORY] ON [dbo].[CATEGORY] 
(
	[idApplication] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAFILECONT]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAFILECONT](
	[idFileCont] [bigint] NOT NULL,
	[idFileUpload] [bigint] NOT NULL,
	[fcContent] [image] NULL,
 CONSTRAINT [BAFILECONT_PK] PRIMARY KEY CLUSTERED 
(
	[idFileCont] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAFILECONT_IX1] ON [dbo].[BAFILECONT] 
(
	[idFileUpload] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ASYNCECMJOB]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASYNCECMJOB](
	[idAsyncECMJob] [bigint] NOT NULL,
	[runningState] [int] NOT NULL,
	[pending] [bit] NOT NULL,
	[currentRetries] [int] NOT NULL,
	[creationDate] [datetime] NOT NULL,
	[lastProcessingDate] [datetime] NULL,
	[parentEntityName] [nvarchar](50) NOT NULL,
	[parentEntityId] [bigint] NOT NULL,
	[fileName] [nvarchar](100) NULL,
	[contentMetadata] [image] NULL,
	[failureMessage] [nvarchar](4000) NULL,
	[idFileUpload] [bigint] NOT NULL,
 CONSTRAINT [ASYNCECMJOB_PK] PRIMARY KEY CLUSTERED 
(
	[idAsyncECMJob] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ASYNCECMJOB_UK1] UNIQUE NONCLUSTERED 
(
	[idFileUpload] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAMULTIINSTANCEGROUP]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAMULTIINSTANCEGROUP](
	[idMultiInstanceGroup] [int] IDENTITY(1,1) NOT NULL,
	[idMultiInstanceProperty] [int] NOT NULL,
	[GroupOrder] [int] NOT NULL,
	[xpath] [nvarchar](1000) NOT NULL,
	[guidMultiInstanceGroup] [uniqueidentifier] NOT NULL,
	[dplyMultiInstanceGroup] [tinyint] NOT NULL,
 CONSTRAINT [BAMULTIINSTANCEGROUP_PK] PRIMARY KEY CLUSTERED 
(
	[idMultiInstanceGroup] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAMULTIINSTANCEGROUP_UKG] UNIQUE NONCLUSTERED 
(
	[guidMultiInstanceGroup] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAMULTIINSTANCEGROUP_FK_IDX_1] ON [dbo].[BAMULTIINSTANCEGROUP] 
(
	[idMultiInstanceProperty] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_UnicodeSupport]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_UnicodeSupport](@toUnicode bit = 1)
	AS
	BEGIN
		declare @sqlTemp varchar(max)

		-- drop temporary table if exists for columns
		if object_id('tempdb..#tbBA_Tmp_UnicodeColumnsToConvert') is not null begin drop table #tbBA_Tmp_UnicodeColumnsToConvert end
		-- create temporal table for sql queries
		create table #tbBA_Tmp_UnicodeColumnsToConvert(table_name sysname, column_name sysname, column_length integer, isNullable bit,
			current_type sysname, new_type sysname, idColumnToConvert integer identity (1, 1))

		-- Calculate columns to convert
		insert into #tbBA_Tmp_UnicodeColumnsToConvert (table_name, column_name, column_length, isNullable, current_type, new_type)
			select *
			from (
				select bacols.table_name, bacols.column_name, bacols.character_maximum_length, bacols.is_nullable, bacols.DATA_TYPE current_type,
					(case when uc.tableName is not null
						then uc.fixedDataType
						else (case when @toUnicode = 0 then 'varchar' else 'nvarchar' end) end) new_type
				from vwBA_Sync_AllColumns bacols
					left outer join BAUNICODEEXCEPTION uc on bacols.table_name = uc.tableName and bacols.column_name = uc.columnName
				where bacols.data_type in ('varchar', 'nvarchar')
					and bacols.character_maximum_length <= 4000

			) cls
			where current_type <> new_type
			order by table_name, column_name

		;

		-- drop temporary table if exists for related objects
		if object_id('tempdb..#tbBA_Tmp_UnicodeObjectsToRecreate') is not null begin drop table #tbBA_Tmp_UnicodeObjectsToRecreate end

		-- create temporal table for sql queries
		create table #tbBA_Tmp_UnicodeObjectsToRecreate(object_type sysname, obj_name sysname, table_name sysname, createDdl varchar(max), dropDdl varchar(max), idObjectToRecreate integer identity (1, 1), idColumnToConvert integer)

		-- Calculate indexes to recreate and scripts for drop and create them
		insert into #tbBA_Tmp_UnicodeObjectsToRecreate (object_type, obj_name, table_name, idColumnToConvert, createDdl, dropDdl)
			select object_type, index_name, table_name, idColumnToConvert,
				dbo.fnBA_SQL_ScriptCreateIndex(table_name, index_name) createDdl,
				dbo.fnBA_SQL_ScriptDropIndex(table_name, index_name) dropDdl
			from  (
				select 'INDEX' object_type, baix.index_name, baix.table_name, cvc.idColumnToConvert
				from vwBA_Sync_AllIndexColumns baix
					inner join #tbBA_Tmp_UnicodeColumnsToConvert cvc on baix.table_name = cvc.table_name and baix.column_name = cvc.column_name
					inner join sys.indexes i on i.name = baix.index_name and baix.table_name = object_name(i.object_id)
				where i.is_primary_key = 0 and i.type <> 0
				group by baix.index_name, baix.table_name, cvc.idColumnToConvert
			) idxr;

		-- Calculate defaults to recreate and scripts for drop and create them
		insert into #tbBA_Tmp_UnicodeObjectsToRecreate (object_type, obj_name, table_name, idColumnToConvert, createDdl, dropDdl)
			select object_type, column_default_name, table_name, idColumnToConvert,
				dbo.fnBA_SQL_ScriptCreateDefault(table_name, column_default_name) createDdl,
				dbo.fnBA_SQL_ScriptDropDefault(table_name, column_default_name) dropDdl
			from  (
				select 'DEFAULT' object_type, badf.column_default_name, badf.table_name, cvc.idColumnToConvert
				from vwBA_Sync_AllDefaults badf
					inner join #tbBA_Tmp_UnicodeColumnsToConvert cvc on badf.table_name = cvc.table_name and badf.column_name = cvc.column_name
			) idxr;

		-- Calculate checks to recreate and scripts for drop and create them
		insert into #tbBA_Tmp_UnicodeObjectsToRecreate (object_type, obj_name, table_name, idColumnToConvert, createDdl, dropDdl)
			select object_type, constraint_name, table_name, idColumnToConvert,
				dbo.fnBA_SQL_ScriptCreateCheck(table_name, constraint_name) createDdl,
				dbo.fnBA_SQL_ScriptDropCheck(table_name, constraint_name) dropDdl
			from  (
				select 'CHECK' object_type, back.constraint_name, ckcol.table_name, cvc.idColumnToConvert
				from INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE ckcol
					inner join INFORMATION_SCHEMA.CHECK_CONSTRAINTS back on ckcol.constraint_name = back.constraint_name
					inner join #tbBA_Tmp_UnicodeColumnsToConvert cvc on ckcol.table_name = cvc.table_name and ckcol.column_name = cvc.column_name
			) idxr;

		-- generate script
		set @sqlTemp = '
			select sqlScript
			from ((
					-- drop related objects
					select cols.idColumnToConvert, 1 as step, idObjectToRecreate as subStep, replace(replace(''
						{dropDdl}
						-- {createDdl}
						'',

						''{dropDdl}'', dropDdl),
						''{createDdl}'', createDdl) as sqlScript
					from #tbBA_Tmp_UnicodeColumnsToConvert cols
						inner join #tbBA_Tmp_UnicodeObjectsToRecreate objr on objr.idColumnToConvert = cols.idColumnToConvert
				) union all (
					-- convert column to unicode

					select idColumnToConvert, 2 as step, 1 as subStep, replace(replace(replace(replace(replace(
						''alter table {0} alter column {1} {4} ({2}) {3}''
						,
						''{0}'', table_name),
						''{1}'', column_name),
						''{2}'', column_length),
						''{3}'', case when isNullable = 1 then ''null'' else ''not null'' end),
						''{4}'', new_type) as sqlScript
					from #tbBA_Tmp_UnicodeColumnsToConvert
				) union all (
					-- create related objects
					select cols.idColumnToConvert, 3 as step, idObjectToRecreate as subStep, replace(''
						{createDdl}
						'',
						''{createDdl}'', createDdl) as sqlScript
					from #tbBA_Tmp_UnicodeColumnsToConvert cols
						inner join #tbBA_Tmp_UnicodeObjectsToRecreate objr on objr.idColumnToConvert = cols.idColumnToConvert
				)) sqlSentences
			order by idColumnToConvert, step asc, subStep asc
			'
		exec spBA_Sync_ExecQueries @sqlTemp, 1, 1

		-- Set unicode flag
		update bizagiinfo
			set bavalue = (case when @toUnicode = 0 then '0' else '1' end)
			where bainfo = 'UnicodeSupport';

		-- drop temporary table if exists
		if object_id('tempdb..#tbBA_Tmp_UnicodeColumnsToConvert') is not null begin drop table #tbBA_Tmp_UnicodeColumnsToConvert end
		if object_id('tempdb..#tbBA_Tmp_UnicodeObjectsToRecreate') is not null begin drop table #tbBA_Tmp_UnicodeObjectsToRecreate end
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_FixTableDefaultNames]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_FixTableDefaultNames](@sTableName sysname, @bPrintMessages bit = 0)
             AS
             BEGIN
                    declare @sTmpTableName varchar(50)
                    declare @sDFSuffix varchar(50)
                    set @sDFSuffix = '_DF'

                    declare @sConstraintPrefix varchar(1000)
                    declare @sNewConstraintName varchar(100)
                    declare @iInd integer
                    declare @iMaxNameLength integer
                    set @iMaxNameLength = 30

                    -- Fix defaults names for all tables
                    BEGIN
                           set @sTmpTableName = dbo.fnBA_DB_UnqouteDBName(@sTableName)
                           -- Find all defaults that are not in standard format

                           -- Allocate a cursor variable.
                           DECLARE @_CrsrVar CURSOR
                           DECLARE @rTmpRow_column_default_name sysname
                           DECLARE @rTmpRow_table_name sysname
                           DECLARE @rTmpRow_column_name sysname
                           -- execute query to retrieve query strings
                           SET @_CrsrVar = CURSOR FAST_FORWARD FOR
                                  select column_default_name, table_name, column_name
                                  from
                                        ((
                                               select a.column_default_name, a.table_name, a.column_name, 'BIZAGI' tabtype
                                               from vwBA_Sync_AllDefaults a,
                                                      (SELECT t.name tab, substring(c.name, 5, len(c.name) - 4) colsuf FROM sys.tables t ,sys.columns c WHERE c.object_id=OBJECT_ID(t.name) AND c.name like 'guid%') b
                                               where a.table_name = b.tab  and
                                                      (@sTmpTableName = '*'  or  a.table_name = @sTmpTableName)  and
                                                      (a.table_name + '.' + a.column_name) <> (b.tab + '.guid' + b.colsuf)  and
                                                      (a.table_name + '.' + a.column_name) <> (b.tab + '.dply' + b.colsuf)  and
                                                      (dbo.fnBA_DB_IsValidConstraintName(a.column_default_name, a.table_name, @sDFSuffix) = 0)
                                        )
                                        union all
                                        (
                                               select a.column_default_name, a.table_name, a.column_name, 'ENTITY' tabtype
                                               from vwBA_Sync_AllDefaults a,
                                                            (
                                                                   select (case when sum(isnull(ek.idEnt,0)) = 0 then e.entSrc else e.entEKSrc end) tab, e.entSrc colsuf
                                                                   from entity e left outer join entitykey ek on e.idEnt = ek.idEnt
                                                                   group by e.entSrc, e.entEKSrc
                                                            ) b
                                               where a.table_name = b.tab  and  a.table_name not in (select name from sys.tables)  and
                                                      (@sTmpTableName = '*'  or  a.table_name = @sTmpTableName)  and
                                                      (a.table_name + '.' + a.column_name) <> (b.tab + '.guid' + b.colsuf)  and
                                                      (a.table_name + '.' + a.column_name) <> (b.tab + '.dsbl' + b.colsuf)  and
                                                      (a.table_name + '.' + a.column_name) <> (b.tab + '.dply' + b.colsuf)  and
                                                      (dbo.fnBA_DB_IsValidConstraintName(a.column_default_name, a.table_name, @sDFSuffix) = 0)
                                        )) d
                                  order by d.tabtype, d.table_name, d.column_name
                                  ;
                           OPEN @_CrsrVar
                           FETCH NEXT FROM @_CrsrVar INTO @rTmpRow_column_default_name, @rTmpRow_table_name, @rTmpRow_column_name
                           WHILE( @@FETCH_STATUS <> -1 )
                           BEGIN
                                  IF( @@FETCH_STATUS <> -2 )
                                  BEGIN
                                        -- Generate not used valid Default Name
                                         -- calculates next id
                                        select @iInd = max(cast(b.ind as integer))
                                        from (
                                               select right(a.column_default_name, charindex(reverse(@sDFSuffix), reverse(a.column_default_name)) - 1) ind
                                               from vwBA_Sync_AllDefaults a
                                               where dbo.fnBA_DB_IsValidConstraintName(a.column_default_name, @rTmpRow_table_name, @sDFSuffix) = 1
                                        ) b

                                        -- case when is first constraint
                                        set @iInd = case when @iInd is null then 1 else @iInd + 1 end

                                        -- calculates constraint prefix
                                        set @sConstraintPrefix = substring(@rTmpRow_table_name, 1, @iMaxNameLength - len(@sDFSuffix) - len(cast(@iInd as varchar(10)))) + @sDFSuffix

                                        -- calculates new name
                                        set @sNewConstraintName = @sConstraintPrefix + cast(@iInd as varchar(10))

                                        -- Fix DF Name
                                        if(@bPrintMessages = 1) begin
                                               declare @sTmpPrint varchar(1000)
                                               set @sTmpPrint = replace(replace(replace(replace(
                                                      'Renaming column {0}.{1} default from {2} to {3}',
                                                      '{0}', @rTmpRow_table_name),
                                                      '{1}', @rTmpRow_column_name),
                                                      '{2}', @rTmpRow_column_default_name),
                                                      '{3}', @sNewConstraintName)
                                               print(@sTmpPrint)
                                        end
                                        exec sp_rename @rTmpRow_column_default_name, @sNewConstraintName, 'OBJECT'
                                  END
                                  FETCH NEXT FROM @_CrsrVar INTO @rTmpRow_column_default_name, @rTmpRow_table_name, @rTmpRow_column_name
                           END
                           CLOSE @_CrsrVar
                           DEALLOCATE @_CrsrVar
                    END

                    declare @sSqlTmp varchar(8000)
                    declare @sDFGuidSuffix varchar(50)
                    set @sDFGuidSuffix = '_DFG'
                    declare @sDFDsblSuffix varchar(50)
                    set @sDFDsblSuffix = '_DFD'
                    declare @sDFDplySuffix varchar(50)
                    set @sDFDplySuffix = '_DFY'

                    -- Fix defaults names for BizAgi Guid columns
                    BEGIN
                           set @sSqlTmp = '
                                  select replace(replace(replace(replace(
                                        ''
                                        if([bPrintMessages] = 1) begin
                                               print(''''Renaming column {2}.{3} default from {0} to {1}'''')
                                        end
                                        exec sp_rename ''''{0}'''', ''''{1}'''', ''''OBJECT''''
                                        '',
                                        ''{0}'', column_default_name),
                                        ''{1}'', valid_default_name),
                                        ''{2}'', table_name),
                                        ''{3}'', column_name)
                                  from (
                                        select *
                                        from (
                                               select a.column_default_name, a.table_name, a.column_name, (a.table_name + ''[sDFGuidSuffix]'') valid_default_name
                                               from vwBA_Sync_AllDefaults a,
                                                      (SELECT t.name + ''.'' + c.name tabcol FROM sys.columns c, sys.tables t where c.object_id=OBJECT_ID(t.name) and c.name like ''guid%'') b
                                               where (''[sTableName]'' = ''*''  or  a.table_name = ''[sTableName]'')  and
                                                      (a.table_name + ''.'' + a.column_name) = b.tabcol
                                        ) c
                                        where c.column_default_name <> c.valid_default_name
                                  ) d
                                  order by table_name, column_name
                                  '
                           set @sSqlTmp = replace(@sSqlTmp, '[sDFGuidSuffix]', @sDFGuidSuffix)
                           set @sSqlTmp = replace(@sSqlTmp, '[sTableName]', @sTmpTableName)
                           set @sSqlTmp = replace(@sSqlTmp, '[bPrintMessages]', @bPrintMessages)
                           exec spBA_Sync_ExecQueries @sSqlTmp, 1, 0
                    END
                    -- Fix defaults names for Entities Guid columns
                    BEGIN
                           set @sSqlTmp = '
                                  select replace(replace(replace(replace(
                                        ''
                                        if([bPrintMessages] = 1) begin
                                               print(''''Renaming column {2}.{3} default from {0} to {1}'''')
                                        end
                                        exec sp_rename ''''{0}'''', ''''{1}'''', ''''OBJECT''''
                                        '',
                                        ''{0}'', column_default_name),
                                        ''{1}'', valid_default_name),
                                        ''{2}'', table_name),
                                        ''{3}'', column_name)
                                  from (
                                        select *
                                        from (
                                               select a.column_default_name, a.table_name, a.column_name, (a.table_name + ''[sDFGuidSuffix]'') valid_default_name
                                               from vwBA_Sync_AllDefaults a,
                                                            (
                                                                   select (case when sum(isnull(ek.idEnt,0)) = 0 then e.entSrc else e.entEKSrc end + ''.guid'' + e.entSrc) tabcol
                                                                   from entity e left outer join entitykey ek on e.idEnt = ek.idEnt
                                                                   group by e.entSrc, e.entEKSrc
                                                            ) b
                                               where (''[sTableName]'' = ''*''  or  a.table_name = ''[sTableName]'')  and
                                                      (a.table_name + ''.'' + a.column_name) = b.tabcol
                                        ) c
                                        where c.column_default_name <> c.valid_default_name
                                  ) d
                                  order by table_name, column_name
                                  '
                           set @sSqlTmp = replace(@sSqlTmp, '[sDFGuidSuffix]', @sDFGuidSuffix)
                           set @sSqlTmp = replace(@sSqlTmp, '[sTableName]', @sTmpTableName)
                           set @sSqlTmp = replace(@sSqlTmp, '[bPrintMessages]', @bPrintMessages)
                           exec spBA_Sync_ExecQueries @sSqlTmp, 1, 0
                    END
                    -- Fix defaults names for Entities Disabled columns
                    BEGIN
                           set @sSqlTmp = '
                                  select replace(replace(replace(replace(
                                        ''
                                        if([bPrintMessages] = 1) begin
                                               print(''''Renaming column {2}.{3} default from {0} to {1}'''')
                                        end
                                        exec sp_rename ''''{0}'''', ''''{1}'''', ''''OBJECT''''
                                        '',
                                        ''{0}'', column_default_name),
                                        ''{1}'', valid_default_name),
                                        ''{2}'', table_name),
                                        ''{3}'', column_name)
                                  from (
                                        select *
                                        from (
                                               select a.column_default_name, a.table_name, a.column_name, (a.table_name + ''[sDFDsblSuffix]'') valid_default_name
                                               from vwBA_Sync_AllDefaults a,
                                                            (
                                                                   select (case when sum(isnull(ek.idEnt,0)) = 0 then e.entSrc else e.entEKSrc end + ''.dsbl'' + e.entSrc) tabcol
                                                                   from entity e left outer join entitykey ek on e.idEnt = ek.idEnt
                                                                   group by e.entSrc, e.entEKSrc
                                                            ) b
                                               where (''[sTableName]'' = ''*''  or  a.table_name = ''[sTableName]'')  and
                                                      (a.table_name + ''.'' + a.column_name) = b.tabcol
                                        ) c
                                        where c.column_default_name <> c.valid_default_name
                                  ) d
                                  order by table_name, column_name
                                  '
                           set @sSqlTmp = replace(@sSqlTmp, '[sDFDsblSuffix]', @sDFDsblSuffix)
                           set @sSqlTmp = replace(@sSqlTmp, '[sTableName]', @sTmpTableName)
                           set @sSqlTmp = replace(@sSqlTmp, '[bPrintMessages]', @bPrintMessages)
                           exec spBA_Sync_ExecQueries @sSqlTmp, 1, 0
                    END
                    -- Fix defaults names for BizAgi Deployment columns
                    BEGIN
                           set @sSqlTmp = '
                                  select replace(replace(replace(replace(
                                        ''
                                        if([bPrintMessages] = 1) begin
                                               print(''''Renaming column {2}.{3} default from {0} to {1}'''')
                                        end
                                        exec sp_rename ''''{0}'''', ''''{1}'''', ''''OBJECT''''
                                        '',
                                        ''{0}'', column_default_name),
                                        ''{1}'', valid_default_name),
                                        ''{2}'', table_name),
                                        ''{3}'', column_name)
                                  from (
                                        select *
                                        from (
                                               select a.column_default_name, a.table_name, a.column_name, (a.table_name + ''[sDFDplySuffix]'') valid_default_name
                                               from vwBA_Sync_AllDefaults a,
                                                      (SELECT t.name + ''.dply'' + substring(c.name, 5, len(c.name) - 4) tabcol FROM sys.columns c, sys.tables t where c.object_id=OBJECT_ID(t.name) and c.name like ''guid%'') b
                                               where (''[sTableName]'' = ''*''  or  a.table_name = ''[sTableName]'')  and
                                                      (a.table_name + ''.'' + a.column_name) = b.tabcol
                                        ) c
                                        where c.column_default_name <> c.valid_default_name
                                  ) d
                                  order by table_name, column_name
                                  '
                           set @sSqlTmp = replace(@sSqlTmp, '[sDFDplySuffix]', @sDFDplySuffix)
                           set @sSqlTmp = replace(@sSqlTmp, '[sTableName]', @sTmpTableName)
                           set @sSqlTmp = replace(@sSqlTmp, '[bPrintMessages]', @bPrintMessages)
                           exec spBA_Sync_ExecQueries @sSqlTmp, 1, 0
                    END
                    -- Fix defaults names for Entities Deployment columns
                    BEGIN
                           set @sSqlTmp = '
                                  select replace(replace(replace(replace(
                                        ''
                                        if([bPrintMessages] = 1) begin
                                               print(''''Renaming column {2}.{3} default from {0} to {1}'''')
                                        end
                                        exec sp_rename ''''{0}'''', ''''{1}'''', ''''OBJECT''''
                                        '',
                                        ''{0}'', column_default_name),
                                        ''{1}'', valid_default_name),
                                        ''{2}'', table_name),
                                        ''{3}'', column_name)
                                  from (
                                        select *
                                        from (
                                               select a.column_default_name, a.table_name, a.column_name, (a.table_name + ''[sDFDplySuffix]'') valid_default_name
                                               from vwBA_Sync_AllDefaults a,
                                                            (
                                                                   select (case when sum(isnull(ek.idEnt,0)) = 0 then e.entSrc else e.entEKSrc end + ''.dply'' + e.entSrc) tabcol
                                                                   from entity e left outer join entitykey ek on e.idEnt = ek.idEnt
                                                                   group by e.entSrc, e.entEKSrc
                                                            ) b
                                               where (''[sTableName]'' = ''*''  or  a.table_name = ''[sTableName]'')  and
                                                      (a.table_name + ''.'' + a.column_name) = b.tabcol
                                        ) c
                                        where c.column_default_name <> c.valid_default_name
                                  ) d
                                  order by table_name, column_name
                                  '
                           set @sSqlTmp = replace(@sSqlTmp, '[sDFDplySuffix]', @sDFDplySuffix)
                           set @sSqlTmp = replace(@sSqlTmp, '[sTableName]', @sTmpTableName)
                           set @sSqlTmp = replace(@sSqlTmp, '[bPrintMessages]', @bPrintMessages)
                           exec spBA_Sync_ExecQueries @sSqlTmp, 1, 0
                    END
             END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_DropIndexMultiple]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_DropIndexMultiple](@sTableName sysname, @sColumnNamesList varchar(8000), @sSuffix sysname, @bPrintMessages bit = 0)
	AS
	BEGIN
 		declare @sIndexName sysname
 		declare @sSql varchar(1000)

		-- validate index columns
		declare @bHasError bit
		exec spBA_SqlSrv_ValidateIndexCols @sTableName, @sColumnNamesList, @bHasError output
		if @bHasError = 1 begin return end

		-- find if index is already created
		exec spBA_SqlSrv_FindIndexNameByCols @sTableName, @sColumnNamesList, @sIndexName output

		-- drop index if exists
		if @sIndexName is not null
		begin
			set @sSql = replace(replace(
				'drop index {0}.{1}',
				'{0}', @sTableName),
				'{1}', @sIndexName)
			if(@bPrintMessages = 1) begin print(@sSql) end
			exec( @sSql )
		end
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_DeleteGuidDefault]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_DeleteGuidDefault]( @sTableName sysname, @sColumnName sysname )
	AS
	BEGIN
		EXEC spBA_DB_DeleteColumnDefault @sTableName, @sColumnName
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_CreateIndexMultiple]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_CreateIndexMultiple](@sTableName sysname, @sColumnNamesList varchar(8000), @bIsUnique bit, @sSuffix sysname, @bAvoidError bit, @bPrintMessages bit = 0)
	AS
	BEGIN
		declare @sTableNameUnQuoted sysname
		declare @sIndexName sysname
		declare @sIndexPrefix sysname
		declare @sNewIndexName sysname
		declare @sMsg varchar(1000)
		declare @sTmp varchar(1000)
		declare @sSql varchar(1000)
		declare @iInd integer
		declare @bOldIsUnique bit

		set @sTableNameUnQuoted = dbo.fnBA_DB_UnqouteDBName(@sTableName)

		-- calculates index prefix
		set @sIndexPrefix = @sTableNameUnQuoted + @sSuffix

		-- calculates next id
		select @iInd = max(cast(ind as integer))
		from (
			select stuff(index_name, 1, len(@sIndexPrefix), '') ind
			from vwBA_Sync_AllIndexes
			where dbo.fnBA_DB_IsValidIndexName(index_name, @sTableName, @sSuffix) = 1
		) a

		-- case when is first index
		set @iInd = case when @iInd is null then 1 else @iInd + 1 end

		-- calculates new name
		set @sNewIndexName = @sIndexPrefix + cast(@iInd as varchar(20))


		-- table to hold index columns
		declare @tIndexCols table (iOrdinal int, sColumnName sysname, sOrderType sysname)
		insert into @tIndexCols select * from dbo.fnBA_SqlSrv_IndexColDefTable(@sTableName, @sColumnNamesList)
		declare @nTmpNumCols integer
		select @nTmpNumCols = max(iOrdinal) from @tIndexCols

		-- validate index columns
		declare @bHasError bit
		exec spBA_SqlSrv_ValidateIndexCols @sTableName, @sColumnNamesList, @bHasError output
		if @bHasError = 1 begin return end

		-- find if index is already created
		exec spBA_SqlSrv_FindIndexNameByCols @sTableName, @sColumnNamesList, @sIndexName output

		-- validates that current index (if exists) is unique or not
		if @sIndexName is not null
		begin
			select @bOldIsUnique = is_unique from vwBA_Sync_AllIndexes where index_name = @sIndexName
			if @bOldIsUnique <> @bIsUnique
			begin
				-- index must be recreated with is unique specified flag

				-- drop index
				set @sSql = replace(replace(
					'drop index {0}.{1}',
					'{0}', @sTableName),
					'{1}', @sIndexName)
				if(@bPrintMessages = 1) begin print(@sSql) end
				exec( @sSql )

				-- reuse index name if is valid
				if dbo.fnBA_DB_IsValidIndexName(@sIndexName, @sTableName, @sSuffix) = 1
				begin
					set @sNewIndexName = @sIndexName
				end

				-- set to null, force create
				set @sIndexName = null
			end
		end

		if @sIndexName is null
		begin
			declare @bError bit
			set @bError = 0

			-- if unique and avoid errors, validate duplicate keys
			if @bIsUnique = 1  and  @bAvoidError = 1
			begin
				-- calculate column list without order type
				declare @sTmpColumnsList nvarchar(1000)
				declare @sTmpColumnName nvarchar(1000)
				declare @j_Ind integer
				set @j_Ind = 1
				while(@j_Ind <= @nTmpNumCols) begin
					select @sTmpColumnName = sColumnName from @tIndexCols where iOrdinal = @j_Ind
					set @sTmpColumnsList = (case when @j_Ind = 1 then '' else @sTmpColumnsList + ',' end) + @sTmpColumnName
					set @j_Ind = @j_Ind + 1
				end

				declare @nsSql nvarchar(1000)
				set @nsSql = replace(replace(
					'select @_iInd = count(*) from (select {1}, count(*) num_count_asterisk from {0} group by {1} having count(*) > 1) a',
					'{0}', @sTableName),
					'{1}', @sTmpColumnsList)
				exec sp_executesql @nsSql, N'@_iInd integer output', @_iInd = @iInd out

				if @iInd > 0
				begin
					-- duplicate keys found
					set @sSql = '**** ERROR: Cannot create unique index on ' + @sTableName + ' (' + @sTmpColumnsList + ') because a duplicate key was found'
					raiserror( @sSql, 16, 1 )
					set @bError = 1
				end
			end

			-- if not unique, or unique and no errors, or not avoid errors
			if @bError = 0
			begin
				-- calculate column list with order type
				declare @sTmp2ColumnsList varchar(1000)
				declare @sTmp2ColumnName varchar(100)
				declare @sTmp2OrderType varchar(100)
				set @j_Ind = 1
				while(@j_Ind <= @nTmpNumCols) begin
					select @sTmp2ColumnName = a.sColumnName, @sTmp2OrderType = a.sOrderType from @tIndexCols a where a.iOrdinal = @j_Ind
					set @sTmp2ColumnsList = (case when @j_Ind = 1 then '' else @sTmp2ColumnsList + ',' end) + 
						@sTmp2ColumnName + ' ' + @sTmp2OrderType
					set @j_Ind = @j_Ind + 1
				end

				-- index doesn't exists, create it
				set @sSql = replace(replace(replace(replace(
					'create {3} index {0} on {1}( {2} ) on [PRIMARY]',
					'{0}', @sNewIndexName),
					'{1}', @sTableName),
					'{2}', @sTmp2ColumnsList),
					'{3}', case when @bIsUnique = 1 then 'UNIQUE' else '' end)
				if(@bPrintMessages = 1) begin print(@sSql) end
				exec( @sSql )
			end
		end
		else
		begin
			-- ensure that index has a standard name
			if dbo.fnBA_DB_IsValidIndexName(@sIndexName, @sTableName, @sSuffix) = 0
			begin
				-- rename index
				set @sIndexName = @sTableName + '.' + @sIndexName
				if(@bPrintMessages = 1) begin print('sp_rename ''' + @sIndexName + ''', ''' + @sNewIndexName + ''', ''INDEX''') end
				exec sp_rename @sIndexName, @sNewIndexName, 'INDEX'
			end
		end
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_Sync_ShiftKey_AuxSP]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_Sync_ShiftKey_AuxSP]
	( 
		@aTableName sysname,
		@aGenerateQueriesOnly bit,
		@bTrace bit = 0,
		@bMassiveRangeShift bit = 0,
		@iMassiveRangeShiftValue integer = 0
	)
	AS
	BEGIN
		DECLARE @_SqlQuery varchar(1000)
		declare @iNumRows integer

		-- Ensure that if is a virtual entity, was called with EntityKey table
		select @iNumRows = count(*)
			from (
				select e.idEnt, e.entSrc 
				from entity e, entitykey ek 
				where e.idEnt = ek.idEnt
				group by e.idEnt, e.entSrc
			) ve
			where ve.entSrc = @aTableName;
		if(@iNumRows > 0)
		begin
			set @_SqlQuery = replace('Cannot shift IDs in virtual entity table {0}, instead shift IDs in table {0}_EntityKey.', '{0}', @aTableName)
			RAISERROR (@_SqlQuery, 16, 1)
			return
		end

		set @iNumRows = 0
		if (@bMassiveRangeShift = 0) begin select @iNumRows = count(*) from #tbBA_Tmp_ShiftIds; end

		if( @iNumRows > 0  or  @bMassiveRangeShift = 1 )
		begin
			-- drop the temporary table if already exists 
			if object_id('tempdb..#tbBA_Tmp_ShiftQueries') is not null begin drop table #tbBA_Tmp_ShiftQueries end

			-- create temporal table for sql queries
			create table #tbBA_Tmp_ShiftQueries( idQuery int identity(1,1), textQuery varchar(max) )
			truncate table #tbBA_Tmp_ShiftQueries

			if (@aGenerateQueriesOnly = 1)
			begin
				set @_SqlQuery = 'PRINT ''Starting shift IDs with Table ' + @aTableName + ''''
				print (@_SqlQuery)
			end

			declare @aTableColumn varchar(2000)
			select @aTableColumn = v.column_name from vwBA_Sync_AllPKeys v where v.table_name = @aTableName

			-- create SP
			exec spBA_Sync_ShiftKey_CreateSP @aTableName, @aTableColumn, @aGenerateQueriesOnly, @bMassiveRangeShift, @iMassiveRangeShiftValue

			if (@bMassiveRangeShift = 0)
			begin
				-- exec SP for each id
				set @_SqlQuery = 'exec spBA_Tmp_ShiftId {ID_OLD}, {ID_NEW}'
				set @_SqlQuery = replace( @_SqlQuery, '''', '''''' )
				set @_SqlQuery = replace( 'insert into #tbBA_Tmp_ShiftQueries (textQuery) values ( ''{SQL_QRY}'' )', '{SQL_QRY}', @_SqlQuery)
				set @_SqlQuery = replace( @_SqlQuery, '''', '''''' )
				set @_SqlQuery = replace( 'select replace(replace(''{SQL_QRY}'', ''{ID_OLD}'', idOld), ''{ID_NEW}'', idNew) from #tbBA_Tmp_ShiftIds order by idShift', '{SQL_QRY}', @_SqlQuery)
				exec spBA_Sync_ExecQueries @_SqlQuery
			end
			else
			begin
				-- exec SP
				insert into #tbBA_Tmp_ShiftQueries (textQuery) values ( 'exec spBA_Tmp_ShiftId' )
			end

			-- drop SP
			exec spBA_Sync_ShiftKey_DeleteSP @aTableName, @aTableColumn, @aGenerateQueriesOnly

			-- Execute Operations
			declare @bExec bit
			declare @bPrint bit
			set @bExec = case when @aGenerateQueriesOnly = 1 then 0 else 1 end
			set @bPrint = case when (@aGenerateQueriesOnly = 1  or  @bTrace = 1) then 1 else 0 end
			exec spBA_Sync_ExecQueries 'SELECT textQuery FROM #tbBA_Tmp_ShiftQueries order by idQuery', @bExec, @bPrint

			-- drop temporal table 
			drop table #tbBA_Tmp_ShiftQueries

			if (@aGenerateQueriesOnly = 1)
			begin
				set @_SqlQuery = 'PRINT ''Finished shift IDs with Table ' + @aTableName + ''''
				print (@_SqlQuery)
			end
		end
		else
		begin
			if (@aGenerateQueriesOnly = 1)
			begin
				set @_SqlQuery = 'PRINT ''No rows to shift in Table ' + @aTableName + ''''
				print (@_SqlQuery)
			end
		end
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_ORG_UpdPositionPath]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_ORG_UpdPositionPath]
	AS
	BEGIN
		DECLARE @idPosition INT
		DECLARE @idPositionToUpdate INT
		DECLARE @ancestorPath VARCHAR(150)
		DECLARE posCursor CURSOR FAST_FORWARD FOR SELECT idPosition FROM ORGPOSITION
		DECLARE @idParentPosition int
		DECLARE @finished bit
		DECLARE @LoopError INT

		OPEN posCursor
		FETCH NEXT FROM posCursor INTO @idPosition

		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @idPositionToUpdate = @idPosition
			SET @ancestorPath = ''
			SET @finished = 0
			SET @LoopError = 0

			SELECT @idParentPosition = idParentPosition
			FROM ORGPOSITION
			WHERE idPosition = @idPosition

			WHILE @finished = 0
			BEGIN
				IF @idParentPosition IS NOT NULL 
				BEGIN
					IF (PATINDEX(RTRIM(CAST(@idParentPosition AS NCHAR))+'.%', @ancestorpath) > 0)
					BEGIN
						SET @finished = 1
						SET @LoopError = 1
						BREAK;
					END

					IF (PATINDEX('%.'+RTRIM(CAST(@idParentPosition AS NCHAR))+'.%', @ancestorpath) > 0)
					BEGIN
						SET @finished = 1
						SET @LoopError = 1
						BREAK;
					END

					SET @ancestorpath = RTRIM(CAST(@idParentPosition AS NCHAR)) + '.' + @ancestorpath
					SET @idPosition = @idParentPosition

					SELECT @idParentPosition = idParentPosition
					FROM ORGPOSITION
					WHERE idPosition = @idPosition
				END
				ELSE
				BEGIN
					SET @finished = 1
				END
			END

			IF (@LoopError = 0 )
			BEGIN 
				UPDATE ORGPOSITION
				SET ancestorpath = @ancestorPath
				WHERE idPosition = @idPositionToUpdate
				FETCH NEXT FROM posCursor INTO @idPosition
			END
			ELSE
			BEGIN
				BREAK;
			END
		END

		IF (@LoopError = 1)
		BEGIN
			RAISERROR ('THERE IS A LOOP IN THE POSITION TABLE. YOU MUST CORRECT IT BEFORE CONTINUE.', 17, 1)
		END

		CLOSE posCursor
		DEALLOCATE posCursor
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_ORG_UpdLocationPath]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_ORG_UpdLocationPath]
	AS
	BEGIN
		DECLARE @idLocation INT
		DECLARE @idLocationToUpdate INT
		DECLARE @ancestorPath VARCHAR(150)
		DECLARE locCursor CURSOR FAST_FORWARD FOR SELECT idLocation FROM LOCATION
		DECLARE @idParentLocation int
		DECLARE @finished bit
		DECLARE @LoopError INT

		OPEN locCursor
		FETCH NEXT FROM locCursor INTO @idLocation

		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @idLocationToUpdate = @idLocation
			SET @ancestorPath = ''
			SET @finished = 0
			SET @LoopError = 0

			SELECT @idParentLocation = idParentLocation 
			FROM LOCATION
			WHERE idLocation = @idLocation

			WHILE @finished = 0
			BEGIN
				IF @idParentLocation IS NOT NULL
				BEGIN
					IF (PATINDEX(RTRIM(CAST(@idParentLocation AS NCHAR))+'.%', @ancestorpath) > 0)
					BEGIN
						SET @finished = 1
						SET @LoopError = 1
						BREAK;
					END

					IF (PATINDEX('%.'+RTRIM(CAST(@idParentLocation AS NCHAR))+'.%', @ancestorpath) > 0)
					BEGIN
						SET @finished = 1
						SET @LoopError = 1
						BREAK;
					END

					SET @ancestorpath = RTRIM(CAST(@idParentLocation AS NCHAR)) + '.' + @ancestorpath
					SET @idLocation = @idParentLocation

					SELECT @idParentLocation = idParentLocation
					FROM LOCATION
					WHERE idLocation = @idLocation
				END
				ELSE
				BEGIN
					SET @finished = 1
				END
			END

			IF (@LoopError = 0 )
			BEGIN
				UPDATE LOCATION
				SET ancestorpath = @ancestorPath
				WHERE idLocation = @idLocationToUpdate
				FETCH NEXT FROM locCursor INTO @idLocation
			END
			ELSE
			BEGIN
				BREAK;
			END
		END

		CLOSE locCursor
		DEALLOCATE locCursor
		IF (@LoopError = 1)
		BEGIN
			RAISERROR ('THERE IS A LOOP IN THE LOCATION TABLE. YOU MUST CORRECT IT BEFORE CONTINUE.', 17, 1)
		END
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_EM_GetReferencingEntity]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_EM_GetReferencingEntity](@iIdEnt integer, @sKeyValue varchar(30), @iIdRefEnt integer output, @sRefEntKeyValue varchar(30) output)
		AS
		BEGIN
			declare @_CrsrVar CURSOR
			declare @sSql nvarchar(500)
			declare @sRelId varchar(30)
			declare @bFound bit
			set @bFound = 0

			-- find s-m relations
			IF (@bFound = 0)
			BEGIN

				-- Allocate a cursor variable. 
				DECLARE @iIdEntFk integer, @sTabFk sysname, @sColFkSrgk sysname, @sColFk sysname, @bfkCompKey bit, @sVirtualTableFk sysname

				-- execute query to retrieve related entities
				SET @_CrsrVar = CURSOR FAST_FORWARD FOR 
				( 
					SELECT entFk.idEnt idEntFk, entFk.entSrc tabFk, ISNULL(entFk.entSurrogateKey, 'id' + entFk.entsrc) colFkSrgk, atrFk.attribSrc colFk, CASE WHEN entFkKey.idEnt IS NULL THEN 0 ELSE 1 END fkCompKey,
					entFk.entEKSrc VirtualTabFk
					FROM Entity entFk 
					INNER JOIN Attrib atrFk ON entFk.idEnt = atrFk.idEnt
					LEFT OUTER JOIN EntityKey entFkKey ON entFk.idEnt = entFkKey.idEnt
					WHERE atrFk.idEntRelated IS NOT NULL AND atrFk.idEntRelated = @iIdEnt
					GROUP BY entFk.idEnt, entFk.entSrc, entFk.entSurrogateKey, entFk.entEKSrc, atrFk.attribSrc, entFkKey.idEnt
				)
				OPEN @_CrsrVar
				FETCH NEXT FROM @_CrsrVar INTO @iIdEntFk, @sTabFk, @sColFkSrgk, @sColFk, @bfkCompKey, @sVirtualTableFk

				WHILE( @@FETCH_STATUS <> -1  AND  @bFound = 0)
				BEGIN
					IF( @@FETCH_STATUS <> -2 )
					BEGIN
						-- checks if entity has composite key
						IF @bfkCompKey = 0
						BEGIN
							-- counts and gets reference in a single query
							set @sSql = 'SELECT @_sRelId = cast(min(tfk.' + @sColFkSrgk + ') as varchar(30)) FROM ' + @sTabFk + ' tfk WITH (NOLOCK) WHERE tfk.' + @sColFk + '=' + @sKeyValue
							exec sp_executesql @sSql, N'@_sRelId varchar(30) output', @_sRelId = @sRelId out
						END
						ELSE
						BEGIN
							-- counts if key is referenced
							declare @iRelCount integer
							set @sSql = 'SELECT @_iRelCount = COUNT(*) FROM ' + @sTabFk + ' tfk WITH (NOLOCK) WHERE tfk.' + @sColFk + '=' + @sKeyValue
							exec sp_executesql @sSql, N'@_iRelCount integer output', @_iRelCount = @iRelCount out

							set @sRelId = null
							if @iRelCount > 0
							begin
								-- builds join condition from source table to composite key table
								DECLARE @sKeyAttribJoin varchar(8000) 
								set @sSQL = 'SELECT replace(''tfkkey.{0} = tfk.{0} AND '', ''{0}'', ATTRIB.attribSrc) FROM ENTITYKEY INNER JOIN ATTRIB ON ATTRIB.idAttrib = ENTITYKEY.idAttrib WHERE ENTITYKEY.idEnt = ' + CAST(@iIdEntFk AS varchar(30))
								EXEC spBA_DB_ConcatRows @sSQL, @sKeyAttribJoin output
								SET @sKeyAttribJoin = LEFT(@sKeyAttribJoin, LEN(@sKeyAttribJoin) - 4)
								
								-- finds first reference
								set @sSQL = replace(replace(replace(replace(replace(replace(
									'SELECT @_sRelId = cast(min(tfkkey.{1}) as varchar(30)) FROM {0} tfk WITH (NOLOCK) INNER JOIN {5} tfkkey WITH (NOLOCK) ON {2} WHERE tfk.{3}={4}', 
									'{0}', @sTabFk), 
									'{1}', @sColFkSrgk), 
									'{2}', @sKeyAttribJoin), 
									'{3}', @sColFk), 
									'{4}', @sKeyValue),
									'{5}', @sVirtualTableFk)

								exec sp_executesql @sSql, N'@_sRelId varchar(30) output', @_sRelId = @sRelId out
							end
						END

						if (@sRelId is not null)
						begin
							-- reference exists
							set @iIdRefEnt = @iIdEntFk
							set @sRefEntKeyValue = @sRelId
							set @bFound = 1
						end
					END
					FETCH NEXT FROM @_CrsrVar INTO @iIdEntFk, @sTabFk, @sColFkSrgk, @sColFk, @bfkCompKey
				END

				CLOSE @_CrsrVar
				DEALLOCATE @_CrsrVar
			END

			-- find m-m relations
			IF (@bFound = 0)
			BEGIN
				-- Allocate a cursor variable. 
				DECLARE @iIdRelEnt integer, @sTabMM sysname, @sColEnt sysname, @sColEntRel sysname

				-- execute query to retrieve related entities
				SET @_CrsrVar = CURSOR FAST_FORWARD FOR 
				( 
					SELECT fctRel.idRelEnt, fctRel.factSrc tabMM, ISNULL(ent.entSurrogateKey, 'id' + ent.entSrc) colEnt, ISNULL(entRel.entSurrogateKey, 'id' + entRel.entSrc) colEntRel
					FROM (
							SELECT (case when fct.idLeftEntity = @iIdEnt then fct.idRightEntity else fct.idLeftEntity end) idRelEnt, fct.factSrc
							FROM fact fct
							WHERE fct.idFactRelationType = 2  AND  (fct.idLeftEntity = @iIdEnt  OR  fct.idRightEntity = @iIdEnt)  
						) fctRel, 
						Entity ent, Entity entRel
					WHERE ent.idEnt = @iIdEnt  AND  entRel.idEnt = fctRel.idRelEnt
				)
				OPEN @_CrsrVar
				FETCH NEXT FROM @_CrsrVar INTO @iIdRelEnt, @sTabMM, @sColEnt, @sColEntRel

				WHILE( @@FETCH_STATUS <> -1  AND  @bFound = 0)
				BEGIN
					IF( @@FETCH_STATUS <> -2 )
					BEGIN

						-- find references in related entity
						set @sSql = 'SELECT @_sRelId = cast(min(tfct.' + @sColEntRel + ') as varchar(30)) FROM ' + @sTabMM + ' tfct WITH (NOLOCK) WHERE tfct.' + @sColEnt + '=' + @sKeyValue
						exec sp_executesql @sSql, N'@_sRelId varchar(30) output', @_sRelId = @sRelId out

						if (@sRelId is not null)
						begin
							-- reference exists
							set @iIdRefEnt = @iIdRelEnt
							set @sRefEntKeyValue = @sRelId
							set @bFound = 1
						end

					END
					FETCH NEXT FROM @_CrsrVar INTO @iIdRelEnt, @sTabMM, @sColEnt, @sColEntRel
				END

				CLOSE @_CrsrVar
				DEALLOCATE @_CrsrVar
			END

			-- not found related instances
			IF (@bFound = 0)
			BEGIN
				set @iIdRefEnt = null
				set @sRefEntKeyValue = null
			END

		END
GO
/****** Object:  Table [dbo].[LGENTITYDATA]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LGENTITYDATA](
	[idLgEntityData] [int] IDENTITY(10000,1) NOT NULL,
	[idLgLanguage] [int] NOT NULL,
	[idLgEntityMetadata] [int] NOT NULL,
	[idSurrogateKey] [nvarchar](50) NOT NULL,
	[resValue] [nvarchar](255) NOT NULL,
	[guidLgEntityData] [uniqueidentifier] NOT NULL,
	[dplyLgEntityData] [tinyint] NOT NULL,
 CONSTRAINT [LGENTITYDATA_PK] PRIMARY KEY CLUSTERED 
(
	[idLgEntityData] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [LGENTITYDATA_UKG] UNIQUE NONCLUSTERED 
(
	[guidLgEntityData] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [LGENTITYDATA_FK_IDX_1] ON [dbo].[LGENTITYDATA] 
(
	[idLgEntityMetadata] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [LGENTITYDATA_FK_IDX_2] ON [dbo].[LGENTITYDATA] 
(
	[idLgLanguage] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QUERYFORM]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUERYFORM](
	[idQueryForm] [int] IDENTITY(1,1) NOT NULL,
	[qfName] [nvarchar](26) NOT NULL,
	[qfDisplayName] [nvarchar](50) NOT NULL,
	[qfDescription] [nvarchar](50) NULL,
	[qfHelpText] [nvarchar](250) NULL,
	[idForm] [int] NOT NULL,
	[qfAllAppsSearch] [bit] NOT NULL,
	[guidQueryForm] [uniqueidentifier] NOT NULL,
	[dplyQueryForm] [tinyint] NOT NULL,
 CONSTRAINT [QUERYFORM_PK] PRIMARY KEY CLUSTERED 
(
	[idQueryForm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [QUERYFORM_UK1] UNIQUE NONCLUSTERED 
(
	[qfName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [QUERYFORM_UK2] UNIQUE NONCLUSTERED 
(
	[qfDisplayName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [QUERYFORM_UKG] UNIQUE NONCLUSTERED 
(
	[guidQueryForm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [QUERYFORM_FK_IDX_1] ON [dbo].[QUERYFORM] 
(
	[idForm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RENDER]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RENDER](
	[idRender] [int] IDENTITY(1,1) NOT NULL,
	[idForm] [int] NOT NULL,
	[idAttrib] [int] NULL,
	[idFact] [int] NULL,
	[rdrDisplayName] [nvarchar](250) NULL,
	[rdrDescription] [nvarchar](50) NULL,
	[rdrHelpText] [nvarchar](250) NULL,
	[rdrDisplayOrder] [int] NOT NULL,
	[rdrType] [int] NOT NULL,
	[idDisplayForm] [int] NULL,
	[rdrTypeDisplayField] [int] NOT NULL,
	[rdrLineBreak] [int] NOT NULL,
	[rdrSubmitOnChange] [int] NULL,
	[idRenderTab] [int] NULL,
	[idRenderGroup] [int] NULL,
	[idDisplayAttrib] [int] NULL,
	[idOrderByAttrib] [int] NULL,
	[filterAttrib] [nvarchar](1000) NULL,
	[guidRender] [uniqueidentifier] NOT NULL,
	[rdrLabelAlign] [tinyint] NOT NULL,
	[rdrValueAlign] [tinyint] NOT NULL,
	[idScopeItemDef] [int] NULL,
	[dplyRender] [tinyint] NOT NULL,
	[XPATH] [nvarchar](1000) NULL,
	[guidBaScopeItemDef] [uniqueidentifier] NULL,
	[guidRdrEditable] [uniqueidentifier] NULL,
	[guidRdrRequired] [uniqueidentifier] NULL,
	[guidRdrVisible] [uniqueidentifier] NULL,
	[guidButtonRule] [uniqueidentifier] NULL,
	[guidInterfaceInstance] [uniqueidentifier] NULL,
 CONSTRAINT [RENDER_PK] PRIMARY KEY CLUSTERED 
(
	[idRender] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [RENDER_UKG] UNIQUE NONCLUSTERED 
(
	[guidRender] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_RENDER] ON [dbo].[RENDER] 
(
	[idForm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RENDER_FK_IDX_1] ON [dbo].[RENDER] 
(
	[idAttrib] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RENDER_FK_IDX_10] ON [dbo].[RENDER] 
(
	[idDisplayForm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RENDER_FK_IDX_12] ON [dbo].[RENDER] 
(
	[idRenderGroup] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RENDER_FK_IDX_13] ON [dbo].[RENDER] 
(
	[idRenderTab] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RENDER_FK_IDX_14] ON [dbo].[RENDER] 
(
	[rdrType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RENDER_FK_IDX_2] ON [dbo].[RENDER] 
(
	[idDisplayAttrib] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RENDER_FK_IDX_3] ON [dbo].[RENDER] 
(
	[idOrderByAttrib] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RENDER_FK_IDX_4] ON [dbo].[RENDER] 
(
	[idScopeItemDef] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RENDER_FK_IDX_9] ON [dbo].[RENDER] 
(
	[idFact] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FORMMD]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FORMMD](
	[idFormMD] [int] NOT NULL,
	[idForm] [int] NULL,
	[idEnt] [int] NULL,
	[formXML] [text] NULL,
	[formControl] [image] NULL,
	[idLgLanguage] [int] NULL,
	[guidEntity] [uniqueidentifier] NULL,
 CONSTRAINT [FORMMD_PK] PRIMARY KEY CLUSTERED 
(
	[idFormMD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [FORMMD_FK_IDX_1] ON [dbo].[FORMMD] 
(
	[idLgLanguage] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FormMD_idEnt] ON [dbo].[FORMMD] 
(
	[idEnt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FormMD_idForm] ON [dbo].[FORMMD] 
(
	[idForm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JOB]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JOB](
	[idJob] [int] IDENTITY(1,1) NOT NULL,
	[jobName] [nvarchar](50) NOT NULL,
	[jobDescription] [nvarchar](100) NULL,
	[jobType] [tinyint] NOT NULL,
	[jobCreationDate] [datetime] NOT NULL,
	[jobEnabled] [bit] NOT NULL,
	[idCreatorUser] [int] NULL,
	[jobNextRunTime] [datetime] NULL,
	[idCase] [int] NULL,
	[idWorkItem] [bigint] NULL,
	[DELETED] [bit] NULL,
 CONSTRAINT [JOB_PK] PRIMARY KEY CLUSTERED 
(
	[idJob] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [JOB_IX1] ON [dbo].[JOB] 
(
	[idWorkItem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [JOB_IX2] ON [dbo].[JOB] 
(
	[idCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [JOB_IX3] ON [dbo].[JOB] 
(
	[jobName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RENDERACTION]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RENDERACTION](
	[idRenderAction] [int] IDENTITY(1,1) NOT NULL,
	[idRender] [int] NOT NULL,
	[rdrActDescription] [nvarchar](100) NULL,
	[rdrActExpression] [nvarchar](500) NOT NULL,
	[guidRenderAction] [uniqueidentifier] NOT NULL,
	[rdrActResetAppearance] [tinyint] NOT NULL,
	[dplyRenderAction] [tinyint] NOT NULL,
 CONSTRAINT [RENDERACTION_PK] PRIMARY KEY CLUSTERED 
(
	[idRenderAction] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [RENDERACTION_UKG] UNIQUE NONCLUSTERED 
(
	[guidRenderAction] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RENDERACTION_IX1] ON [dbo].[RENDERACTION] 
(
	[idRender] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RENDEREX]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RENDEREX](
	[idRender] [int] NOT NULL,
	[rdrXML] [nvarchar](4000) NOT NULL,
	[guidRenderex] [uniqueidentifier] NOT NULL,
	[dplyRenderex] [tinyint] NOT NULL,
	[idRenderEx] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [RENDEREX_PK] PRIMARY KEY CLUSTERED 
(
	[idRenderEx] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [RENDEREX_UK1] UNIQUE NONCLUSTERED 
(
	[idRender] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [RENDEREX_UKG] UNIQUE NONCLUSTERED 
(
	[guidRenderex] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RENDERBEHAVIOUR]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RENDERBEHAVIOUR](
	[idRenderBehaviour] [int] IDENTITY(1,1) NOT NULL,
	[idRender] [int] NOT NULL,
	[rdrBvrDescription] [nvarchar](100) NULL,
	[rdrBvrExpression] [nvarchar](500) NOT NULL,
	[rdrBvrCommand] [nvarchar](100) NOT NULL,
	[guidRenderBehaviour] [uniqueidentifier] NOT NULL,
	[rdrBvrResetAppearance] [tinyint] NOT NULL,
	[dplyRenderBehaviour] [tinyint] NOT NULL,
 CONSTRAINT [RENDERBEHAVIOUR_PK] PRIMARY KEY CLUSTERED 
(
	[idRenderBehaviour] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [RENDERBEHAVIOUR_UKG] UNIQUE NONCLUSTERED 
(
	[guidRenderBehaviour] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RENDERBEHAVIOUR_IX1] ON [dbo].[RENDERBEHAVIOUR] 
(
	[idRender] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spBA_EM_DropKeyAttribIndex]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_EM_DropKeyAttribIndex]( @sTableName sysname, @sColumnNames varchar(8000))
	AS
	BEGIN
		exec spBA_DB_DropIndexMultiple @sTableName, @sColumnNames, '_EK', 0
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_Sync_ShiftKey]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_Sync_ShiftKey]
	( 
		@aTableNameChange sysname,
		@aIdTableKeyChangeOld int,
		@aIdTableKeyChangeNew int = null,
		@aGenerateQueriesOnlyChange bit,
		@aDatabaseReferenceKeyTab1 VARCHAR(50) = null, 
		@aDatabaseReferenceKeyTab2 VARCHAR(50) = null
	)
	AS
	BEGIN
		declare @_ColumnName varchar(26)
		select @_ColumnName = v.column_name from vwBA_Sync_AllPKeys v where v.table_name = @aTableNameChange

		declare @_IdTableKeyChangeNewCalculated int
		if( @aIdTableKeyChangeNew is not null )
		begin
			-- new key provided
			set @_IdTableKeyChangeNewCalculated = @aIdTableKeyChangeNew
		end
		else
		begin
			-- variables for get maximum value
			declare @nsSql nvarchar(500)
			declare @iMaxDbCurr integer, @iMaxDbRef1 integer, @iMaxDbRef2 integer
			set @iMaxDbCurr = 0
			set @iMaxDbRef1 = 0
			set @iMaxDbRef2 = 0

			-- get maximum value for current database
			set @nsSql = 'select @_iMax = isnull( max(' + @_ColumnName + '), 0) from ' + @aTableNameChange
			exec sp_executesql @nsSql, N'@_iMax integer output', @_iMax = @iMaxDbCurr out

			IF( @aDatabaseReferenceKeyTab1 is not null )
			BEGIN
				-- get maximum value for ref database 1
				set @nsSql = 'select @_iMax = isnull( max(' + @_ColumnName + '), 0) from ' + @aDatabaseReferenceKeyTab1 + '.dbo.' + @aTableNameChange
				exec sp_executesql @nsSql, N'@_iMax integer output', @_iMax = @iMaxDbRef1 out
			END

			IF( @aDatabaseReferenceKeyTab2 is not null )
			BEGIN
				-- get maximum value for ref database 2
				set @nsSql = 'select @_iMax = isnull( max(' + @_ColumnName + '), 0) from ' + @aDatabaseReferenceKeyTab2 + '.dbo.' + @aTableNameChange
				exec sp_executesql @nsSql, N'@_iMax integer output', @_iMax = @iMaxDbRef2 out
			END

			-- get new key value
			declare @_CurrentKey int
			set @_CurrentKey = case when @iMaxDbRef1 > @iMaxDbRef2 then @iMaxDbRef1 else @iMaxDbRef2 end
			set @_CurrentKey = case when @_CurrentKey > @iMaxDbCurr then @_CurrentKey else @iMaxDbCurr end
			set @_CurrentKey = @_CurrentKey + 1

			set @_IdTableKeyChangeNewCalculated = @_CurrentKey
		end

		-- drop the temporary table if already exists 
		if object_id('tempdb..#tbBA_Tmp_ShiftIds') is not null begin drop table #tbBA_Tmp_ShiftIds end

		create table #tbBA_Tmp_ShiftIds(idShift int identity(1,1), idOld varchar(2000), idNew varchar(2000))
		truncate table #tbBA_Tmp_ShiftIds
		insert into #tbBA_Tmp_ShiftIds (idOld, idNew) values (@aIdTableKeyChangeOld, @_IdTableKeyChangeNewCalculated)
		exec spBA_Sync_ShiftKey_AuxSP @aTableNameChange, @aGenerateQueriesOnlyChange
		drop table #tbBA_Tmp_ShiftIds
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_Sync_ShiftKeysTable]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_Sync_ShiftKeysTable]
	( 
		@aTableNameChangeTab sysname,
		@aGenerateQueriesOnlyChangeTab bit, 
		@aSqlWhereCriteria VARCHAR(500) = null, 
		@aDatabaseReferenceKeyTab1 VARCHAR(50) = null, 
		@aDatabaseReferenceKeyTab2 VARCHAR(50) = null
	)
	AS
	BEGIN
		declare @_SqlQuery varchar(200)

		declare @_ColumnName varchar(26)
		select @_ColumnName = v.column_name from vwBA_Sync_AllPKeys v where v.table_name = @aTableNameChangeTab

		-- variables for get maximum value
		declare @nsSql nvarchar(500)
		declare @iMaxDbCurr integer, @iMaxDbRef1 integer, @iMaxDbRef2 integer
		set @iMaxDbCurr = 0
		set @iMaxDbRef1 = 0
		set @iMaxDbRef2 = 0

		-- get maximum value for current database
		set @nsSql = 'select @_iMax = isnull( max(' + @_ColumnName + '), 0) from ' + @aTableNameChangeTab
		exec sp_executesql @nsSql, N'@_iMax integer output', @_iMax = @iMaxDbCurr out

		IF( @aDatabaseReferenceKeyTab1 is not null )
		BEGIN
			-- get maximum value for ref database 1
			set @nsSql = 'select @_iMax = isnull( max(' + @_ColumnName + '), 0) from ' + @aDatabaseReferenceKeyTab1 + '.dbo.' + @aTableNameChangeTab
			exec sp_executesql @nsSql, N'@_iMax integer output', @_iMax = @iMaxDbRef1 out
		END

		IF( @aDatabaseReferenceKeyTab2 is not null )
		BEGIN
			-- get maximum value for ref database 2
			set @nsSql = 'select @_iMax = isnull( max(' + @_ColumnName + '), 0) from ' + @aDatabaseReferenceKeyTab2 + '.dbo.' + @aTableNameChangeTab
			exec sp_executesql @nsSql, N'@_iMax integer output', @_iMax = @iMaxDbRef2 out
		END

		-- get new key value
		declare @_CurrentKey int
		set @_CurrentKey = case when @iMaxDbRef1 > @iMaxDbRef2 then @iMaxDbRef1 else @iMaxDbRef2 end
		set @_CurrentKey = case when @_CurrentKey > @iMaxDbCurr then @_CurrentKey else @iMaxDbCurr end
		set @_CurrentKey = @_CurrentKey + 1


		-- drop the temporary table if already exists 
		if object_id('tempdb..#tbBA_Tmp_ShiftIds') is not null begin drop table #tbBA_Tmp_ShiftIds end

		-- temp ids table
		create table #tbBA_Tmp_ShiftIds(idShift int identity(1,1), idOld varchar(2000), idNew varchar(2000))
		truncate table #tbBA_Tmp_ShiftIds

		-- Allocate a cursor variable. 
		DECLARE @_CrsrVar CURSOR
		-- Variables for sp_pkeys result set
		DECLARE @_IdKey sysname

		-- Execute the procedure to fill the cursor with tables that reference the table
		set @nsSql = 'SET @TmpCrsrVar = CURSOR FAST_FORWARD FOR SELECT ' + @_ColumnName + ' FROM ' + @aTableNameChangeTab + (case when @aSqlWhereCriteria is not null then ' WHERE (' + @aSqlWhereCriteria + ')' else '' end) + ' ORDER BY ' + @_ColumnName + '
			OPEN @TmpCrsrVar'
		exec sp_executesql @nsSql, N'@TmpCrsrVar CURSOR output', @TmpCrsrVar = @_CrsrVar out

		FETCH NEXT FROM @_CrsrVar INTO @_IdKey
		WHILE( @@FETCH_STATUS <> -1 )
		BEGIN
			IF( @@FETCH_STATUS <> -2 )
			BEGIN
				insert into #tbBA_Tmp_ShiftIds (idOld, idNew) values (@_IdKey, @_CurrentKey)
				SET @_CurrentKey = @_CurrentKey + 1
			END
			FETCH NEXT FROM @_CrsrVar INTO @_IdKey
		END

		CLOSE @_CrsrVar
		DEALLOCATE @_CrsrVar

		exec spBA_Sync_ShiftKey_AuxSP @aTableNameChangeTab, @aGenerateQueriesOnlyChangeTab
		drop table #tbBA_Tmp_ShiftIds
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_CreateColumnDefault]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_CreateColumnDefault] ( @sTableName sysname, @sColumnName sysname, @sDefaultValue varchar(4000) )
	AS
	BEGIN
		DECLARE @sConstraintName sysname
		SET @sConstraintName = 'DF_' + REPLACE(REPLACE(@sTableName, '[', ''), ']', '') + '_' + REPLACE(REPLACE(@sColumnName, '[', ''), ']', '')
		EXEC( 'ALTER TABLE ' + @sTableName + ' ADD CONSTRAINT ' + @sConstraintName + ' DEFAULT (' + @sDefaultValue + ') FOR ' + @sColumnName )

		EXEC spBA_DB_FixTableDefaultNames @sTableName, 0
	END
GO
/****** Object:  Table [dbo].[RENDERVALIDATION]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RENDERVALIDATION](
	[idRenderValidation] [int] IDENTITY(1,1) NOT NULL,
	[idRender] [int] NOT NULL,
	[rdrValDescription] [nvarchar](100) NULL,
	[rdrValExpression] [nvarchar](500) NOT NULL,
	[rdrValMessage] [nvarchar](100) NOT NULL,
	[guidRenderValidation] [uniqueidentifier] NOT NULL,
	[rdrIsServerValidation] [bit] NOT NULL,
	[dplyRenderValidation] [tinyint] NOT NULL,
 CONSTRAINT [RENDERVALIDATION_PK] PRIMARY KEY CLUSTERED 
(
	[idRenderValidation] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [RENDERVALIDATION_UKG] UNIQUE NONCLUSTERED 
(
	[guidRenderValidation] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RENDERVALIDATION_IX1] ON [dbo].[RENDERVALIDATION] 
(
	[idRender] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_FixAllDefaultNames]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_FixAllDefaultNames] AS
	BEGIN
		exec spBA_DB_FixTableDefaultNames '*', 1
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_EM_CreateKeyAttribIndex]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_EM_CreateKeyAttribIndex]( @sTableName sysname, @sColumnNames varchar(8000))
	AS
	BEGIN
		exec spBA_DB_CreateIndexMultiple @sTableName, @sColumnNames, 1, '_EK', 0, 0
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_ReserveSystemIDs]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_ReserveSystemIDs]
	( 
		@sTableName sysname,
		@sPKColumnName sysname,
		@iShiftValue integer, 
		@bOnlyPrintSql bit,
		@bUseMassiveShift bit = 0,
		@bTrace bit = 0
	)
	AS
	BEGIN
		-- if identity seed < @iShiftValue
		declare @iCurrIdentSeed integer, @iCurrIdentIncr integer
		select @iCurrIdentSeed = identity_seed, @iCurrIdentIncr = identity_incr from vwBA_Sync_AllIdentities where table_name = @sTableName
		if (@iCurrIdentSeed is null) begin print('-- Table ' + @sTableName + ' does not have Identity.' ) return end
		if (@iCurrIdentSeed = @iShiftValue) begin print('-- IDs for table ' + @sTableName + ' already shifted by ' + cast(@iShiftValue as sysname) ) return end

		-- get script for recreate table
		-- DO IT BEFORE SHIFT TO AVOID LOCK WITH TABLE!!!
		declare @sBufferStart varchar(8000), @sBufferCreate varchar(8000), @sBufferEnd varchar(8000)
		exec spBA_SQL_ScriptRecreateTable @sTableName, @sBufferStart output, @sBufferCreate output, @sBufferEnd output

		declare @sSqlQuery varchar(8000)

		if(@bUseMassiveShift = 0)
		begin
			-- drop the temporary table if already exists 
			if object_id('tempdb..#tbBA_Tmp_ShiftIds') is not null begin drop table #tbBA_Tmp_ShiftIds end
	
			-- temp ids table
			create table #tbBA_Tmp_ShiftIds (idShift int identity(1,1), idOld varchar(2000), idNew varchar(2000))
			truncate table #tbBA_Tmp_ShiftIds
	
			-- insert mapping in temporal table
			set @sSqlQuery = replace(replace(replace(
				'insert into #tbBA_Tmp_ShiftIds (idOld, idNew) select {1}, {1} + {2} from {0} order by cast({1} as integer) desc', 
				'{0}', @sTableName), 
				'{1}', @sPKColumnName),
				'{2}', @iShiftValue)
			exec ( @sSqlQuery )
	
			-- shift IDs
			print('-- BEGIN: Shift IDs for table ' + @sTableName + ' by ' + cast(@iShiftValue as sysname) )
			exec spBA_Sync_ShiftKey_AuxSP @sTableName, @bOnlyPrintSql, @bTrace, 0
			print('-- END: Shift IDs for table ' + @sTableName + ' by ' + cast(@iShiftValue as sysname) )
	
			-- delete temp table
			drop table #tbBA_Tmp_ShiftIds
		end
		else
		begin
			-- shift IDs
			print('-- BEGIN: Shift IDs for table ' + @sTableName + ' by ' + cast(@iShiftValue as sysname) )
			exec spBA_Sync_ShiftKey_AuxSP @sTableName, @bOnlyPrintSql, @bTrace, 1, @iShiftValue
			print('-- END: Shift IDs for table ' + @sTableName + ' by ' + cast(@iShiftValue as sysname) )
		end

		-- change identity seed
		set @sBufferCreate = replace(@sBufferCreate, 
			'IDENTITY (' + cast(@iCurrIdentSeed as sysname) + ', ' + cast(@iCurrIdentIncr as sysname) + ')', 
			'IDENTITY (' + cast(@iShiftValue as sysname) + ', ' + cast(@iCurrIdentIncr as sysname) + ')')
		print('-- BEGIN: Set identity seed (with table recreation) for table ' + @sTableName + ' to ' + cast(@iShiftValue as sysname) )
		if (@bOnlyPrintSql = 1  or  @bTrace = 1)
		begin
			print(@sBufferStart) 
			print(@sBufferCreate) 
			print(@sBufferEnd) 
		end

		if ( @bOnlyPrintSql = 0 ) 
		begin
			exec ( @sBufferStart )
			exec ( @sBufferCreate )
			exec ( @sBufferEnd )
		end
		print('-- END: Set identity seed (with table recreation) for table ' + @sTableName + ' to ' + cast(@iShiftValue as sysname) )
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_RenameTable]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_RenameTable]( @sOldTableName sysname, @sNewTableName sysname )
	AS
	BEGIN
		EXEC sp_rename @sOldTableName, @sNewTableName
		EXEC spBA_DB_FixTableNotNullNames @sNewTableName, 0
		EXEC spBA_DB_FixPKName @sNewTableName, 0
		EXEC spBA_DB_FixTableDefaultNames @sNewTableName, 0
	END;
GO
/****** Object:  Table [dbo].[BACASEACCESSOPEN]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BACASEACCESSOPEN](
	[idCaseAccess] [int] NOT NULL,
	[idUser] [int] NOT NULL,
 CONSTRAINT [BACASEACCESSOPEN_PK] PRIMARY KEY CLUSTERED 
(
	[idCaseAccess] ASC,
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BACASEACCESS]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BACASEACCESS](
	[idCaseAccess] [int] NOT NULL,
	[idUser] [int] NOT NULL,
 CONSTRAINT [BACASEACCESS_PK] PRIMARY KEY CLUSTERED 
(
	[idCaseAccess] ASC,
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAECMMETADATA]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAECMMETADATA](
	[idBAECMMetadata] [int] IDENTITY(10000,1) NOT NULL,
	[metadataName] [nvarchar](200) NULL,
	[metadataId] [nvarchar](200) NOT NULL,
	[idRender] [int] NOT NULL,
	[xpath] [nvarchar](1000) NULL,
	[guidBAECMMetadata] [uniqueidentifier] NOT NULL,
	[dplyBAECMMetadata] [tinyint] NOT NULL,
 CONSTRAINT [BAECMMETADATA_PK] PRIMARY KEY CLUSTERED 
(
	[idBAECMMetadata] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAECMMETADATA_UK1] UNIQUE NONCLUSTERED 
(
	[idRender] ASC,
	[metadataId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAECMMETADATA_UKG] UNIQUE NONCLUSTERED 
(
	[guidBAECMMetadata] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAUSERACCESSLOG]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAUSERACCESSLOG](
	[idUserAccessLog] [int] IDENTITY(1,1) NOT NULL,
	[accessedPage] [nvarchar](1000) NOT NULL,
	[idUser] [int] NOT NULL,
	[ualEntryDate] [datetime] NULL,
 CONSTRAINT [BAUSERACCESSLOG_PK] PRIMARY KEY CLUSTERED 
(
	[idUserAccessLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAUSERACCESSLOG_FK_IDX_1] ON [dbo].[BAUSERACCESSLOG] 
(
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAUSERSTATISTICS_CASE]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAUSERSTATISTICS_CASE](
	[idUSCase] [int] NOT NULL,
	[idUser] [int] NOT NULL,
	[lastDate] [datetime] NOT NULL,
 CONSTRAINT [BAUSERSTATISTICS_CASE_PK] PRIMARY KEY CLUSTERED 
(
	[idUSCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ID_USER_UQ1] UNIQUE NONCLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAUSERGROUPUSER]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAUSERGROUPUSER](
	[idBAUserGroupUser] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[userGroupUserInclude] [bit] NOT NULL,
	[guidUserGroup] [uniqueidentifier] NULL,
 CONSTRAINT [BAUSERGROUPUSER_PK] PRIMARY KEY CLUSTERED 
(
	[idBAUserGroupUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAUSERGROUPUSER_FK_IDX_2] ON [dbo].[BAUSERGROUPUSER] 
(
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAWPQUERY]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAWPQUERY](
	[idBAWPQuery] [int] IDENTITY(10000,1) NOT NULL,
	[idParentQuery] [int] NULL,
	[idApplication] [int] NULL,
	[WPQueryName] [nvarchar](50) NULL,
	[idUser] [int] NULL,
	[WPQueryCurrentCases] [bit] NULL,
	[WPQueryOpenCases] [bit] NULL,
	[WPQueryMonths] [int] NULL,
	[idSystemQuery] [int] NULL,
	[deleted] [bit] NULL,
	[WPQueryDays] [int] NULL,
 CONSTRAINT [BAWPQUERY_PK] PRIMARY KEY CLUSTERED 
(
	[idBAWPQuery] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAWPQUERY_FK_IDX_1] ON [dbo].[BAWPQUERY] 
(
	[idApplication] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAWPQUERY_FK_IDX_2] ON [dbo].[BAWPQUERY] 
(
	[idParentQuery] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAWPQUERY_FK_IDX_3] ON [dbo].[BAWPQUERY] 
(
	[idSystemQuery] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAWPQUERY_FK_IDX_4] ON [dbo].[BAWPQUERY] 
(
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAWPFOLDER]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAWPFOLDER](
	[idBAWPFolder] [int] IDENTITY(10000,1) NOT NULL,
	[idBAWPParentFolder] [int] NULL,
	[WPFolderName] [nvarchar](50) NULL,
	[idUser] [int] NOT NULL,
 CONSTRAINT [BAWPFOLDER_PK] PRIMARY KEY CLUSTERED 
(
	[idBAWPFolder] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAWPFOLDER_FK_IDX_1] ON [dbo].[BAWPFOLDER] 
(
	[idBAWPParentFolder] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAWPFOLDER_FK_IDX_2] ON [dbo].[BAWPFOLDER] 
(
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ENTITYLOG]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ENTITYLOG](
	[idEntityLog] [bigint] IDENTITY(1,1) NOT NULL,
	[idEnt] [int] NOT NULL,
	[idSurrogateKey] [bigint] NOT NULL,
	[idWorkItem] [bigint] NOT NULL,
	[idUser] [int] NOT NULL,
	[idEntLogOpType] [tinyint] NOT NULL,
	[elNewDisabled] [bit] NULL,
	[elEntryDate] [datetime] NULL,
 CONSTRAINT [ENTITYLOG_PK] PRIMARY KEY CLUSTERED 
(
	[idEntityLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ENTITYLOG_IX1] ON [dbo].[ENTITYLOG] 
(
	[idWorkItem] ASC,
	[idUser] ASC
)
INCLUDE ( [elEntryDate]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DWKPI]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DWKPI](
	[idKpi] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[kpiDisplayName] [nvarchar](50) NOT NULL,
 CONSTRAINT [DWKPI_PK] PRIMARY KEY CLUSTERED 
(
	[idKpi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DWKPI_FK_IDX_1] ON [dbo].[DWKPI] 
(
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STOREDQUERYFORM]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STOREDQUERYFORM](
	[idStoredQueryForm] [int] IDENTITY(1,1) NOT NULL,
	[queryFormGuid] [uniqueidentifier] NOT NULL,
	[idUser] [int] NULL,
	[definitionQueryForm] [text] NULL,
 CONSTRAINT [STOREDQUERYFORM_PK] PRIMARY KEY CLUSTERED 
(
	[idStoredQueryForm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [STOREDQUERYFORM_FK_IDX_1] ON [dbo].[STOREDQUERYFORM] 
(
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [STOREDQUERYFORM_FK_IDX_2] ON [dbo].[STOREDQUERYFORM] 
(
	[queryFormGuid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STOREDQUERY]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STOREDQUERY](
	[idStoredQuery] [int] IDENTITY(1,1) NOT NULL,
	[sqName] [nvarchar](26) NOT NULL,
	[sqDescription] [nvarchar](250) NULL,
	[idUser] [int] NULL,
	[idQueryForm] [int] NULL,
	[sqSearchAllUsers] [bit] NULL,
	[sqProcessState] [tinyint] NULL,
 CONSTRAINT [STOREDQUERY_PK] PRIMARY KEY CLUSTERED 
(
	[idStoredQuery] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [STOREDQUERY_FK_IDX_1] ON [dbo].[STOREDQUERY] 
(
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERAUTH]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERAUTH](
	[idUserAuth] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[password] [nvarchar](255) NULL,
	[secretQuestion] [nvarchar](255) NULL,
	[secretAnswer] [nvarchar](255) NULL,
	[locked] [bit] NOT NULL,
	[expired] [bit] NOT NULL,
	[lastLogonDate] [datetime] NOT NULL,
	[lastChangePasswordDate] [datetime] NOT NULL,
	[failedLoginAttempts] [int] NOT NULL,
 CONSTRAINT [USERAUTH_PK] PRIMARY KEY CLUSTERED 
(
	[idUserAuth] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [USERAUTH_UK1] UNIQUE NONCLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERASSIGNCOUNT]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERASSIGNCOUNT](
	[idUser] [int] NOT NULL,
	[UserAssignCount] [int] NOT NULL,
 CONSTRAINT [USERASSIGNCOUNT_PK] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERSKILL]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERSKILL](
	[idUser] [int] NOT NULL,
	[idSkill] [int] NOT NULL,
 CONSTRAINT [USERSKILL_PK] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC,
	[idSkill] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [USERSKILL_F1] ON [dbo].[USERSKILL] 
(
	[idSkill] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERROLE]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERROLE](
	[idUser] [int] NOT NULL,
	[idRole] [int] NOT NULL,
 CONSTRAINT [USERROLE_PK] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC,
	[idRole] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [USERROLE_F1] ON [dbo].[USERROLE] 
(
	[idRole] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERPOSITION]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERPOSITION](
	[idUser] [int] NOT NULL,
	[idPosition] [int] NOT NULL,
 CONSTRAINT [USERPOSITION_PK] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC,
	[idPosition] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [USERPOSITION_F1] ON [dbo].[USERPOSITION] 
(
	[idPosition] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERPENDINGREQUEST]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERPENDINGREQUEST](
	[idUserPendingRequest] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[requestDate] [datetime] NOT NULL,
	[requestObservation] [nvarchar](100) NOT NULL,
	[requestAttended] [bit] NOT NULL,
	[solutionDate] [datetime] NULL,
 CONSTRAINT [USERPENDINGREQUEST_PK] PRIMARY KEY CLUSTERED 
(
	[idUserPendingRequest] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [USERPENDINGREQUEST_FK_IDX_1] ON [dbo].[USERPENDINGREQUEST] 
(
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [USERPENDINGREQUEST_IX1] ON [dbo].[USERPENDINGREQUEST] 
(
	[requestAttended] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [USERPENDINGREQUEST_IX2] ON [dbo].[USERPENDINGREQUEST] 
(
	[requestDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERORG]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERORG](
	[idOrg] [int] NOT NULL,
	[idUser] [int] NOT NULL,
 CONSTRAINT [USERORG_PK] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC,
	[idOrg] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [USERORG_F1] ON [dbo].[USERORG] 
(
	[idOrg] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERCACHE]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERCACHE](
	[idUser] [int] NOT NULL,
	[idEnt] [int] NOT NULL,
	[idRender] [int] NOT NULL,
	[Cache] [int] NOT NULL,
	[idUserCache] [int] IDENTITY(1,1) NOT NULL,
	[guidEntity] [uniqueidentifier] NULL,
 CONSTRAINT [USERCACHE_PK] PRIMARY KEY CLUSTERED 
(
	[idUserCache] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_USERCACHE] ON [dbo].[USERCACHE] 
(
	[idUser] ASC,
	[idRender] ASC,
	[idEnt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [USERCACHE_IX1] ON [dbo].[USERCACHE] 
(
	[Cache] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WORKINGTIMEUSERDATA]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WORKINGTIMEUSERDATA](
	[idWorkingTimeData] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[weekDay] [tinyint] NOT NULL,
	[isWorking] [bit] NOT NULL,
	[fromDate] [datetime] NULL,
	[toDate] [datetime] NULL,
	[fromTime1] [datetime] NULL,
	[toTime1] [datetime] NULL,
	[fromTime2] [datetime] NULL,
	[toTime2] [datetime] NULL,
	[fromTime3] [datetime] NULL,
	[toTime3] [datetime] NULL,
	[fromTime4] [datetime] NULL,
	[toTime4] [datetime] NULL,
	[fromTime5] [datetime] NULL,
	[toTime5] [datetime] NULL,
 CONSTRAINT [WORKINGTIMEUSERDATA_PK] PRIMARY KEY CLUSTERED 
(
	[idWorkingTimeData] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WORKINGTIMEUSERDATA_FK_IDX_1] ON [dbo].[WORKINGTIMEUSERDATA] 
(
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WFCLASS]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WFCLASS](
	[idWfClass] [int] IDENTITY(1,1) NOT NULL,
	[wfClsName] [nvarchar](26) NOT NULL,
	[wfClsDisplayName] [nvarchar](40) NULL,
	[wfClsDescription] [nvarchar](4000) NULL,
	[wfClsHelpText] [nvarchar](100) NULL,
	[wfClsDisplayOrder] [smallint] NULL,
	[wfClsCreationDate] [datetime] NOT NULL,
	[guidWFClass] [uniqueidentifier] NOT NULL,
	[idCategory] [int] NOT NULL,
	[idAllocPrinciple] [int] NOT NULL,
	[idwfAccessType] [tinyint] NOT NULL,
	[display] [bit] NOT NULL,
	[wfClsUseParentRadNumber] [bit] NULL,
	[dplyWFClass] [tinyint] NOT NULL,
	[wfClsHelpURL] [nvarchar](1000) NULL,
	[guidCustomizedResult] [uniqueidentifier] NULL,
 CONSTRAINT [WFCLASS_PK] PRIMARY KEY CLUSTERED 
(
	[idWfClass] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [WFCLASS_UK1] UNIQUE NONCLUSTERED 
(
	[wfClsName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [WFCLASS_UK2] UNIQUE NONCLUSTERED 
(
	[wfClsDisplayName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [WFCLASS_UKG] UNIQUE NONCLUSTERED 
(
	[guidWFClass] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_WFCLASS] ON [dbo].[WFCLASS] 
(
	[idwfAccessType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WFCLASS_FK_IDX_1] ON [dbo].[WFCLASS] 
(
	[idAllocPrinciple] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WFCLASS_FK_IDX_2] ON [dbo].[WFCLASS] 
(
	[idCategory] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WORKFLOW]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WORKFLOW](
	[idWorkflow] [int] IDENTITY(1,1) NOT NULL,
	[wfActive] [bit] NOT NULL,
	[wfVersion] [nvarchar](10) NOT NULL,
	[wfDocument] [image] NULL,
	[wfCreationDate] [datetime] NOT NULL,
	[wfEstimatedDuration] [int] NULL,
	[idWFClass] [int] NOT NULL,
	[guidWorkflow] [uniqueidentifier] NOT NULL,
	[wfLowTolerance] [int] NULL,
	[wfHighTolerance] [int] NULL,
	[wfExtEstimatedDuration] [int] NOT NULL,
	[wfEnvironment] [tinyint] NULL,
	[idScopeDef] [int] NULL,
	[wfSupportsScopes] [bit] NOT NULL,
	[dplyWorkflow] [tinyint] NOT NULL,
	[wfImage] [image] NULL,
	[idPool] [int] NULL,
	[wfXPDL] [image] NULL,
	[wfModelerCreationVersion] [nvarchar](12) NULL,
	[wfModelerVersion] [nvarchar](12) NULL,
	[wfDocumentationSettings] [image] NULL,
	[wfCaseAccessType] [int] NULL,
	[wfRenderVersion] [int] NULL,
	[formsVersion] [int] NULL,
	[idGlobalForm] [uniqueidentifier] NULL,
	[idSummaryForm] [uniqueidentifier] NULL,
	[wfMobileAccess] [bit] NOT NULL,
	[atRiskTime] [int] NULL,
 CONSTRAINT [WORKFLOW_PK] PRIMARY KEY CLUSTERED 
(
	[idWorkflow] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [WORKFLOW_UK1] UNIQUE NONCLUSTERED 
(
	[idWFClass] ASC,
	[wfVersion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [WORKFLOW_UKG] UNIQUE NONCLUSTERED 
(
	[guidWorkflow] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_WORKFLOW] ON [dbo].[WORKFLOW] 
(
	[idWFClass] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WORKFLOW_FK_IDX_1] ON [dbo].[WORKFLOW] 
(
	[wfCaseAccessType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WORKFLOW_FK_IDX_2] ON [dbo].[WORKFLOW] 
(
	[idPool] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WORKFLOW_FK_IDX_3] ON [dbo].[WORKFLOW] 
(
	[idScopeDef] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WORKFLOW_FK_IDX_4] ON [dbo].[WORKFLOW] 
(
	[wfEnvironment] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WFCONFIG]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WFCONFIG](
	[idWfConfig] [int] IDENTITY(1,1) NOT NULL,
	[enableTaskLogging] [bit] NOT NULL,
	[enablePropertyLogging] [bit] NOT NULL,
	[enableAlarms] [bit] NOT NULL,
	[enableNotifications] [bit] NOT NULL,
	[idWfClass] [int] NOT NULL,
	[guidWfConfig] [uniqueidentifier] NOT NULL,
	[dplyWfConfig] [tinyint] NOT NULL,
 CONSTRAINT [WFCONFIG_PK] PRIMARY KEY CLUSTERED 
(
	[idWfConfig] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [WFCONFIG_UK1] UNIQUE NONCLUSTERED 
(
	[idWfClass] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [WFCONFIG_UKG] UNIQUE NONCLUSTERED 
(
	[guidWfConfig] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERAUTHHISTORY]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USERAUTHHISTORY](
	[idUserAuthHistiory] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](100) NOT NULL,
	[passwordOrder] [int] NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[idUserAuth] [int] NULL,
 CONSTRAINT [USERAUTHHISTORY_PK] PRIMARY KEY CLUSTERED 
(
	[idUserAuthHistiory] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOREDQUERYVALUE]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STOREDQUERYVALUE](
	[idStoredQueryValue] [int] IDENTITY(1,1) NOT NULL,
	[idStoredQuery] [int] NOT NULL,
	[idRender] [int] NOT NULL,
	[sqvValue] [nvarchar](50) NULL,
	[idRuleforValue] [int] NULL,
	[sqvOutputOrder] [tinyint] NOT NULL,
	[sqvSortOrder] [tinyint] NOT NULL,
	[sqvInclude] [bit] NOT NULL,
 CONSTRAINT [STOREDQUERYVALUE_PK] PRIMARY KEY CLUSTERED 
(
	[idStoredQueryValue] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [STOREDQUERYVALUE_FK_IDX_1] ON [dbo].[STOREDQUERYVALUE] 
(
	[idRender] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [STOREDQUERYVALUE_FK_IDX_2] ON [dbo].[STOREDQUERYVALUE] 
(
	[idStoredQuery] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STOREDQUERYUSER]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STOREDQUERYUSER](
	[idStoredQueryUser] [int] IDENTITY(1,1) NOT NULL,
	[idStoredQuery] [int] NOT NULL,
	[idUser] [int] NOT NULL,
 CONSTRAINT [STOREDQUERYUSER_PK] PRIMARY KEY CLUSTERED 
(
	[idStoredQueryUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [STOREDQUERYUSER_FK_IDX_1] ON [dbo].[STOREDQUERYUSER] 
(
	[idStoredQuery] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [STOREDQUERYUSER_FK_IDX_2] ON [dbo].[STOREDQUERYUSER] 
(
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STOREDQUERYGROUP]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STOREDQUERYGROUP](
	[idStoredQueryGroup] [int] IDENTITY(1,1) NOT NULL,
	[idStoredQuery] [int] NOT NULL,
	[guidUserGroup] [uniqueidentifier] NULL,
 CONSTRAINT [STOREDQUERYGROUP_PK] PRIMARY KEY CLUSTERED 
(
	[idStoredQueryGroup] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STOREDQUERYFORMUSER]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STOREDQUERYFORMUSER](
	[idStoredQueryFormUser] [int] IDENTITY(1,1) NOT NULL,
	[idStoredQueryForm] [int] NOT NULL,
	[idUser] [int] NOT NULL,
 CONSTRAINT [STOREDQUERYFORMUSER_PK] PRIMARY KEY CLUSTERED 
(
	[idStoredQueryFormUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [STOREDQUERYFORMUSER_FK_IDX_1] ON [dbo].[STOREDQUERYFORMUSER] 
(
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [STOREDQUERYFORMUSER_FK_IDX_2] ON [dbo].[STOREDQUERYFORMUSER] 
(
	[idStoredQueryForm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STOREDQUERYFORMGROUP]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STOREDQUERYFORMGROUP](
	[idStoredQueryFormGroup] [int] IDENTITY(1,1) NOT NULL,
	[idStoredQueryForm] [int] NOT NULL,
	[guidUserGroup] [uniqueidentifier] NULL,
 CONSTRAINT [STOREDQUERYFORMGROUP_PK] PRIMARY KEY CLUSTERED 
(
	[idStoredQueryFormGroup] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spBA_WFE_add_to_entitylog]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_WFE_add_to_entitylog]
		(
			@idEnt INT, 
			@idSurrogateKey BIGINT, 
			@idWorkitem BIGINT, 
			@idUser INT, 
			@idEntLogOpType TINYINT,
			@elNewDisabled BIT,
			@RetVal BIGINT OUTPUT
		)
		AS
		BEGIN
			INSERT INTO ENTITYLOG 
				(idEnt, idSurrogateKey, idWorkitem, idUser, idEntLogOpType, elNewDisabled)
			VALUES 
				(@idEnt, @idSurrogateKey, @idWorkitem, @idUser, @idEntLogOpType, @elNewDisabled)

		SELECT @RetVal = @@IDENTITY
		END
GO
/****** Object:  StoredProcedure [dbo].[spBA_WFE_addtobauseraccesslog]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_WFE_addtobauseraccesslog]
			(
				@accessedPage NVARCHAR(1000), 
				@idUser INT
			)
			AS
			BEGIN
				INSERT INTO BAUSERACCESSLOG
					(accessedPage, idUser)
				VALUES 
					(@accessedPage, @idUser)
			END
GO
/****** Object:  Table [dbo].[DWKPICONTEXT]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DWKPICONTEXT](
	[idKpiContext] [int] IDENTITY(1,1) NOT NULL,
	[idKpi] [int] NOT NULL,
	[idMeasureQualifier] [int] NOT NULL,
	[kctDisplayName] [nvarchar](50) NULL,
	[kctFilters] [text] NULL,
	[kctTimeFilter] [nvarchar](100) NULL,
	[kct_cdLevel] [tinyint] NULL,
	[kct_cdOffset] [int] NULL,
	[kctUsesCustomQualifier] [bit] NOT NULL,
 CONSTRAINT [DWKPICONTEXT_PK] PRIMARY KEY CLUSTERED 
(
	[idKpiContext] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DWKPICONTEXT_FK_IDX_1] ON [dbo].[DWKPICONTEXT] 
(
	[idKpi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAWPQUERYPROCESSDATA]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAWPQUERYPROCESSDATA](
	[idBAWPQueryProcessData] [int] IDENTITY(10000,1) NOT NULL,
	[idBAWPQuery] [int] NOT NULL,
	[internalName] [nvarchar](50) NOT NULL,
	[idApplication] [int] NULL,
	[idWfClass] [int] NULL,
	[idCategory] [int] NULL,
	[CustomData] [nvarchar](200) NOT NULL,
 CONSTRAINT [BAWPQUERYPROCESSDATA_PK] PRIMARY KEY CLUSTERED 
(
	[idBAWPQueryProcessData] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAWPQUERYPROCESSDATA_FK_IDX_1] ON [dbo].[BAWPQUERYPROCESSDATA] 
(
	[idApplication] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAWPQUERYPROCESSDATA_FK_IDX_2] ON [dbo].[BAWPQUERYPROCESSDATA] 
(
	[idBAWPQuery] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAWPQUERYPROCESSDATA_FK_IDX_3] ON [dbo].[BAWPQUERYPROCESSDATA] 
(
	[idCategory] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAWPQUERYPROCESSDATA_FK_IDX_4] ON [dbo].[BAWPQUERYPROCESSDATA] 
(
	[idWfClass] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAWPQUERYBUSINESSDATA]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAWPQUERYBUSINESSDATA](
	[idBAWPQueryBusinessData] [int] IDENTITY(10000,1) NOT NULL,
	[idBAWPQuery] [int] NOT NULL,
	[CustomValue] [nvarchar](400) NULL,
	[idBADefinition] [uniqueidentifier] NULL,
 CONSTRAINT [BAWPQUERYBUSINESSDATA_PK] PRIMARY KEY CLUSTERED 
(
	[idBAWPQueryBusinessData] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAWPQUERYBUSINESSDATA_FK_IDX_1] ON [dbo].[BAWPQUERYBUSINESSDATA] 
(
	[idBAWPQuery] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAWPFOLDERCASE]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAWPFOLDERCASE](
	[idBAWPFolderCase] [int] IDENTITY(10000,1) NOT NULL,
	[idBAWPFolder] [int] NOT NULL,
	[idCase] [int] NULL,
 CONSTRAINT [BAWPFOLDERCASE_PK] PRIMARY KEY CLUSTERED 
(
	[idBAWPFolderCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAWPFOLDERCASE_FK_IDX_1] ON [dbo].[BAWPFOLDERCASE] 
(
	[idBAWPFolder] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAWFCLASS_ENTITY]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAWFCLASS_ENTITY](
	[idWfClassEntity] [int] IDENTITY(1,1) NOT NULL,
	[idWfClass] [int] NOT NULL,
	[idEnt] [int] NOT NULL,
	[guidWfClassEntity] [uniqueidentifier] NOT NULL,
	[dplyWfClassEntity] [tinyint] NOT NULL,
	[idAttrib] [int] NULL,
 CONSTRAINT [BAWFCLASS_ENTITY_PK] PRIMARY KEY CLUSTERED 
(
	[idWfClassEntity] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAWFCLASS_ENTITY_UK1] UNIQUE NONCLUSTERED 
(
	[idWfClass] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAWFCLASS_ENTITY_UKG] UNIQUE NONCLUSTERED 
(
	[guidWfClassEntity] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAWFCLASS_ENTITY_FK_IDX_1] ON [dbo].[BAWFCLASS_ENTITY] 
(
	[idAttrib] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAWFCLASS_ENTITY_IX1] ON [dbo].[BAWFCLASS_ENTITY] 
(
	[idWfClass] ASC,
	[idEnt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAUSERSTATISTICS_CCASE]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAUSERSTATISTICS_CCASE](
	[idUSCC] [int] NOT NULL,
	[idUSCase] [int] NOT NULL,
	[idWFClass] [int] NOT NULL,
	[weight] [int] NOT NULL,
 CONSTRAINT [BAUSERSTATISTICS_CCASE_PK] PRIMARY KEY CLUSTERED 
(
	[idUSCC] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAUSERSTATISTICS_CCAS_FK_IDX_1] ON [dbo].[BAUSERSTATISTICS_CCASE] 
(
	[idUSCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAUSERSTATISTICS_CCAS_FK_IDX_2] ON [dbo].[BAUSERSTATISTICS_CCASE] 
(
	[idWFClass] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BARENDERDATA]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BARENDERDATA](
	[idBaRenderData] [int] IDENTITY(1,1) NOT NULL,
	[idForm] [uniqueidentifier] NULL,
	[data] [image] NULL,
	[crc] [nvarchar](32) NULL,
	[frmTimeStamp] [datetime] NULL,
	[idWfClass] [int] NOT NULL,
	[idWorkflow] [int] NOT NULL,
	[idLanguage] [int] NULL,
	[idUser] [int] NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [BARENDERDATA_PK] PRIMARY KEY CLUSTERED 
(
	[idBaRenderData] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BARENDERDATA_IX] ON [dbo].[BARENDERDATA] 
(
	[idForm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAUSERDEFAULTWFCLASS]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAUSERDEFAULTWFCLASS](
	[idUser] [int] NOT NULL,
	[idWfClass] [int] NOT NULL,
	[idOrganization] [int] NOT NULL,
 CONSTRAINT [BAUSERDEFAULTWFCLASS_PK] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC,
	[idWfClass] ASC,
	[idOrganization] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ATTRIBLOG]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATTRIBLOG](
	[idAttribLog] [bigint] IDENTITY(1,1) NOT NULL,
	[idEntityLog] [bigint] NOT NULL,
	[idAttrib] [int] NOT NULL,
	[alNewValue] [nvarchar](32) NULL,
 CONSTRAINT [ATTRIBLOG_PK] PRIMARY KEY CLUSTERED 
(
	[idAttribLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ATTRIBLOG_IX1] ON [dbo].[ATTRIBLOG] 
(
	[idEntityLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ATTRIBCHARLOG]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATTRIBCHARLOG](
	[idAttribCharLog] [bigint] IDENTITY(1,1) NOT NULL,
	[idEntityLog] [bigint] NOT NULL,
	[idAttrib] [int] NOT NULL,
	[aclNewValue] [nvarchar](500) NULL,
 CONSTRAINT [ATTRIBCHARLOG_PK] PRIMARY KEY CLUSTERED 
(
	[idAttribCharLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ATTRIBCHARLOG_F1] ON [dbo].[ATTRIBCHARLOG] 
(
	[idEntityLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spBA_DB_RenameEntityTable]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_DB_RenameEntityTable]( @sOldTableName sysname, @sNewTableName sysname )
	AS
	BEGIN
		EXEC spBA_DB_RenameTable @sOldTableName, @sNewTableName
	END
GO
/****** Object:  Table [dbo].[RENDERACTIONTARGET]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RENDERACTIONTARGET](
	[idRenderActionTarget] [int] IDENTITY(1,1) NOT NULL,
	[idRenderAction] [int] NOT NULL,
	[rdrActTgtPath] [nvarchar](100) NULL,
	[idGroup] [int] NULL,
	[rdrActTgtCommand] [nvarchar](100) NOT NULL,
	[guidRenderActionTarget] [uniqueidentifier] NOT NULL,
	[dplyRenderActionTarget] [tinyint] NOT NULL,
 CONSTRAINT [RENDERACTIONTARGET_PK] PRIMARY KEY CLUSTERED 
(
	[idRenderActionTarget] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [RENDERACTIONTARGET_UKG] UNIQUE NONCLUSTERED 
(
	[guidRenderActionTarget] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RENDERACTIONTARGET_IX1] ON [dbo].[RENDERACTIONTARGET] 
(
	[idRenderAction] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JOBSCHEDULE]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JOBSCHEDULE](
	[idJobSchedule] [int] IDENTITY(1,1) NOT NULL,
	[idJob] [int] NOT NULL,
	[schName] [nvarchar](26) NOT NULL,
	[schRecurring] [bit] NOT NULL,
	[schOccurs] [int] NULL,
	[schStartDate] [datetime] NOT NULL,
	[schEndDate] [datetime] NULL,
	[idSchType] [int] NULL,
	[schTypeValue] [int] NULL,
	[schWeeklyMask] [char](7) NULL,
	[schMonthlyFrequency] [tinyint] NULL,
	[idMonthlyWeekday] [tinyint] NULL,
	[idJobSchFrequency] [tinyint] NULL,
	[schFrequencyTime] [int] NULL,
 CONSTRAINT [JOBSCHEDULE_PK] PRIMARY KEY CLUSTERED 
(
	[idJobSchedule] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_JOBSCHEDULEIDJOB] ON [dbo].[JOBSCHEDULE] 
(
	[idJob] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JOBRUNNING]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JOBRUNNING](
	[idJobRunning] [int] IDENTITY(1,1) NOT NULL,
	[idJob] [int] NOT NULL,
	[jobNextRunTime] [datetime] NOT NULL,
	[runningState] [tinyint] NOT NULL,
	[jobStartRunTime] [datetime] NULL,
 CONSTRAINT [JOBRUNNING_PK] PRIMARY KEY CLUSTERED 
(
	[idJobRunning] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [JOBRUNNING_UK1] UNIQUE NONCLUSTERED 
(
	[idJob] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JOBLOG]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JOBLOG](
	[idJobLog] [int] IDENTITY(1,1) NOT NULL,
	[idJob] [int] NOT NULL,
	[jobExecutionDate] [datetime] NOT NULL,
	[jobExecutionResult] [bit] NOT NULL,
	[jobExecutionMessage] [nvarchar](4000) NULL,
 CONSTRAINT [JOBLOG_PK] PRIMARY KEY CLUSTERED 
(
	[idJobLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [JOBLOG_IX1] ON [dbo].[JOBLOG] 
(
	[idJob] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JOBSTEP]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JOBSTEP](
	[idJobStep] [int] IDENTITY(1,1) NOT NULL,
	[idJob] [int] NOT NULL,
	[jsOrder] [tinyint] NOT NULL,
	[jsName] [nvarchar](26) NOT NULL,
	[jsDescription] [nvarchar](100) NULL,
	[jsCode] [nvarchar](2000) NULL,
	[idRunAsUser] [int] NULL,
	[OnStepSuccess] [tinyint] NOT NULL,
	[OnStepFailure] [tinyint] NOT NULL,
 CONSTRAINT [JOBSTEP_PK] PRIMARY KEY CLUSTERED 
(
	[idJobStep] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_JOBSTEPIDJOB] ON [dbo].[JOBSTEP] 
(
	[idJob] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRUSERDIMENSION]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRUSERDIMENSION](
	[idUserDimension] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[idWfClass] [int] NOT NULL,
	[dimName] [nvarchar](50) NOT NULL,
	[dimDisplayName] [nvarchar](50) NOT NULL,
	[dimDescription] [nvarchar](100) NOT NULL,
	[srcEntityPath] [nvarchar](512) NOT NULL,
 CONSTRAINT [GRUSERDIMENSION_PK] PRIMARY KEY CLUSTERED 
(
	[idUserDimension] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GRUSERDIMENSION_FK_IDX_1] ON [dbo].[GRUSERDIMENSION] 
(
	[idWfClass] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GRUSERDIMENSION_FK_IDX_2] ON [dbo].[GRUSERDIMENSION] 
(
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FUNCTIONALAREAPOSITION]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FUNCTIONALAREAPOSITION](
	[idFunctionalAreaPosition] [int] IDENTITY(1,1) NOT NULL,
	[idFunctionalArea] [int] NOT NULL,
	[idWorkflow] [int] NOT NULL,
	[DiagramYPos] [int] NOT NULL,
	[guidFunctionalAreaPosition] [uniqueidentifier] NOT NULL,
	[dplyFunctionalAreaPosition] [tinyint] NOT NULL,
 CONSTRAINT [FUNCTIONALAREAPOSITION_PK] PRIMARY KEY CLUSTERED 
(
	[idFunctionalAreaPosition] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [FUNCTIONALAREAPOSITION_UK1] UNIQUE NONCLUSTERED 
(
	[idWorkflow] ASC,
	[idFunctionalArea] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [FUNCTIONALAREAPOSITION_UKG] UNIQUE NONCLUSTERED 
(
	[guidFunctionalAreaPosition] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHASE]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHASE](
	[idPhase] [int] IDENTITY(1,1) NOT NULL,
	[phaseName] [nvarchar](26) NOT NULL,
	[phaseDisplayName] [nvarchar](40) NULL,
	[phaseDescription] [nvarchar](4000) NULL,
	[phaseHelpText] [nvarchar](100) NULL,
	[idPhaseType] [int] NOT NULL,
	[idWorkflow] [int] NOT NULL,
	[guidPhase] [uniqueidentifier] NOT NULL,
	[DiagramXPos] [int] NULL,
	[dplyPhase] [tinyint] NOT NULL,
 CONSTRAINT [PHASE_PK] PRIMARY KEY CLUSTERED 
(
	[idPhase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [PHASE_UK1] UNIQUE NONCLUSTERED 
(
	[idWorkflow] ASC,
	[phaseName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [PHASE_UK2] UNIQUE NONCLUSTERED 
(
	[idWorkflow] ASC,
	[phaseDisplayName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [PHASE_UKG] UNIQUE NONCLUSTERED 
(
	[guidPhase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PHASE_FK_IDX_1] ON [dbo].[PHASE] 
(
	[idPhaseType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spBA_Sync_ValBASch_TblsReg]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_Sync_ValBASch_TblsReg]
	AS

	BEGIN
		declare @_sSqlSpTmp varchar(8000)
		declare @_bHasMetadata int

		-- Test if database is a BizAgiModel
		select @_bHasMetadata = sum(n)
		from (
			select count(*) n from entity where idEnt > 10000
			union all
			select count(*) n from workflow
		) a

		-- All tables in DB are managed by BizAgi
		set @_sSqlSpTmp = '
		select replace(''
			PRINT(''''***Warning BADBUpgrd-Gen-001: Table {0} is neither BizAgi table or Entity table '''')
			if( {bNotIsBizAgiModel} = 0 ) begin
				RAISERROR (''''BADBUpgrd-Gen-001: Table {0} is neither BizAgi table or Entity table '''', 16, 1)
			end
			'',
			''{0}'', table_name)
		from (
			select *
			from information_schema.tables
			where table_type = ''BASE TABLE''  and  table_name not in (''dtproperties'', ''DropCreateFks'', ''sysdiagrams'')  and
				table_name not in (select entSrc from ENTITY)  and
				table_name not in (select ''PVCL'' + SUBSTRING(entSrc,3,LEN(entSrc)-2) from ENTITY where entType = 0)  and
				table_name not in (select compEnt.entSrc + ''_ENTITYKEY'' from entity compEnt, entitykey compKey where compEnt.idEnt = compKey.idEnt)  and
				table_name not in (select factSrc from FACT where idFactRelationType = 2) and
				table_name not in (''BACATALOGREFERENCE'', ''BABIZAGICATALOG'', ''BAOVERRIDE'', ''BAOVERRIDEREFERENCE'', ''BATAGVALUE'', ''BAMETADATASTATE'') AND
				table_name not in (''BAOVERRIDETAGVALUE'', ''BAMETADATAVERSION'',  ''BAFAVORITES'', ''TAGDEFINITIONTYPE'', ''BATAGDEFINITION'', ''BATAGS'', ''BARENDERCACHE'', ''BALOCALIZATION'', ''BALOCALIZATIONOVERRIDE'',''ARCHIVINGLOG'') AND
				table_name not in (''BADSDATE'',''BADSWORKFLOW'',''BADSCLOSEDCASES'',''BADSCLOSEDCASEACTIVITIES'', ''BADSUSERCOST'', ''BADSTRANSITIONHISTORY'')
		) a
		'
		set @_sSqlSpTmp = replace(@_sSqlSpTmp, '{bNotIsBizAgiModel}', @_bHasMetadata)
		exec spBA_Sync_ExecQueries @_sSqlSpTmp, 1, 0
	END
GO
/****** Object:  Table [dbo].[BAMACROWIZARD]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BAMACROWIZARD](
	[idMacroWizard] [int] IDENTITY(1,1) NOT NULL,
	[idApplication] [int] NOT NULL,
	[idWorkflow] [int] NOT NULL,
	[idWizardStep] [int] NOT NULL,
	[isCurrent] [bit] NOT NULL,
	[userName] [varchar](50) NOT NULL,
 CONSTRAINT [BAMACROWIZARD_PK] PRIMARY KEY CLUSTERED 
(
	[idMacroWizard] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [BAMACROWIZARD_FK_IDX_1] ON [dbo].[BAMACROWIZARD] 
(
	[idApplication] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BAMACROWIZARD_FK_IDX_2] ON [dbo].[BAMACROWIZARD] 
(
	[idWorkflow] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAEXTATTVALUE]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAEXTATTVALUE](
	[idExtAttValue] [int] IDENTITY(1,1) NOT NULL,
	[idWorkflow] [int] NOT NULL,
	[elementId] [uniqueidentifier] NULL,
	[extAttId] [uniqueidentifier] NULL,
	[extAttValue] [nvarchar](500) NULL,
	[extAttFile] [image] NULL,
	[guidBAExtAttValue] [uniqueidentifier] NOT NULL,
	[dplyBAExtAttValue] [tinyint] NOT NULL,
 CONSTRAINT [BAEXTATTVALUE_PK] PRIMARY KEY CLUSTERED 
(
	[idExtAttValue] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAEXTATTVALUE_UK1] UNIQUE NONCLUSTERED 
(
	[idWorkflow] ASC,
	[elementId] ASC,
	[extAttId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAEXTATTVALUE_UKG] UNIQUE NONCLUSTERED 
(
	[guidBAExtAttValue] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BACOLLABPROCESS]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BACOLLABPROCESS](
	[idCollabProcess] [int] IDENTITY(1,1) NOT NULL,
	[guidCollabProcess] [uniqueidentifier] NOT NULL,
	[xPosition] [int] NOT NULL,
	[yPosition] [int] NOT NULL,
	[isCollapsed] [bit] NOT NULL,
	[idCollabDiagram] [int] NOT NULL,
	[idCollabWorkflow] [int] NOT NULL,
	[dplyCollabProcess] [tinyint] NOT NULL,
 CONSTRAINT [BACOLLABPROCESS_PK] PRIMARY KEY CLUSTERED 
(
	[idCollabProcess] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BACOLLABPROCESS_UK1] UNIQUE NONCLUSTERED 
(
	[idCollabDiagram] ASC,
	[idCollabWorkflow] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BACOLLABPROCESS_UKG] UNIQUE NONCLUSTERED 
(
	[guidCollabProcess] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALARMJOBLOG]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALARMJOBLOG](
	[idAlarmJobLog] [int] IDENTITY(1,1) NOT NULL,
	[idJob] [int] NOT NULL,
	[idAlarm] [int] NOT NULL,
	[registerDate] [datetime] NOT NULL,
	[idWorkflow] [int] NULL,
	[idTask] [int] NULL,
	[idCase] [int] NULL,
	[idWorkItem] [bigint] NULL,
	[idJobLog] [int] NULL,
 CONSTRAINT [ALARMJOBLOG_PK] PRIMARY KEY CLUSTERED 
(
	[idAlarmJobLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ALARMJOBLOG_IX1] ON [dbo].[ALARMJOBLOG] 
(
	[idJobLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAPRESACTION]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAPRESACTION](
	[idPresAction] [int] IDENTITY(1,1) NOT NULL,
	[idWorkflow] [int] NOT NULL,
	[elementId] [uniqueidentifier] NOT NULL,
	[extAttId] [uniqueidentifier] NULL,
	[presActionType] [tinyint] NOT NULL,
	[presActionValue] [nvarchar](4000) NULL,
	[presActionValueType] [tinyint] NOT NULL,
	[presActionFile] [image] NULL,
	[guidBAPresAction] [uniqueidentifier] NOT NULL,
	[dplyBAPresAction] [tinyint] NOT NULL,
 CONSTRAINT [BAPRESACTION_PK] PRIMARY KEY CLUSTERED 
(
	[idPresAction] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAPRESACTION_UK1] UNIQUE NONCLUSTERED 
(
	[idWorkflow] ASC,
	[elementId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BAPRESACTION_UKG] UNIQUE NONCLUSTERED 
(
	[guidBAPresAction] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAOFFRENDER]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAOFFRENDER](
	[idBaOffRender] [int] IDENTITY(1,1) NOT NULL,
	[idBaOfflineChangeSet] [int] NOT NULL,
	[idBaRenderData] [int] NOT NULL,
 CONSTRAINT [BAOFFRENDER_PK] PRIMARY KEY CLUSTERED 
(
	[idBaOffRender] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CASEPATH]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CASEPATH](
	[idCasePath] [int] IDENTITY(1,1) NOT NULL,
	[PathName] [nvarchar](15) NOT NULL,
	[PathDisplayName] [nvarchar](30) NULL,
	[PathDescription] [nvarchar](80) NULL,
	[idWorkflow] [int] NOT NULL,
	[guidCasePath] [uniqueidentifier] NOT NULL,
	[dplyCasePath] [tinyint] NOT NULL,
 CONSTRAINT [CASEPATH_PK] PRIMARY KEY CLUSTERED 
(
	[idCasePath] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [CASEPATH_UKG] UNIQUE NONCLUSTERED 
(
	[guidCasePath] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CASEPATH_FK_IDX_1] ON [dbo].[CASEPATH] 
(
	[idWorkflow] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BIZLETTERBINDING]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BIZLETTERBINDING](
	[idBizLetterBinding] [int] IDENTITY(1,1) NOT NULL,
	[blbName] [nvarchar](26) NOT NULL,
	[blbDisplayName] [nvarchar](100) NULL,
	[blbDescription] [nvarchar](100) NULL,
	[blbXPath] [nvarchar](500) NOT NULL,
	[guidBizLetterBinding] [uniqueidentifier] NOT NULL,
	[idWorkflow] [int] NOT NULL,
	[dplyBizLetterBinding] [tinyint] NOT NULL,
 CONSTRAINT [BIZLETTERBINDING_PK] PRIMARY KEY CLUSTERED 
(
	[idBizLetterBinding] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BIZLETTERBINDING_UK1] UNIQUE NONCLUSTERED 
(
	[idWorkflow] ASC,
	[blbName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BIZLETTERBINDING_UK2] UNIQUE NONCLUSTERED 
(
	[idWorkflow] ASC,
	[blbDisplayName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BIZLETTERBINDING_UKG] UNIQUE NONCLUSTERED 
(
	[guidBizLetterBinding] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spBA_WFE_GetNextIntJobsForRun]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_WFE_GetNextIntJobsForRun](@dJobNextRunTime datetime, @nNumJobsToRetrive int = 30,
			@iRunningTimeoutSecs int = 3600)
		AS
		BEGIN

			if (@dJobNextRunTime is null) begin
				RAISERROR ('dJobNextRunTime argument not specified', 16, 1)
				return
			end

			if (@nNumJobsToRetrive is null) begin
				RAISERROR ('nNumJobsToRetrive argument not specified', 16, 1)
				return
			end

			if (@@trancount > 0) begin
				RAISERROR ('@@trancount is greather than 0. The procedure spBA_WFE_GetNextIntJobsForRun cannot be called in nested transactions', 16, 1)
				return
			end

			DECLARE @tmpJobList TABLE ( idJob INT NULL)

			begin

				-- Look for Jobs pending to run in cache table
				WITH JR AS
				(
					select TOP (@nNumJobsToRetrive) idJob, runningState, jobStartRunTime
					from JOBRUNNING 
					where runningState = 0
					order by jobNextRunTime, idJob
				)
				UPDATE JR with (rowlock)
					set runningState = 1, 
						jobStartRunTime = getdate()
				OUTPUT inserted.idJob into @tmpJobList

				if not exists(select 1 from @tmpJobList)
				begin

					--Tries to get an App Lock to start loading Jobs for processing
					declare @ret int 
					exec @ret = spBA_MonitorEnter 'Job', 0
					if (@ret = 0)
					begin
						begin try

							-- Delete runned jobs  and  Timeout for running
							delete JOBRUNNING
								from JOBRUNNING jr
								where jr.runningState = 2  or
									(jr.runningState = 1  and  (datediff(second, jr.jobStartRunTime, getdate()) > @iRunningTimeoutSecs) )

							-- Cache table does not have jobs, calculate more jobs
							insert into JOBRUNNING(idJob, jobNextRunTime, runningState)
								SELECT jb.idJob, jb.jobNextRunTime, 0
								FROM JOB jb left outer join JOBRUNNING jr on jb.idJob = jr.idJob
								WHERE jb.jobEnabled = 1  AND  jb.jobNextRunTime <= @dJobNextRunTime  AND
									jr.idJob is null;

							-- Look for Jobs pending to run in cache table
							-- by again executing the initial query
							WITH JR AS
							(
								select TOP (@nNumJobsToRetrive) idJob, runningState, jobStartRunTime
								from JOBRUNNING 
								where runningState = 0
								order by jobNextRunTime, idJob
							)
							UPDATE JR with (rowlock)
								set runningState = 1, 
									jobStartRunTime = getdate()
							OUTPUT inserted.idJob into @tmpJobList

						end try
						begin catch
					
							exec spBA_MonitorExit 'Job'

							DECLARE		@ErrorMessage nvarchar(4000) ,
										@ErrorNumber int ,
										@ErrorSeverity int ,
										@ErrorState int ,
										@ErrorLine int ,
										@ErrorProcedure nvarchar(200) ;
										SET @ErrorMessage = ERROR_MESSAGE()
										SET @ErrorNumber = ERROR_NUMBER()
										SET @ErrorSeverity  = ERROR_SEVERITY()
										SET @ErrorState  = ERROR_STATE()
										SET @ErrorLine  = ERROR_LINE()
										SET @ErrorProcedure = ISNULL(ERROR_PROCEDURE(), '-')
										SELECT @ErrorMessage = N'Error %d, Level %d, State %d, Procedure %s, Line %d, ' + 'Message: ' + @ErrorMessage;
										RAISERROR (@ErrorMessage, @ErrorSeverity, 1, @ErrorNumber, @ErrorSeverity, @ErrorState, @ErrorProcedure, @ErrorLine)
							--yep... raising an error DOES NOT end execution 
							If @@ERROR > 0 Return
						end catch
					end
					exec spBA_MonitorExit 'Job'
				end

				--Returns jobs list
				select idJob
				from @tmpJobList
			end

		END
GO
/****** Object:  Table [dbo].[TASK]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TASK](
	[idTask] [int] IDENTITY(1,1) NOT NULL,
	[tskName] [nvarchar](26) NOT NULL,
	[tskDisplayName] [nvarchar](40) NULL,
	[tskDescription] [nvarchar](4000) NULL,
	[tskHelpText] [nvarchar](250) NULL,
	[tskDuration] [int] NULL,
	[allowReassign] [bit] NOT NULL,
	[idWorkflow] [int] NOT NULL,
	[idPhase] [int] NOT NULL,
	[guidTask] [uniqueidentifier] NOT NULL,
	[idTaskType] [int] NULL,
	[idFunctionalArea] [int] NULL,
	[idSubWfClass] [int] NULL,
	[idSubProcType] [int] NULL,
	[sendNotification] [bit] NOT NULL,
	[tskCost] [numeric](11, 2) NULL,
	[tskPriority] [tinyint] NOT NULL,
	[tskWaitDelay] [int] NULL,
	[idSubProcMappingTypeI] [int] NOT NULL,
	[idSubProcMappingTypeO] [int] NOT NULL,
	[DiagramXPos] [int] NULL,
	[DiagramYPos] [int] NULL,
	[DiagramWidth] [int] NULL,
	[DiagramHeight] [int] NULL,
	[tskLowTolerance] [int] NULL,
	[tskHighTolerance] [int] NULL,
	[idMultiInstanceFact] [int] NULL,
	[idMultiInstanceGroupByAttrib] [int] NULL,
	[idMultiInstanceExitMode] [int] NULL,
	[idTaskToSync] [int] NULL,
	[isRollbackPoint] [bit] NOT NULL,
	[idSubWorkflow] [int] NULL,
	[tskExtDuration] [int] NOT NULL,
	[sendAlarms] [bit] NOT NULL,
	[tskIsAsynchTask] [bit] NULL,
	[tskNumberOfRetries] [int] NULL,
	[tskRetryInterval] [int] NULL,
	[tskShowFeedBack] [bit] NULL,
	[tskAsynchTimeout] [int] NULL,
	[tskCompensation] [bit] NOT NULL,
	[tskTransactional] [bit] NOT NULL,
	[tskEmbedded] [bit] NOT NULL,
	[tskScopeEnabled] [bit] NOT NULL,
	[idScopeDef] [int] NULL,
	[tskSingleton] [bit] NOT NULL,
	[tskMultiple] [bit] NOT NULL,
	[dplyTask] [tinyint] NOT NULL,
	[tskTimerEventDuration] [int] NULL,
	[tskExpanded] [bit] NULL,
	[tskExpandedWidth] [int] NULL,
	[tskExpandedHeight] [int] NULL,
	[idCompensationTargetTask] [int] NULL,
	[idErrorCode] [int] NULL,
	[tskURLHelp] [nvarchar](1000) NULL,
	[idTaskSubType] [int] NULL,
	[idTaskLinkTo] [int] NULL,
	[idTaskLinkFrom] [int] NULL,
	[MultiInstanceXPath] [nvarchar](1000) NULL,
	[isThrow] [bit] NULL,
	[idTaskMessage] [int] NULL,
	[idTransitionMessage] [int] NULL,
	[idCaseXPath] [nvarchar](1000) NULL,
	[idMultiInstanceProperty] [int] NULL,
	[idForm] [uniqueidentifier] NULL,
	[tskMobileAccess] [bit] NOT NULL,
	[tskMessageAfterProcess] [nvarchar](1000) NULL,
	[tskAllowReleaseActivity] [bit] NOT NULL,
	[idStartForm] [uniqueidentifier] NULL,
	[offLineAsOnline] [bit] NOT NULL,
	[guidMultiInstanceExitRule] [uniqueidentifier] NULL,
 CONSTRAINT [TASK_PK] PRIMARY KEY CLUSTERED 
(
	[idTask] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [TASK_UKG] UNIQUE NONCLUSTERED 
(
	[guidTask] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TASK] ON [dbo].[TASK] 
(
	[idWorkflow] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TASK_FK_IDX_1] ON [dbo].[TASK] 
(
	[idMultiInstanceGroupByAttrib] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TASK_FK_IDX_10] ON [dbo].[TASK] 
(
	[idSubProcMappingTypeI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TASK_FK_IDX_11] ON [dbo].[TASK] 
(
	[idSubProcMappingTypeO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TASK_FK_IDX_12] ON [dbo].[TASK] 
(
	[idTaskSubType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TASK_FK_IDX_13] ON [dbo].[TASK] 
(
	[idTaskType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TASK_FK_IDX_14] ON [dbo].[TASK] 
(
	[idTaskToSync] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TASK_FK_IDX_15] ON [dbo].[TASK] 
(
	[idCompensationTargetTask] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TASK_FK_IDX_16] ON [dbo].[TASK] 
(
	[idTaskLinkTo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TASK_FK_IDX_17] ON [dbo].[TASK] 
(
	[idTaskLinkFrom] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TASK_FK_IDX_18] ON [dbo].[TASK] 
(
	[idSubWfClass] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TASK_FK_IDX_19] ON [dbo].[TASK] 
(
	[idSubWorkflow] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TASK_FK_IDX_2] ON [dbo].[TASK] 
(
	[idErrorCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TASK_FK_IDX_3] ON [dbo].[TASK] 
(
	[idScopeDef] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TASK_FK_IDX_5] ON [dbo].[TASK] 
(
	[idMultiInstanceFact] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TASK_FK_IDX_6] ON [dbo].[TASK] 
(
	[idFunctionalArea] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TASK_FK_IDX_7] ON [dbo].[TASK] 
(
	[idMultiInstanceProperty] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TASK_FK_IDX_8] ON [dbo].[TASK] 
(
	[idMultiInstanceExitMode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TASK_FK_IDX_9] ON [dbo].[TASK] 
(
	[idPhase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BIZLETTERCONDITION]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BIZLETTERCONDITION](
	[idBizLetterCondition] [int] IDENTITY(1,1) NOT NULL,
	[idBizLetter] [int] NOT NULL,
	[idBizLetterBinding] [int] NOT NULL,
	[guidBizLetterCondition] [uniqueidentifier] NOT NULL,
	[dplyBizLetterCondition] [tinyint] NOT NULL,
	[guidRule] [uniqueidentifier] NULL,
 CONSTRAINT [BIZLETTERCONDITION_PK] PRIMARY KEY CLUSTERED 
(
	[idBizLetterCondition] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [BIZLETTERCONDITION_UKG] UNIQUE NONCLUSTERED 
(
	[guidBizLetterCondition] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BIZLETTERCONDITION_FK_IDX_1] ON [dbo].[BIZLETTERCONDITION] 
(
	[idBizLetterBinding] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BIZLETTERCONDITION_FK_IDX_2] ON [dbo].[BIZLETTERCONDITION] 
(
	[idBizLetter] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EXCEPTIONTRANSITION]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EXCEPTIONTRANSITION](
	[idExceptionTransition] [int] IDENTITY(1,1) NOT NULL,
	[etName] [nvarchar](26) NOT NULL,
	[etDisplayName] [nvarchar](40) NULL,
	[etDescription] [nvarchar](100) NULL,
	[idTaskFrom] [int] NOT NULL,
	[idTaskTo] [int] NOT NULL,
	[idWorkflow] [int] NOT NULL,
	[etDefaultOption] [tinyint] NULL,
	[guidExceptionTransition] [uniqueidentifier] NOT NULL,
	[dplyExceptionTransition] [tinyint] NOT NULL,
 CONSTRAINT [EXCEPTIONTRANSITION_PK] PRIMARY KEY CLUSTERED 
(
	[idExceptionTransition] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [EXCEPTIONTRANSITION_UKG] UNIQUE NONCLUSTERED 
(
	[guidExceptionTransition] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EXCEPTIONTRANSITION_FK_IDX_1] ON [dbo].[EXCEPTIONTRANSITION] 
(
	[idTaskFrom] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EXCEPTIONTRANSITION_FK_IDX_2] ON [dbo].[EXCEPTIONTRANSITION] 
(
	[idTaskTo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [EXCEPTIONTRANSITION_FK_IDX_3] ON [dbo].[EXCEPTIONTRANSITION] 
(
	[idWorkflow] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALARM]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALARM](
	[idAlarm] [int] IDENTITY(1,1) NOT NULL,
	[idAlarmSendMode] [tinyint] NULL,
	[idTask] [int] NULL,
	[idWorkflow] [int] NULL,
	[idAlarmRecurMode] [tinyint] NULL,
	[idLapseMode] [tinyint] NULL,
	[alarmTime] [int] NOT NULL,
	[recurrTime] [int] NOT NULL,
	[sendToCurrAssignee] [bit] NOT NULL,
	[idRecurrSchType] [int] NOT NULL,
	[guidRule] [uniqueidentifier] NULL,
 CONSTRAINT [ALARM_PK] PRIMARY KEY CLUSTERED 
(
	[idAlarm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ALARM_FK_IDX_1] ON [dbo].[ALARM] 
(
	[idLapseMode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ALARM_FK_IDX_2] ON [dbo].[ALARM] 
(
	[idAlarmRecurMode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ALARM_FK_IDX_3] ON [dbo].[ALARM] 
(
	[idAlarmSendMode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ALARM_FK_IDX_5] ON [dbo].[ALARM] 
(
	[idRecurrSchType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ALARM] ON [dbo].[ALARM] 
(
	[idWorkflow] ASC,
	[idTask] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ASYNCHWORKITEM]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASYNCHWORKITEM](
	[idAsynchWorkitem] [bigint] NOT NULL,
	[idWorkitem] [bigint] NULL,
	[awCurrentRetries] [int] NOT NULL,
	[awEnabled] [bit] NOT NULL,
	[awCreationDate] [datetime] NOT NULL,
	[awLastProcessDate] [datetime] NULL,
	[awState] [smallint] NOT NULL,
	[awProcessing] [bit] NOT NULL,
	[idCase] [int] NULL,
	[idTask] [int] NULL,
	[idWorkItemScope] [bigint] NULL,
	[bAsynchSubProcess] [bit] NOT NULL,
	[awSubProcessContext] [image] NULL,
	[idWfClass] [int] NULL,
	[awCaseCreationContext] [image] NULL,
	[idWorkflow] [int] NULL,
	[awNextProcessDate] [datetime] NULL,
 CONSTRAINT [ASYNCHWORKITEM_PK] PRIMARY KEY CLUSTERED 
(
	[idAsynchWorkitem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ASYNCHWORKITEM_IX1] ON [dbo].[ASYNCHWORKITEM] 
(
	[awEnabled] ASC,
	[awState] ASC
)
INCLUDE ( [awCurrentRetries],
[awProcessing],
[awNextProcessDate],
[awCreationDate]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ASYNCHWORKITEM_IX3] ON [dbo].[ASYNCHWORKITEM] 
(
	[idWorkitem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ASYNCHWORKITEM_IX4] ON [dbo].[ASYNCHWORKITEM] 
(
	[idCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SECUENTIALASSIG]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SECUENTIALASSIG](
	[idSecuentialAssig] [int] NOT NULL,
	[idTask] [int] NOT NULL,
	[idLastUser] [int] NOT NULL,
 CONSTRAINT [SECUENTIALASSIG_PK] PRIMARY KEY CLUSTERED 
(
	[idSecuentialAssig] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SECUENTIALASSIG_FK_IDX_1] ON [dbo].[SECUENTIALASSIG] 
(
	[idTask] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SECUENTIALASSIG_FK_IDX_2] ON [dbo].[SECUENTIALASSIG] 
(
	[idLastUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRCUSTOMPHASE]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRCUSTOMPHASE](
	[idCustomPhase] [int] IDENTITY(0,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[cphName] [nvarchar](50) NOT NULL,
	[cphDescription] [nvarchar](200) NOT NULL,
	[idTaskFrom] [int] NOT NULL,
	[idTaskTo] [int] NOT NULL,
	[cphDisplayName] [nvarchar](50) NULL,
	[cphSLA] [int] NOT NULL,
 CONSTRAINT [GRCUSTOMPHASE_PK] PRIMARY KEY CLUSTERED 
(
	[idCustomPhase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GRCUSTOMPHASE_FK_IDX_1] ON [dbo].[GRCUSTOMPHASE] 
(
	[idTaskFrom] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GRCUSTOMPHASE_FK_IDX_2] ON [dbo].[GRCUSTOMPHASE] 
(
	[idTaskTo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GRCUSTOMPHASE_FK_IDX_3] ON [dbo].[GRCUSTOMPHASE] 
(
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRCOUNTER]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRCOUNTER](
	[idCounter] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[counterName] [nvarchar](50) NOT NULL,
	[counterDisplayName] [nvarchar](50) NOT NULL,
	[counterDescription] [nvarchar](200) NOT NULL,
	[idTask] [int] NOT NULL,
 CONSTRAINT [GRCOUNTER_PK] PRIMARY KEY CLUSTERED 
(
	[idCounter] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GRCOUNTER_FK_IDX_1] ON [dbo].[GRCOUNTER] 
(
	[idTask] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GRCOUNTER_IX1] ON [dbo].[GRCOUNTER] 
(
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROCESSTRIGGERREGISTER]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROCESSTRIGGERREGISTER](
	[idProcessTriggerRegister] [int] NOT NULL,
	[idCase] [int] NOT NULL,
	[idWorkitem] [bigint] NOT NULL,
	[idScope] [bigint] NOT NULL,
	[idTask] [int] NOT NULL,
	[guidTask] [uniqueidentifier] NULL,
	[guidProcessTrigger] [uniqueidentifier] NULL,
	[enabled] [bit] NOT NULL,
	[taskType] [int] NOT NULL,
 CONSTRAINT [PROCESSTRIGGERREGISTER_PK] PRIMARY KEY CLUSTERED 
(
	[idProcessTriggerRegister] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUBPROCMAPPING]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUBPROCMAPPING](
	[idSubProcMapping] [int] IDENTITY(1,1) NOT NULL,
	[direction] [tinyint] NOT NULL,
	[source] [nvarchar](500) NOT NULL,
	[target] [nvarchar](50) NOT NULL,
	[idTask] [int] NOT NULL,
	[guidSubprocMapping] [uniqueidentifier] NOT NULL,
	[dplySubprocMapping] [tinyint] NOT NULL,
 CONSTRAINT [SUBPROCMAPPING_PK] PRIMARY KEY CLUSTERED 
(
	[idSubProcMapping] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [SUBPROCMAPPING_UKG] UNIQUE NONCLUSTERED 
(
	[guidSubprocMapping] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SUBPROCMAPPING] ON [dbo].[SUBPROCMAPPING] 
(
	[idTask] ASC,
	[direction] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRANSITION]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRANSITION](
	[idTransition] [int] IDENTITY(1,1) NOT NULL,
	[trName] [nvarchar](26) NOT NULL,
	[trDisplayName] [nvarchar](40) NULL,
	[trDescription] [nvarchar](4000) NULL,
	[idTaskFrom] [int] NULL,
	[idTaskTo] [int] NULL,
	[idWorkflow] [int] NULL,
	[guidTransition] [uniqueidentifier] NOT NULL,
	[DiagramXPos] [int] NULL,
	[DiagramYPos] [int] NULL,
	[DiagramWidth] [int] NULL,
	[DiagramHeight] [int] NULL,
	[trDefaultOption] [tinyint] NULL,
	[idTransitionType] [tinyint] NOT NULL,
	[dplyTransition] [tinyint] NOT NULL,
	[trStartPort] [int] NULL,
	[trEndPort] [int] NULL,
	[idErrorCode] [int] NULL,
 CONSTRAINT [TRANSITION_PK] PRIMARY KEY CLUSTERED 
(
	[idTransition] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [TRANSITION_UKG] UNIQUE NONCLUSTERED 
(
	[guidTransition] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TRANSITION_FK_IDX_1] ON [dbo].[TRANSITION] 
(
	[idErrorCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TRANSITION_FK_IDX_2] ON [dbo].[TRANSITION] 
(
	[idTaskFrom] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TRANSITION_FK_IDX_3] ON [dbo].[TRANSITION] 
(
	[idTaskTo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TRANSITION_FK_IDX_4] ON [dbo].[TRANSITION] 
(
	[idTransitionType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TRANSITION_FK_IDX_5] ON [dbo].[TRANSITION] 
(
	[idWorkflow] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WFCASE]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WFCASE](
	[idCase] [int] NOT NULL,
	[casCreationDate] [datetime] NOT NULL,
	[casSolutionDate] [datetime] NULL,
	[casEstimatedSolutionDate] [datetime] NULL,
	[priority] [tinyint] NULL,
	[severity] [tinyint] NULL,
	[idWorkflow] [int] NULL,
	[idCreatorUser] [int] NULL,
	[idCaseManager] [int] NULL,
	[idCaseState] [int] NOT NULL,
	[idParentCase] [int] NULL,
	[idParentTask] [int] NULL,
	[idSubProcType] [int] NULL,
	[radNumber] [nvarchar](20) NULL,
	[idParentWorkItem] [bigint] NULL,
	[casExtEstimatedSolutionDate] [datetime] NULL,
	[idCasePath] [int] NULL,
	[ancestorPath] [varchar](50) NULL,
	[CaseClosed] [tinyint] NULL,
	[amount] [money] NOT NULL,
	[idOrg] [int] NULL,
	[duration] [int] NULL,
	[idCaseAccess] [int] NULL,
	[CaseGUID] [uniqueidentifier] NULL,
	[hasCaseNumber] [bit] NULL,
	[caseArchived] [bit] NOT NULL,
	[guidPlan] [uniqueidentifier] NULL,
 CONSTRAINT [WFCASE_PK] PRIMARY KEY CLUSTERED 
(
	[idCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [WFCASE_CASCREATIONDATE_IDX] ON [dbo].[WFCASE] 
(
	[casCreationDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WFCASE_FX_IDX_8] ON [dbo].[WFCASE] 
(
	[guidPlan] ASC
)
WHERE ([guidPlan] IS NOT NULL)
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WFCASE_IDPARENTCASE_IDX] ON [dbo].[WFCASE] 
(
	[idParentCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WFCASE_IDX7] ON [dbo].[WFCASE] 
(
	[idCaseState] ASC,
	[hasCaseNumber] ASC,
	[CaseClosed] ASC,
	[idWorkflow] ASC,
	[idCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WFCASE_IDX9] ON [dbo].[WFCASE] 
(
	[idCase] ASC,
	[idWorkflow] ASC,
	[radNumber] ASC,
	[casCreationDate] ASC,
	[casSolutionDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WFCASE_RADNUMBER_IDX] ON [dbo].[WFCASE] 
(
	[radNumber] ASC,
	[hasCaseNumber] ASC,
	[idCaseState] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spBA_WFE_close_process]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_WFE_close_process]
(
	@idWorkflow INT,
	@idCase INT,
	@abortReason VARCHAR(1000),
	@idCaseAccess INT
)
AS
BEGIN

BEGIN TRANSACTION;

	INSERT INTO WFCASECL (idCase, casCreationDate, casSolutionDate, casEstimatedSolutionDate, priority, severity, idWorkflow, idCreatorUser,
	idCaseManager, idCaseState, idParentCase, idParentTask, idSubProcType, radNumber, idParentWorkItem, casExtEstimatedSolutionDate, idCasePath, amount, idOrg, duration, idCaseAccess, CaseGUID, hasCaseNumber,guidPlan)
		SELECT idCase, casCreationDate, CASE WHEN casEstimatedSolutionDate is null THEN GETDATE() ELSE casSolutionDate END AS casSolutionDate, 
		CASE WHEN casEstimatedSolutionDate is null THEN casSolutionDate ELSE casEstimatedSolutionDate END AS casEstimatedSolutionDate, 
		priority, severity, idWorkflow, idCreatorUser, idCaseManager, idCaseState, idParentCase, idParentTask, idSubProcType, radNumber,
		idParentWorkItem, casExtEstimatedSolutionDate, idCasePath, amount, idOrg, duration, idCaseAccess, CaseGUID, CASE WHEN hasCaseNumber is null THEN 1 ELSE hasCaseNumber END AS hasCaseNumber,guidPlan
		FROM WFCASE
		WHERE idCase = @idCase
		
	IF @@ERROR <> 0
		BEGIN
		ROLLBACK			
		RAISERROR ('Error in inserting in WFCASECL.', 16, 1)
		RETURN
		END

	DELETE SUBPROCMULTIINSTCOUNT WHERE idCase = @idCase

	IF @@ERROR <> 0
		BEGIN
		ROLLBACK			
		RAISERROR ('Error in deleting case in SUBPROCMULTIINSTCOUNT.', 16, 1)
		RETURN
		END

	DELETE WFCASE WHERE idCase = @idCase

	IF @@ERROR <> 0
		BEGIN
		ROLLBACK			
		RAISERROR ('Error in deleting case in WFCASE.', 16, 1)
		RETURN
		END

	DELETE ASSIGNATIONLOG WHERE idCase = @idCase		

	IF @@ERROR <> 0
		BEGIN
		ROLLBACK			
		RAISERROR ('Error in deleteing case in ASSIGNATIONLOG.', 16, 1)
		RETURN
		END

	IF (@abortReason IS NOT NULL AND LEN(@abortReason) > 0)
	BEGIN
		INSERT INTO WFCASEABORTREASON
			(idCase, abortReason)
		VALUES
			(@idCase, @abortReason)

		IF @@ERROR <> 0
			BEGIN
			ROLLBACK			
			RAISERROR ('Error in inserting case in WFCASEABORTREASON.', 16, 1)
			RETURN
			END

	END
	IF NOT EXISTS (SELECT 1 FROM WFCASE WHERE IDCASEACCESS = @idCaseAccess)
		begin
			--If all process with the seme idCaseAccess has been closed, delete the records from 
			-- BACASEACCESS TABLE
			DELETE FROM BACASEACCESSOPEN
			WHERE IDCASEACCESS = @idCaseAccess

		IF @@ERROR <> 0
			BEGIN
			ROLLBACK			
			RAISERROR ('Error in deleting case in BACASEACCESSOPEN.', 16, 1)
			RETURN
			END

		end
	
	COMMIT;
END
GO
/****** Object:  Table [dbo].[WORKITEM]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WORKITEM](
	[idWorkItem] [bigint] NOT NULL,
	[idCase] [int] NOT NULL,
	[idTask] [int] NULL,
	[idWorkItemState] [int] NOT NULL,
	[wiEntryDate] [datetime] NOT NULL,
	[wiDuration] [int] NOT NULL,
	[wiEstimatedSolutionDate] [datetime] NULL,
	[idParentWorkItem] [bigint] NULL,
	[wiSubProcMICurrCount] [int] NULL,
	[wiSubProcMICountToWaitFor] [int] NULL,
	[idDeferredByWorkItem] [bigint] NULL,
	[wiExtDuration] [int] NOT NULL,
	[wiExtEstimatedSolutionDate] [datetime] NULL,
	[wiClosed] [tinyint] NULL,
	[wiSolutionDate] [datetime] NULL,
	[idWorkItemScope] [bigint] NULL,
	[wiMultiInstanceEnded] [bit] NULL,
	[wiParentMIId] [bigint] NULL,
	[guidWorkitem] [uniqueidentifier] NULL,
	[guidActivity] [uniqueidentifier] NULL,
 CONSTRAINT [WORKITEM_PK] PRIMARY KEY CLUSTERED 
(
	[idWorkItem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_WORKITEM] ON [dbo].[WORKITEM] 
(
	[idCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_WORKITEM_1] ON [dbo].[WORKITEM] 
(
	[idTask] ASC,
	[idCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WORKITEM_FX_IDX_2] ON [dbo].[WORKITEM] 
(
	[guidActivity] ASC
)
WHERE ([guidActivity] IS NOT NULL)
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WORKITEM_INCLUDE_IDX] ON [dbo].[WORKITEM] 
(
	[wiClosed] ASC,
	[idCase] ASC,
	[idWorkItem] ASC,
	[idTask] ASC
)
INCLUDE ( [idWorkItemState],
[wiEntryDate],
[wiDuration],
[wiEstimatedSolutionDate],
[idParentWorkItem]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WORKITEM_IX1] ON [dbo].[WORKITEM] 
(
	[idDeferredByWorkItem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WORKITEM_IX3] ON [dbo].[WORKITEM] 
(
	[wiParentMIId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WORKITEM_IX4] ON [dbo].[WORKITEM] 
(
	[wiClosed] ASC,
	[idWorkItemState] ASC,
	[idTask] ASC,
	[idWorkItem] ASC,
	[idCase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VWBA_WFE_WFCASECL]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VWBA_WFE_WFCASECL] AS
		SELECT closedCases.*, closedCases.CaseGUID as guidCase, WORKFLOW.guidWorkflow, WFUSER.guidUser AS guidCreatorUser
		FROM
		(SELECT *
		FROM WFCASE
		WHERE CaseClosed = 1
		UNION ALL
		SELECT *
		FROM WFCASECL) closedCases
		INNER JOIN WORKFLOW ON closedCases.idWorkflow = WORKFLOW.idWorkflow
		INNER JOIN WFUSER ON closedCases.idCreatorUser = WFUSER.idUser
GO
/****** Object:  View [dbo].[VWBA_WFE_WFCASE]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VWBA_WFE_WFCASE] AS
	SELECT WFCASE.*, WFCASE.CaseGuid as guidCase, WORKFLOW.guidWorkflow, WFUSER.guidUser AS guidCreatorUser
	FROM WFCASE
	LEFT OUTER JOIN WORKFLOW ON WFCASE.idWorkflow = WORKFLOW.idWorkflow
	LEFT OUTER JOIN WFUSER ON WFCASE.idCreatorUser = WFUSER.idUser
	WHERE CaseClosed = 0
GO
/****** Object:  Table [dbo].[TRANSITIONDIAGRAM]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRANSITIONDIAGRAM](
	[idTransitionDiagram] [int] IDENTITY(1,1) NOT NULL,
	[idTransition] [int] NOT NULL,
	[DiagramXPos] [int] NOT NULL,
	[DiagramYPos] [int] NOT NULL,
	[DiagramOrder] [int] NOT NULL,
	[guidTransitionDiagram] [uniqueidentifier] NOT NULL,
	[dplyTransitionDiagram] [tinyint] NOT NULL,
 CONSTRAINT [TRANSITIONDIAGRAM_PK] PRIMARY KEY CLUSTERED 
(
	[idTransitionDiagram] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [TRANSITIONDIAGRAM_UKG] UNIQUE NONCLUSTERED 
(
	[guidTransitionDiagram] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TRANSITIONDIAGRAM_FK_IDX_1] ON [dbo].[TRANSITIONDIAGRAM] 
(
	[idTransition] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRANSITIONCONDITION]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRANSITIONCONDITION](
	[idTransitionCondition] [int] IDENTITY(1,1) NOT NULL,
	[idTask] [int] NOT NULL,
	[idTransition] [int] NOT NULL,
	[tcName] [nvarchar](26) NOT NULL,
	[tcDisplayName] [nvarchar](40) NULL,
	[isElse] [bit] NOT NULL,
	[guidTransitionCondition] [uniqueidentifier] NOT NULL,
	[dplyTransitionCondition] [tinyint] NOT NULL,
	[guidRule] [uniqueidentifier] NULL,
 CONSTRAINT [TRANSITIONCONDITION_PK] PRIMARY KEY CLUSTERED 
(
	[idTransitionCondition] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [TRANSITIONCONDITION_UKG] UNIQUE NONCLUSTERED 
(
	[guidTransitionCondition] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TRANSITIONCONDITION] ON [dbo].[TRANSITIONCONDITION] 
(
	[idTask] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TRANSITIONCONDITION_FK_IDX_2] ON [dbo].[TRANSITIONCONDITION] 
(
	[idTransition] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROCESSTRIGGERREGISTERENT]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROCESSTRIGGERREGISTERENT](
	[idProcessTriggerRegisterEnt] [int] NOT NULL,
	[idProcessTriggerRegister] [int] NOT NULL,
	[guidEntity] [uniqueidentifier] NOT NULL,
	[idSurrogateKey] [int] NOT NULL,
 CONSTRAINT [PROCESSTRIGGERREGISTERENT_PK] PRIMARY KEY CLUSTERED 
(
	[idProcessTriggerRegisterEnt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRPHASEINSTANCE]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRPHASEINSTANCE](
	[idPhaseInstance] [int] IDENTITY(0,1) NOT NULL,
	[idCustomPhase] [int] NOT NULL,
	[idCase] [int] NOT NULL,
	[dateFrom] [datetime] NOT NULL,
	[dateTo] [datetime] NOT NULL,
	[durationMinutes] [int] NULL,
 CONSTRAINT [GRPHASEINSTANCE_PK] PRIMARY KEY CLUSTERED 
(
	[idPhaseInstance] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GRPHASEINSTANCE_FK_IDX_1] ON [dbo].[GRPHASEINSTANCE] 
(
	[idCustomPhase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRUSERQUERY]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRUSERQUERY](
	[idQuery] [int] IDENTITY(0,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[qryName] [nvarchar](50) NOT NULL,
	[qryDescription] [nvarchar](200) NOT NULL,
	[idReportSet] [int] NOT NULL,
	[idWorkflow] [int] NULL,
	[idWfClass] [int] NULL,
	[idFromOffsetType] [int] NULL,
	[fromOffsetLength] [int] NULL,
	[idToOffsetType] [int] NULL,
	[toOffsetLength] [int] NULL,
	[dimensionFilters] [text] NULL,
	[idStopwatch] [int] NULL,
	[idCounter] [int] NULL,
	[idTask] [int] NULL,
 CONSTRAINT [GRUSERQUERY_PK] PRIMARY KEY CLUSTERED 
(
	[idQuery] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GRUSERQUERY_FK_IDX_1] ON [dbo].[GRUSERQUERY] 
(
	[idCounter] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GRUSERQUERY_FK_IDX_2] ON [dbo].[GRUSERQUERY] 
(
	[idStopwatch] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GRUSERQUERY_FK_IDX_3] ON [dbo].[GRUSERQUERY] 
(
	[idFromOffsetType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GRUSERQUERY_FK_IDX_4] ON [dbo].[GRUSERQUERY] 
(
	[idToOffsetType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GRUSERQUERY_FK_IDX_5] ON [dbo].[GRUSERQUERY] 
(
	[idTask] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GRUSERQUERY_FK_IDX_6] ON [dbo].[GRUSERQUERY] 
(
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GRUSERQUERY_FK_IDX_7] ON [dbo].[GRUSERQUERY] 
(
	[idWfClass] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GRUSERQUERY_FK_IDX_8] ON [dbo].[GRUSERQUERY] 
(
	[idWorkflow] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ASYNCHWORKITEMRUNNING]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASYNCHWORKITEMRUNNING](
	[idAsynchWorkitemRunning] [bigint] IDENTITY(1,1) NOT NULL,
	[idAsynchWorkitem] [bigint] NOT NULL,
	[awCreationDate] [datetime] NOT NULL,
	[runningState] [tinyint] NOT NULL,
	[awStartRunTime] [datetime] NULL,
 CONSTRAINT [ASYNCHWORKITEMRUNNING_PK] PRIMARY KEY CLUSTERED 
(
	[idAsynchWorkitemRunning] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ASYNCHWORKITEMRUNNING_UK1] UNIQUE NONCLUSTERED 
(
	[idAsynchWorkitem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ASYNCHWORKITEMRUNNING_IX1] ON [dbo].[ASYNCHWORKITEMRUNNING] 
(
	[idAsynchWorkitem] ASC
)
INCLUDE ( [runningState]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ASYNCHWIRETRY]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASYNCHWIRETRY](
	[idAsynchWIRetry] [bigint] NOT NULL,
	[idAsynchWorkitem] [bigint] NOT NULL,
	[awrMessage] [nvarchar](4000) NOT NULL,
	[awrRetryDate] [datetime] NOT NULL,
 CONSTRAINT [ASYNCHWIRETRY_PK] PRIMARY KEY CLUSTERED 
(
	[idAsynchWIRetry] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ASYNCHWIRETRY_FK_IDX_1] ON [dbo].[ASYNCHWIRETRY] 
(
	[idAsynchWorkitem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALARMRECIPIENT]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALARMRECIPIENT](
	[idAlarmRecipient] [int] IDENTITY(1,1) NOT NULL,
	[idAlarm] [int] NULL,
	[idRole] [int] NULL,
	[idSkill] [int] NULL,
	[idPosition] [int] NULL,
	[idArea] [int] NULL,
	[idLocation] [int] NULL,
	[include] [bit] NOT NULL,
	[guidRule] [uniqueidentifier] NULL,
 CONSTRAINT [ALARMRECIPIENT_PK] PRIMARY KEY CLUSTERED 
(
	[idAlarmRecipient] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ALARMRECIPIENT_FK_IDX_1] ON [dbo].[ALARMRECIPIENT] 
(
	[idAlarm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ALARMRECIPIENT_FK_IDX_2] ON [dbo].[ALARMRECIPIENT] 
(
	[idArea] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ALARMRECIPIENT_FK_IDX_4] ON [dbo].[ALARMRECIPIENT] 
(
	[idLocation] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ALARMRECIPIENT_FK_IDX_5] ON [dbo].[ALARMRECIPIENT] 
(
	[idPosition] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ALARMRECIPIENT_FK_IDX_6] ON [dbo].[ALARMRECIPIENT] 
(
	[idRole] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ALARMRECIPIENT_FK_IDX_7] ON [dbo].[ALARMRECIPIENT] 
(
	[idSkill] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CURRENTASSIGNEE]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CURRENTASSIGNEE](
	[idWorkItem] [bigint] NOT NULL,
	[idUser] [int] NOT NULL,
	[Deleted] [tinyint] NULL,
	[idTaskType] [int] NULL,
 CONSTRAINT [CURRENTASSIGNEE_PK] PRIMARY KEY CLUSTERED 
(
	[idWorkItem] ASC,
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CURRENTASSIGNEE_IX1] ON [dbo].[CURRENTASSIGNEE] 
(
	[idWorkItem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spBA_WFE_GetNextAsyncWIForRun]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_WFE_GetNextAsyncWIForRun](@iAwEnabled int, @iAwState int, @nNumWIsToRetrive int = 30,
			@iRunningTimeoutSecs int = 3600)
		AS
		BEGIN

			if (@iAwEnabled is null) begin
				RAISERROR ('iAwEnabled argument not specified', 16, 1)
				return
			end

			if (@iAwState is null) begin
				RAISERROR ('iAwState argument not specified', 16, 1)
				return
			end

			if (@nNumWIsToRetrive is null) begin
				RAISERROR ('nNumWIsToRetrive argument not specified', 16, 1)
				return
			end

			if (@@trancount > 0) begin
				RAISERROR ('@@trancount is greather than 0. The procedure spBA_WFE_GetNextAsyncWIForRun cannot be called in nested transactions', 16, 1)
				return
			end

			DECLARE @tmpWorkitemList TABLE (idAsynchWorkitem bigint null)

			begin
				-- Look for Asynch Workitems pending to run in cache table
				WITH ASWR AS
				(
						select TOP (@nNumWIsToRetrive) idAsynchWorkitem, runningState, awStartRunTime
						from ASYNCHWORKITEMRUNNING
						where runningState = 0
						order by idAsynchWorkitem
				)
				UPDATE ASWR with (rowlock)
					SET runningState = 1, 
						awStartRunTime = getdate()
				OUTPUT inserted.idAsynchWorkitem into @tmpWorkitemList;

				if not exists(select 1 from @tmpWorkitemList)
				begin
					--Tries to get an App Lock to start loading asyncworkitems for processing
					declare @ret int 
					exec @ret = spBA_MonitorEnter 'AsynchWorkitem', 10
					if (@ret >= 0)
					begin
						begin try
						-- Delete runned Asynch Workitems  and  Timeout for running
						delete from ASYNCHWORKITEMRUNNING
						where runningState = 2  or
							(runningState = 1  and  (datediff(second, awStartRunTime, getdate()) > @iRunningTimeoutSecs) )

						-- Cache table does not have Asynch Workitems, calculate more Asynch Workitems
						insert into ASYNCHWORKITEMRUNNING(idAsynchWorkitem, awCreationDate, runningState)
							SELECT aw.idAsynchWorkitem, aw.awCreationDate, 0
							FROM ASYNCHWORKITEM aw 
								LEFT OUTER JOIN ASYNCHWORKITEMRUNNING awr ON aw.idAsynchWorkitem = awr.idAsynchWorkitem
							WHERE aw.awEnabled = @iAwEnabled  AND  aw.awState = @iAwState  AND
								awr.idAsynchWorkitem is null AND 
									(aw.awCurrentRetries = 0 
									OR (aw.awCurrentRetries > 0 AND aw.awProcessing = 0 AND awNextProcessDate < GETDATE() ))
							ORDER BY aw.idAsynchWorkitem;

							-- Look for Asynch Workitems pending to run in cache table
							-- by again executing the initial query
							WITH ASWR AS
							(
									select TOP (@nNumWIsToRetrive) idAsynchWorkitem, runningState, awStartRunTime
									from ASYNCHWORKITEMRUNNING
									where runningState = 0
									order by idAsynchWorkitem
							)
							UPDATE ASWR with (rowlock)
								SET runningState = 1, 
									awStartRunTime = getdate()
							OUTPUT inserted.idAsynchWorkitem into @tmpWorkitemList;
						end try
						begin catch
					
							exec spBA_MonitorExit 'AsynchWorkitem'

							DECLARE		@ErrorMessage nvarchar(4000) ,
										@ErrorNumber int ,
										@ErrorSeverity int ,
										@ErrorState int ,
										@ErrorLine int ,
										@ErrorProcedure nvarchar(200) ;
										SET @ErrorMessage = ERROR_MESSAGE()
										SET @ErrorNumber = ERROR_NUMBER()
										SET @ErrorSeverity  = ERROR_SEVERITY()
										SET @ErrorState  = ERROR_STATE()
										SET @ErrorLine  = ERROR_LINE()
										SET @ErrorProcedure = ISNULL(ERROR_PROCEDURE(), '-')
										SELECT @ErrorMessage = N'Error %d, Level %d, State %d, Procedure %s, Line %d, ' + 'Message: ' + @ErrorMessage;
										RAISERROR (@ErrorMessage, @ErrorSeverity, 1, @ErrorNumber, @ErrorSeverity, @ErrorState, @ErrorProcedure, @ErrorLine)
							--yep... raising an error DOES NOT end execution 
							If @@ERROR > 0 Return
						end catch
					end
					exec spBA_MonitorExit 'AsynchWorkitem'
				end

				SELECT idAsynchWorkitem, idWorkitem, awCurrentRetries, awEnabled, awCreationDate, awLastProcessDate,
					awState, awProcessing, idCase, idTask, idWorkitemScope, bAsynchSubProcess, awSubProcessContext,
					idWfClass, awCaseCreationContext, idWorkflow
				FROM ASYNCHWORKITEM 
				WHERE idAsynchWorkitem in (select idAsynchWorkitem from @tmpWorkitemList)
			end

		END
GO
/****** Object:  View [dbo].[VWBA_WFE_WORKITEMCL]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VWBA_WFE_WORKITEMCL] AS
			SELECT idWorkItem, idCase, idTask, idWorkItemState, wiEntryDate, wiDuration, wiEstimatedSolutionDate, idParentWorkItem, wiSolutionDate,
			wiSubProcMICurrCount, wiSubProcMICountToWaitFor, idDeferredByWorkItem, wiExtDuration, wiExtEstimatedSolutionDate, idWorkItemScope,
			wiParentMIId, wiMultiInstanceEnded, guidWorkitem, guidActivity
			FROM WORKITEM
			WHERE wiClosed = 1
			UNION ALL
			SELECT idWorkItem, idCase, idTask, idWorkItemState, wiEntryDate, wiDuration, wiEstimatedSolutionDate, idParentWorkItem, wiSolutionDate, 
			wiSubProcMICurrCount, wiSubProcMICountToWaitFor, idDeferredByWorkItem, wiExtDuration, wiExtEstimatedSolutionDate, idWorkItemScope,
			wiParentMIId, wiMultiInstanceEnded, guidWorkitem, guidActivity
			FROM WORKITEMCL
GO
/****** Object:  View [dbo].[VWBA_WFE_WORKITEM]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VWBA_WFE_WORKITEM] AS
		SELECT *
		FROM WORKITEM
		WHERE (wiClosed = 0)
GO
/****** Object:  View [dbo].[VWBA_WFE_CURRENTASSIGNEE]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VWBA_WFE_CURRENTASSIGNEE] AS
		SELECT *
		FROM CURRENTASSIGNEE
		WHERE deleted = 0
GO
/****** Object:  View [dbo].[VWBA_DS_WORKITEMCL]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VWBA_DS_WORKITEMCL] AS
			SELECT CLOSEDWORKITEMS.* 
			FROM 
				(	SELECT wf.*, c.caseGUID as guidCase, t.guidTask 
					FROM VWBA_WFE_WORKITEMCL wf 
					INNER JOIN (SELECT idCase, caseGuid 
								FROM wfcase 
								UNION ALL
								SELECT idCase, caseGuid 
								FROM wfcasecl
								) c ON c.idCase = wf.idCase
					INNER JOIN task t ON t.idtask = wf.idtask
				) CLOSEDWORKITEMS
GO
/****** Object:  StoredProcedure [dbo].[spBA_WFE_setassignee_mu]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_WFE_setassignee_mu]
	(
		@idWorkItem BIGINT, 
		@idUsersClause varchar(1000),
		@idTaskType INT, 
		@clearLog BIT
	)
	AS
	BEGIN
		DECLARE @Buffer VARCHAR(1000)
		DECLARE @FieldNVI INTEGER
		DECLARE @FieldNI INTEGER
		DECLARE @FieldNV INTEGER
		SET NOCOUNT ON
		            
		SET @Buffer = RTRIM(LTRIM(@idUsersClause))
		SET @FieldNVI = 0
		      
		WHILE 1=1
		BEGIN		
			IF LEN(@Buffer) <= 0
				BREAK
		  			
			SET @FieldNVI = CHARINDEX(',', @Buffer, 0)
			IF @FieldNVI = 0
				SET @FieldNVI = LEN(@Buffer)+1
		  
			SET @FieldNV = CAST(SUBSTRING(@Buffer, 1, @FieldNVI-1) AS INT)
			SET @Buffer = LTRIM(SUBSTRING(@Buffer, @FieldNVI+1, LEN(@Buffer)))
		      
			IF EXISTS(SELECT idUser FROM CURRENTASSIGNEE WHERE idWorkItem=@idWorkItem AND idUser=@FieldNV AND Deleted=1 ) 
			BEGIN
				UPDATE CURRENTASSIGNEE SET Deleted = 0 WHERE idWorkItem=@idWorkItem AND idUser=@FieldNV AND Deleted=1
			END
			ELSE
			BEGIN			
				INSERT INTO CURRENTASSIGNEE (idWorkItem, idUser, idTaskType) VALUES (@idWorkItem ,@FieldNV, @idTaskType )
			END
		END
		IF (@clearLog = 1)
				DELETE ASSIGNATIONLOG
				WHERE idWorkItem = @idWorkItem
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_WFE_setassignee]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_WFE_setassignee]
	(
		@idWorkItem BIGINT, 
		@idUser INT,
		@idTaskType INT,
		@clearLog BIT
	)
	AS
	BEGIN
		INSERT INTO CURRENTASSIGNEE(idWorkItem, idUser, idTaskType) VALUES (@idWorkItem, @idUser, @idTaskType)
		IF (@clearLog = 1)
				DELETE ASSIGNATIONLOG
				WHERE idWorkItem = @idWorkItem
	END
GO
/****** Object:  StoredProcedure [dbo].[spBA_WFE_GetCurTokenForSyncGtw]    Script Date: 06/08/2017 15:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_WFE_GetCurTokenForSyncGtw](@idCase int, @idTask int, @currentTokens int output)
AS
BEGIN
	declare @ret int
	declare @lockName varchar
	set @lockName = 'GetCurrentTokenNumber_' + cast(@idCase as varchar) + '_' + cast(@idTask as varchar)
	exec @ret = sp_getapplock @Resource = @lockName, @LockMode = 'Exclusive', @LockOwner = 'Session'
	
	if (@ret >= 0)
	BEGIN
	
		SELECT @currentTokens = COUNT(0)
		FROM VWBA_WFE_WORKITEM WITH(nolock)
		WHERE idCase = @idCase AND idTask = @idTask
	
	END
	
	exec sp_releaseapplock @Resource = @lockName, @LockOwner = 'Session'
	
END
GO
/****** Object:  StoredProcedure [dbo].[spBA_WFE_close_workitem]    Script Date: 06/08/2017 15:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_WFE_close_workitem]
(
	@idWorkItem INT,
	@delCurrentAssignee BIT
)
AS
BEGIN

	IF (@delCurrentAssignee = 1)
		DELETE CURRENTASSIGNEE WHERE idWorkItem = @idWorkItem

	INSERT INTO WORKITEMCL
				(idWorkItem, idCase, idTask, idWorkItemState, wiEntryDate, wiDuration, wiEstimatedSolutionDate, idParentWorkItem, wiSolutionDate,
				wiSubProcMICurrCount, wiSubProcMICountToWaitFor, idDeferredByWorkItem, wiExtDuration, wiExtEstimatedSolutionDate, wiMultiInstanceEnded, wiParentMIId, guidWorkitem,guidActivity)
		SELECT  idWorkItem, idCase, idTask, idWorkItemState, wiEntryDate, wiDuration, wiEstimatedSolutionDate, idParentWorkItem, 
		CASE WHEN wiSolutionDate is null Then GETDATE() ELSE wiSolutionDate END AS wiSolutionDate, wiSubProcMICurrCount, 
		wiSubProcMICountToWaitFor, idDeferredByWorkItem, wiExtDuration, wiExtEstimatedSolutionDate, wiMultiInstanceEnded, wiParentMIId, guidWorkitem,guidActivity
		FROM WORKITEM 
		WHERE idWorkItem = @idWorkItem
			
	DELETE WORKITEM WHERE idWorkItem = @idWorkItem

END
GO
/****** Object:  StoredProcedure [dbo].[spBA_WFE_close_properties]    Script Date: 06/08/2017 15:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBA_WFE_close_properties]
	(
		@propsTableName VARCHAR(80), 
		@closedPropsTableName VARCHAR(80), 
		@idCase INT, 
		@delCurrentAssignee INT
	)
	AS
	BEGIN
		DECLARE @query NVARCHAR(1000)
		DECLARE @ParamDefinition NVARCHAR(2000) 
		SET @query = 'INSERT INTO ' + @closedPropsTableName + ' WITH (ROWLOCK)  SELECT * FROM  ' + @propsTableName + ' WHERE idCase = @idCase' 
		SET @ParamDefinition = '@idCase INT'
		EXECUTE sp_executesql @query, @ParamDefinition, @idCase

		IF (@delCurrentAssignee = 1) 
			DELETE CURRENTASSIGNEE WITH (ROWLOCK)
			WHERE idWorkItem IN 
				(SELECT W.idWorkItem 
				FROM WORKITEM W 
				WHERE W.idCase = @idCase)

		ELSE
			UPDATE CURRENTASSIGNEE WITH (ROWLOCK)
			SET Deleted = 1
			WHERE idWorkItem IN 
				(SELECT W.idWorkItem 
				FROM WORKITEM W 
				WHERE W.idCase = @idCase)

		SET @query = 'DELETE ' + @propsTableName + ' WITH (ROWLOCK) WHERE idCase = @idCase'
		SET @ParamDefinition = '@idCase INT'
		EXECUTE sp_executesql @query, @ParamDefinition, @idCase
	END
GO
/****** Object:  Default [FUNCTIONALAREA_DFG]    Script Date: 06/08/2017 15:53:09 ******/
ALTER TABLE [dbo].[FUNCTIONALAREA] ADD  CONSTRAINT [FUNCTIONALAREA_DFG]  DEFAULT (newid()) FOR [guidFunctionalArea]
GO
/****** Object:  Default [FUNCTIONALAREA_DFY]    Script Date: 06/08/2017 15:53:09 ******/
ALTER TABLE [dbo].[FUNCTIONALAREA] ADD  CONSTRAINT [FUNCTIONALAREA_DFY]  DEFAULT ((0)) FOR [dplyFunctionalArea]
GO
/****** Object:  Default [HOLIDAYSCHEMA_DFG]    Script Date: 06/08/2017 15:53:10 ******/
ALTER TABLE [dbo].[HOLIDAYSCHEMA] ADD  CONSTRAINT [HOLIDAYSCHEMA_DFG]  DEFAULT (newid()) FOR [guidHolidaySchema]
GO
/****** Object:  Default [HOLIDAYSCHEMA_DFY]    Script Date: 06/08/2017 15:53:10 ******/
ALTER TABLE [dbo].[HOLIDAYSCHEMA] ADD  CONSTRAINT [HOLIDAYSCHEMA_DFY]  DEFAULT ((0)) FOR [dplyHolidaySchema]
GO
/****** Object:  Default [RENDERTAB_DF1]    Script Date: 06/08/2017 15:53:13 ******/
ALTER TABLE [dbo].[RENDERTAB] ADD  CONSTRAINT [RENDERTAB_DF1]  DEFAULT ((1)) FOR [rdrTabDisplayOrder]
GO
/****** Object:  Default [RENDERTAB_DFG]    Script Date: 06/08/2017 15:53:13 ******/
ALTER TABLE [dbo].[RENDERTAB] ADD  CONSTRAINT [RENDERTAB_DFG]  DEFAULT (newid()) FOR [guidRenderTab]
GO
/****** Object:  Default [RENDERTAB_DFY]    Script Date: 06/08/2017 15:53:13 ******/
ALTER TABLE [dbo].[RENDERTAB] ADD  CONSTRAINT [RENDERTAB_DFY]  DEFAULT ((0)) FOR [dplyRenderTab]
GO
/****** Object:  Default [RENDERGROUP_DF1]    Script Date: 06/08/2017 15:53:13 ******/
ALTER TABLE [dbo].[RENDERGROUP] ADD  CONSTRAINT [RENDERGROUP_DF1]  DEFAULT ((1)) FOR [rdrGrpDisplayOrder]
GO
/****** Object:  Default [RENDERGROUP_DFG]    Script Date: 06/08/2017 15:53:13 ******/
ALTER TABLE [dbo].[RENDERGROUP] ADD  CONSTRAINT [RENDERGROUP_DFG]  DEFAULT (newid()) FOR [guidRenderGroup]
GO
/****** Object:  Default [RENDERGROUP_DFY]    Script Date: 06/08/2017 15:53:13 ******/
ALTER TABLE [dbo].[RENDERGROUP] ADD  CONSTRAINT [RENDERGROUP_DFY]  DEFAULT ((0)) FOR [dplyRenderGroup]
GO
/****** Object:  Default [DF__PVApp__finalEnt__73901351]    Script Date: 06/08/2017 15:53:13 ******/
ALTER TABLE [dbo].[PVApp] ADD  DEFAULT ((10001)) FOR [finalEnt]
GO
/****** Object:  Default [DF__ProtsessZ__final__7BF04F28]    Script Date: 06/08/2017 15:53:13 ******/
ALTER TABLE [dbo].[ProtsessZhiznennyyTsiklU] ADD  DEFAULT ((10005)) FOR [finalEnt]
GO
/****** Object:  Default [DF__ProtsessZ__final__1C5D1EBA]    Script Date: 06/08/2017 15:53:13 ******/
ALTER TABLE [dbo].[ProtsessZaneseniyaStuden] ADD  DEFAULT ((10008)) FOR [finalEnt]
GO
/****** Object:  Default [REASSIGNLOG_DF1]    Script Date: 06/08/2017 15:53:13 ******/
ALTER TABLE [dbo].[REASSIGNLOG] ADD  CONSTRAINT [REASSIGNLOG_DF1]  DEFAULT (getdate()) FOR [rlOldAssignDate]
GO
/****** Object:  Default [JOBTYPE_DF1]    Script Date: 06/08/2017 15:53:13 ******/
ALTER TABLE [dbo].[JOBTYPE] ADD  CONSTRAINT [JOBTYPE_DF1]  DEFAULT ((1)) FOR [jobTypeEnabled]
GO
/****** Object:  Default [LGLANGUAGE_DFG]    Script Date: 06/08/2017 15:53:13 ******/
ALTER TABLE [dbo].[LGLANGUAGE] ADD  CONSTRAINT [LGLANGUAGE_DFG]  DEFAULT (newid()) FOR [guidLGLanguage]
GO
/****** Object:  Default [LGLANGUAGE_DFY]    Script Date: 06/08/2017 15:53:13 ******/
ALTER TABLE [dbo].[LGLANGUAGE] ADD  CONSTRAINT [LGLANGUAGE_DFY]  DEFAULT ((0)) FOR [dplyLGLanguage]
GO
/****** Object:  Default [LGLANGUAGEDEF]    Script Date: 06/08/2017 15:53:13 ******/
ALTER TABLE [dbo].[LGLANGUAGE] ADD  CONSTRAINT [LGLANGUAGEDEF]  DEFAULT ((11)) FOR [finalEnt]
GO
/****** Object:  Default [ROLE_DFG]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[ROLE] ADD  CONSTRAINT [ROLE_DFG]  DEFAULT (newid()) FOR [guidRole]
GO
/****** Object:  Default [ROLE_DFY]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[ROLE] ADD  CONSTRAINT [ROLE_DFY]  DEFAULT ((0)) FOR [dplyRole]
GO
/****** Object:  Default [ROLEDEF]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[ROLE] ADD  CONSTRAINT [ROLEDEF]  DEFAULT ((4)) FOR [finalEnt]
GO
/****** Object:  Default [SKILL_DFG]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[SKILL] ADD  CONSTRAINT [SKILL_DFG]  DEFAULT (newid()) FOR [guidSkill]
GO
/****** Object:  Default [SKILL_DFY]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[SKILL] ADD  CONSTRAINT [SKILL_DFY]  DEFAULT ((0)) FOR [dplySkill]
GO
/****** Object:  Default [SKILLDEF]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[SKILL] ADD  CONSTRAINT [SKILLDEF]  DEFAULT ((5)) FOR [finalEnt]
GO
/****** Object:  Default [ASSIGNATIONLOG_DF1]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[ASSIGNATIONLOG] ADD  CONSTRAINT [ASSIGNATIONLOG_DF1]  DEFAULT (getdate()) FOR [alEntryDate]
GO
/****** Object:  Default [AREA_DFG]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[AREA] ADD  CONSTRAINT [AREA_DFG]  DEFAULT (newid()) FOR [guidArea]
GO
/****** Object:  Default [AREA_DFY]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[AREA] ADD  CONSTRAINT [AREA_DFY]  DEFAULT ((0)) FOR [dplyArea]
GO
/****** Object:  Default [AREADEF]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[AREA] ADD  CONSTRAINT [AREADEF]  DEFAULT ((3)) FOR [finalEnt]
GO
/****** Object:  Default [ARCHIVINGLOG_DFD2]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[ARCHIVINGLOG] ADD  CONSTRAINT [ARCHIVINGLOG_DFD2]  DEFAULT (newid()) FOR [idArchivingLog]
GO
/****** Object:  Default [ARCHIVINGLOG_DFD]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[ARCHIVINGLOG] ADD  CONSTRAINT [ARCHIVINGLOG_DFD]  DEFAULT (getdate()) FOR [logData]
GO
/****** Object:  Default [BACACHESYNC_DF1]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BACACHESYNC] ADD  CONSTRAINT [BACACHESYNC_DF1]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  Default [BABIZRULEAUDITLOG_DF1]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BABIZRULEAUDITLOG] ADD  CONSTRAINT [BABIZRULEAUDITLOG_DF1]  DEFAULT (getdate()) FOR [updateDate]
GO
/****** Object:  Default [BABIZAGICATALOG_DF1]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BABIZAGICATALOG] ADD  CONSTRAINT [BABIZAGICATALOG_DF1]  DEFAULT (getdate()) FOR [modifiedDate]
GO
/****** Object:  Default [BABIZAGICATALOG_DFG]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BABIZAGICATALOG] ADD  CONSTRAINT [BABIZAGICATALOG_DFG]  DEFAULT ((0)) FOR [mtdVersion]
GO
/****** Object:  Default [BABIZAGICATALOG_DFG2]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BABIZAGICATALOG] ADD  CONSTRAINT [BABIZAGICATALOG_DFG2]  DEFAULT ((0)) FOR [contentFormat]
GO
/****** Object:  Default [BAAUDITLOG_DF1]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BAAUDITLOG] ADD  CONSTRAINT [BAAUDITLOG_DF1]  DEFAULT (getdate()) FOR [updateDate]
GO
/****** Object:  Default [BAFILEUPLOG_DF1]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BAFILEUPLOG] ADD  CONSTRAINT [BAFILEUPLOG_DF1]  DEFAULT ((0)) FOR [FULDISABLED]
GO
/****** Object:  Default [BAFILEUPLOG_DF2]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BAFILEUPLOG] ADD  CONSTRAINT [BAFILEUPLOG_DF2]  DEFAULT ((0)) FOR [FULIDSCOPE]
GO
/****** Object:  Default [BAFAVORITES_DFG]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BAFAVORITES] ADD  CONSTRAINT [BAFAVORITES_DFG]  DEFAULT (newid()) FOR [guidFavorite]
GO
/****** Object:  Default [BAERRORCODE_DFG]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BAERRORCODE] ADD  CONSTRAINT [BAERRORCODE_DFG]  DEFAULT (newid()) FOR [guidErrorCode]
GO
/****** Object:  Default [BAERRORCODE_DFY]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BAERRORCODE] ADD  CONSTRAINT [BAERRORCODE_DFY]  DEFAULT ((0)) FOR [dplyErrorCode]
GO
/****** Object:  Default [BAEMAILINTEGRATIONDATA_DF1]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BAEMAILINTEGRATIONDATA] ADD  CONSTRAINT [BAEMAILINTEGRATIONDATA_DF1]  DEFAULT (getdate()) FOR [readDate]
GO
/****** Object:  Default [BAEMAILINTEGRATIONDATA_DF2]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BAEMAILINTEGRATIONDATA] ADD  CONSTRAINT [BAEMAILINTEGRATIONDATA_DF2]  DEFAULT ((0)) FOR [processingTries]
GO
/****** Object:  Default [BAEMAILINTEGRATIONDATA_DF3]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BAEMAILINTEGRATIONDATA] ADD  CONSTRAINT [BAEMAILINTEGRATIONDATA_DF3]  DEFAULT ((0)) FOR [status]
GO
/****** Object:  Default [BAENVPARAMENTITYEX_DFG]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BAENVPARAMENTITYEX] ADD  CONSTRAINT [BAENVPARAMENTITYEX_DFG]  DEFAULT (newid()) FOR [guidEnvParamEntityEx]
GO
/****** Object:  Default [BAENVPARAMENTITYEX_DFY]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BAENVPARAMENTITYEX] ADD  CONSTRAINT [BAENVPARAMENTITYEX_DFY]  DEFAULT ((0)) FOR [dplyEnvParamEntityEx]
GO
/****** Object:  Default [DF__BADSUSERC__guidC__532E30B7]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BADSUSERCOST] ADD  CONSTRAINT [DF__BADSUSERC__guidC__532E30B7]  DEFAULT (newid()) FOR [guidCost]
GO
/****** Object:  Default [BADSTRANSITIONHISTORY_DFG]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BADSTRANSITIONHISTORY] ADD  CONSTRAINT [BADSTRANSITIONHISTORY_DFG]  DEFAULT (newid()) FOR [guidTransitionHistory]
GO
/****** Object:  Default [DF__BADSDATE__guid__43EBED27]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BADSDATE] ADD  CONSTRAINT [DF__BADSDATE__guid__43EBED27]  DEFAULT (newid()) FOR [guid]
GO
/****** Object:  Default [BACOLLABFOLDER_DFG]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BACOLLABFOLDER] ADD  CONSTRAINT [BACOLLABFOLDER_DFG]  DEFAULT (newid()) FOR [guidCollabFolder]
GO
/****** Object:  Default [BACOLLABFOLDER_DFY]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BACOLLABFOLDER] ADD  CONSTRAINT [BACOLLABFOLDER_DFY]  DEFAULT ((0)) FOR [dplyCollabFolder]
GO
/****** Object:  Default [DF__BADATATRI__trigg__3A379A64]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BADATATRIGGERJOB] ADD  DEFAULT ((1)) FOR [triggerType]
GO
/****** Object:  Default [BADATATRIGGEREXECUTIONLOG_DF3]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BADATATRIGGEREXECUTIONLOG] ADD  CONSTRAINT [BADATATRIGGEREXECUTIONLOG_DF3]  DEFAULT (getdate()) FOR [executionDate]
GO
/****** Object:  Default [BADPLYPACKAGE_DFG]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BADPLYPACKAGE] ADD  CONSTRAINT [BADPLYPACKAGE_DFG]  DEFAULT (newid()) FOR [guidDeploymentPackage]
GO
/****** Object:  Default [BADPLYPACKAGE_DF1]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BADPLYPACKAGE] ADD  CONSTRAINT [BADPLYPACKAGE_DF1]  DEFAULT (getdate()) FOR [dpkCreationDate]
GO
/****** Object:  Default [BADPLYPACKAGE_DFY]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BADPLYPACKAGE] ADD  CONSTRAINT [BADPLYPACKAGE_DFY]  DEFAULT ((0)) FOR [dplyDeploymentPackage]
GO
/****** Object:  Default [BADPLYCONFIG_DFG]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BADPLYCONFIG] ADD  CONSTRAINT [BADPLYCONFIG_DFG]  DEFAULT (newid()) FOR [guidBADplyConfig]
GO
/****** Object:  Default [BADPLYCONFIG_DFY]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BADPLYCONFIG] ADD  CONSTRAINT [BADPLYCONFIG_DFY]  DEFAULT ((0)) FOR [dplyBADplyConfig]
GO
/****** Object:  Default [BAPOOL_DFG]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BAPOOL] ADD  CONSTRAINT [BAPOOL_DFG]  DEFAULT (newid()) FOR [guidPool]
GO
/****** Object:  Default [BAPOOL_DFY]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BAPOOL] ADD  CONSTRAINT [BAPOOL_DFY]  DEFAULT ((0)) FOR [dplyPool]
GO
/****** Object:  Default [BAOVERRIDE_DF1]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BAOVERRIDE] ADD  CONSTRAINT [BAOVERRIDE_DF1]  DEFAULT (getdate()) FOR [modifiedDate]
GO
/****** Object:  Default [BAOVERRIDE_DFG]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BAOVERRIDE] ADD  CONSTRAINT [BAOVERRIDE_DFG]  DEFAULT ((0)) FOR [mtdVersion]
GO
/****** Object:  Default [BAOVERRIDE_DFG2]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BAOVERRIDE] ADD  CONSTRAINT [BAOVERRIDE_DFG2]  DEFAULT ((0)) FOR [contentFormat]
GO
/****** Object:  Default [BATIMEZONE_DFG]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BATIMEZONE] ADD  CONSTRAINT [BATIMEZONE_DFG]  DEFAULT (newid()) FOR [guidBATimeZone]
GO
/****** Object:  Default [BATIMEZONE_DFY]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BATIMEZONE] ADD  CONSTRAINT [BATIMEZONE_DFY]  DEFAULT ((0)) FOR [dplyBATimeZone]
GO
/****** Object:  Default [BATIMEZONEDEF]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BATIMEZONE] ADD  CONSTRAINT [BATIMEZONEDEF]  DEFAULT ((10)) FOR [finalEnt]
GO
/****** Object:  Default [BASYSTEMCATALOG_DF1]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BASYSTEMCATALOG] ADD  CONSTRAINT [BASYSTEMCATALOG_DF1]  DEFAULT (getdate()) FOR [modifiedDate]
GO
/****** Object:  Default [BASYSTEMCATALOG_DFG]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BASYSTEMCATALOG] ADD  CONSTRAINT [BASYSTEMCATALOG_DFG]  DEFAULT ((0)) FOR [mtdVersion]
GO
/****** Object:  Default [BASYSTEMCATALOG_DFG2]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BASYSTEMCATALOG] ADD  CONSTRAINT [BASYSTEMCATALOG_DFG2]  DEFAULT ((0)) FOR [contentFormat]
GO
/****** Object:  Default [DF__BASTAKEHO__autoM__1D66518C]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BASTAKEHOLDERUSER] ADD  DEFAULT ((0)) FOR [autoMapping]
GO
/****** Object:  Default [DF__BASTAKEHO__disab__1E5A75C5]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BASTAKEHOLDERUSER] ADD  DEFAULT ((0)) FOR [disabled]
GO
/****** Object:  Default [BASCOPELOG_DF1]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BASCOPELOG] ADD  CONSTRAINT [BASCOPELOG_DF1]  DEFAULT ((1)) FOR [version]
GO
/****** Object:  Default [BASCOPEDEF_DFG]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BASCOPEDEF] ADD  CONSTRAINT [BASCOPEDEF_DFG]  DEFAULT (newid()) FOR [guidScopeDef]
GO
/****** Object:  Default [BASCOPEDEF_DFY]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BASCOPEDEF] ADD  CONSTRAINT [BASCOPEDEF_DFY]  DEFAULT ((0)) FOR [dplyScopeDef]
GO
/****** Object:  Default [BASCOPE_DF1]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BASCOPE] ADD  CONSTRAINT [BASCOPE_DF1]  DEFAULT ((1)) FOR [SPESCOPEVER]
GO
/****** Object:  Default [BASCOPE_DF2]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BASCOPE] ADD  CONSTRAINT [BASCOPE_DF2]  DEFAULT ((0)) FOR [DISABLED]
GO
/****** Object:  Default [BAWFCASELOG_DF1]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BAWFCASELOG] ADD  CONSTRAINT [BAWFCASELOG_DF1]  DEFAULT (getdate()) FOR [wfCaseLogEntryDate]
GO
/****** Object:  Default [DF__Dolzhnost__final__06A2E7C5]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[Dolzhnost] ADD  DEFAULT ((10004)) FOR [finalEnt]
GO
/****** Object:  Default [CUSTOMJOBRUNNING_DF2]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[CUSTOMJOBRUNNING] ADD  CONSTRAINT [CUSTOMJOBRUNNING_DF2]  DEFAULT ((0)) FOR [runningState]
GO
/****** Object:  Default [CUSTOMJOBRUNNING_DF1]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[CUSTOMJOBRUNNING] ADD  CONSTRAINT [CUSTOMJOBRUNNING_DF1]  DEFAULT (getdate()) FOR [jobStartRunTime]
GO
/****** Object:  Default [FACTLOG_DF1]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[FACTLOG] ADD  CONSTRAINT [FACTLOG_DF1]  DEFAULT (getdate()) FOR [flEntryDate]
GO
/****** Object:  Default [CASESTATELOG_DF1]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[CASESTATELOG] ADD  CONSTRAINT [CASESTATELOG_DF1]  DEFAULT (getdate()) FOR [cslEntryDate]
GO
/****** Object:  Default [ENTITY_DFG]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[ENTITY] ADD  CONSTRAINT [ENTITY_DFG]  DEFAULT (newid()) FOR [guidEnt]
GO
/****** Object:  Default [ENTITY_DF1]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[ENTITY] ADD  CONSTRAINT [ENTITY_DF1]  DEFAULT ((0)) FOR [AllowDelete]
GO
/****** Object:  Default [ENTITY_DF2]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[ENTITY] ADD  CONSTRAINT [ENTITY_DF2]  DEFAULT ((0)) FOR [entAdministrable]
GO
/****** Object:  Default [ENTITY_DF3]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[ENTITY] ADD  CONSTRAINT [ENTITY_DF3]  DEFAULT ((0)) FOR [entLogged]
GO
/****** Object:  Default [ENTITY_DF4]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[ENTITY] ADD  CONSTRAINT [ENTITY_DF4]  DEFAULT ((0)) FOR [entReplicated]
GO
/****** Object:  Default [ENTITY_DFY]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[ENTITY] ADD  CONSTRAINT [ENTITY_DFY]  DEFAULT ((0)) FOR [dplyEnt]
GO
/****** Object:  Default [ENTITY_DF5]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[ENTITY] ADD  CONSTRAINT [ENTITY_DF5]  DEFAULT ((0)) FOR [hasIdentity]
GO
/****** Object:  Default [DF__WFPLAN__contextu__48A5B54C]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[WFPLAN] ADD  DEFAULT ((0)) FOR [contextualized]
GO
/****** Object:  Default [WORKINGTIMESCHEMA_DFG]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[WORKINGTIMESCHEMA] ADD  CONSTRAINT [WORKINGTIMESCHEMA_DFG]  DEFAULT (newid()) FOR [guidWorkingTimeSchema]
GO
/****** Object:  Default [WORKINGTIMESCHEMA_DFY]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[WORKINGTIMESCHEMA] ADD  CONSTRAINT [WORKINGTIMESCHEMA_DFY]  DEFAULT ((0)) FOR [dplyWorkingTimeSchema]
GO
/****** Object:  Default [WORKINGTIMESCHEMADEF]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[WORKINGTIMESCHEMA] ADD  CONSTRAINT [WORKINGTIMESCHEMADEF]  DEFAULT ((7)) FOR [finalEnt]
GO
/****** Object:  Default [DF__Zhiznenny__final__188C8DD6]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[ZhiznennyyTsiklStudenta] ADD  DEFAULT ((10007)) FOR [finalEnt]
GO
/****** Object:  Default [DF__Zhiznenny__final__7B313519]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[ZhiznennyyTsiklKursovogo] ADD  DEFAULT ((10002)) FOR [finalEnt]
GO
/****** Object:  Default [DF__Zadacha__finalEn__7ECCBBD3]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[Zadacha] ADD  DEFAULT ((10006)) FOR [finalEnt]
GO
/****** Object:  Default [WORKITEMCL_DF2]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[WORKITEMCL] ADD  CONSTRAINT [WORKITEMCL_DF2]  DEFAULT ((0)) FOR [wiExtDuration]
GO
/****** Object:  Default [WORKITEMCL_DF1]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[WORKITEMCL] ADD  CONSTRAINT [WORKITEMCL_DF1]  DEFAULT ((1)) FOR [wiClosed]
GO
/****** Object:  Default [WORKITEMCL_DF3]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[WORKITEMCL] ADD  CONSTRAINT [WORKITEMCL_DF3]  DEFAULT (newid()) FOR [guidWorkitem]
GO
/****** Object:  Default [WISTATELOG_DF1]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[WISTATELOG] ADD  CONSTRAINT [WISTATELOG_DF1]  DEFAULT (getdate()) FOR [wislEntryDate]
GO
/****** Object:  Default [WFCASECL_DF1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[WFCASECL] ADD  CONSTRAINT [WFCASECL_DF1]  DEFAULT (getdate()) FOR [casCreationDate]
GO
/****** Object:  Default [WFCASECL_DF2]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[WFCASECL] ADD  CONSTRAINT [WFCASECL_DF2]  DEFAULT ((1)) FOR [CaseClosed]
GO
/****** Object:  Default [WFCASECL_DF3]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[WFCASECL] ADD  CONSTRAINT [WFCASECL_DF3]  DEFAULT ((0)) FOR [amount]
GO
/****** Object:  Default [WFCASECL_DF4]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[WFCASECL] ADD  CONSTRAINT [WFCASECL_DF4]  DEFAULT ((0)) FOR [caseArchived]
GO
/****** Object:  Default [DF__Uchastnik__final__7E0DA1C4]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[Uchastniki] ADD  DEFAULT ((10003)) FOR [finalEnt]
GO
/****** Object:  Default [TRANSITIONLOG_DF1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[TRANSITIONLOG] ADD  CONSTRAINT [TRANSITIONLOG_DF1]  DEFAULT (getdate()) FOR [tlEntryDate]
GO
/****** Object:  Default [STARTPAGE_DFG]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[USERSTARTPAGE] ADD  CONSTRAINT [STARTPAGE_DFG]  DEFAULT (newid()) FOR [guidUserStartPage]
GO
/****** Object:  Default [USERFIELD_DFG]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[USERFIELD] ADD  CONSTRAINT [USERFIELD_DFG]  DEFAULT (newid()) FOR [guidUserField]
GO
/****** Object:  Default [USERFIELD_DFY]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[USERFIELD] ADD  CONSTRAINT [USERFIELD_DFY]  DEFAULT ((0)) FOR [dplyUserField]
GO
/****** Object:  Default [FACT_DFG]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[FACT] ADD  CONSTRAINT [FACT_DFG]  DEFAULT (newid()) FOR [guidFact]
GO
/****** Object:  Default [FACT_DFY]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[FACT] ADD  CONSTRAINT [FACT_DFY]  DEFAULT ((0)) FOR [dplyFact]
GO
/****** Object:  Default [FACT_DF1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[FACT] ADD  CONSTRAINT [FACT_DF1]  DEFAULT ((0)) FOR [factLogged]
GO
/****** Object:  Default [FACT_DF2]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[FACT] ADD  CONSTRAINT [FACT_DF2]  DEFAULT ((0)) FOR [bidirectional]
GO
/****** Object:  Default [DF__FACT__isVisible__274FAE79]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[FACT] ADD  CONSTRAINT [DF__FACT__isVisible__274FAE79]  DEFAULT ((0)) FOR [isVisible]
GO
/****** Object:  Default [DF__FACT__automapped__43EBED27]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[FACT] ADD  CONSTRAINT [DF__FACT__automapped__43EBED27]  DEFAULT ((1)) FOR [automapped]
GO
/****** Object:  Default [ENTITYSCHEMA_DFG]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ENTITYSCHEMA] ADD  CONSTRAINT [ENTITYSCHEMA_DFG]  DEFAULT (newid()) FOR [guidEntitySchema]
GO
/****** Object:  Default [ENTITYSCHEMA_DFY]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ENTITYSCHEMA] ADD  CONSTRAINT [ENTITYSCHEMA_DFY]  DEFAULT ((0)) FOR [dplyEntitySchema]
GO
/****** Object:  Default [ENTITYEX_DFG]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ENTITYEX] ADD  CONSTRAINT [ENTITYEX_DFG]  DEFAULT (newid()) FOR [guidEntityEx]
GO
/****** Object:  Default [ENTITYEX_DFY]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ENTITYEX] ADD  CONSTRAINT [ENTITYEX_DFY]  DEFAULT ((0)) FOR [dplyEntityEx]
GO
/****** Object:  Default [BIZLETTER_DFG]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BIZLETTER] ADD  CONSTRAINT [BIZLETTER_DFG]  DEFAULT (newid()) FOR [guidBizLetter]
GO
/****** Object:  Default [BIZLETTER_DFY]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BIZLETTER] ADD  CONSTRAINT [BIZLETTER_DFY]  DEFAULT ((0)) FOR [dplyBizLetter]
GO
/****** Object:  Default [BASCOPEITEMDEF_DFG]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BASCOPEITEMDEF] ADD  CONSTRAINT [BASCOPEITEMDEF_DFG]  DEFAULT (newid()) FOR [guidScopeItemDef]
GO
/****** Object:  Default [BASCOPEITEMDEF_DFY]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BASCOPEITEMDEF] ADD  CONSTRAINT [BASCOPEITEMDEF_DFY]  DEFAULT ((0)) FOR [dplyScopeItemDef]
GO
/****** Object:  Default [DF__BADATATRI__runni__3B2BBE9D]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BADATATRIGGERJOBRUNNING] ADD  DEFAULT ((0)) FOR [runningState]
GO
/****** Object:  Default [BADATATRIGGERJOBRUNNING_DF3]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BADATATRIGGERJOBRUNNING] ADD  CONSTRAINT [BADATATRIGGERJOBRUNNING_DF3]  DEFAULT (getdate()) FOR [startRunTime]
GO
/****** Object:  Default [BADATATRIGGERJOBRUNNING_DF4]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BADATATRIGGERJOBRUNNING] ADD  CONSTRAINT [BADATATRIGGERJOBRUNNING_DF4]  DEFAULT (getdate()) FOR [endRunTime]
GO
/****** Object:  Default [BACOLLABDIAGRAM_DFG]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BACOLLABDIAGRAM] ADD  CONSTRAINT [BACOLLABDIAGRAM_DFG]  DEFAULT (newid()) FOR [guidCollabDiagram]
GO
/****** Object:  Default [BACOLLABDIAGRAM_DFY]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BACOLLABDIAGRAM] ADD  CONSTRAINT [BACOLLABDIAGRAM_DFY]  DEFAULT ((0)) FOR [dplyCollabDiagram]
GO
/****** Object:  Default [BAENVIRONMENT_DFG]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BAENVIRONMENT] ADD  CONSTRAINT [BAENVIRONMENT_DFG]  DEFAULT (newid()) FOR [guidBAEnvironment]
GO
/****** Object:  Default [BAENVIRONMENT_DFY]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BAENVIRONMENT] ADD  CONSTRAINT [BAENVIRONMENT_DFY]  DEFAULT ((0)) FOR [dplyBAEnvironment]
GO
/****** Object:  Default [BAENVPARAMENTITYEXFLAGS_DFG]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BAENVPARAMENTITYEXFLAGS] ADD  CONSTRAINT [BAENVPARAMENTITYEXFLAGS_DFG]  DEFAULT (newid()) FOR [guidEnvParamEntityExFlags]
GO
/****** Object:  Default [BAENVPARAMENTITYEXFLAGS_DFY]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BAENVPARAMENTITYEXFLAGS] ADD  CONSTRAINT [BAENVPARAMENTITYEXFLAGS_DFY]  DEFAULT ((0)) FOR [dplyEnvParamEntityExFlags]
GO
/****** Object:  Default [AUTHLOG_DF1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[AUTHLOG] ADD  CONSTRAINT [AUTHLOG_DF1]  DEFAULT (getdate()) FOR [alEntryDate]
GO
/****** Object:  Default [ATTRIB_DFG]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ATTRIB] ADD  CONSTRAINT [ATTRIB_DFG]  DEFAULT (newid()) FOR [guidAttrib]
GO
/****** Object:  Default [ATTRIB_DF1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ATTRIB] ADD  CONSTRAINT [ATTRIB_DF1]  DEFAULT ((0)) FOR [attribExclExtSrc]
GO
/****** Object:  Default [ATTRIB_DF2]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ATTRIB] ADD  CONSTRAINT [ATTRIB_DF2]  DEFAULT ((0)) FOR [attribAutoExtSrc]
GO
/****** Object:  Default [ATTRIB_DFY]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ATTRIB] ADD  CONSTRAINT [ATTRIB_DFY]  DEFAULT ((0)) FOR [dplyAttrib]
GO
/****** Object:  Default [ATTRIB_DF3]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ATTRIB] ADD  CONSTRAINT [ATTRIB_DF3]  DEFAULT ((0)) FOR [attribAttributeType]
GO
/****** Object:  Default [ATTRIB_DF4]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ATTRIB] ADD  CONSTRAINT [ATTRIB_DF4]  DEFAULT ((0)) FOR [attribSize]
GO
/****** Object:  Default [DF__ATTRIB__automapp__42F7C8EE]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ATTRIB] ADD  CONSTRAINT [DF__ATTRIB__automapp__42F7C8EE]  DEFAULT ((1)) FOR [automapped]
GO
/****** Object:  Default [ORG_DFG]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ORG] ADD  CONSTRAINT [ORG_DFG]  DEFAULT (newid()) FOR [guidOrganization]
GO
/****** Object:  Default [ORG_DFY]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ORG] ADD  CONSTRAINT [ORG_DFY]  DEFAULT ((0)) FOR [dplyOrganization]
GO
/****** Object:  Default [ORGDEF]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ORG] ADD  CONSTRAINT [ORGDEF]  DEFAULT ((9)) FOR [finalEnt]
GO
/****** Object:  Default [LGMDDATA_DFG]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[LGMDDATA] ADD  CONSTRAINT [LGMDDATA_DFG]  DEFAULT (newid()) FOR [guidLgMdData]
GO
/****** Object:  Default [LGMDDATA_DFY]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[LGMDDATA] ADD  CONSTRAINT [LGMDDATA_DFY]  DEFAULT ((0)) FOR [dplyLgMdData]
GO
/****** Object:  Default [FORMCLASS_DFG]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[FORMCLASS] ADD  CONSTRAINT [FORMCLASS_DFG]  DEFAULT (newid()) FOR [guidFormClass]
GO
/****** Object:  Default [FORMCLASS_DF1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[FORMCLASS] ADD  CONSTRAINT [FORMCLASS_DF1]  DEFAULT ((0)) FOR [isScopeForm]
GO
/****** Object:  Default [FORMCLASS_DFY]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[FORMCLASS] ADD  CONSTRAINT [FORMCLASS_DFY]  DEFAULT ((0)) FOR [dplyFormClass]
GO
/****** Object:  Default [FORM_DFG]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[FORM] ADD  CONSTRAINT [FORM_DFG]  DEFAULT (newid()) FOR [guidForm]
GO
/****** Object:  Default [FORM_DF1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[FORM] ADD  CONSTRAINT [FORM_DF1]  DEFAULT ((0)) FOR [IsWizard]
GO
/****** Object:  Default [FORM_DFY]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[FORM] ADD  CONSTRAINT [FORM_DFY]  DEFAULT ((0)) FOR [dplyForm]
GO
/****** Object:  Default [FORM_DF2]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[FORM] ADD  CONSTRAINT [FORM_DF2]  DEFAULT ((0)) FOR [IsAdministrable]
GO
/****** Object:  Default [FORM_DF3]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[FORM] ADD  CONSTRAINT [FORM_DF3]  DEFAULT ((1)) FOR [IsReusable]
GO
/****** Object:  Default [FORM_DF4]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[FORM] ADD  CONSTRAINT [FORM_DF4]  DEFAULT ((0)) FOR [qfSearchAllUsers]
GO
/****** Object:  Default [FORM_DF5]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[FORM] ADD  CONSTRAINT [FORM_DF5]  DEFAULT ((0)) FOR [isQueryForm]
GO
/****** Object:  Default [ENTITYSCHEMAXSL_DFG]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ENTITYSCHEMAXSL] ADD  CONSTRAINT [ENTITYSCHEMAXSL_DFG]  DEFAULT (newid()) FOR [guidEntitySchemaXsl]
GO
/****** Object:  Default [ENTITYSCHEMAXSL_DFY]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ENTITYSCHEMAXSL] ADD  CONSTRAINT [ENTITYSCHEMAXSL_DFY]  DEFAULT ((0)) FOR [dplyEntitySchemaXsl]
GO
/****** Object:  Default [RENDERTYPE_DFG]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[RENDERTYPE] ADD  CONSTRAINT [RENDERTYPE_DFG]  DEFAULT (newid()) FOR [guidRenderType]
GO
/****** Object:  Default [RENDERTYPE_DFY]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[RENDERTYPE] ADD  CONSTRAINT [RENDERTYPE_DFY]  DEFAULT ((0)) FOR [dplyRenderType]
GO
/****** Object:  Default [ORGPOSITION_DFG]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ORGPOSITION] ADD  CONSTRAINT [ORGPOSITION_DFG]  DEFAULT (newid()) FOR [guidPosition]
GO
/****** Object:  Default [ORGPOSITION_DFY]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ORGPOSITION] ADD  CONSTRAINT [ORGPOSITION_DFY]  DEFAULT ((0)) FOR [dplyPosition]
GO
/****** Object:  Default [ORGPOSITIONDEF]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ORGPOSITION] ADD  CONSTRAINT [ORGPOSITIONDEF]  DEFAULT ((6)) FOR [finalEnt]
GO
/****** Object:  Default [LOCATION_DFG]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[LOCATION] ADD  CONSTRAINT [LOCATION_DFG]  DEFAULT (newid()) FOR [guidLocation]
GO
/****** Object:  Default [LOCATION_DFY]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[LOCATION] ADD  CONSTRAINT [LOCATION_DFY]  DEFAULT ((0)) FOR [dplyLocation]
GO
/****** Object:  Default [LOCATIONDEF]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[LOCATION] ADD  CONSTRAINT [LOCATIONDEF]  DEFAULT ((2)) FOR [finalEnt]
GO
/****** Object:  Default [LGENTITYMETADATA_DFG]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[LGENTITYMETADATA] ADD  CONSTRAINT [LGENTITYMETADATA_DFG]  DEFAULT (newid()) FOR [guidLgEntityMetadata]
GO
/****** Object:  Default [LGENTITYMETADATA_DFY]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[LGENTITYMETADATA] ADD  CONSTRAINT [LGENTITYMETADATA_DFY]  DEFAULT ((0)) FOR [dplyLgEntityMetadata]
GO
/****** Object:  Default [APPLICATION_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[APPLICATION] ADD  CONSTRAINT [APPLICATION_DF1]  DEFAULT (getdate()) FOR [appCreationDate]
GO
/****** Object:  Default [APPLICATION_DF2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[APPLICATION] ADD  CONSTRAINT [APPLICATION_DF2]  DEFAULT ((1)) FOR [idOrg]
GO
/****** Object:  Default [APPLICATION_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[APPLICATION] ADD  CONSTRAINT [APPLICATION_DFG]  DEFAULT (newid()) FOR [guidApplication]
GO
/****** Object:  Default [APPLICATION_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[APPLICATION] ADD  CONSTRAINT [APPLICATION_DFY]  DEFAULT ((0)) FOR [dplyApplication]
GO
/****** Object:  Default [BAMULTIINSTANCEPROPERTY_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAMULTIINSTANCEPROPERTY] ADD  CONSTRAINT [BAMULTIINSTANCEPROPERTY_DFG]  DEFAULT (newid()) FOR [guidMultiInstanceProperty]
GO
/****** Object:  Default [BAMULTIINSTANCEPROPERTY_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAMULTIINSTANCEPROPERTY] ADD  CONSTRAINT [BAMULTIINSTANCEPROPERTY_DFY]  DEFAULT ((0)) FOR [dplyMultiInstanceProperty]
GO
/****** Object:  Default [BAENVPARAMVALUEENTITYEX_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAENVPARAMVALUEENTITYEX] ADD  CONSTRAINT [BAENVPARAMVALUEENTITYEX_DFG]  DEFAULT (newid()) FOR [guidBAEnvParamValueEntityEx]
GO
/****** Object:  Default [BAENVPARAMVALUEENTITYEX_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAENVPARAMVALUEENTITYEX] ADD  CONSTRAINT [BAENVPARAMVALUEENTITYEX_DFY]  DEFAULT ((0)) FOR [dplyBAEnvParamValueEntityEx]
GO
/****** Object:  Default [ENTITYBIZKEY_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ENTITYBIZKEY] ADD  CONSTRAINT [ENTITYBIZKEY_DFG]  DEFAULT (newid()) FOR [guidEntityBizKey]
GO
/****** Object:  Default [ENTITYBIZKEY_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ENTITYBIZKEY] ADD  CONSTRAINT [ENTITYBIZKEY_DFY]  DEFAULT ((0)) FOR [dplyEntityBizKey]
GO
/****** Object:  Default [ENTITYKEY_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ENTITYKEY] ADD  CONSTRAINT [ENTITYKEY_DFG]  DEFAULT (newid()) FOR [guidEntityKey]
GO
/****** Object:  Default [ENTITYKEY_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ENTITYKEY] ADD  CONSTRAINT [ENTITYKEY_DFY]  DEFAULT ((0)) FOR [dplyEntityKey]
GO
/****** Object:  Default [USERFIELDPARAMETERS_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[USERFIELDPARAMETERS] ADD  CONSTRAINT [USERFIELDPARAMETERS_DFG]  DEFAULT (newid()) FOR [guidUserFieldParameters]
GO
/****** Object:  Default [USERFIELDPARAMETERS_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[USERFIELDPARAMETERS] ADD  CONSTRAINT [USERFIELDPARAMETERS_DFY]  DEFAULT ((0)) FOR [dplyUserFieldParameters]
GO
/****** Object:  Default [USERFIELDATTRIBUTETYPE_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[USERFIELDATTRIBUTETYPE] ADD  CONSTRAINT [USERFIELDATTRIBUTETYPE_DFG]  DEFAULT (newid()) FOR [guidUserFieldAttributeType]
GO
/****** Object:  Default [USERFIELDATTRIBUTETYPE_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[USERFIELDATTRIBUTETYPE] ADD  CONSTRAINT [USERFIELDATTRIBUTETYPE_DFY]  DEFAULT ((0)) FOR [dplyUserFieldAttributeType]
GO
/****** Object:  Default [WFUSER_DF3]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFUSER] ADD  CONSTRAINT [WFUSER_DF3]  DEFAULT ((1)) FOR [enabled]
GO
/****** Object:  Default [WFUSER_DF6]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFUSER] ADD  CONSTRAINT [WFUSER_DF6]  DEFAULT ((1)) FOR [enabledForAssignation]
GO
/****** Object:  Default [WFUSER_DF5]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFUSER] ADD  CONSTRAINT [WFUSER_DF5]  DEFAULT ((1)) FOR [notifByEmail]
GO
/****** Object:  Default [WFUSER_DF7]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFUSER] ADD  CONSTRAINT [WFUSER_DF7]  DEFAULT ((0)) FOR [createdCasesSkipAssigRules]
GO
/****** Object:  Default [WFUSER_DF8]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFUSER] ADD  CONSTRAINT [WFUSER_DF8]  DEFAULT ((1)) FOR [offlineForms]
GO
/****** Object:  Default [WFUSER_DF9]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFUSER] ADD  CONSTRAINT [WFUSER_DF9]  DEFAULT (newid()) FOR [guidUser]
GO
/****** Object:  Default [WFUSERDEF]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFUSER] ADD  CONSTRAINT [WFUSERDEF]  DEFAULT ((1)) FOR [finalEnt]
GO
/****** Object:  Default [WFUSER_STARTPAGE_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFUSER] ADD  CONSTRAINT [WFUSER_STARTPAGE_DFG]  DEFAULT ((1)) FOR [userStartPage]
GO
/****** Object:  Default [CATEGORY_DF2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[CATEGORY] ADD  CONSTRAINT [CATEGORY_DF2]  DEFAULT ((1)) FOR [catDisplayOrder]
GO
/****** Object:  Default [CATEGORY_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[CATEGORY] ADD  CONSTRAINT [CATEGORY_DF1]  DEFAULT (getdate()) FOR [catCreationDate]
GO
/****** Object:  Default [CATEGORY_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[CATEGORY] ADD  CONSTRAINT [CATEGORY_DFG]  DEFAULT (newid()) FOR [guidCategory]
GO
/****** Object:  Default [CATEGORY_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[CATEGORY] ADD  CONSTRAINT [CATEGORY_DFY]  DEFAULT ((0)) FOR [dplyCategory]
GO
/****** Object:  Default [ASYNCECMJOB_DF3]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ASYNCECMJOB] ADD  CONSTRAINT [ASYNCECMJOB_DF3]  DEFAULT ((1)) FOR [pending]
GO
/****** Object:  Default [ASYNCECMJOB_DF2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ASYNCECMJOB] ADD  CONSTRAINT [ASYNCECMJOB_DF2]  DEFAULT ((0)) FOR [currentRetries]
GO
/****** Object:  Default [ASYNCECMJOB_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ASYNCECMJOB] ADD  CONSTRAINT [ASYNCECMJOB_DF1]  DEFAULT (getdate()) FOR [creationDate]
GO
/****** Object:  Default [BAMULTIINSTANCEGROUP_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAMULTIINSTANCEGROUP] ADD  CONSTRAINT [BAMULTIINSTANCEGROUP_DFG]  DEFAULT (newid()) FOR [guidMultiInstanceGroup]
GO
/****** Object:  Default [BAMULTIINSTANCEGROUP_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAMULTIINSTANCEGROUP] ADD  CONSTRAINT [BAMULTIINSTANCEGROUP_DFY]  DEFAULT ((0)) FOR [dplyMultiInstanceGroup]
GO
/****** Object:  Default [LGENTITYDATA_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[LGENTITYDATA] ADD  CONSTRAINT [LGENTITYDATA_DFG]  DEFAULT (newid()) FOR [guidLgEntityData]
GO
/****** Object:  Default [LGENTITYDATA_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[LGENTITYDATA] ADD  CONSTRAINT [LGENTITYDATA_DFY]  DEFAULT ((0)) FOR [dplyLgEntityData]
GO
/****** Object:  Default [QUERYFORM_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[QUERYFORM] ADD  CONSTRAINT [QUERYFORM_DF1]  DEFAULT ((0)) FOR [qfAllAppsSearch]
GO
/****** Object:  Default [QUERYFORM_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[QUERYFORM] ADD  CONSTRAINT [QUERYFORM_DFG]  DEFAULT (newid()) FOR [guidQueryForm]
GO
/****** Object:  Default [QUERYFORM_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[QUERYFORM] ADD  CONSTRAINT [QUERYFORM_DFY]  DEFAULT ((0)) FOR [dplyQueryForm]
GO
/****** Object:  Default [RENDER_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDER] ADD  CONSTRAINT [RENDER_DF1]  DEFAULT ((1)) FOR [rdrDisplayOrder]
GO
/****** Object:  Default [RENDER_DF4]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDER] ADD  CONSTRAINT [RENDER_DF4]  DEFAULT ((1)) FOR [rdrTypeDisplayField]
GO
/****** Object:  Default [RENDER_DF3]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDER] ADD  CONSTRAINT [RENDER_DF3]  DEFAULT ((1)) FOR [rdrLineBreak]
GO
/****** Object:  Default [RENDER_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDER] ADD  CONSTRAINT [RENDER_DFG]  DEFAULT (newid()) FOR [guidRender]
GO
/****** Object:  Default [RENDER_DF2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDER] ADD  CONSTRAINT [RENDER_DF2]  DEFAULT ((1)) FOR [rdrLabelAlign]
GO
/****** Object:  Default [RENDER_DF5]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDER] ADD  CONSTRAINT [RENDER_DF5]  DEFAULT ((1)) FOR [rdrValueAlign]
GO
/****** Object:  Default [RENDER_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDER] ADD  CONSTRAINT [RENDER_DFY]  DEFAULT ((0)) FOR [dplyRender]
GO
/****** Object:  Default [JOB_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[JOB] ADD  CONSTRAINT [JOB_DF1]  DEFAULT ((0)) FOR [DELETED]
GO
/****** Object:  Default [RENDERACTION_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDERACTION] ADD  CONSTRAINT [RENDERACTION_DFG]  DEFAULT (newid()) FOR [guidRenderAction]
GO
/****** Object:  Default [RENDERACTION_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDERACTION] ADD  CONSTRAINT [RENDERACTION_DF1]  DEFAULT ((1)) FOR [rdrActResetAppearance]
GO
/****** Object:  Default [RENDERACTION_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDERACTION] ADD  CONSTRAINT [RENDERACTION_DFY]  DEFAULT ((0)) FOR [dplyRenderAction]
GO
/****** Object:  Default [RENDEREX_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDEREX] ADD  CONSTRAINT [RENDEREX_DFG]  DEFAULT (newid()) FOR [guidRenderex]
GO
/****** Object:  Default [RENDEREX_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDEREX] ADD  CONSTRAINT [RENDEREX_DFY]  DEFAULT ((0)) FOR [dplyRenderex]
GO
/****** Object:  Default [RENDERBEHAVIOUR_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDERBEHAVIOUR] ADD  CONSTRAINT [RENDERBEHAVIOUR_DFG]  DEFAULT (newid()) FOR [guidRenderBehaviour]
GO
/****** Object:  Default [RENDERBEHAVIOUR_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDERBEHAVIOUR] ADD  CONSTRAINT [RENDERBEHAVIOUR_DF1]  DEFAULT ((1)) FOR [rdrBvrResetAppearance]
GO
/****** Object:  Default [RENDERBEHAVIOUR_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDERBEHAVIOUR] ADD  CONSTRAINT [RENDERBEHAVIOUR_DFY]  DEFAULT ((0)) FOR [dplyRenderBehaviour]
GO
/****** Object:  Default [RENDERVALIDATION_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDERVALIDATION] ADD  CONSTRAINT [RENDERVALIDATION_DFG]  DEFAULT (newid()) FOR [guidRenderValidation]
GO
/****** Object:  Default [RENDERVALIDATION_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDERVALIDATION] ADD  CONSTRAINT [RENDERVALIDATION_DF1]  DEFAULT ((0)) FOR [rdrIsServerValidation]
GO
/****** Object:  Default [RENDERVALIDATION_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDERVALIDATION] ADD  CONSTRAINT [RENDERVALIDATION_DFY]  DEFAULT ((0)) FOR [dplyRenderValidation]
GO
/****** Object:  Default [BAECMMETADATA_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAECMMETADATA] ADD  CONSTRAINT [BAECMMETADATA_DFG]  DEFAULT (newid()) FOR [guidBAECMMetadata]
GO
/****** Object:  Default [BAECMMETADATA_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAECMMETADATA] ADD  CONSTRAINT [BAECMMETADATA_DFY]  DEFAULT ((0)) FOR [dplyBAECMMetadata]
GO
/****** Object:  Default [BAUSERACCESSLOG_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAUSERACCESSLOG] ADD  CONSTRAINT [BAUSERACCESSLOG_DF1]  DEFAULT (getdate()) FOR [ualEntryDate]
GO
/****** Object:  Default [BAUSERSTATISTICS_CASE_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAUSERSTATISTICS_CASE] ADD  CONSTRAINT [BAUSERSTATISTICS_CASE_DF1]  DEFAULT (getdate()) FOR [lastDate]
GO
/****** Object:  Default [ENTITYLOG_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ENTITYLOG] ADD  CONSTRAINT [ENTITYLOG_DF1]  DEFAULT (getdate()) FOR [elEntryDate]
GO
/****** Object:  Default [USERPENDINGREQUEST_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[USERPENDINGREQUEST] ADD  CONSTRAINT [USERPENDINGREQUEST_DF1]  DEFAULT ((0)) FOR [requestAttended]
GO
/****** Object:  Default [WFCLASS_DF3]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCLASS] ADD  CONSTRAINT [WFCLASS_DF3]  DEFAULT (getdate()) FOR [wfClsCreationDate]
GO
/****** Object:  Default [WFCLASS_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCLASS] ADD  CONSTRAINT [WFCLASS_DFG]  DEFAULT (newid()) FOR [guidWFClass]
GO
/****** Object:  Default [WFCLASS_DF2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCLASS] ADD  CONSTRAINT [WFCLASS_DF2]  DEFAULT ((1)) FOR [idwfAccessType]
GO
/****** Object:  Default [WFCLASS_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCLASS] ADD  CONSTRAINT [WFCLASS_DF1]  DEFAULT ((1)) FOR [display]
GO
/****** Object:  Default [WFCLASS_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCLASS] ADD  CONSTRAINT [WFCLASS_DFY]  DEFAULT ((0)) FOR [dplyWFClass]
GO
/****** Object:  Default [WORKFLOW_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WORKFLOW] ADD  CONSTRAINT [WORKFLOW_DF1]  DEFAULT ((1)) FOR [wfActive]
GO
/****** Object:  Default [WORKFLOW_DF2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WORKFLOW] ADD  CONSTRAINT [WORKFLOW_DF2]  DEFAULT (getdate()) FOR [wfCreationDate]
GO
/****** Object:  Default [WORKFLOW_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WORKFLOW] ADD  CONSTRAINT [WORKFLOW_DFG]  DEFAULT (newid()) FOR [guidWorkflow]
GO
/****** Object:  Default [WORKFLOW_DF3]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WORKFLOW] ADD  CONSTRAINT [WORKFLOW_DF3]  DEFAULT ((0)) FOR [wfExtEstimatedDuration]
GO
/****** Object:  Default [WORKFLOW_DF4]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WORKFLOW] ADD  CONSTRAINT [WORKFLOW_DF4]  DEFAULT ((0)) FOR [wfSupportsScopes]
GO
/****** Object:  Default [WORKFLOW_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WORKFLOW] ADD  CONSTRAINT [WORKFLOW_DFY]  DEFAULT ((0)) FOR [dplyWorkflow]
GO
/****** Object:  Default [WORKFLOW_DF5]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WORKFLOW] ADD  CONSTRAINT [WORKFLOW_DF5]  DEFAULT ((1)) FOR [wfCaseAccessType]
GO
/****** Object:  Default [WORKFLOW_DF6]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WORKFLOW] ADD  CONSTRAINT [WORKFLOW_DF6]  DEFAULT ((2)) FOR [wfRenderVersion]
GO
/****** Object:  Default [WORKFLOW_DF7]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WORKFLOW] ADD  CONSTRAINT [WORKFLOW_DF7]  DEFAULT ((1)) FOR [wfMobileAccess]
GO
/****** Object:  Default [WFCONFIG_DF4]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCONFIG] ADD  CONSTRAINT [WFCONFIG_DF4]  DEFAULT ((1)) FOR [enableTaskLogging]
GO
/****** Object:  Default [WFCONFIG_DF3]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCONFIG] ADD  CONSTRAINT [WFCONFIG_DF3]  DEFAULT ((1)) FOR [enablePropertyLogging]
GO
/****** Object:  Default [WFCONFIG_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCONFIG] ADD  CONSTRAINT [WFCONFIG_DF1]  DEFAULT ((1)) FOR [enableAlarms]
GO
/****** Object:  Default [WFCONFIG_DF2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCONFIG] ADD  CONSTRAINT [WFCONFIG_DF2]  DEFAULT ((1)) FOR [enableNotifications]
GO
/****** Object:  Default [WFCONFIG_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCONFIG] ADD  CONSTRAINT [WFCONFIG_DFG]  DEFAULT (newid()) FOR [guidWfConfig]
GO
/****** Object:  Default [WFCONFIG_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCONFIG] ADD  CONSTRAINT [WFCONFIG_DFY]  DEFAULT ((0)) FOR [dplyWfConfig]
GO
/****** Object:  Default [STOREDQUERYVALUE_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[STOREDQUERYVALUE] ADD  CONSTRAINT [STOREDQUERYVALUE_DF1]  DEFAULT ((1)) FOR [sqvInclude]
GO
/****** Object:  Default [DWKPICONTEXT_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[DWKPICONTEXT] ADD  CONSTRAINT [DWKPICONTEXT_DF1]  DEFAULT ((0)) FOR [kctUsesCustomQualifier]
GO
/****** Object:  Default [BAWFCLASS_ENTITY_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAWFCLASS_ENTITY] ADD  CONSTRAINT [BAWFCLASS_ENTITY_DFG]  DEFAULT (newid()) FOR [guidWfClassEntity]
GO
/****** Object:  Default [BAWFCLASS_ENTITY_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAWFCLASS_ENTITY] ADD  CONSTRAINT [BAWFCLASS_ENTITY_DFY]  DEFAULT ((0)) FOR [dplyWfClassEntity]
GO
/****** Object:  Default [RENDERACTIONTARGET_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDERACTIONTARGET] ADD  CONSTRAINT [RENDERACTIONTARGET_DFG]  DEFAULT (newid()) FOR [guidRenderActionTarget]
GO
/****** Object:  Default [RENDERACTIONTARGET_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDERACTIONTARGET] ADD  CONSTRAINT [RENDERACTIONTARGET_DFY]  DEFAULT ((0)) FOR [dplyRenderActionTarget]
GO
/****** Object:  Default [JOBRUNNING_DF2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[JOBRUNNING] ADD  CONSTRAINT [JOBRUNNING_DF2]  DEFAULT ((0)) FOR [runningState]
GO
/****** Object:  Default [JOBRUNNING_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[JOBRUNNING] ADD  CONSTRAINT [JOBRUNNING_DF1]  DEFAULT (getdate()) FOR [jobStartRunTime]
GO
/****** Object:  Default [FUNCTIONALAREAPOSITION_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[FUNCTIONALAREAPOSITION] ADD  CONSTRAINT [FUNCTIONALAREAPOSITION_DFG]  DEFAULT (newid()) FOR [guidFunctionalAreaPosition]
GO
/****** Object:  Default [FUNCTIONALAREAPOSITION_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[FUNCTIONALAREAPOSITION] ADD  CONSTRAINT [FUNCTIONALAREAPOSITION_DFY]  DEFAULT ((0)) FOR [dplyFunctionalAreaPosition]
GO
/****** Object:  Default [PHASE_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[PHASE] ADD  CONSTRAINT [PHASE_DFG]  DEFAULT (newid()) FOR [guidPhase]
GO
/****** Object:  Default [PHASE_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[PHASE] ADD  CONSTRAINT [PHASE_DFY]  DEFAULT ((0)) FOR [dplyPhase]
GO
/****** Object:  Default [BAEXTATTVALUE_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAEXTATTVALUE] ADD  CONSTRAINT [BAEXTATTVALUE_DFG]  DEFAULT (newid()) FOR [guidBAExtAttValue]
GO
/****** Object:  Default [BAEXTATTVALUE_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAEXTATTVALUE] ADD  CONSTRAINT [BAEXTATTVALUE_DFY]  DEFAULT ((0)) FOR [dplyBAExtAttValue]
GO
/****** Object:  Default [BACOLLABPROCESS_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BACOLLABPROCESS] ADD  CONSTRAINT [BACOLLABPROCESS_DFG]  DEFAULT (newid()) FOR [guidCollabProcess]
GO
/****** Object:  Default [BACOLLABPROCESS_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BACOLLABPROCESS] ADD  CONSTRAINT [BACOLLABPROCESS_DFY]  DEFAULT ((0)) FOR [dplyCollabProcess]
GO
/****** Object:  Default [BAPRESACTION_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAPRESACTION] ADD  CONSTRAINT [BAPRESACTION_DFG]  DEFAULT (newid()) FOR [guidBAPresAction]
GO
/****** Object:  Default [BAPRESACTION_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAPRESACTION] ADD  CONSTRAINT [BAPRESACTION_DFY]  DEFAULT ((0)) FOR [dplyBAPresAction]
GO
/****** Object:  Default [CASEPATH_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[CASEPATH] ADD  CONSTRAINT [CASEPATH_DFG]  DEFAULT (newid()) FOR [guidCasePath]
GO
/****** Object:  Default [CASEPATH_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[CASEPATH] ADD  CONSTRAINT [CASEPATH_DFY]  DEFAULT ((0)) FOR [dplyCasePath]
GO
/****** Object:  Default [BIZLETTERBINDING_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BIZLETTERBINDING] ADD  CONSTRAINT [BIZLETTERBINDING_DFG]  DEFAULT (newid()) FOR [guidBizLetterBinding]
GO
/****** Object:  Default [BIZLETTERBINDING_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BIZLETTERBINDING] ADD  CONSTRAINT [BIZLETTERBINDING_DFY]  DEFAULT ((0)) FOR [dplyBizLetterBinding]
GO
/****** Object:  Default [TASK_DF7]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK] ADD  CONSTRAINT [TASK_DF7]  DEFAULT ((1)) FOR [tskDuration]
GO
/****** Object:  Default [TASK_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK] ADD  CONSTRAINT [TASK_DF1]  DEFAULT ((0)) FOR [allowReassign]
GO
/****** Object:  Default [TASK_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK] ADD  CONSTRAINT [TASK_DFG]  DEFAULT (newid()) FOR [guidTask]
GO
/****** Object:  Default [TASK_DF6]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK] ADD  CONSTRAINT [TASK_DF6]  DEFAULT ((0)) FOR [sendNotification]
GO
/****** Object:  Default [TASK_DF9]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK] ADD  CONSTRAINT [TASK_DF9]  DEFAULT ((2)) FOR [tskPriority]
GO
/****** Object:  Default [TASK_DF2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK] ADD  CONSTRAINT [TASK_DF2]  DEFAULT ((1)) FOR [idSubProcMappingTypeI]
GO
/****** Object:  Default [TASK_DF3]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK] ADD  CONSTRAINT [TASK_DF3]  DEFAULT ((1)) FOR [idSubProcMappingTypeO]
GO
/****** Object:  Default [TASK_DF4]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK] ADD  CONSTRAINT [TASK_DF4]  DEFAULT ((0)) FOR [isRollbackPoint]
GO
/****** Object:  Default [TASK_DF8]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK] ADD  CONSTRAINT [TASK_DF8]  DEFAULT ((0)) FOR [tskExtDuration]
GO
/****** Object:  Default [TASK_DF5]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK] ADD  CONSTRAINT [TASK_DF5]  DEFAULT ((1)) FOR [sendAlarms]
GO
/****** Object:  Default [TASK_DF10]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK] ADD  CONSTRAINT [TASK_DF10]  DEFAULT ((0)) FOR [tskCompensation]
GO
/****** Object:  Default [TASK_DF13]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK] ADD  CONSTRAINT [TASK_DF13]  DEFAULT ((0)) FOR [tskTransactional]
GO
/****** Object:  Default [TASK_DF11]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK] ADD  CONSTRAINT [TASK_DF11]  DEFAULT ((0)) FOR [tskEmbedded]
GO
/****** Object:  Default [TASK_DF12]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK] ADD  CONSTRAINT [TASK_DF12]  DEFAULT ((0)) FOR [tskScopeEnabled]
GO
/****** Object:  Default [TASK_DF15]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK] ADD  CONSTRAINT [TASK_DF15]  DEFAULT ((0)) FOR [tskSingleton]
GO
/****** Object:  Default [TASK_DF14]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK] ADD  CONSTRAINT [TASK_DF14]  DEFAULT ((0)) FOR [tskMultiple]
GO
/****** Object:  Default [TASK_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK] ADD  CONSTRAINT [TASK_DFY]  DEFAULT ((0)) FOR [dplyTask]
GO
/****** Object:  Default [TASK_DF16]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK] ADD  CONSTRAINT [TASK_DF16]  DEFAULT ((1)) FOR [tskMobileAccess]
GO
/****** Object:  Default [TASK_DF17]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK] ADD  CONSTRAINT [TASK_DF17]  DEFAULT ((0)) FOR [tskAllowReleaseActivity]
GO
/****** Object:  Default [TASK_DF18]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK] ADD  CONSTRAINT [TASK_DF18]  DEFAULT ((0)) FOR [offLineAsOnline]
GO
/****** Object:  Default [BIZLETTERCONDITION_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BIZLETTERCONDITION] ADD  CONSTRAINT [BIZLETTERCONDITION_DFG]  DEFAULT (newid()) FOR [guidBizLetterCondition]
GO
/****** Object:  Default [BIZLETTERCONDITION_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BIZLETTERCONDITION] ADD  CONSTRAINT [BIZLETTERCONDITION_DFY]  DEFAULT ((0)) FOR [dplyBizLetterCondition]
GO
/****** Object:  Default [EXCEPTIONTRANSITION_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[EXCEPTIONTRANSITION] ADD  CONSTRAINT [EXCEPTIONTRANSITION_DFG]  DEFAULT (newid()) FOR [guidExceptionTransition]
GO
/****** Object:  Default [EXCEPTIONTRANSITION_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[EXCEPTIONTRANSITION] ADD  CONSTRAINT [EXCEPTIONTRANSITION_DFY]  DEFAULT ((0)) FOR [dplyExceptionTransition]
GO
/****** Object:  Default [ALARM_DF2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ALARM] ADD  CONSTRAINT [ALARM_DF2]  DEFAULT ((0)) FOR [sendToCurrAssignee]
GO
/****** Object:  Default [ALARM_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ALARM] ADD  CONSTRAINT [ALARM_DF1]  DEFAULT ((1)) FOR [idRecurrSchType]
GO
/****** Object:  Default [ASYNCHWORKITEM_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ASYNCHWORKITEM] ADD  CONSTRAINT [ASYNCHWORKITEM_DF1]  DEFAULT ((0)) FOR [awCurrentRetries]
GO
/****** Object:  Default [ASYNCHWORKITEM_DF2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ASYNCHWORKITEM] ADD  CONSTRAINT [ASYNCHWORKITEM_DF2]  DEFAULT ((1)) FOR [awEnabled]
GO
/****** Object:  Default [ASYNCHWORKITEM_DF3]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ASYNCHWORKITEM] ADD  CONSTRAINT [ASYNCHWORKITEM_DF3]  DEFAULT (getdate()) FOR [awCreationDate]
GO
/****** Object:  Default [ASYNCHWORKITEM_DF4]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ASYNCHWORKITEM] ADD  CONSTRAINT [ASYNCHWORKITEM_DF4]  DEFAULT ((0)) FOR [awProcessing]
GO
/****** Object:  Default [ASYNCHWORKITEM_DF5]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ASYNCHWORKITEM] ADD  CONSTRAINT [ASYNCHWORKITEM_DF5]  DEFAULT ((0)) FOR [bAsynchSubProcess]
GO
/****** Object:  Default [GRCUSTOMPHASE_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[GRCUSTOMPHASE] ADD  CONSTRAINT [GRCUSTOMPHASE_DF1]  DEFAULT ((0)) FOR [cphSLA]
GO
/****** Object:  Default [SUBPROCMAPPING_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[SUBPROCMAPPING] ADD  CONSTRAINT [SUBPROCMAPPING_DFG]  DEFAULT (newid()) FOR [guidSubprocMapping]
GO
/****** Object:  Default [SUBPROCMAPPING_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[SUBPROCMAPPING] ADD  CONSTRAINT [SUBPROCMAPPING_DFY]  DEFAULT ((0)) FOR [dplySubprocMapping]
GO
/****** Object:  Default [TRANSITION_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TRANSITION] ADD  CONSTRAINT [TRANSITION_DFG]  DEFAULT (newid()) FOR [guidTransition]
GO
/****** Object:  Default [TRANSITION_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TRANSITION] ADD  CONSTRAINT [TRANSITION_DF1]  DEFAULT ((1)) FOR [idTransitionType]
GO
/****** Object:  Default [TRANSITION_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TRANSITION] ADD  CONSTRAINT [TRANSITION_DFY]  DEFAULT ((0)) FOR [dplyTransition]
GO
/****** Object:  Default [WFCASE_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCASE] ADD  CONSTRAINT [WFCASE_DF1]  DEFAULT (getdate()) FOR [casCreationDate]
GO
/****** Object:  Default [WFCASE_DF2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCASE] ADD  CONSTRAINT [WFCASE_DF2]  DEFAULT ((0)) FOR [CaseClosed]
GO
/****** Object:  Default [WFCASE_DF3]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCASE] ADD  CONSTRAINT [WFCASE_DF3]  DEFAULT ((0)) FOR [amount]
GO
/****** Object:  Default [WFCASE_DF4]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCASE] ADD  CONSTRAINT [WFCASE_DF4]  DEFAULT (newid()) FOR [CaseGUID]
GO
/****** Object:  Default [WFCASE_DF5]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCASE] ADD  CONSTRAINT [WFCASE_DF5]  DEFAULT ((0)) FOR [caseArchived]
GO
/****** Object:  Default [WORKITEM_DF3]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WORKITEM] ADD  CONSTRAINT [WORKITEM_DF3]  DEFAULT (getdate()) FOR [wiEntryDate]
GO
/****** Object:  Default [WORKITEM_DF2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WORKITEM] ADD  CONSTRAINT [WORKITEM_DF2]  DEFAULT ((1)) FOR [wiDuration]
GO
/****** Object:  Default [WORKITEM_DF4]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WORKITEM] ADD  CONSTRAINT [WORKITEM_DF4]  DEFAULT ((0)) FOR [wiExtDuration]
GO
/****** Object:  Default [WORKITEM_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WORKITEM] ADD  CONSTRAINT [WORKITEM_DF1]  DEFAULT ((0)) FOR [wiClosed]
GO
/****** Object:  Default [WORKITEM_DF5]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WORKITEM] ADD  CONSTRAINT [WORKITEM_DF5]  DEFAULT (newid()) FOR [guidWorkitem]
GO
/****** Object:  Default [TRANSITIONDIAGRAM_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TRANSITIONDIAGRAM] ADD  CONSTRAINT [TRANSITIONDIAGRAM_DFG]  DEFAULT (newid()) FOR [guidTransitionDiagram]
GO
/****** Object:  Default [TRANSITIONDIAGRAM_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TRANSITIONDIAGRAM] ADD  CONSTRAINT [TRANSITIONDIAGRAM_DFY]  DEFAULT ((0)) FOR [dplyTransitionDiagram]
GO
/****** Object:  Default [TRANSITIONCONDITION_DFG]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TRANSITIONCONDITION] ADD  CONSTRAINT [TRANSITIONCONDITION_DFG]  DEFAULT (newid()) FOR [guidTransitionCondition]
GO
/****** Object:  Default [TRANSITIONCONDITION_DFY]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TRANSITIONCONDITION] ADD  CONSTRAINT [TRANSITIONCONDITION_DFY]  DEFAULT ((0)) FOR [dplyTransitionCondition]
GO
/****** Object:  Default [ASYNCHWORKITEMRUNNING_DF2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ASYNCHWORKITEMRUNNING] ADD  CONSTRAINT [ASYNCHWORKITEMRUNNING_DF2]  DEFAULT ((0)) FOR [runningState]
GO
/****** Object:  Default [ASYNCHWORKITEMRUNNING_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ASYNCHWORKITEMRUNNING] ADD  CONSTRAINT [ASYNCHWORKITEMRUNNING_DF1]  DEFAULT (getdate()) FOR [awStartRunTime]
GO
/****** Object:  Default [ASYNCHWIRETRY_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ASYNCHWIRETRY] ADD  CONSTRAINT [ASYNCHWIRETRY_DF1]  DEFAULT (getdate()) FOR [awrRetryDate]
GO
/****** Object:  Default [ALARMRECIPIENT_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ALARMRECIPIENT] ADD  CONSTRAINT [ALARMRECIPIENT_DF1]  DEFAULT ((1)) FOR [include]
GO
/****** Object:  Default [CURRENTASSIGNEE_DF1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[CURRENTASSIGNEE] ADD  CONSTRAINT [CURRENTASSIGNEE_DF1]  DEFAULT ((0)) FOR [Deleted]
GO
/****** Object:  Check [BAUNICODEEXCEPTION_CK1]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BAUNICODEEXCEPTION]  WITH NOCHECK ADD  CONSTRAINT [BAUNICODEEXCEPTION_CK1] CHECK  ((([fixedDataType]='NVARCHAR' OR [fixedDataType]='VARCHAR') AND CONVERT([varbinary](1000),[fixedDataType],(0))=CONVERT([varbinary](1000),upper([fixedDataType]),(0))))
GO
ALTER TABLE [dbo].[BAUNICODEEXCEPTION] CHECK CONSTRAINT [BAUNICODEEXCEPTION_CK1]
GO
/****** Object:  Check [ENTITY_CK1]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[ENTITY]  WITH CHECK ADD  CONSTRAINT [ENTITY_CK1] CHECK  ((([entContentType]=(2) OR [entContentType]=(1)) AND (NOT [entType]=(1) AND NOT [entType]=(0) OR [entContentType]=(2))))
GO
ALTER TABLE [dbo].[ENTITY] CHECK CONSTRAINT [ENTITY_CK1]
GO
/****** Object:  Check [ENTITY_CK2]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[ENTITY]  WITH CHECK ADD  CONSTRAINT [ENTITY_CK2] CHECK  ((([entAdministrable]=(1) OR [entAdministrable]=(0)) AND (NOT [entType]=(1) AND NOT [entType]=(0) OR [entAdministrable]=(0))))
GO
ALTER TABLE [dbo].[ENTITY] CHECK CONSTRAINT [ENTITY_CK2]
GO
/****** Object:  Check [WFCASECL_CK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[WFCASECL]  WITH NOCHECK ADD  CONSTRAINT [WFCASECL_CK1] CHECK  (([hasCaseNumber] IS NOT NULL))
GO
ALTER TABLE [dbo].[WFCASECL] CHECK CONSTRAINT [WFCASECL_CK1]
GO
/****** Object:  Check [RENDERTYPE_CK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[RENDERTYPE]  WITH CHECK ADD  CONSTRAINT [RENDERTYPE_CK1] CHECK  (([rdrType]<(10000) AND [rdrTypeName] IS NOT NULL AND [idUserField] IS NULL OR [rdrType]>=(10000) AND [rdrTypeName] IS NULL AND [idUserField] IS NOT NULL))
GO
ALTER TABLE [dbo].[RENDERTYPE] CHECK CONSTRAINT [RENDERTYPE_CK1]
GO
/****** Object:  Check [JOB_CK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[JOB]  WITH NOCHECK ADD  CONSTRAINT [JOB_CK1] CHECK  (([jobType]=(4) OR ([jobType]=(3) OR [jobType]=(2))))
GO
ALTER TABLE [dbo].[JOB] CHECK CONSTRAINT [JOB_CK1]
GO
/****** Object:  Check [TASK_CK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK]  WITH CHECK ADD  CONSTRAINT [TASK_CK1] CHECK  (([idSubWorkflow] IS NULL OR [idSubWfClass] IS NULL))
GO
ALTER TABLE [dbo].[TASK] CHECK CONSTRAINT [TASK_CK1]
GO
/****** Object:  Check [WFCASE_CK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCASE]  WITH NOCHECK ADD  CONSTRAINT [WFCASE_CK1] CHECK  (([hasCaseNumber] IS NOT NULL))
GO
ALTER TABLE [dbo].[WFCASE] CHECK CONSTRAINT [WFCASE_CK1]
GO
/****** Object:  ForeignKey [FUNCTIONALAREA_FUNCTIONALA_FK1]    Script Date: 06/08/2017 15:53:09 ******/
ALTER TABLE [dbo].[FUNCTIONALAREA]  WITH CHECK ADD  CONSTRAINT [FUNCTIONALAREA_FUNCTIONALA_FK1] FOREIGN KEY([idParentFunctionalArea])
REFERENCES [dbo].[FUNCTIONALAREA] ([idFunctionalArea])
GO
ALTER TABLE [dbo].[FUNCTIONALAREA] CHECK CONSTRAINT [FUNCTIONALAREA_FUNCTIONALA_FK1]
GO
/****** Object:  ForeignKey [RENDERGROUP_RENDERGROUP_FK1]    Script Date: 06/08/2017 15:53:13 ******/
ALTER TABLE [dbo].[RENDERGROUP]  WITH CHECK ADD  CONSTRAINT [RENDERGROUP_RENDERGROUP_FK1] FOREIGN KEY([idRdrGrpParent])
REFERENCES [dbo].[RENDERGROUP] ([idRenderGroup])
GO
ALTER TABLE [dbo].[RENDERGROUP] CHECK CONSTRAINT [RENDERGROUP_RENDERGROUP_FK1]
GO
/****** Object:  ForeignKey [COLFOLDER_COLFOLDER_FK1]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[BACOLLABFOLDER]  WITH CHECK ADD  CONSTRAINT [COLFOLDER_COLFOLDER_FK1] FOREIGN KEY([idParentFolder])
REFERENCES [dbo].[BACOLLABFOLDER] ([idCollabFolder])
GO
ALTER TABLE [dbo].[BACOLLABFOLDER] CHECK CONSTRAINT [COLFOLDER_COLFOLDER_FK1]
GO
/****** Object:  ForeignKey [ENTITY_ENTITY_FK1]    Script Date: 06/08/2017 15:53:17 ******/
ALTER TABLE [dbo].[ENTITY]  WITH CHECK ADD  CONSTRAINT [ENTITY_ENTITY_FK1] FOREIGN KEY([idParentEnt])
REFERENCES [dbo].[ENTITY] ([idEnt])
GO
ALTER TABLE [dbo].[ENTITY] CHECK CONSTRAINT [ENTITY_ENTITY_FK1]
GO
/****** Object:  ForeignKey [USERFIELD_ENTITY_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[USERFIELD]  WITH CHECK ADD  CONSTRAINT [USERFIELD_ENTITY_FK1] FOREIGN KEY([idContextEnt])
REFERENCES [dbo].[ENTITY] ([idEnt])
GO
ALTER TABLE [dbo].[USERFIELD] CHECK CONSTRAINT [USERFIELD_ENTITY_FK1]
GO
/****** Object:  ForeignKey [DWUSERSEMAP_DWEVALUATIO_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[DWUSERSEMAPHORE]  WITH CHECK ADD  CONSTRAINT [DWUSERSEMAP_DWEVALUATIO_FK1] FOREIGN KEY([idEvaluationType])
REFERENCES [dbo].[DWEVALUATIONTYPE] ([idEvaluationType])
GO
ALTER TABLE [dbo].[DWUSERSEMAPHORE] CHECK CONSTRAINT [DWUSERSEMAP_DWEVALUATIO_FK1]
GO
/****** Object:  ForeignKey [FACT_ENTITY_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[FACT]  WITH CHECK ADD  CONSTRAINT [FACT_ENTITY_FK1] FOREIGN KEY([idLeftEntity])
REFERENCES [dbo].[ENTITY] ([idEnt])
GO
ALTER TABLE [dbo].[FACT] CHECK CONSTRAINT [FACT_ENTITY_FK1]
GO
/****** Object:  ForeignKey [FACT_ENTITY_FK2]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[FACT]  WITH CHECK ADD  CONSTRAINT [FACT_ENTITY_FK2] FOREIGN KEY([idRightEntity])
REFERENCES [dbo].[ENTITY] ([idEnt])
GO
ALTER TABLE [dbo].[FACT] CHECK CONSTRAINT [FACT_ENTITY_FK2]
GO
/****** Object:  ForeignKey [FACT_FACT_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[FACT]  WITH CHECK ADD  CONSTRAINT [FACT_FACT_FK1] FOREIGN KEY([idParentRelation])
REFERENCES [dbo].[FACT] ([idFact])
GO
ALTER TABLE [dbo].[FACT] CHECK CONSTRAINT [FACT_FACT_FK1]
GO
/****** Object:  ForeignKey [FACT_FACTRELATIONTYPE_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[FACT]  WITH CHECK ADD  CONSTRAINT [FACT_FACTRELATIONTYPE_FK1] FOREIGN KEY([idFactRelationType])
REFERENCES [dbo].[FACTRELATIONTYPE] ([idFactRelationType])
GO
ALTER TABLE [dbo].[FACT] CHECK CONSTRAINT [FACT_FACTRELATIONTYPE_FK1]
GO
/****** Object:  ForeignKey [ENTITYSCHEMA_ENTITY_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ENTITYSCHEMA]  WITH CHECK ADD  CONSTRAINT [ENTITYSCHEMA_ENTITY_FK1] FOREIGN KEY([idEnt])
REFERENCES [dbo].[ENTITY] ([idEnt])
GO
ALTER TABLE [dbo].[ENTITYSCHEMA] CHECK CONSTRAINT [ENTITYSCHEMA_ENTITY_FK1]
GO
/****** Object:  ForeignKey [ENTITYEX_ENTITY_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ENTITYEX]  WITH CHECK ADD  CONSTRAINT [ENTITYEX_ENTITY_FK1] FOREIGN KEY([idEnt])
REFERENCES [dbo].[ENTITY] ([idEnt])
GO
ALTER TABLE [dbo].[ENTITYEX] CHECK CONSTRAINT [ENTITYEX_ENTITY_FK1]
GO
/****** Object:  ForeignKey [BIZLETTER_ENTITY_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BIZLETTER]  WITH CHECK ADD  CONSTRAINT [BIZLETTER_ENTITY_FK1] FOREIGN KEY([idContextEnt])
REFERENCES [dbo].[ENTITY] ([idEnt])
GO
ALTER TABLE [dbo].[BIZLETTER] CHECK CONSTRAINT [BIZLETTER_ENTITY_FK1]
GO
/****** Object:  ForeignKey [BARENDERCACHE_LGLANGUAGE_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BARENDERCACHE]  WITH NOCHECK ADD  CONSTRAINT [BARENDERCACHE_LGLANGUAGE_FK1] FOREIGN KEY([idLanguage])
REFERENCES [dbo].[LGLANGUAGE] ([idLgLanguage])
GO
ALTER TABLE [dbo].[BARENDERCACHE] CHECK CONSTRAINT [BARENDERCACHE_LGLANGUAGE_FK1]
GO
/****** Object:  ForeignKey [BASCOPEITEMDEF_ENTITY_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BASCOPEITEMDEF]  WITH CHECK ADD  CONSTRAINT [BASCOPEITEMDEF_ENTITY_FK1] FOREIGN KEY([idEnt])
REFERENCES [dbo].[ENTITY] ([idEnt])
GO
ALTER TABLE [dbo].[BASCOPEITEMDEF] CHECK CONSTRAINT [BASCOPEITEMDEF_ENTITY_FK1]
GO
/****** Object:  ForeignKey [BAOFFACESS_OFFCHG_FK2]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BAOFFACCESS]  WITH CHECK ADD  CONSTRAINT [BAOFFACESS_OFFCHG_FK2] FOREIGN KEY([idBaOfflineChangeSet])
REFERENCES [dbo].[BAOFFLINECHANGESET] ([idBaOfflineChangeSet])
GO
ALTER TABLE [dbo].[BAOFFACCESS] CHECK CONSTRAINT [BAOFFACESS_OFFCHG_FK2]
GO
/****** Object:  ForeignKey [BAOA2SERTOKEN_BAOA2SERAPP_FK]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BAOAUTH2SERVERTOKEN]  WITH CHECK ADD  CONSTRAINT [BAOA2SERTOKEN_BAOA2SERAPP_FK] FOREIGN KEY([idApplication])
REFERENCES [dbo].[BAOAUTH2SERVERAPP] ([id])
GO
ALTER TABLE [dbo].[BAOAUTH2SERVERTOKEN] CHECK CONSTRAINT [BAOA2SERTOKEN_BAOA2SERAPP_FK]
GO
/****** Object:  ForeignKey [BAGAMEASURE_BAGACUBE_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BAGAMEASURE]  WITH CHECK ADD  CONSTRAINT [BAGAMEASURE_BAGACUBE_FK1] FOREIGN KEY([idCube])
REFERENCES [dbo].[BAGACUBE] ([idCube])
GO
ALTER TABLE [dbo].[BAGAMEASURE] CHECK CONSTRAINT [BAGAMEASURE_BAGACUBE_FK1]
GO
/****** Object:  ForeignKey [BADTRUNNING_BADTJOB_FK]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BADATATRIGGERJOBRUNNING]  WITH CHECK ADD  CONSTRAINT [BADTRUNNING_BADTJOB_FK] FOREIGN KEY([idJob])
REFERENCES [dbo].[BADATATRIGGERJOB] ([idJob])
GO
ALTER TABLE [dbo].[BADATATRIGGERJOBRUNNING] CHECK CONSTRAINT [BADTRUNNING_BADTJOB_FK]
GO
/****** Object:  ForeignKey [BADTRUNNING_SCHRUNNING_FK]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BADATATRIGGERJOBRUNNING]  WITH CHECK ADD  CONSTRAINT [BADTRUNNING_SCHRUNNING_FK] FOREIGN KEY([runningState])
REFERENCES [dbo].[SCHEDRUNNINGSTATE] ([idSchedRunningState])
GO
ALTER TABLE [dbo].[BADATATRIGGERJOBRUNNING] CHECK CONSTRAINT [BADTRUNNING_SCHRUNNING_FK]
GO
/****** Object:  ForeignKey [COLDIAGRAM_COLFOLDER_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BACOLLABDIAGRAM]  WITH CHECK ADD  CONSTRAINT [COLDIAGRAM_COLFOLDER_FK1] FOREIGN KEY([idContainingFolder])
REFERENCES [dbo].[BACOLLABFOLDER] ([idCollabFolder])
GO
ALTER TABLE [dbo].[BACOLLABDIAGRAM] CHECK CONSTRAINT [COLDIAGRAM_COLFOLDER_FK1]
GO
/****** Object:  ForeignKey [BADPLYPKGDTA_BADPLYPKG_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BADPLYPACKAGEDATA]  WITH CHECK ADD  CONSTRAINT [BADPLYPKGDTA_BADPLYPKG_FK1] FOREIGN KEY([idDeploymentPackage])
REFERENCES [dbo].[BADPLYPACKAGE] ([idDeploymentPackage])
GO
ALTER TABLE [dbo].[BADPLYPACKAGEDATA] CHECK CONSTRAINT [BADPLYPKGDTA_BADPLYPKG_FK1]
GO
/****** Object:  ForeignKey [BAENVIRONME_ENVIRONMENTTYP_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BAENVIRONMENT]  WITH CHECK ADD  CONSTRAINT [BAENVIRONME_ENVIRONMENTTYP_FK1] FOREIGN KEY([idEnvType])
REFERENCES [dbo].[ENVIRONMENTTYPE] ([idEnvType])
GO
ALTER TABLE [dbo].[BAENVIRONMENT] CHECK CONSTRAINT [BAENVIRONME_ENVIRONMENTTYP_FK1]
GO
/****** Object:  ForeignKey [BAGADIMENSION_BAGACUBE_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BAGADIMENSION]  WITH CHECK ADD  CONSTRAINT [BAGADIMENSION_BAGACUBE_FK1] FOREIGN KEY([idCube])
REFERENCES [dbo].[BAGACUBE] ([idCube])
GO
ALTER TABLE [dbo].[BAGADIMENSION] CHECK CONSTRAINT [BAGADIMENSION_BAGACUBE_FK1]
GO
/****** Object:  ForeignKey [BAENVPARENTFLG_BAENVPARENT_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BAENVPARAMENTITYEXFLAGS]  WITH CHECK ADD  CONSTRAINT [BAENVPARENTFLG_BAENVPARENT_FK1] FOREIGN KEY([idEnvParamEntityEx])
REFERENCES [dbo].[BAENVPARAMENTITYEX] ([idEnvParamEntityEx])
GO
ALTER TABLE [dbo].[BAENVPARAMENTITYEXFLAGS] CHECK CONSTRAINT [BAENVPARENTFLG_BAENVPARENT_FK1]
GO
/****** Object:  ForeignKey [BAENVPARENTFLG_ENTITY_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[BAENVPARAMENTITYEXFLAGS]  WITH CHECK ADD  CONSTRAINT [BAENVPARENTFLG_ENTITY_FK1] FOREIGN KEY([idEnt])
REFERENCES [dbo].[ENTITY] ([idEnt])
GO
ALTER TABLE [dbo].[BAENVPARAMENTITYEXFLAGS] CHECK CONSTRAINT [BAENVPARENTFLG_ENTITY_FK1]
GO
/****** Object:  ForeignKey [AUTHLOG_AUTHEVENTSUBTYPE_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[AUTHLOG]  WITH CHECK ADD  CONSTRAINT [AUTHLOG_AUTHEVENTSUBTYPE_FK1] FOREIGN KEY([idAuthEventSubType])
REFERENCES [dbo].[AUTHEVENTSUBTYPE] ([idAuthEventSubType])
GO
ALTER TABLE [dbo].[AUTHLOG] CHECK CONSTRAINT [AUTHLOG_AUTHEVENTSUBTYPE_FK1]
GO
/****** Object:  ForeignKey [AUTHLOG_AUTHEVENTTYPE_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[AUTHLOG]  WITH CHECK ADD  CONSTRAINT [AUTHLOG_AUTHEVENTTYPE_FK1] FOREIGN KEY([idAuthEventType])
REFERENCES [dbo].[AUTHEVENTTYPE] ([idAuthEventType])
GO
ALTER TABLE [dbo].[AUTHLOG] CHECK CONSTRAINT [AUTHLOG_AUTHEVENTTYPE_FK1]
GO
/****** Object:  ForeignKey [ATTRIB_ENTITY_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ATTRIB]  WITH CHECK ADD  CONSTRAINT [ATTRIB_ENTITY_FK1] FOREIGN KEY([idEnt])
REFERENCES [dbo].[ENTITY] ([idEnt])
GO
ALTER TABLE [dbo].[ATTRIB] CHECK CONSTRAINT [ATTRIB_ENTITY_FK1]
GO
/****** Object:  ForeignKey [ATTRIB_ENTITY_FK2]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ATTRIB]  WITH CHECK ADD  CONSTRAINT [ATTRIB_ENTITY_FK2] FOREIGN KEY([idEntRelated])
REFERENCES [dbo].[ENTITY] ([idEnt])
GO
ALTER TABLE [dbo].[ATTRIB] CHECK CONSTRAINT [ATTRIB_ENTITY_FK2]
GO
/****** Object:  ForeignKey [ORG_BATIMEZONE_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ORG]  WITH CHECK ADD  CONSTRAINT [ORG_BATIMEZONE_FK1] FOREIGN KEY([idTimeZone])
REFERENCES [dbo].[BATIMEZONE] ([idBATimeZone])
GO
ALTER TABLE [dbo].[ORG] CHECK CONSTRAINT [ORG_BATIMEZONE_FK1]
GO
/****** Object:  ForeignKey [ORG_HOLIDAYSCHEMA_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ORG]  WITH CHECK ADD  CONSTRAINT [ORG_HOLIDAYSCHEMA_FK1] FOREIGN KEY([idHolidaySchema])
REFERENCES [dbo].[HOLIDAYSCHEMA] ([idHolidaySchema])
GO
ALTER TABLE [dbo].[ORG] CHECK CONSTRAINT [ORG_HOLIDAYSCHEMA_FK1]
GO
/****** Object:  ForeignKey [ORG_WORKINGTIMESCHEMA_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ORG]  WITH CHECK ADD  CONSTRAINT [ORG_WORKINGTIMESCHEMA_FK1] FOREIGN KEY([idWorkingTimeSchema])
REFERENCES [dbo].[WORKINGTIMESCHEMA] ([idWorkingTimeSchema])
GO
ALTER TABLE [dbo].[ORG] CHECK CONSTRAINT [ORG_WORKINGTIMESCHEMA_FK1]
GO
/****** Object:  ForeignKey [LGMDDATA_LGLANGUAGE_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[LGMDDATA]  WITH NOCHECK ADD  CONSTRAINT [LGMDDATA_LGLANGUAGE_FK1] FOREIGN KEY([idLgLanguage])
REFERENCES [dbo].[LGLANGUAGE] ([idLgLanguage])
GO
ALTER TABLE [dbo].[LGMDDATA] CHECK CONSTRAINT [LGMDDATA_LGLANGUAGE_FK1]
GO
/****** Object:  ForeignKey [LGMDDATA_LGMETADATA_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[LGMDDATA]  WITH CHECK ADD  CONSTRAINT [LGMDDATA_LGMETADATA_FK1] FOREIGN KEY([idLgMetadata])
REFERENCES [dbo].[LGMETADATA] ([idLgMetadata])
GO
ALTER TABLE [dbo].[LGMDDATA] CHECK CONSTRAINT [LGMDDATA_LGMETADATA_FK1]
GO
/****** Object:  ForeignKey [FORMCLASS_ENTITY_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[FORMCLASS]  WITH CHECK ADD  CONSTRAINT [FORMCLASS_ENTITY_FK1] FOREIGN KEY([idEnt])
REFERENCES [dbo].[ENTITY] ([idEnt])
GO
ALTER TABLE [dbo].[FORMCLASS] CHECK CONSTRAINT [FORMCLASS_ENTITY_FK1]
GO
/****** Object:  ForeignKey [FORMCLASS_FORMTYPE_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[FORMCLASS]  WITH CHECK ADD  CONSTRAINT [FORMCLASS_FORMTYPE_FK1] FOREIGN KEY([frmClsType])
REFERENCES [dbo].[FORMTYPE] ([idFormType])
GO
ALTER TABLE [dbo].[FORMCLASS] CHECK CONSTRAINT [FORMCLASS_FORMTYPE_FK1]
GO
/****** Object:  ForeignKey [FORM_FORMCLASS_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[FORM]  WITH CHECK ADD  CONSTRAINT [FORM_FORMCLASS_FK1] FOREIGN KEY([idFormClass])
REFERENCES [dbo].[FORMCLASS] ([idFormClass])
GO
ALTER TABLE [dbo].[FORM] CHECK CONSTRAINT [FORM_FORMCLASS_FK1]
GO
/****** Object:  ForeignKey [FRMPARENT_FORM_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[FORM]  WITH CHECK ADD  CONSTRAINT [FRMPARENT_FORM_FK1] FOREIGN KEY([idFormParentVersion])
REFERENCES [dbo].[FORM] ([idForm])
GO
ALTER TABLE [dbo].[FORM] CHECK CONSTRAINT [FRMPARENT_FORM_FK1]
GO
/****** Object:  ForeignKey [ENTITYSCHEMAXSL_ENTITYSCHE_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ENTITYSCHEMAXSL]  WITH CHECK ADD  CONSTRAINT [ENTITYSCHEMAXSL_ENTITYSCHE_FK1] FOREIGN KEY([idEntitySchema])
REFERENCES [dbo].[ENTITYSCHEMA] ([idEntitySchema])
GO
ALTER TABLE [dbo].[ENTITYSCHEMAXSL] CHECK CONSTRAINT [ENTITYSCHEMAXSL_ENTITYSCHE_FK1]
GO
/****** Object:  ForeignKey [RENDERTYPE_USERFIELD_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[RENDERTYPE]  WITH CHECK ADD  CONSTRAINT [RENDERTYPE_USERFIELD_FK1] FOREIGN KEY([idUserField])
REFERENCES [dbo].[USERFIELD] ([idUserField])
GO
ALTER TABLE [dbo].[RENDERTYPE] CHECK CONSTRAINT [RENDERTYPE_USERFIELD_FK1]
GO
/****** Object:  ForeignKey [ORGPOSITION_ORG_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ORGPOSITION]  WITH CHECK ADD  CONSTRAINT [ORGPOSITION_ORG_FK1] FOREIGN KEY([idOrg])
REFERENCES [dbo].[ORG] ([idOrg])
GO
ALTER TABLE [dbo].[ORGPOSITION] CHECK CONSTRAINT [ORGPOSITION_ORG_FK1]
GO
/****** Object:  ForeignKey [ORGPOSITION_ORGPOSITION_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[ORGPOSITION]  WITH CHECK ADD  CONSTRAINT [ORGPOSITION_ORGPOSITION_FK1] FOREIGN KEY([idParentPosition])
REFERENCES [dbo].[ORGPOSITION] ([idPosition])
GO
ALTER TABLE [dbo].[ORGPOSITION] CHECK CONSTRAINT [ORGPOSITION_ORGPOSITION_FK1]
GO
/****** Object:  ForeignKey [LOCATION_BATIMEZONE_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[LOCATION]  WITH CHECK ADD  CONSTRAINT [LOCATION_BATIMEZONE_FK1] FOREIGN KEY([idTimeZone])
REFERENCES [dbo].[BATIMEZONE] ([idBATimeZone])
GO
ALTER TABLE [dbo].[LOCATION] CHECK CONSTRAINT [LOCATION_BATIMEZONE_FK1]
GO
/****** Object:  ForeignKey [LOCATION_LOCATION_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[LOCATION]  WITH CHECK ADD  CONSTRAINT [LOCATION_LOCATION_FK1] FOREIGN KEY([idParentLocation])
REFERENCES [dbo].[LOCATION] ([idLocation])
GO
ALTER TABLE [dbo].[LOCATION] CHECK CONSTRAINT [LOCATION_LOCATION_FK1]
GO
/****** Object:  ForeignKey [LOCATION_ORG_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[LOCATION]  WITH CHECK ADD  CONSTRAINT [LOCATION_ORG_FK1] FOREIGN KEY([idOrg])
REFERENCES [dbo].[ORG] ([idOrg])
GO
ALTER TABLE [dbo].[LOCATION] CHECK CONSTRAINT [LOCATION_ORG_FK1]
GO
/****** Object:  ForeignKey [LOCATION_WORKINGTIMESCHEMA_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[LOCATION]  WITH CHECK ADD  CONSTRAINT [LOCATION_WORKINGTIMESCHEMA_FK1] FOREIGN KEY([idWorkingTimeSchema])
REFERENCES [dbo].[WORKINGTIMESCHEMA] ([idWorkingTimeSchema])
GO
ALTER TABLE [dbo].[LOCATION] CHECK CONSTRAINT [LOCATION_WORKINGTIMESCHEMA_FK1]
GO
/****** Object:  ForeignKey [LGENTITYMETADATA_ATTRIB_FK1]    Script Date: 06/08/2017 15:53:20 ******/
ALTER TABLE [dbo].[LGENTITYMETADATA]  WITH CHECK ADD  CONSTRAINT [LGENTITYMETADATA_ATTRIB_FK1] FOREIGN KEY([idAttrib])
REFERENCES [dbo].[ATTRIB] ([idAttrib])
GO
ALTER TABLE [dbo].[LGENTITYMETADATA] CHECK CONSTRAINT [LGENTITYMETADATA_ATTRIB_FK1]
GO
/****** Object:  ForeignKey [APPLICATION_ALLOCPRINCIPLE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[APPLICATION]  WITH CHECK ADD  CONSTRAINT [APPLICATION_ALLOCPRINCIPLE_FK1] FOREIGN KEY([idAllocPrinciple])
REFERENCES [dbo].[ALLOCPRINCIPLE] ([idAllocPrinciple])
GO
ALTER TABLE [dbo].[APPLICATION] CHECK CONSTRAINT [APPLICATION_ALLOCPRINCIPLE_FK1]
GO
/****** Object:  ForeignKey [APPLICATION_ENTITY_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[APPLICATION]  WITH CHECK ADD  CONSTRAINT [APPLICATION_ENTITY_FK1] FOREIGN KEY([idEntityPV])
REFERENCES [dbo].[ENTITY] ([idEnt])
GO
ALTER TABLE [dbo].[APPLICATION] CHECK CONSTRAINT [APPLICATION_ENTITY_FK1]
GO
/****** Object:  ForeignKey [APPLICATION_ORG_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[APPLICATION]  WITH CHECK ADD  CONSTRAINT [APPLICATION_ORG_FK1] FOREIGN KEY([idOrg])
REFERENCES [dbo].[ORG] ([idOrg])
GO
ALTER TABLE [dbo].[APPLICATION] CHECK CONSTRAINT [APPLICATION_ORG_FK1]
GO
/****** Object:  ForeignKey [MIPROPERTY_ATTRIB_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAMULTIINSTANCEPROPERTY]  WITH CHECK ADD  CONSTRAINT [MIPROPERTY_ATTRIB_FK1] FOREIGN KEY([orderByAttrib])
REFERENCES [dbo].[ATTRIB] ([idAttrib])
GO
ALTER TABLE [dbo].[BAMULTIINSTANCEPROPERTY] CHECK CONSTRAINT [MIPROPERTY_ATTRIB_FK1]
GO
/****** Object:  ForeignKey [BAGAMEASAGG_BAGAMEAS_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAGAMEASUREAGGREGATE]  WITH CHECK ADD  CONSTRAINT [BAGAMEASAGG_BAGAMEAS_FK1] FOREIGN KEY([idMeasure])
REFERENCES [dbo].[BAGAMEASURE] ([idMeasure])
GO
ALTER TABLE [dbo].[BAGAMEASUREAGGREGATE] CHECK CONSTRAINT [BAGAMEASAGG_BAGAMEAS_FK1]
GO
/****** Object:  ForeignKey [BAEPARAMVALENT_BAENVIRONME_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAENVPARAMVALUEENTITYEX]  WITH CHECK ADD  CONSTRAINT [BAEPARAMVALENT_BAENVIRONME_FK1] FOREIGN KEY([idBAEnvironment])
REFERENCES [dbo].[BAENVIRONMENT] ([idBAEnvironment])
GO
ALTER TABLE [dbo].[BAENVPARAMVALUEENTITYEX] CHECK CONSTRAINT [BAEPARAMVALENT_BAENVIRONME_FK1]
GO
/****** Object:  ForeignKey [BAEPARAMVALENT_BAEPARAMENT_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAENVPARAMVALUEENTITYEX]  WITH CHECK ADD  CONSTRAINT [BAEPARAMVALENT_BAEPARAMENT_FK1] FOREIGN KEY([idEnvParamEntityEx])
REFERENCES [dbo].[BAENVPARAMENTITYEX] ([idEnvParamEntityEx])
GO
ALTER TABLE [dbo].[BAENVPARAMVALUEENTITYEX] CHECK CONSTRAINT [BAEPARAMVALENT_BAEPARAMENT_FK1]
GO
/****** Object:  ForeignKey [BAEPARAMVALENT_ENTITY_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAENVPARAMVALUEENTITYEX]  WITH CHECK ADD  CONSTRAINT [BAEPARAMVALENT_ENTITY_FK1] FOREIGN KEY([idEnt])
REFERENCES [dbo].[ENTITY] ([idEnt])
GO
ALTER TABLE [dbo].[BAENVPARAMVALUEENTITYEX] CHECK CONSTRAINT [BAEPARAMVALENT_ENTITY_FK1]
GO
/****** Object:  ForeignKey [BAFILEUPLOAD_ATTRIB_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAFILEUPLOAD]  WITH CHECK ADD  CONSTRAINT [BAFILEUPLOAD_ATTRIB_FK1] FOREIGN KEY([idAttrib])
REFERENCES [dbo].[ATTRIB] ([idAttrib])
GO
ALTER TABLE [dbo].[BAFILEUPLOAD] CHECK CONSTRAINT [BAFILEUPLOAD_ATTRIB_FK1]
GO
/****** Object:  ForeignKey [BAGADIMFILTER_GADIM_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAGADIMENSIONFILTER]  WITH CHECK ADD  CONSTRAINT [BAGADIMFILTER_GADIM_FK1] FOREIGN KEY([idDimension])
REFERENCES [dbo].[BAGADIMENSION] ([idDimension])
GO
ALTER TABLE [dbo].[BAGADIMENSIONFILTER] CHECK CONSTRAINT [BAGADIMFILTER_GADIM_FK1]
GO
/****** Object:  ForeignKey [ENTITYBIZKEY_ATTRIB_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ENTITYBIZKEY]  WITH CHECK ADD  CONSTRAINT [ENTITYBIZKEY_ATTRIB_FK1] FOREIGN KEY([idAttrib])
REFERENCES [dbo].[ATTRIB] ([idAttrib])
GO
ALTER TABLE [dbo].[ENTITYBIZKEY] CHECK CONSTRAINT [ENTITYBIZKEY_ATTRIB_FK1]
GO
/****** Object:  ForeignKey [ENTITYBIZKEY_ENTITY_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ENTITYBIZKEY]  WITH CHECK ADD  CONSTRAINT [ENTITYBIZKEY_ENTITY_FK1] FOREIGN KEY([idEnt])
REFERENCES [dbo].[ENTITY] ([idEnt])
GO
ALTER TABLE [dbo].[ENTITYBIZKEY] CHECK CONSTRAINT [ENTITYBIZKEY_ENTITY_FK1]
GO
/****** Object:  ForeignKey [ENTITYKEY_ATTRIB_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ENTITYKEY]  WITH CHECK ADD  CONSTRAINT [ENTITYKEY_ATTRIB_FK1] FOREIGN KEY([idAttrib])
REFERENCES [dbo].[ATTRIB] ([idAttrib])
GO
ALTER TABLE [dbo].[ENTITYKEY] CHECK CONSTRAINT [ENTITYKEY_ATTRIB_FK1]
GO
/****** Object:  ForeignKey [ENTITYKEY_ENTITY_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ENTITYKEY]  WITH CHECK ADD  CONSTRAINT [ENTITYKEY_ENTITY_FK1] FOREIGN KEY([idEnt])
REFERENCES [dbo].[ENTITY] ([idEnt])
GO
ALTER TABLE [dbo].[ENTITYKEY] CHECK CONSTRAINT [ENTITYKEY_ENTITY_FK1]
GO
/****** Object:  ForeignKey [USERFIELDPARA_USERFIELD_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[USERFIELDPARAMETERS]  WITH CHECK ADD  CONSTRAINT [USERFIELDPARA_USERFIELD_FK1] FOREIGN KEY([idUserField])
REFERENCES [dbo].[USERFIELD] ([idUserField])
GO
ALTER TABLE [dbo].[USERFIELDPARAMETERS] CHECK CONSTRAINT [USERFIELDPARA_USERFIELD_FK1]
GO
/****** Object:  ForeignKey [USERFIELDATTR_USERFIELD_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[USERFIELDATTRIBUTETYPE]  WITH CHECK ADD  CONSTRAINT [USERFIELDATTR_USERFIELD_FK1] FOREIGN KEY([idUserField])
REFERENCES [dbo].[USERFIELD] ([idUserField])
GO
ALTER TABLE [dbo].[USERFIELDATTRIBUTETYPE] CHECK CONSTRAINT [USERFIELDATTR_USERFIELD_FK1]
GO
/****** Object:  ForeignKey [WFUSER_AREA_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFUSER]  WITH CHECK ADD  CONSTRAINT [WFUSER_AREA_FK1] FOREIGN KEY([idArea])
REFERENCES [dbo].[AREA] ([idArea])
GO
ALTER TABLE [dbo].[WFUSER] CHECK CONSTRAINT [WFUSER_AREA_FK1]
GO
/****** Object:  ForeignKey [WFUSER_BATIMEZONE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFUSER]  WITH CHECK ADD  CONSTRAINT [WFUSER_BATIMEZONE_FK1] FOREIGN KEY([idTimeZone])
REFERENCES [dbo].[BATIMEZONE] ([idBATimeZone])
GO
ALTER TABLE [dbo].[WFUSER] CHECK CONSTRAINT [WFUSER_BATIMEZONE_FK1]
GO
/****** Object:  ForeignKey [WFUSER_LGLANGUAGE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFUSER]  WITH NOCHECK ADD  CONSTRAINT [WFUSER_LGLANGUAGE_FK1] FOREIGN KEY([language])
REFERENCES [dbo].[LGLANGUAGE] ([idLgLanguage])
GO
ALTER TABLE [dbo].[WFUSER] CHECK CONSTRAINT [WFUSER_LGLANGUAGE_FK1]
GO
/****** Object:  ForeignKey [WFUSER_LOCATION_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFUSER]  WITH CHECK ADD  CONSTRAINT [WFUSER_LOCATION_FK1] FOREIGN KEY([idLocation])
REFERENCES [dbo].[LOCATION] ([idLocation])
GO
ALTER TABLE [dbo].[WFUSER] CHECK CONSTRAINT [WFUSER_LOCATION_FK1]
GO
/****** Object:  ForeignKey [WFUSER_USERSTARTPAGE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFUSER]  WITH CHECK ADD  CONSTRAINT [WFUSER_USERSTARTPAGE_FK1] FOREIGN KEY([userStartPage])
REFERENCES [dbo].[USERSTARTPAGE] ([idStartPage])
GO
ALTER TABLE [dbo].[WFUSER] CHECK CONSTRAINT [WFUSER_USERSTARTPAGE_FK1]
GO
/****** Object:  ForeignKey [WFUSER_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFUSER]  WITH CHECK ADD  CONSTRAINT [WFUSER_WFUSER_FK1] FOREIGN KEY([idBossUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[WFUSER] CHECK CONSTRAINT [WFUSER_WFUSER_FK1]
GO
/****** Object:  ForeignKey [WFUSER_WFUSER_FK2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFUSER]  WITH CHECK ADD  CONSTRAINT [WFUSER_WFUSER_FK2] FOREIGN KEY([idDelegate])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[WFUSER] CHECK CONSTRAINT [WFUSER_WFUSER_FK2]
GO
/****** Object:  ForeignKey [WFUSER_WORKINGTIMESCHEMA_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFUSER]  WITH CHECK ADD  CONSTRAINT [WFUSER_WORKINGTIMESCHEMA_FK1] FOREIGN KEY([idWorkingTimeSchema])
REFERENCES [dbo].[WORKINGTIMESCHEMA] ([idWorkingTimeSchema])
GO
ALTER TABLE [dbo].[WFUSER] CHECK CONSTRAINT [WFUSER_WORKINGTIMESCHEMA_FK1]
GO
/****** Object:  ForeignKey [CATEGORY_APPLICATION_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[CATEGORY]  WITH CHECK ADD  CONSTRAINT [CATEGORY_APPLICATION_FK1] FOREIGN KEY([idApplication])
REFERENCES [dbo].[APPLICATION] ([idApplication])
GO
ALTER TABLE [dbo].[CATEGORY] CHECK CONSTRAINT [CATEGORY_APPLICATION_FK1]
GO
/****** Object:  ForeignKey [CATEGORY_CATEGORY_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[CATEGORY]  WITH CHECK ADD  CONSTRAINT [CATEGORY_CATEGORY_FK1] FOREIGN KEY([idParentCategory])
REFERENCES [dbo].[CATEGORY] ([idCategory])
GO
ALTER TABLE [dbo].[CATEGORY] CHECK CONSTRAINT [CATEGORY_CATEGORY_FK1]
GO
/****** Object:  ForeignKey [BAFILECONT_BAFILEUPLOAD_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAFILECONT]  WITH CHECK ADD  CONSTRAINT [BAFILECONT_BAFILEUPLOAD_FK1] FOREIGN KEY([idFileUpload])
REFERENCES [dbo].[BAFILEUPLOAD] ([idFileUpload])
GO
ALTER TABLE [dbo].[BAFILECONT] CHECK CONSTRAINT [BAFILECONT_BAFILEUPLOAD_FK1]
GO
/****** Object:  ForeignKey [ASYNCECMJOB_BAFILEUPLOAD_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ASYNCECMJOB]  WITH CHECK ADD  CONSTRAINT [ASYNCECMJOB_BAFILEUPLOAD_FK1] FOREIGN KEY([idFileUpload])
REFERENCES [dbo].[BAFILEUPLOAD] ([idFileUpload])
GO
ALTER TABLE [dbo].[ASYNCECMJOB] CHECK CONSTRAINT [ASYNCECMJOB_BAFILEUPLOAD_FK1]
GO
/****** Object:  ForeignKey [MIGROUP_MIPROPERTY_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAMULTIINSTANCEGROUP]  WITH CHECK ADD  CONSTRAINT [MIGROUP_MIPROPERTY_FK1] FOREIGN KEY([idMultiInstanceProperty])
REFERENCES [dbo].[BAMULTIINSTANCEPROPERTY] ([idMultiInstanceProperty])
GO
ALTER TABLE [dbo].[BAMULTIINSTANCEGROUP] CHECK CONSTRAINT [MIGROUP_MIPROPERTY_FK1]
GO
/****** Object:  ForeignKey [LGENTITYDATA_LGENTITYMD_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[LGENTITYDATA]  WITH CHECK ADD  CONSTRAINT [LGENTITYDATA_LGENTITYMD_FK1] FOREIGN KEY([idLgEntityMetadata])
REFERENCES [dbo].[LGENTITYMETADATA] ([idLgEntityMetadata])
GO
ALTER TABLE [dbo].[LGENTITYDATA] CHECK CONSTRAINT [LGENTITYDATA_LGENTITYMD_FK1]
GO
/****** Object:  ForeignKey [LGENTITYDATA_LGLANGUAGE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[LGENTITYDATA]  WITH NOCHECK ADD  CONSTRAINT [LGENTITYDATA_LGLANGUAGE_FK1] FOREIGN KEY([idLgLanguage])
REFERENCES [dbo].[LGLANGUAGE] ([idLgLanguage])
GO
ALTER TABLE [dbo].[LGENTITYDATA] CHECK CONSTRAINT [LGENTITYDATA_LGLANGUAGE_FK1]
GO
/****** Object:  ForeignKey [QUERYFORM_FORM_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[QUERYFORM]  WITH CHECK ADD  CONSTRAINT [QUERYFORM_FORM_FK1] FOREIGN KEY([idForm])
REFERENCES [dbo].[FORM] ([idForm])
GO
ALTER TABLE [dbo].[QUERYFORM] CHECK CONSTRAINT [QUERYFORM_FORM_FK1]
GO
/****** Object:  ForeignKey [RENDER_ATTRIB_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDER]  WITH CHECK ADD  CONSTRAINT [RENDER_ATTRIB_FK1] FOREIGN KEY([idAttrib])
REFERENCES [dbo].[ATTRIB] ([idAttrib])
GO
ALTER TABLE [dbo].[RENDER] CHECK CONSTRAINT [RENDER_ATTRIB_FK1]
GO
/****** Object:  ForeignKey [RENDER_ATTRIB_FK2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDER]  WITH CHECK ADD  CONSTRAINT [RENDER_ATTRIB_FK2] FOREIGN KEY([idDisplayAttrib])
REFERENCES [dbo].[ATTRIB] ([idAttrib])
GO
ALTER TABLE [dbo].[RENDER] CHECK CONSTRAINT [RENDER_ATTRIB_FK2]
GO
/****** Object:  ForeignKey [RENDER_ATTRIB_FK3]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDER]  WITH CHECK ADD  CONSTRAINT [RENDER_ATTRIB_FK3] FOREIGN KEY([idOrderByAttrib])
REFERENCES [dbo].[ATTRIB] ([idAttrib])
GO
ALTER TABLE [dbo].[RENDER] CHECK CONSTRAINT [RENDER_ATTRIB_FK3]
GO
/****** Object:  ForeignKey [RENDER_FACT_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDER]  WITH CHECK ADD  CONSTRAINT [RENDER_FACT_FK1] FOREIGN KEY([idFact])
REFERENCES [dbo].[FACT] ([idFact])
GO
ALTER TABLE [dbo].[RENDER] CHECK CONSTRAINT [RENDER_FACT_FK1]
GO
/****** Object:  ForeignKey [RENDER_FORM_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDER]  WITH CHECK ADD  CONSTRAINT [RENDER_FORM_FK1] FOREIGN KEY([idDisplayForm])
REFERENCES [dbo].[FORM] ([idForm])
GO
ALTER TABLE [dbo].[RENDER] CHECK CONSTRAINT [RENDER_FORM_FK1]
GO
/****** Object:  ForeignKey [RENDER_FORM_FK2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDER]  WITH CHECK ADD  CONSTRAINT [RENDER_FORM_FK2] FOREIGN KEY([idForm])
REFERENCES [dbo].[FORM] ([idForm])
GO
ALTER TABLE [dbo].[RENDER] CHECK CONSTRAINT [RENDER_FORM_FK2]
GO
/****** Object:  ForeignKey [RENDER_RENDERGROUP_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDER]  WITH CHECK ADD  CONSTRAINT [RENDER_RENDERGROUP_FK1] FOREIGN KEY([idRenderGroup])
REFERENCES [dbo].[RENDERGROUP] ([idRenderGroup])
GO
ALTER TABLE [dbo].[RENDER] CHECK CONSTRAINT [RENDER_RENDERGROUP_FK1]
GO
/****** Object:  ForeignKey [RENDER_RENDERTAB_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDER]  WITH CHECK ADD  CONSTRAINT [RENDER_RENDERTAB_FK1] FOREIGN KEY([idRenderTab])
REFERENCES [dbo].[RENDERTAB] ([idRenderTab])
GO
ALTER TABLE [dbo].[RENDER] CHECK CONSTRAINT [RENDER_RENDERTAB_FK1]
GO
/****** Object:  ForeignKey [RENDER_RENDERTYPE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDER]  WITH CHECK ADD  CONSTRAINT [RENDER_RENDERTYPE_FK1] FOREIGN KEY([rdrType])
REFERENCES [dbo].[RENDERTYPE] ([rdrType])
GO
ALTER TABLE [dbo].[RENDER] CHECK CONSTRAINT [RENDER_RENDERTYPE_FK1]
GO
/****** Object:  ForeignKey [FK_FORMMD_ENT]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[FORMMD]  WITH CHECK ADD  CONSTRAINT [FK_FORMMD_ENT] FOREIGN KEY([idEnt])
REFERENCES [dbo].[ENTITY] ([idEnt])
GO
ALTER TABLE [dbo].[FORMMD] CHECK CONSTRAINT [FK_FORMMD_ENT]
GO
/****** Object:  ForeignKey [FK_FormMD_FORM]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[FORMMD]  WITH CHECK ADD  CONSTRAINT [FK_FormMD_FORM] FOREIGN KEY([idForm])
REFERENCES [dbo].[FORM] ([idForm])
GO
ALTER TABLE [dbo].[FORMMD] CHECK CONSTRAINT [FK_FormMD_FORM]
GO
/****** Object:  ForeignKey [FORMMD_LGLANGUAGE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[FORMMD]  WITH NOCHECK ADD  CONSTRAINT [FORMMD_LGLANGUAGE_FK1] FOREIGN KEY([idLgLanguage])
REFERENCES [dbo].[LGLANGUAGE] ([idLgLanguage])
GO
ALTER TABLE [dbo].[FORMMD] CHECK CONSTRAINT [FORMMD_LGLANGUAGE_FK1]
GO
/****** Object:  ForeignKey [JOB_JOBTYPE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[JOB]  WITH CHECK ADD  CONSTRAINT [JOB_JOBTYPE_FK1] FOREIGN KEY([jobType])
REFERENCES [dbo].[JOBTYPE] ([idJobType])
GO
ALTER TABLE [dbo].[JOB] CHECK CONSTRAINT [JOB_JOBTYPE_FK1]
GO
/****** Object:  ForeignKey [JOB_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[JOB]  WITH CHECK ADD  CONSTRAINT [JOB_WFUSER_FK1] FOREIGN KEY([idCreatorUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[JOB] CHECK CONSTRAINT [JOB_WFUSER_FK1]
GO
/****** Object:  ForeignKey [RENDERACTION_RENDER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDERACTION]  WITH CHECK ADD  CONSTRAINT [RENDERACTION_RENDER_FK1] FOREIGN KEY([idRender])
REFERENCES [dbo].[RENDER] ([idRender])
GO
ALTER TABLE [dbo].[RENDERACTION] CHECK CONSTRAINT [RENDERACTION_RENDER_FK1]
GO
/****** Object:  ForeignKey [RENDEREX_RENDER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDEREX]  WITH CHECK ADD  CONSTRAINT [RENDEREX_RENDER_FK1] FOREIGN KEY([idRender])
REFERENCES [dbo].[RENDER] ([idRender])
GO
ALTER TABLE [dbo].[RENDEREX] CHECK CONSTRAINT [RENDEREX_RENDER_FK1]
GO
/****** Object:  ForeignKey [RENDERBEHAVIOUR_RENDER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDERBEHAVIOUR]  WITH CHECK ADD  CONSTRAINT [RENDERBEHAVIOUR_RENDER_FK1] FOREIGN KEY([idRender])
REFERENCES [dbo].[RENDER] ([idRender])
GO
ALTER TABLE [dbo].[RENDERBEHAVIOUR] CHECK CONSTRAINT [RENDERBEHAVIOUR_RENDER_FK1]
GO
/****** Object:  ForeignKey [RENDERVALIDATION_RENDER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDERVALIDATION]  WITH CHECK ADD  CONSTRAINT [RENDERVALIDATION_RENDER_FK1] FOREIGN KEY([idRender])
REFERENCES [dbo].[RENDER] ([idRender])
GO
ALTER TABLE [dbo].[RENDERVALIDATION] CHECK CONSTRAINT [RENDERVALIDATION_RENDER_FK1]
GO
/****** Object:  ForeignKey [BACASEACCESSOPEN_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BACASEACCESSOPEN]  WITH CHECK ADD  CONSTRAINT [BACASEACCESSOPEN_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[BACASEACCESSOPEN] CHECK CONSTRAINT [BACASEACCESSOPEN_WFUSER_FK1]
GO
/****** Object:  ForeignKey [BACASEACCESS_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BACASEACCESS]  WITH CHECK ADD  CONSTRAINT [BACASEACCESS_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[BACASEACCESS] CHECK CONSTRAINT [BACASEACCESS_WFUSER_FK1]
GO
/****** Object:  ForeignKey [BAECMMETADATA_RENDER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAECMMETADATA]  WITH CHECK ADD  CONSTRAINT [BAECMMETADATA_RENDER_FK1] FOREIGN KEY([idRender])
REFERENCES [dbo].[RENDER] ([idRender])
GO
ALTER TABLE [dbo].[BAECMMETADATA] CHECK CONSTRAINT [BAECMMETADATA_RENDER_FK1]
GO
/****** Object:  ForeignKey [BAUSERACCESSLOG_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAUSERACCESSLOG]  WITH CHECK ADD  CONSTRAINT [BAUSERACCESSLOG_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[BAUSERACCESSLOG] CHECK CONSTRAINT [BAUSERACCESSLOG_WFUSER_FK1]
GO
/****** Object:  ForeignKey [BAUSRSTATS_CASE_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAUSERSTATISTICS_CASE]  WITH CHECK ADD  CONSTRAINT [BAUSRSTATS_CASE_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[BAUSERSTATISTICS_CASE] CHECK CONSTRAINT [BAUSRSTATS_CASE_WFUSER_FK1]
GO
/****** Object:  ForeignKey [BAUSERGROUPUSER_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAUSERGROUPUSER]  WITH CHECK ADD  CONSTRAINT [BAUSERGROUPUSER_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[BAUSERGROUPUSER] CHECK CONSTRAINT [BAUSERGROUPUSER_WFUSER_FK1]
GO
/****** Object:  ForeignKey [BAWPQUERY_APP_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAWPQUERY]  WITH CHECK ADD  CONSTRAINT [BAWPQUERY_APP_FK1] FOREIGN KEY([idApplication])
REFERENCES [dbo].[APPLICATION] ([idApplication])
GO
ALTER TABLE [dbo].[BAWPQUERY] CHECK CONSTRAINT [BAWPQUERY_APP_FK1]
GO
/****** Object:  ForeignKey [BAWPQUERY_BAWPQUERY_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAWPQUERY]  WITH CHECK ADD  CONSTRAINT [BAWPQUERY_BAWPQUERY_FK1] FOREIGN KEY([idParentQuery])
REFERENCES [dbo].[BAWPQUERY] ([idBAWPQuery])
GO
ALTER TABLE [dbo].[BAWPQUERY] CHECK CONSTRAINT [BAWPQUERY_BAWPQUERY_FK1]
GO
/****** Object:  ForeignKey [BAWPQUERY_BAWPQUERY_FK2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAWPQUERY]  WITH CHECK ADD  CONSTRAINT [BAWPQUERY_BAWPQUERY_FK2] FOREIGN KEY([idSystemQuery])
REFERENCES [dbo].[BAWPQUERY] ([idBAWPQuery])
GO
ALTER TABLE [dbo].[BAWPQUERY] CHECK CONSTRAINT [BAWPQUERY_BAWPQUERY_FK2]
GO
/****** Object:  ForeignKey [BAWPQUERY_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAWPQUERY]  WITH CHECK ADD  CONSTRAINT [BAWPQUERY_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[BAWPQUERY] CHECK CONSTRAINT [BAWPQUERY_WFUSER_FK1]
GO
/****** Object:  ForeignKey [BAWPFOLDER_BAWPFOLDER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAWPFOLDER]  WITH CHECK ADD  CONSTRAINT [BAWPFOLDER_BAWPFOLDER_FK1] FOREIGN KEY([idBAWPParentFolder])
REFERENCES [dbo].[BAWPFOLDER] ([idBAWPFolder])
GO
ALTER TABLE [dbo].[BAWPFOLDER] CHECK CONSTRAINT [BAWPFOLDER_BAWPFOLDER_FK1]
GO
/****** Object:  ForeignKey [BAWPFOLDER_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAWPFOLDER]  WITH CHECK ADD  CONSTRAINT [BAWPFOLDER_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[BAWPFOLDER] CHECK CONSTRAINT [BAWPFOLDER_WFUSER_FK1]
GO
/****** Object:  ForeignKey [ENTITYLOG_ENTLOGOPTYPE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ENTITYLOG]  WITH CHECK ADD  CONSTRAINT [ENTITYLOG_ENTLOGOPTYPE_FK1] FOREIGN KEY([idEntLogOpType])
REFERENCES [dbo].[ENTLOGOPTYPE] ([idEntLogOpType])
GO
ALTER TABLE [dbo].[ENTITYLOG] CHECK CONSTRAINT [ENTITYLOG_ENTLOGOPTYPE_FK1]
GO
/****** Object:  ForeignKey [ENTITYLOG_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ENTITYLOG]  WITH CHECK ADD  CONSTRAINT [ENTITYLOG_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[ENTITYLOG] CHECK CONSTRAINT [ENTITYLOG_WFUSER_FK1]
GO
/****** Object:  ForeignKey [DWKPI_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[DWKPI]  WITH CHECK ADD  CONSTRAINT [DWKPI_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[DWKPI] CHECK CONSTRAINT [DWKPI_WFUSER_FK1]
GO
/****** Object:  ForeignKey [STOREDQUERYFORMWFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[STOREDQUERYFORM]  WITH CHECK ADD  CONSTRAINT [STOREDQUERYFORMWFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[STOREDQUERYFORM] CHECK CONSTRAINT [STOREDQUERYFORMWFUSER_FK1]
GO
/****** Object:  ForeignKey [STOREDQUERY_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[STOREDQUERY]  WITH CHECK ADD  CONSTRAINT [STOREDQUERY_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[STOREDQUERY] CHECK CONSTRAINT [STOREDQUERY_WFUSER_FK1]
GO
/****** Object:  ForeignKey [USERAUTH_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[USERAUTH]  WITH CHECK ADD  CONSTRAINT [USERAUTH_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[USERAUTH] CHECK CONSTRAINT [USERAUTH_WFUSER_FK1]
GO
/****** Object:  ForeignKey [USERASSIGNCOUNT_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[USERASSIGNCOUNT]  WITH CHECK ADD  CONSTRAINT [USERASSIGNCOUNT_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[USERASSIGNCOUNT] CHECK CONSTRAINT [USERASSIGNCOUNT_WFUSER_FK1]
GO
/****** Object:  ForeignKey [USERSKILL_SKILL_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[USERSKILL]  WITH CHECK ADD  CONSTRAINT [USERSKILL_SKILL_FK1] FOREIGN KEY([idSkill])
REFERENCES [dbo].[SKILL] ([idSkill])
GO
ALTER TABLE [dbo].[USERSKILL] CHECK CONSTRAINT [USERSKILL_SKILL_FK1]
GO
/****** Object:  ForeignKey [USERSKILL_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[USERSKILL]  WITH CHECK ADD  CONSTRAINT [USERSKILL_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[USERSKILL] CHECK CONSTRAINT [USERSKILL_WFUSER_FK1]
GO
/****** Object:  ForeignKey [USERROLE_ROLE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[USERROLE]  WITH CHECK ADD  CONSTRAINT [USERROLE_ROLE_FK1] FOREIGN KEY([idRole])
REFERENCES [dbo].[ROLE] ([idRole])
GO
ALTER TABLE [dbo].[USERROLE] CHECK CONSTRAINT [USERROLE_ROLE_FK1]
GO
/****** Object:  ForeignKey [USERROLE_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[USERROLE]  WITH CHECK ADD  CONSTRAINT [USERROLE_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[USERROLE] CHECK CONSTRAINT [USERROLE_WFUSER_FK1]
GO
/****** Object:  ForeignKey [USERPOSITION_ORGPOSITION_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[USERPOSITION]  WITH CHECK ADD  CONSTRAINT [USERPOSITION_ORGPOSITION_FK1] FOREIGN KEY([idPosition])
REFERENCES [dbo].[ORGPOSITION] ([idPosition])
GO
ALTER TABLE [dbo].[USERPOSITION] CHECK CONSTRAINT [USERPOSITION_ORGPOSITION_FK1]
GO
/****** Object:  ForeignKey [USERPOSITION_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[USERPOSITION]  WITH CHECK ADD  CONSTRAINT [USERPOSITION_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[USERPOSITION] CHECK CONSTRAINT [USERPOSITION_WFUSER_FK1]
GO
/****** Object:  ForeignKey [USERPENDINGREQUEST_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[USERPENDINGREQUEST]  WITH CHECK ADD  CONSTRAINT [USERPENDINGREQUEST_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[USERPENDINGREQUEST] CHECK CONSTRAINT [USERPENDINGREQUEST_WFUSER_FK1]
GO
/****** Object:  ForeignKey [USERORG_ORG_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[USERORG]  WITH CHECK ADD  CONSTRAINT [USERORG_ORG_FK1] FOREIGN KEY([idOrg])
REFERENCES [dbo].[ORG] ([idOrg])
GO
ALTER TABLE [dbo].[USERORG] CHECK CONSTRAINT [USERORG_ORG_FK1]
GO
/****** Object:  ForeignKey [USERORG_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[USERORG]  WITH CHECK ADD  CONSTRAINT [USERORG_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[USERORG] CHECK CONSTRAINT [USERORG_WFUSER_FK1]
GO
/****** Object:  ForeignKey [USERCACHE_ENTITY_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[USERCACHE]  WITH CHECK ADD  CONSTRAINT [USERCACHE_ENTITY_FK1] FOREIGN KEY([idEnt])
REFERENCES [dbo].[ENTITY] ([idEnt])
GO
ALTER TABLE [dbo].[USERCACHE] CHECK CONSTRAINT [USERCACHE_ENTITY_FK1]
GO
/****** Object:  ForeignKey [USERCACHE_RENDER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[USERCACHE]  WITH CHECK ADD  CONSTRAINT [USERCACHE_RENDER_FK1] FOREIGN KEY([idRender])
REFERENCES [dbo].[RENDER] ([idRender])
GO
ALTER TABLE [dbo].[USERCACHE] CHECK CONSTRAINT [USERCACHE_RENDER_FK1]
GO
/****** Object:  ForeignKey [USERCACHE_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[USERCACHE]  WITH CHECK ADD  CONSTRAINT [USERCACHE_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[USERCACHE] CHECK CONSTRAINT [USERCACHE_WFUSER_FK1]
GO
/****** Object:  ForeignKey [WORKINGTIMEUSERDATA_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WORKINGTIMEUSERDATA]  WITH CHECK ADD  CONSTRAINT [WORKINGTIMEUSERDATA_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[WORKINGTIMEUSERDATA] CHECK CONSTRAINT [WORKINGTIMEUSERDATA_WFUSER_FK1]
GO
/****** Object:  ForeignKey [WFCLASS_ALLOCPRINCIPLE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCLASS]  WITH CHECK ADD  CONSTRAINT [WFCLASS_ALLOCPRINCIPLE_FK1] FOREIGN KEY([idAllocPrinciple])
REFERENCES [dbo].[ALLOCPRINCIPLE] ([idAllocPrinciple])
GO
ALTER TABLE [dbo].[WFCLASS] CHECK CONSTRAINT [WFCLASS_ALLOCPRINCIPLE_FK1]
GO
/****** Object:  ForeignKey [WFCLASS_CATEGORY_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCLASS]  WITH CHECK ADD  CONSTRAINT [WFCLASS_CATEGORY_FK1] FOREIGN KEY([idCategory])
REFERENCES [dbo].[CATEGORY] ([idCategory])
GO
ALTER TABLE [dbo].[WFCLASS] CHECK CONSTRAINT [WFCLASS_CATEGORY_FK1]
GO
/****** Object:  ForeignKey [WFCLASS_WFACCESSTYPE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCLASS]  WITH CHECK ADD  CONSTRAINT [WFCLASS_WFACCESSTYPE_FK1] FOREIGN KEY([idwfAccessType])
REFERENCES [dbo].[WFACCESSTYPE] ([idwfAccessType])
GO
ALTER TABLE [dbo].[WFCLASS] CHECK CONSTRAINT [WFCLASS_WFACCESSTYPE_FK1]
GO
/****** Object:  ForeignKey [WORKFLOW_BACASEACCESSTYPE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WORKFLOW]  WITH CHECK ADD  CONSTRAINT [WORKFLOW_BACASEACCESSTYPE_FK1] FOREIGN KEY([wfCaseAccessType])
REFERENCES [dbo].[BACASEACCESSTYPE] ([caType])
GO
ALTER TABLE [dbo].[WORKFLOW] CHECK CONSTRAINT [WORKFLOW_BACASEACCESSTYPE_FK1]
GO
/****** Object:  ForeignKey [WORKFLOW_BAPOOL_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WORKFLOW]  WITH CHECK ADD  CONSTRAINT [WORKFLOW_BAPOOL_FK1] FOREIGN KEY([idPool])
REFERENCES [dbo].[BAPOOL] ([idPool])
GO
ALTER TABLE [dbo].[WORKFLOW] CHECK CONSTRAINT [WORKFLOW_BAPOOL_FK1]
GO
/****** Object:  ForeignKey [WORKFLOW_ENVIRONMENTTYPE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WORKFLOW]  WITH CHECK ADD  CONSTRAINT [WORKFLOW_ENVIRONMENTTYPE_FK1] FOREIGN KEY([wfEnvironment])
REFERENCES [dbo].[ENVIRONMENTTYPE] ([idEnvType])
GO
ALTER TABLE [dbo].[WORKFLOW] CHECK CONSTRAINT [WORKFLOW_ENVIRONMENTTYPE_FK1]
GO
/****** Object:  ForeignKey [WORKFLOW_WFCLASS_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WORKFLOW]  WITH CHECK ADD  CONSTRAINT [WORKFLOW_WFCLASS_FK1] FOREIGN KEY([idWFClass])
REFERENCES [dbo].[WFCLASS] ([idWfClass])
GO
ALTER TABLE [dbo].[WORKFLOW] CHECK CONSTRAINT [WORKFLOW_WFCLASS_FK1]
GO
/****** Object:  ForeignKey [WFCONFIG_WFCLASS_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCONFIG]  WITH CHECK ADD  CONSTRAINT [WFCONFIG_WFCLASS_FK1] FOREIGN KEY([idWfClass])
REFERENCES [dbo].[WFCLASS] ([idWfClass])
GO
ALTER TABLE [dbo].[WFCONFIG] CHECK CONSTRAINT [WFCONFIG_WFCLASS_FK1]
GO
/****** Object:  ForeignKey [USERAUTHHISTORY_USERAUTH_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[USERAUTHHISTORY]  WITH CHECK ADD  CONSTRAINT [USERAUTHHISTORY_USERAUTH_FK1] FOREIGN KEY([idUserAuth])
REFERENCES [dbo].[USERAUTH] ([idUserAuth])
GO
ALTER TABLE [dbo].[USERAUTHHISTORY] CHECK CONSTRAINT [USERAUTHHISTORY_USERAUTH_FK1]
GO
/****** Object:  ForeignKey [STOREDQUERYVALUE_RENDER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[STOREDQUERYVALUE]  WITH CHECK ADD  CONSTRAINT [STOREDQUERYVALUE_RENDER_FK1] FOREIGN KEY([idRender])
REFERENCES [dbo].[RENDER] ([idRender])
GO
ALTER TABLE [dbo].[STOREDQUERYVALUE] CHECK CONSTRAINT [STOREDQUERYVALUE_RENDER_FK1]
GO
/****** Object:  ForeignKey [STOREDQUERYVALUE_STOREDQUE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[STOREDQUERYVALUE]  WITH CHECK ADD  CONSTRAINT [STOREDQUERYVALUE_STOREDQUE_FK1] FOREIGN KEY([idStoredQuery])
REFERENCES [dbo].[STOREDQUERY] ([idStoredQuery])
GO
ALTER TABLE [dbo].[STOREDQUERYVALUE] CHECK CONSTRAINT [STOREDQUERYVALUE_STOREDQUE_FK1]
GO
/****** Object:  ForeignKey [SQUSER_STOREDQUERY_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[STOREDQUERYUSER]  WITH CHECK ADD  CONSTRAINT [SQUSER_STOREDQUERY_FK1] FOREIGN KEY([idStoredQuery])
REFERENCES [dbo].[STOREDQUERY] ([idStoredQuery])
GO
ALTER TABLE [dbo].[STOREDQUERYUSER] CHECK CONSTRAINT [SQUSER_STOREDQUERY_FK1]
GO
/****** Object:  ForeignKey [SQUSER_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[STOREDQUERYUSER]  WITH CHECK ADD  CONSTRAINT [SQUSER_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[STOREDQUERYUSER] CHECK CONSTRAINT [SQUSER_WFUSER_FK1]
GO
/****** Object:  ForeignKey [SQGROUP_STOREDQUERY_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[STOREDQUERYGROUP]  WITH CHECK ADD  CONSTRAINT [SQGROUP_STOREDQUERY_FK1] FOREIGN KEY([idStoredQuery])
REFERENCES [dbo].[STOREDQUERY] ([idStoredQuery])
GO
ALTER TABLE [dbo].[STOREDQUERYGROUP] CHECK CONSTRAINT [SQGROUP_STOREDQUERY_FK1]
GO
/****** Object:  ForeignKey [STOREDQUERYFORMUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[STOREDQUERYFORMUSER]  WITH CHECK ADD  CONSTRAINT [STOREDQUERYFORMUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[STOREDQUERYFORMUSER] CHECK CONSTRAINT [STOREDQUERYFORMUSER_FK1]
GO
/****** Object:  ForeignKey [STOREDQUERYFORMUSER_FK2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[STOREDQUERYFORMUSER]  WITH CHECK ADD  CONSTRAINT [STOREDQUERYFORMUSER_FK2] FOREIGN KEY([idStoredQueryForm])
REFERENCES [dbo].[STOREDQUERYFORM] ([idStoredQueryForm])
GO
ALTER TABLE [dbo].[STOREDQUERYFORMUSER] CHECK CONSTRAINT [STOREDQUERYFORMUSER_FK2]
GO
/****** Object:  ForeignKey [STOREDQUERYFORMGROUP_FK2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[STOREDQUERYFORMGROUP]  WITH CHECK ADD  CONSTRAINT [STOREDQUERYFORMGROUP_FK2] FOREIGN KEY([idStoredQueryForm])
REFERENCES [dbo].[STOREDQUERYFORM] ([idStoredQueryForm])
GO
ALTER TABLE [dbo].[STOREDQUERYFORMGROUP] CHECK CONSTRAINT [STOREDQUERYFORMGROUP_FK2]
GO
/****** Object:  ForeignKey [DWKPICONTEXT_DWKPI_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[DWKPICONTEXT]  WITH CHECK ADD  CONSTRAINT [DWKPICONTEXT_DWKPI_FK1] FOREIGN KEY([idKpi])
REFERENCES [dbo].[DWKPI] ([idKpi])
GO
ALTER TABLE [dbo].[DWKPICONTEXT] CHECK CONSTRAINT [DWKPICONTEXT_DWKPI_FK1]
GO
/****** Object:  ForeignKey [BAWPBAQUERYPRDATA_APP_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAWPQUERYPROCESSDATA]  WITH CHECK ADD  CONSTRAINT [BAWPBAQUERYPRDATA_APP_FK1] FOREIGN KEY([idApplication])
REFERENCES [dbo].[APPLICATION] ([idApplication])
GO
ALTER TABLE [dbo].[BAWPQUERYPROCESSDATA] CHECK CONSTRAINT [BAWPBAQUERYPRDATA_APP_FK1]
GO
/****** Object:  ForeignKey [BAWPQUERYPRDATA_BAWPQUERY_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAWPQUERYPROCESSDATA]  WITH CHECK ADD  CONSTRAINT [BAWPQUERYPRDATA_BAWPQUERY_FK1] FOREIGN KEY([idBAWPQuery])
REFERENCES [dbo].[BAWPQUERY] ([idBAWPQuery])
GO
ALTER TABLE [dbo].[BAWPQUERYPROCESSDATA] CHECK CONSTRAINT [BAWPQUERYPRDATA_BAWPQUERY_FK1]
GO
/****** Object:  ForeignKey [BAWPQUERYPRDATA_CATEG_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAWPQUERYPROCESSDATA]  WITH CHECK ADD  CONSTRAINT [BAWPQUERYPRDATA_CATEG_FK1] FOREIGN KEY([idCategory])
REFERENCES [dbo].[CATEGORY] ([idCategory])
GO
ALTER TABLE [dbo].[BAWPQUERYPROCESSDATA] CHECK CONSTRAINT [BAWPQUERYPRDATA_CATEG_FK1]
GO
/****** Object:  ForeignKey [BAWPQUERYPRDATA_WFCLASS_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAWPQUERYPROCESSDATA]  WITH CHECK ADD  CONSTRAINT [BAWPQUERYPRDATA_WFCLASS_FK1] FOREIGN KEY([idWfClass])
REFERENCES [dbo].[WFCLASS] ([idWfClass])
GO
ALTER TABLE [dbo].[BAWPQUERYPROCESSDATA] CHECK CONSTRAINT [BAWPQUERYPRDATA_WFCLASS_FK1]
GO
/****** Object:  ForeignKey [BAWPQUERYBDATA_BAWPQUERY_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAWPQUERYBUSINESSDATA]  WITH CHECK ADD  CONSTRAINT [BAWPQUERYBDATA_BAWPQUERY_FK1] FOREIGN KEY([idBAWPQuery])
REFERENCES [dbo].[BAWPQUERY] ([idBAWPQuery])
GO
ALTER TABLE [dbo].[BAWPQUERYBUSINESSDATA] CHECK CONSTRAINT [BAWPQUERYBDATA_BAWPQUERY_FK1]
GO
/****** Object:  ForeignKey [BAWPFOLDERCASE_BAWPFOLDER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAWPFOLDERCASE]  WITH CHECK ADD  CONSTRAINT [BAWPFOLDERCASE_BAWPFOLDER_FK1] FOREIGN KEY([idBAWPFolder])
REFERENCES [dbo].[BAWPFOLDER] ([idBAWPFolder])
GO
ALTER TABLE [dbo].[BAWPFOLDERCASE] CHECK CONSTRAINT [BAWPFOLDERCASE_BAWPFOLDER_FK1]
GO
/****** Object:  ForeignKey [BAWFCLASS_ATTRIB_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAWFCLASS_ENTITY]  WITH CHECK ADD  CONSTRAINT [BAWFCLASS_ATTRIB_FK1] FOREIGN KEY([idAttrib])
REFERENCES [dbo].[ATTRIB] ([idAttrib])
GO
ALTER TABLE [dbo].[BAWFCLASS_ENTITY] CHECK CONSTRAINT [BAWFCLASS_ATTRIB_FK1]
GO
/****** Object:  ForeignKey [BAWFCLASS_ENTITY_ENTITY_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAWFCLASS_ENTITY]  WITH CHECK ADD  CONSTRAINT [BAWFCLASS_ENTITY_ENTITY_FK1] FOREIGN KEY([idEnt])
REFERENCES [dbo].[ENTITY] ([idEnt])
GO
ALTER TABLE [dbo].[BAWFCLASS_ENTITY] CHECK CONSTRAINT [BAWFCLASS_ENTITY_ENTITY_FK1]
GO
/****** Object:  ForeignKey [BAWFCLASS_ENTITY_WFCLASS_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAWFCLASS_ENTITY]  WITH CHECK ADD  CONSTRAINT [BAWFCLASS_ENTITY_WFCLASS_FK1] FOREIGN KEY([idWfClass])
REFERENCES [dbo].[WFCLASS] ([idWfClass])
GO
ALTER TABLE [dbo].[BAWFCLASS_ENTITY] CHECK CONSTRAINT [BAWFCLASS_ENTITY_WFCLASS_FK1]
GO
/****** Object:  ForeignKey [BAUSRSTATS_CCASE_STATSCASE_FK2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAUSERSTATISTICS_CCASE]  WITH CHECK ADD  CONSTRAINT [BAUSRSTATS_CCASE_STATSCASE_FK2] FOREIGN KEY([idUSCase])
REFERENCES [dbo].[BAUSERSTATISTICS_CASE] ([idUSCase])
GO
ALTER TABLE [dbo].[BAUSERSTATISTICS_CCASE] CHECK CONSTRAINT [BAUSRSTATS_CCASE_STATSCASE_FK2]
GO
/****** Object:  ForeignKey [BAUSRSTATS_CCASE_WFCLASS_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAUSERSTATISTICS_CCASE]  WITH CHECK ADD  CONSTRAINT [BAUSRSTATS_CCASE_WFCLASS_FK1] FOREIGN KEY([idWFClass])
REFERENCES [dbo].[WFCLASS] ([idWfClass])
GO
ALTER TABLE [dbo].[BAUSERSTATISTICS_CCASE] CHECK CONSTRAINT [BAUSRSTATS_CCASE_WFCLASS_FK1]
GO
/****** Object:  ForeignKey [BARENDERDATA_LGLNG_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BARENDERDATA]  WITH NOCHECK ADD  CONSTRAINT [BARENDERDATA_LGLNG_FK1] FOREIGN KEY([idLanguage])
REFERENCES [dbo].[LGLANGUAGE] ([idLgLanguage])
GO
ALTER TABLE [dbo].[BARENDERDATA] CHECK CONSTRAINT [BARENDERDATA_LGLNG_FK1]
GO
/****** Object:  ForeignKey [BARENDERDATA_WFCLASS_FK2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BARENDERDATA]  WITH CHECK ADD  CONSTRAINT [BARENDERDATA_WFCLASS_FK2] FOREIGN KEY([idWfClass])
REFERENCES [dbo].[WFCLASS] ([idWfClass])
GO
ALTER TABLE [dbo].[BARENDERDATA] CHECK CONSTRAINT [BARENDERDATA_WFCLASS_FK2]
GO
/****** Object:  ForeignKey [BAUSERWFCLASS_ORG_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAUSERDEFAULTWFCLASS]  WITH CHECK ADD  CONSTRAINT [BAUSERWFCLASS_ORG_FK1] FOREIGN KEY([idOrganization])
REFERENCES [dbo].[ORG] ([idOrg])
GO
ALTER TABLE [dbo].[BAUSERDEFAULTWFCLASS] CHECK CONSTRAINT [BAUSERWFCLASS_ORG_FK1]
GO
/****** Object:  ForeignKey [BAUSERWFCLASS_WFCLASS_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAUSERDEFAULTWFCLASS]  WITH CHECK ADD  CONSTRAINT [BAUSERWFCLASS_WFCLASS_FK1] FOREIGN KEY([idWfClass])
REFERENCES [dbo].[WFCLASS] ([idWfClass])
GO
ALTER TABLE [dbo].[BAUSERDEFAULTWFCLASS] CHECK CONSTRAINT [BAUSERWFCLASS_WFCLASS_FK1]
GO
/****** Object:  ForeignKey [BAUSERWFCLASS_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAUSERDEFAULTWFCLASS]  WITH CHECK ADD  CONSTRAINT [BAUSERWFCLASS_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[BAUSERDEFAULTWFCLASS] CHECK CONSTRAINT [BAUSERWFCLASS_WFUSER_FK1]
GO
/****** Object:  ForeignKey [ATTRIBLOG_ENTITYLOG_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ATTRIBLOG]  WITH CHECK ADD  CONSTRAINT [ATTRIBLOG_ENTITYLOG_FK1] FOREIGN KEY([idEntityLog])
REFERENCES [dbo].[ENTITYLOG] ([idEntityLog])
GO
ALTER TABLE [dbo].[ATTRIBLOG] CHECK CONSTRAINT [ATTRIBLOG_ENTITYLOG_FK1]
GO
/****** Object:  ForeignKey [ATTRIBCHARLOG_ENTITYLOG_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ATTRIBCHARLOG]  WITH CHECK ADD  CONSTRAINT [ATTRIBCHARLOG_ENTITYLOG_FK1] FOREIGN KEY([idEntityLog])
REFERENCES [dbo].[ENTITYLOG] ([idEntityLog])
GO
ALTER TABLE [dbo].[ATTRIBCHARLOG] CHECK CONSTRAINT [ATTRIBCHARLOG_ENTITYLOG_FK1]
GO
/****** Object:  ForeignKey [RENDERACTIONTARGET_RENDERA_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[RENDERACTIONTARGET]  WITH CHECK ADD  CONSTRAINT [RENDERACTIONTARGET_RENDERA_FK1] FOREIGN KEY([idRenderAction])
REFERENCES [dbo].[RENDERACTION] ([idRenderAction])
GO
ALTER TABLE [dbo].[RENDERACTIONTARGET] CHECK CONSTRAINT [RENDERACTIONTARGET_RENDERA_FK1]
GO
/****** Object:  ForeignKey [JOBSCHEDULE_JOB_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[JOBSCHEDULE]  WITH CHECK ADD  CONSTRAINT [JOBSCHEDULE_JOB_FK1] FOREIGN KEY([idJob])
REFERENCES [dbo].[JOB] ([idJob])
GO
ALTER TABLE [dbo].[JOBSCHEDULE] CHECK CONSTRAINT [JOBSCHEDULE_JOB_FK1]
GO
/****** Object:  ForeignKey [JOBSCHEDULE_JOBSCHFREQUENC_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[JOBSCHEDULE]  WITH CHECK ADD  CONSTRAINT [JOBSCHEDULE_JOBSCHFREQUENC_FK1] FOREIGN KEY([idJobSchFrequency])
REFERENCES [dbo].[JOBSCHFREQUENCY] ([idJobSchFrequency])
GO
ALTER TABLE [dbo].[JOBSCHEDULE] CHECK CONSTRAINT [JOBSCHEDULE_JOBSCHFREQUENC_FK1]
GO
/****** Object:  ForeignKey [JOBSCHEDULE_SCHTYPE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[JOBSCHEDULE]  WITH CHECK ADD  CONSTRAINT [JOBSCHEDULE_SCHTYPE_FK1] FOREIGN KEY([idSchType])
REFERENCES [dbo].[SCHTYPE] ([idSchType])
GO
ALTER TABLE [dbo].[JOBSCHEDULE] CHECK CONSTRAINT [JOBSCHEDULE_SCHTYPE_FK1]
GO
/****** Object:  ForeignKey [JOBSCHEDULE_WEEKDAY_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[JOBSCHEDULE]  WITH CHECK ADD  CONSTRAINT [JOBSCHEDULE_WEEKDAY_FK1] FOREIGN KEY([idMonthlyWeekday])
REFERENCES [dbo].[WEEKDAY] ([idWeekDay])
GO
ALTER TABLE [dbo].[JOBSCHEDULE] CHECK CONSTRAINT [JOBSCHEDULE_WEEKDAY_FK1]
GO
/****** Object:  ForeignKey [JOBRUNNING_JOB_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[JOBRUNNING]  WITH CHECK ADD  CONSTRAINT [JOBRUNNING_JOB_FK1] FOREIGN KEY([idJob])
REFERENCES [dbo].[JOB] ([idJob])
GO
ALTER TABLE [dbo].[JOBRUNNING] CHECK CONSTRAINT [JOBRUNNING_JOB_FK1]
GO
/****** Object:  ForeignKey [JOBLOG_JOB_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[JOBLOG]  WITH CHECK ADD  CONSTRAINT [JOBLOG_JOB_FK1] FOREIGN KEY([idJob])
REFERENCES [dbo].[JOB] ([idJob])
GO
ALTER TABLE [dbo].[JOBLOG] CHECK CONSTRAINT [JOBLOG_JOB_FK1]
GO
/****** Object:  ForeignKey [JOBSTEP_JOB_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[JOBSTEP]  WITH CHECK ADD  CONSTRAINT [JOBSTEP_JOB_FK1] FOREIGN KEY([idJob])
REFERENCES [dbo].[JOB] ([idJob])
GO
ALTER TABLE [dbo].[JOBSTEP] CHECK CONSTRAINT [JOBSTEP_JOB_FK1]
GO
/****** Object:  ForeignKey [JOBSTEP_ONENDSTEP_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[JOBSTEP]  WITH CHECK ADD  CONSTRAINT [JOBSTEP_ONENDSTEP_FK1] FOREIGN KEY([OnStepFailure])
REFERENCES [dbo].[ONENDSTEP] ([idOnEndStep])
GO
ALTER TABLE [dbo].[JOBSTEP] CHECK CONSTRAINT [JOBSTEP_ONENDSTEP_FK1]
GO
/****** Object:  ForeignKey [JOBSTEP_ONENDSTEP_FK2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[JOBSTEP]  WITH CHECK ADD  CONSTRAINT [JOBSTEP_ONENDSTEP_FK2] FOREIGN KEY([OnStepSuccess])
REFERENCES [dbo].[ONENDSTEP] ([idOnEndStep])
GO
ALTER TABLE [dbo].[JOBSTEP] CHECK CONSTRAINT [JOBSTEP_ONENDSTEP_FK2]
GO
/****** Object:  ForeignKey [GRUSERDIMENSION_WFCLASS_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[GRUSERDIMENSION]  WITH CHECK ADD  CONSTRAINT [GRUSERDIMENSION_WFCLASS_FK1] FOREIGN KEY([idWfClass])
REFERENCES [dbo].[WFCLASS] ([idWfClass])
GO
ALTER TABLE [dbo].[GRUSERDIMENSION] CHECK CONSTRAINT [GRUSERDIMENSION_WFCLASS_FK1]
GO
/****** Object:  ForeignKey [GRUSERDIMENSION_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[GRUSERDIMENSION]  WITH CHECK ADD  CONSTRAINT [GRUSERDIMENSION_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[GRUSERDIMENSION] CHECK CONSTRAINT [GRUSERDIMENSION_WFUSER_FK1]
GO
/****** Object:  ForeignKey [FUNCTIONALAREAPOSITION_FUN_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[FUNCTIONALAREAPOSITION]  WITH CHECK ADD  CONSTRAINT [FUNCTIONALAREAPOSITION_FUN_FK1] FOREIGN KEY([idFunctionalArea])
REFERENCES [dbo].[FUNCTIONALAREA] ([idFunctionalArea])
GO
ALTER TABLE [dbo].[FUNCTIONALAREAPOSITION] CHECK CONSTRAINT [FUNCTIONALAREAPOSITION_FUN_FK1]
GO
/****** Object:  ForeignKey [FUNCTIONALAREAPOSITION_WOR_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[FUNCTIONALAREAPOSITION]  WITH CHECK ADD  CONSTRAINT [FUNCTIONALAREAPOSITION_WOR_FK1] FOREIGN KEY([idWorkflow])
REFERENCES [dbo].[WORKFLOW] ([idWorkflow])
GO
ALTER TABLE [dbo].[FUNCTIONALAREAPOSITION] CHECK CONSTRAINT [FUNCTIONALAREAPOSITION_WOR_FK1]
GO
/****** Object:  ForeignKey [PHASE_PHASETYPE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[PHASE]  WITH CHECK ADD  CONSTRAINT [PHASE_PHASETYPE_FK1] FOREIGN KEY([idPhaseType])
REFERENCES [dbo].[PHASETYPE] ([idPhaseType])
GO
ALTER TABLE [dbo].[PHASE] CHECK CONSTRAINT [PHASE_PHASETYPE_FK1]
GO
/****** Object:  ForeignKey [PHASE_WORKFLOW_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[PHASE]  WITH CHECK ADD  CONSTRAINT [PHASE_WORKFLOW_FK1] FOREIGN KEY([idWorkflow])
REFERENCES [dbo].[WORKFLOW] ([idWorkflow])
GO
ALTER TABLE [dbo].[PHASE] CHECK CONSTRAINT [PHASE_WORKFLOW_FK1]
GO
/****** Object:  ForeignKey [BAMACROWIZARD_APP_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAMACROWIZARD]  WITH CHECK ADD  CONSTRAINT [BAMACROWIZARD_APP_FK1] FOREIGN KEY([idApplication])
REFERENCES [dbo].[APPLICATION] ([idApplication])
GO
ALTER TABLE [dbo].[BAMACROWIZARD] CHECK CONSTRAINT [BAMACROWIZARD_APP_FK1]
GO
/****** Object:  ForeignKey [BAMACROWIZARD_WF_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAMACROWIZARD]  WITH CHECK ADD  CONSTRAINT [BAMACROWIZARD_WF_FK1] FOREIGN KEY([idWorkflow])
REFERENCES [dbo].[WORKFLOW] ([idWorkflow])
GO
ALTER TABLE [dbo].[BAMACROWIZARD] CHECK CONSTRAINT [BAMACROWIZARD_WF_FK1]
GO
/****** Object:  ForeignKey [BAEXTATTVALUE_WORKFLOW_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAEXTATTVALUE]  WITH CHECK ADD  CONSTRAINT [BAEXTATTVALUE_WORKFLOW_FK1] FOREIGN KEY([idWorkflow])
REFERENCES [dbo].[WORKFLOW] ([idWorkflow])
GO
ALTER TABLE [dbo].[BAEXTATTVALUE] CHECK CONSTRAINT [BAEXTATTVALUE_WORKFLOW_FK1]
GO
/****** Object:  ForeignKey [COLPROCESS_COLDIAGRAM_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BACOLLABPROCESS]  WITH CHECK ADD  CONSTRAINT [COLPROCESS_COLDIAGRAM_FK1] FOREIGN KEY([idCollabDiagram])
REFERENCES [dbo].[BACOLLABDIAGRAM] ([idCollabDiagram])
GO
ALTER TABLE [dbo].[BACOLLABPROCESS] CHECK CONSTRAINT [COLPROCESS_COLDIAGRAM_FK1]
GO
/****** Object:  ForeignKey [COLPROCESS_WORKFLOW_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BACOLLABPROCESS]  WITH CHECK ADD  CONSTRAINT [COLPROCESS_WORKFLOW_FK1] FOREIGN KEY([idCollabWorkflow])
REFERENCES [dbo].[WORKFLOW] ([idWorkflow])
GO
ALTER TABLE [dbo].[BACOLLABPROCESS] CHECK CONSTRAINT [COLPROCESS_WORKFLOW_FK1]
GO
/****** Object:  ForeignKey [ALARMJOBLOG_JOBLOG_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ALARMJOBLOG]  WITH CHECK ADD  CONSTRAINT [ALARMJOBLOG_JOBLOG_FK1] FOREIGN KEY([idJobLog])
REFERENCES [dbo].[JOBLOG] ([idJobLog])
GO
ALTER TABLE [dbo].[ALARMJOBLOG] CHECK CONSTRAINT [ALARMJOBLOG_JOBLOG_FK1]
GO
/****** Object:  ForeignKey [BAPRESACTION_WORKFLOW_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAPRESACTION]  WITH CHECK ADD  CONSTRAINT [BAPRESACTION_WORKFLOW_FK1] FOREIGN KEY([idWorkflow])
REFERENCES [dbo].[WORKFLOW] ([idWorkflow])
GO
ALTER TABLE [dbo].[BAPRESACTION] CHECK CONSTRAINT [BAPRESACTION_WORKFLOW_FK1]
GO
/****** Object:  ForeignKey [BAOFFRENDER_OFFCHG_FK2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAOFFRENDER]  WITH CHECK ADD  CONSTRAINT [BAOFFRENDER_OFFCHG_FK2] FOREIGN KEY([idBaOfflineChangeSet])
REFERENCES [dbo].[BAOFFLINECHANGESET] ([idBaOfflineChangeSet])
GO
ALTER TABLE [dbo].[BAOFFRENDER] CHECK CONSTRAINT [BAOFFRENDER_OFFCHG_FK2]
GO
/****** Object:  ForeignKey [BAOFFRENDER_RNDDTA_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BAOFFRENDER]  WITH CHECK ADD  CONSTRAINT [BAOFFRENDER_RNDDTA_FK1] FOREIGN KEY([idBaRenderData])
REFERENCES [dbo].[BARENDERDATA] ([idBaRenderData])
GO
ALTER TABLE [dbo].[BAOFFRENDER] CHECK CONSTRAINT [BAOFFRENDER_RNDDTA_FK1]
GO
/****** Object:  ForeignKey [CASEPATH_WORKFLOW_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[CASEPATH]  WITH CHECK ADD  CONSTRAINT [CASEPATH_WORKFLOW_FK1] FOREIGN KEY([idWorkflow])
REFERENCES [dbo].[WORKFLOW] ([idWorkflow])
GO
ALTER TABLE [dbo].[CASEPATH] CHECK CONSTRAINT [CASEPATH_WORKFLOW_FK1]
GO
/****** Object:  ForeignKey [BIZLETTERBINDING_WORKFLOW_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BIZLETTERBINDING]  WITH CHECK ADD  CONSTRAINT [BIZLETTERBINDING_WORKFLOW_FK1] FOREIGN KEY([idWorkflow])
REFERENCES [dbo].[WORKFLOW] ([idWorkflow])
GO
ALTER TABLE [dbo].[BIZLETTERBINDING] CHECK CONSTRAINT [BIZLETTERBINDING_WORKFLOW_FK1]
GO
/****** Object:  ForeignKey [TASK_ATTRIB_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK]  WITH CHECK ADD  CONSTRAINT [TASK_ATTRIB_FK1] FOREIGN KEY([idMultiInstanceGroupByAttrib])
REFERENCES [dbo].[ATTRIB] ([idAttrib])
GO
ALTER TABLE [dbo].[TASK] CHECK CONSTRAINT [TASK_ATTRIB_FK1]
GO
/****** Object:  ForeignKey [TASK_BAERRORCODE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK]  WITH CHECK ADD  CONSTRAINT [TASK_BAERRORCODE_FK1] FOREIGN KEY([idErrorCode])
REFERENCES [dbo].[BAERRORCODE] ([idErrorCode])
GO
ALTER TABLE [dbo].[TASK] CHECK CONSTRAINT [TASK_BAERRORCODE_FK1]
GO
/****** Object:  ForeignKey [TASK_FACT_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK]  WITH CHECK ADD  CONSTRAINT [TASK_FACT_FK1] FOREIGN KEY([idMultiInstanceFact])
REFERENCES [dbo].[FACT] ([idFact])
GO
ALTER TABLE [dbo].[TASK] CHECK CONSTRAINT [TASK_FACT_FK1]
GO
/****** Object:  ForeignKey [TASK_FUNCTIONALAREA_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK]  WITH CHECK ADD  CONSTRAINT [TASK_FUNCTIONALAREA_FK1] FOREIGN KEY([idFunctionalArea])
REFERENCES [dbo].[FUNCTIONALAREA] ([idFunctionalArea])
GO
ALTER TABLE [dbo].[TASK] CHECK CONSTRAINT [TASK_FUNCTIONALAREA_FK1]
GO
/****** Object:  ForeignKey [TASK_MIPROPERTY_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK]  WITH CHECK ADD  CONSTRAINT [TASK_MIPROPERTY_FK1] FOREIGN KEY([idMultiInstanceProperty])
REFERENCES [dbo].[BAMULTIINSTANCEPROPERTY] ([idMultiInstanceProperty])
GO
ALTER TABLE [dbo].[TASK] CHECK CONSTRAINT [TASK_MIPROPERTY_FK1]
GO
/****** Object:  ForeignKey [TASK_MULTIINSTANCEEXITMODE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK]  WITH CHECK ADD  CONSTRAINT [TASK_MULTIINSTANCEEXITMODE_FK1] FOREIGN KEY([idMultiInstanceExitMode])
REFERENCES [dbo].[MULTIINSTANCEEXITMODE] ([idMultiInstanceExitMode])
GO
ALTER TABLE [dbo].[TASK] CHECK CONSTRAINT [TASK_MULTIINSTANCEEXITMODE_FK1]
GO
/****** Object:  ForeignKey [TASK_PHASE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK]  WITH CHECK ADD  CONSTRAINT [TASK_PHASE_FK1] FOREIGN KEY([idPhase])
REFERENCES [dbo].[PHASE] ([idPhase])
GO
ALTER TABLE [dbo].[TASK] CHECK CONSTRAINT [TASK_PHASE_FK1]
GO
/****** Object:  ForeignKey [TASK_SUBPROCMAPPINGTYPE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK]  WITH CHECK ADD  CONSTRAINT [TASK_SUBPROCMAPPINGTYPE_FK1] FOREIGN KEY([idSubProcMappingTypeI])
REFERENCES [dbo].[SUBPROCMAPPINGTYPE] ([idSubProcMappingType])
GO
ALTER TABLE [dbo].[TASK] CHECK CONSTRAINT [TASK_SUBPROCMAPPINGTYPE_FK1]
GO
/****** Object:  ForeignKey [TASK_SUBPROCMAPPINGTYPE_FK2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK]  WITH CHECK ADD  CONSTRAINT [TASK_SUBPROCMAPPINGTYPE_FK2] FOREIGN KEY([idSubProcMappingTypeO])
REFERENCES [dbo].[SUBPROCMAPPINGTYPE] ([idSubProcMappingType])
GO
ALTER TABLE [dbo].[TASK] CHECK CONSTRAINT [TASK_SUBPROCMAPPINGTYPE_FK2]
GO
/****** Object:  ForeignKey [TASK_TASK_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK]  WITH CHECK ADD  CONSTRAINT [TASK_TASK_FK1] FOREIGN KEY([idTaskToSync])
REFERENCES [dbo].[TASK] ([idTask])
GO
ALTER TABLE [dbo].[TASK] CHECK CONSTRAINT [TASK_TASK_FK1]
GO
/****** Object:  ForeignKey [TASK_TASK_FK2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK]  WITH CHECK ADD  CONSTRAINT [TASK_TASK_FK2] FOREIGN KEY([idCompensationTargetTask])
REFERENCES [dbo].[TASK] ([idTask])
GO
ALTER TABLE [dbo].[TASK] CHECK CONSTRAINT [TASK_TASK_FK2]
GO
/****** Object:  ForeignKey [TASK_TASK_FK3]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK]  WITH CHECK ADD  CONSTRAINT [TASK_TASK_FK3] FOREIGN KEY([idTaskLinkTo])
REFERENCES [dbo].[TASK] ([idTask])
GO
ALTER TABLE [dbo].[TASK] CHECK CONSTRAINT [TASK_TASK_FK3]
GO
/****** Object:  ForeignKey [TASK_TASK_FK4]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK]  WITH CHECK ADD  CONSTRAINT [TASK_TASK_FK4] FOREIGN KEY([idTaskLinkFrom])
REFERENCES [dbo].[TASK] ([idTask])
GO
ALTER TABLE [dbo].[TASK] CHECK CONSTRAINT [TASK_TASK_FK4]
GO
/****** Object:  ForeignKey [TASK_TASKSUBTYPE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK]  WITH CHECK ADD  CONSTRAINT [TASK_TASKSUBTYPE_FK1] FOREIGN KEY([idTaskSubType])
REFERENCES [dbo].[TASKSUBTYPE] ([idTaskSubType])
GO
ALTER TABLE [dbo].[TASK] CHECK CONSTRAINT [TASK_TASKSUBTYPE_FK1]
GO
/****** Object:  ForeignKey [TASK_TASKTYPE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK]  WITH CHECK ADD  CONSTRAINT [TASK_TASKTYPE_FK1] FOREIGN KEY([idTaskType])
REFERENCES [dbo].[TASKTYPE] ([idTaskType])
GO
ALTER TABLE [dbo].[TASK] CHECK CONSTRAINT [TASK_TASKTYPE_FK1]
GO
/****** Object:  ForeignKey [TASK_WFCLASS_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK]  WITH CHECK ADD  CONSTRAINT [TASK_WFCLASS_FK1] FOREIGN KEY([idSubWfClass])
REFERENCES [dbo].[WFCLASS] ([idWfClass])
GO
ALTER TABLE [dbo].[TASK] CHECK CONSTRAINT [TASK_WFCLASS_FK1]
GO
/****** Object:  ForeignKey [TASK_WORKFLOW_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK]  WITH CHECK ADD  CONSTRAINT [TASK_WORKFLOW_FK1] FOREIGN KEY([idSubWorkflow])
REFERENCES [dbo].[WORKFLOW] ([idWorkflow])
GO
ALTER TABLE [dbo].[TASK] CHECK CONSTRAINT [TASK_WORKFLOW_FK1]
GO
/****** Object:  ForeignKey [TASK_WORKFLOW_FK2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TASK]  WITH CHECK ADD  CONSTRAINT [TASK_WORKFLOW_FK2] FOREIGN KEY([idWorkflow])
REFERENCES [dbo].[WORKFLOW] ([idWorkflow])
GO
ALTER TABLE [dbo].[TASK] CHECK CONSTRAINT [TASK_WORKFLOW_FK2]
GO
/****** Object:  ForeignKey [LETTERCONDITION_BINDING_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BIZLETTERCONDITION]  WITH CHECK ADD  CONSTRAINT [LETTERCONDITION_BINDING_FK1] FOREIGN KEY([idBizLetterBinding])
REFERENCES [dbo].[BIZLETTERBINDING] ([idBizLetterBinding])
GO
ALTER TABLE [dbo].[BIZLETTERCONDITION] CHECK CONSTRAINT [LETTERCONDITION_BINDING_FK1]
GO
/****** Object:  ForeignKey [LETTERCONDITION_BIZLETTER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[BIZLETTERCONDITION]  WITH CHECK ADD  CONSTRAINT [LETTERCONDITION_BIZLETTER_FK1] FOREIGN KEY([idBizLetter])
REFERENCES [dbo].[BIZLETTER] ([idBizLetter])
GO
ALTER TABLE [dbo].[BIZLETTERCONDITION] CHECK CONSTRAINT [LETTERCONDITION_BIZLETTER_FK1]
GO
/****** Object:  ForeignKey [EXCEPTIONTRANSITION_TASK_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[EXCEPTIONTRANSITION]  WITH CHECK ADD  CONSTRAINT [EXCEPTIONTRANSITION_TASK_FK1] FOREIGN KEY([idTaskFrom])
REFERENCES [dbo].[TASK] ([idTask])
GO
ALTER TABLE [dbo].[EXCEPTIONTRANSITION] CHECK CONSTRAINT [EXCEPTIONTRANSITION_TASK_FK1]
GO
/****** Object:  ForeignKey [EXCEPTIONTRANSITION_TASK_FK2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[EXCEPTIONTRANSITION]  WITH CHECK ADD  CONSTRAINT [EXCEPTIONTRANSITION_TASK_FK2] FOREIGN KEY([idTaskTo])
REFERENCES [dbo].[TASK] ([idTask])
GO
ALTER TABLE [dbo].[EXCEPTIONTRANSITION] CHECK CONSTRAINT [EXCEPTIONTRANSITION_TASK_FK2]
GO
/****** Object:  ForeignKey [EXCEPTIONTRANSITION_WORKFL_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[EXCEPTIONTRANSITION]  WITH CHECK ADD  CONSTRAINT [EXCEPTIONTRANSITION_WORKFL_FK1] FOREIGN KEY([idWorkflow])
REFERENCES [dbo].[WORKFLOW] ([idWorkflow])
GO
ALTER TABLE [dbo].[EXCEPTIONTRANSITION] CHECK CONSTRAINT [EXCEPTIONTRANSITION_WORKFL_FK1]
GO
/****** Object:  ForeignKey [ALARM_ALARMLAPSEMODE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ALARM]  WITH CHECK ADD  CONSTRAINT [ALARM_ALARMLAPSEMODE_FK1] FOREIGN KEY([idLapseMode])
REFERENCES [dbo].[ALARMLAPSEMODE] ([idLapseMode])
GO
ALTER TABLE [dbo].[ALARM] CHECK CONSTRAINT [ALARM_ALARMLAPSEMODE_FK1]
GO
/****** Object:  ForeignKey [ALARM_ALARMRECURMODE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ALARM]  WITH CHECK ADD  CONSTRAINT [ALARM_ALARMRECURMODE_FK1] FOREIGN KEY([idAlarmRecurMode])
REFERENCES [dbo].[ALARMRECURMODE] ([idAlarmRecurMode])
GO
ALTER TABLE [dbo].[ALARM] CHECK CONSTRAINT [ALARM_ALARMRECURMODE_FK1]
GO
/****** Object:  ForeignKey [ALARM_ALARMSENDMODE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ALARM]  WITH CHECK ADD  CONSTRAINT [ALARM_ALARMSENDMODE_FK1] FOREIGN KEY([idAlarmSendMode])
REFERENCES [dbo].[ALARMSENDMODE] ([idAlarmSendMode])
GO
ALTER TABLE [dbo].[ALARM] CHECK CONSTRAINT [ALARM_ALARMSENDMODE_FK1]
GO
/****** Object:  ForeignKey [ALARM_SCHTYPE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ALARM]  WITH CHECK ADD  CONSTRAINT [ALARM_SCHTYPE_FK1] FOREIGN KEY([idRecurrSchType])
REFERENCES [dbo].[SCHTYPE] ([idSchType])
GO
ALTER TABLE [dbo].[ALARM] CHECK CONSTRAINT [ALARM_SCHTYPE_FK1]
GO
/****** Object:  ForeignKey [ALARM_TASK_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ALARM]  WITH CHECK ADD  CONSTRAINT [ALARM_TASK_FK1] FOREIGN KEY([idTask])
REFERENCES [dbo].[TASK] ([idTask])
GO
ALTER TABLE [dbo].[ALARM] CHECK CONSTRAINT [ALARM_TASK_FK1]
GO
/****** Object:  ForeignKey [ALARM_WORKFLOW_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ALARM]  WITH CHECK ADD  CONSTRAINT [ALARM_WORKFLOW_FK1] FOREIGN KEY([idWorkflow])
REFERENCES [dbo].[WORKFLOW] ([idWorkflow])
GO
ALTER TABLE [dbo].[ALARM] CHECK CONSTRAINT [ALARM_WORKFLOW_FK1]
GO
/****** Object:  ForeignKey [ASYNCHWORKITEM_TASK_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ASYNCHWORKITEM]  WITH CHECK ADD  CONSTRAINT [ASYNCHWORKITEM_TASK_FK1] FOREIGN KEY([idTask])
REFERENCES [dbo].[TASK] ([idTask])
GO
ALTER TABLE [dbo].[ASYNCHWORKITEM] CHECK CONSTRAINT [ASYNCHWORKITEM_TASK_FK1]
GO
/****** Object:  ForeignKey [SECUENTIALASSIG_TASK_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[SECUENTIALASSIG]  WITH CHECK ADD  CONSTRAINT [SECUENTIALASSIG_TASK_FK1] FOREIGN KEY([idTask])
REFERENCES [dbo].[TASK] ([idTask])
GO
ALTER TABLE [dbo].[SECUENTIALASSIG] CHECK CONSTRAINT [SECUENTIALASSIG_TASK_FK1]
GO
/****** Object:  ForeignKey [SECUENTIALASSIG_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[SECUENTIALASSIG]  WITH CHECK ADD  CONSTRAINT [SECUENTIALASSIG_WFUSER_FK1] FOREIGN KEY([idLastUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[SECUENTIALASSIG] CHECK CONSTRAINT [SECUENTIALASSIG_WFUSER_FK1]
GO
/****** Object:  ForeignKey [GRCUSTOMPHASE_TASK_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[GRCUSTOMPHASE]  WITH CHECK ADD  CONSTRAINT [GRCUSTOMPHASE_TASK_FK1] FOREIGN KEY([idTaskFrom])
REFERENCES [dbo].[TASK] ([idTask])
GO
ALTER TABLE [dbo].[GRCUSTOMPHASE] CHECK CONSTRAINT [GRCUSTOMPHASE_TASK_FK1]
GO
/****** Object:  ForeignKey [GRCUSTOMPHASE_TASK_FK2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[GRCUSTOMPHASE]  WITH CHECK ADD  CONSTRAINT [GRCUSTOMPHASE_TASK_FK2] FOREIGN KEY([idTaskTo])
REFERENCES [dbo].[TASK] ([idTask])
GO
ALTER TABLE [dbo].[GRCUSTOMPHASE] CHECK CONSTRAINT [GRCUSTOMPHASE_TASK_FK2]
GO
/****** Object:  ForeignKey [GRCUSTOMPHASE_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[GRCUSTOMPHASE]  WITH CHECK ADD  CONSTRAINT [GRCUSTOMPHASE_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[GRCUSTOMPHASE] CHECK CONSTRAINT [GRCUSTOMPHASE_WFUSER_FK1]
GO
/****** Object:  ForeignKey [GRCOUNTER_TASK_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[GRCOUNTER]  WITH CHECK ADD  CONSTRAINT [GRCOUNTER_TASK_FK1] FOREIGN KEY([idTask])
REFERENCES [dbo].[TASK] ([idTask])
GO
ALTER TABLE [dbo].[GRCOUNTER] CHECK CONSTRAINT [GRCOUNTER_TASK_FK1]
GO
/****** Object:  ForeignKey [GRCOUNTER_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[GRCOUNTER]  WITH CHECK ADD  CONSTRAINT [GRCOUNTER_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[GRCOUNTER] CHECK CONSTRAINT [GRCOUNTER_WFUSER_FK1]
GO
/****** Object:  ForeignKey [PROCESSTRIGREG_TASK_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[PROCESSTRIGGERREGISTER]  WITH CHECK ADD  CONSTRAINT [PROCESSTRIGREG_TASK_FK1] FOREIGN KEY([idTask])
REFERENCES [dbo].[TASK] ([idTask])
GO
ALTER TABLE [dbo].[PROCESSTRIGGERREGISTER] CHECK CONSTRAINT [PROCESSTRIGREG_TASK_FK1]
GO
/****** Object:  ForeignKey [SUBPROCMAPPING_TASK_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[SUBPROCMAPPING]  WITH CHECK ADD  CONSTRAINT [SUBPROCMAPPING_TASK_FK1] FOREIGN KEY([idTask])
REFERENCES [dbo].[TASK] ([idTask])
GO
ALTER TABLE [dbo].[SUBPROCMAPPING] CHECK CONSTRAINT [SUBPROCMAPPING_TASK_FK1]
GO
/****** Object:  ForeignKey [TRANSITION_BAERRORCODE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TRANSITION]  WITH CHECK ADD  CONSTRAINT [TRANSITION_BAERRORCODE_FK1] FOREIGN KEY([idErrorCode])
REFERENCES [dbo].[BAERRORCODE] ([idErrorCode])
GO
ALTER TABLE [dbo].[TRANSITION] CHECK CONSTRAINT [TRANSITION_BAERRORCODE_FK1]
GO
/****** Object:  ForeignKey [TRANSITION_TASK_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TRANSITION]  WITH CHECK ADD  CONSTRAINT [TRANSITION_TASK_FK1] FOREIGN KEY([idTaskFrom])
REFERENCES [dbo].[TASK] ([idTask])
GO
ALTER TABLE [dbo].[TRANSITION] CHECK CONSTRAINT [TRANSITION_TASK_FK1]
GO
/****** Object:  ForeignKey [TRANSITION_TASK_FK2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TRANSITION]  WITH CHECK ADD  CONSTRAINT [TRANSITION_TASK_FK2] FOREIGN KEY([idTaskTo])
REFERENCES [dbo].[TASK] ([idTask])
GO
ALTER TABLE [dbo].[TRANSITION] CHECK CONSTRAINT [TRANSITION_TASK_FK2]
GO
/****** Object:  ForeignKey [TRANSITION_TRANSITIONTYPE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TRANSITION]  WITH CHECK ADD  CONSTRAINT [TRANSITION_TRANSITIONTYPE_FK1] FOREIGN KEY([idTransitionType])
REFERENCES [dbo].[TRANSITIONTYPE] ([idTransitionType])
GO
ALTER TABLE [dbo].[TRANSITION] CHECK CONSTRAINT [TRANSITION_TRANSITIONTYPE_FK1]
GO
/****** Object:  ForeignKey [TRANSITION_WORKFLOW_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TRANSITION]  WITH NOCHECK ADD  CONSTRAINT [TRANSITION_WORKFLOW_FK1] FOREIGN KEY([idWorkflow])
REFERENCES [dbo].[WORKFLOW] ([idWorkflow])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[TRANSITION] CHECK CONSTRAINT [TRANSITION_WORKFLOW_FK1]
GO
/****** Object:  ForeignKey [WFCASE_CASEPATH_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCASE]  WITH CHECK ADD  CONSTRAINT [WFCASE_CASEPATH_FK1] FOREIGN KEY([idCasePath])
REFERENCES [dbo].[CASEPATH] ([idCasePath])
GO
ALTER TABLE [dbo].[WFCASE] CHECK CONSTRAINT [WFCASE_CASEPATH_FK1]
GO
/****** Object:  ForeignKey [WFCASE_CASESTATE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCASE]  WITH CHECK ADD  CONSTRAINT [WFCASE_CASESTATE_FK1] FOREIGN KEY([idCaseState])
REFERENCES [dbo].[CASESTATE] ([idCaseState])
GO
ALTER TABLE [dbo].[WFCASE] CHECK CONSTRAINT [WFCASE_CASESTATE_FK1]
GO
/****** Object:  ForeignKey [WFCASE_ORG_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCASE]  WITH CHECK ADD  CONSTRAINT [WFCASE_ORG_FK1] FOREIGN KEY([idOrg])
REFERENCES [dbo].[ORG] ([idOrg])
GO
ALTER TABLE [dbo].[WFCASE] CHECK CONSTRAINT [WFCASE_ORG_FK1]
GO
/****** Object:  ForeignKey [WFCASE_SUBPROCTYPE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCASE]  WITH CHECK ADD  CONSTRAINT [WFCASE_SUBPROCTYPE_FK1] FOREIGN KEY([idSubProcType])
REFERENCES [dbo].[SUBPROCTYPE] ([idSubProcType])
GO
ALTER TABLE [dbo].[WFCASE] CHECK CONSTRAINT [WFCASE_SUBPROCTYPE_FK1]
GO
/****** Object:  ForeignKey [WFCASE_TASK_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCASE]  WITH CHECK ADD  CONSTRAINT [WFCASE_TASK_FK1] FOREIGN KEY([idParentTask])
REFERENCES [dbo].[TASK] ([idTask])
GO
ALTER TABLE [dbo].[WFCASE] CHECK CONSTRAINT [WFCASE_TASK_FK1]
GO
/****** Object:  ForeignKey [WFCASE_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCASE]  WITH CHECK ADD  CONSTRAINT [WFCASE_WFUSER_FK1] FOREIGN KEY([idCaseManager])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[WFCASE] CHECK CONSTRAINT [WFCASE_WFUSER_FK1]
GO
/****** Object:  ForeignKey [WFCASE_WFUSER_FK2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCASE]  WITH CHECK ADD  CONSTRAINT [WFCASE_WFUSER_FK2] FOREIGN KEY([idCreatorUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[WFCASE] CHECK CONSTRAINT [WFCASE_WFUSER_FK2]
GO
/****** Object:  ForeignKey [WFCASE_WORKFLOW_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WFCASE]  WITH CHECK ADD  CONSTRAINT [WFCASE_WORKFLOW_FK1] FOREIGN KEY([idWorkflow])
REFERENCES [dbo].[WORKFLOW] ([idWorkflow])
GO
ALTER TABLE [dbo].[WFCASE] CHECK CONSTRAINT [WFCASE_WORKFLOW_FK1]
GO
/****** Object:  ForeignKey [WORKITEM_TASK_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WORKITEM]  WITH CHECK ADD  CONSTRAINT [WORKITEM_TASK_FK1] FOREIGN KEY([idTask])
REFERENCES [dbo].[TASK] ([idTask])
GO
ALTER TABLE [dbo].[WORKITEM] CHECK CONSTRAINT [WORKITEM_TASK_FK1]
GO
/****** Object:  ForeignKey [WORKITEM_WFCASE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WORKITEM]  WITH CHECK ADD  CONSTRAINT [WORKITEM_WFCASE_FK1] FOREIGN KEY([idCase])
REFERENCES [dbo].[WFCASE] ([idCase])
GO
ALTER TABLE [dbo].[WORKITEM] CHECK CONSTRAINT [WORKITEM_WFCASE_FK1]
GO
/****** Object:  ForeignKey [WORKITEM_WORKITEMSTATE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[WORKITEM]  WITH CHECK ADD  CONSTRAINT [WORKITEM_WORKITEMSTATE_FK1] FOREIGN KEY([idWorkItemState])
REFERENCES [dbo].[WORKITEMSTATE] ([idWorkItemState])
GO
ALTER TABLE [dbo].[WORKITEM] CHECK CONSTRAINT [WORKITEM_WORKITEMSTATE_FK1]
GO
/****** Object:  ForeignKey [TRANSITIONDIAGRAM_TRANSITI_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TRANSITIONDIAGRAM]  WITH CHECK ADD  CONSTRAINT [TRANSITIONDIAGRAM_TRANSITI_FK1] FOREIGN KEY([idTransition])
REFERENCES [dbo].[TRANSITION] ([idTransition])
GO
ALTER TABLE [dbo].[TRANSITIONDIAGRAM] CHECK CONSTRAINT [TRANSITIONDIAGRAM_TRANSITI_FK1]
GO
/****** Object:  ForeignKey [TRANSITIONCONDITION_TASK_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TRANSITIONCONDITION]  WITH CHECK ADD  CONSTRAINT [TRANSITIONCONDITION_TASK_FK1] FOREIGN KEY([idTask])
REFERENCES [dbo].[TASK] ([idTask])
GO
ALTER TABLE [dbo].[TRANSITIONCONDITION] CHECK CONSTRAINT [TRANSITIONCONDITION_TASK_FK1]
GO
/****** Object:  ForeignKey [TRANSITIONCONDITION_TRANSI_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[TRANSITIONCONDITION]  WITH CHECK ADD  CONSTRAINT [TRANSITIONCONDITION_TRANSI_FK1] FOREIGN KEY([idTransition])
REFERENCES [dbo].[TRANSITION] ([idTransition])
GO
ALTER TABLE [dbo].[TRANSITIONCONDITION] CHECK CONSTRAINT [TRANSITIONCONDITION_TRANSI_FK1]
GO
/****** Object:  ForeignKey [PROTRIGREGENT_PROCTRIGREG_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[PROCESSTRIGGERREGISTERENT]  WITH CHECK ADD  CONSTRAINT [PROTRIGREGENT_PROCTRIGREG_FK1] FOREIGN KEY([idProcessTriggerRegister])
REFERENCES [dbo].[PROCESSTRIGGERREGISTER] ([idProcessTriggerRegister])
GO
ALTER TABLE [dbo].[PROCESSTRIGGERREGISTERENT] CHECK CONSTRAINT [PROTRIGREGENT_PROCTRIGREG_FK1]
GO
/****** Object:  ForeignKey [GRPHINSTANCE_CUSTPHASE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[GRPHASEINSTANCE]  WITH CHECK ADD  CONSTRAINT [GRPHINSTANCE_CUSTPHASE_FK1] FOREIGN KEY([idCustomPhase])
REFERENCES [dbo].[GRCUSTOMPHASE] ([idCustomPhase])
GO
ALTER TABLE [dbo].[GRPHASEINSTANCE] CHECK CONSTRAINT [GRPHINSTANCE_CUSTPHASE_FK1]
GO
/****** Object:  ForeignKey [GRQUERY_GRCOUNTER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[GRUSERQUERY]  WITH CHECK ADD  CONSTRAINT [GRQUERY_GRCOUNTER_FK1] FOREIGN KEY([idCounter])
REFERENCES [dbo].[GRCOUNTER] ([idCounter])
GO
ALTER TABLE [dbo].[GRUSERQUERY] CHECK CONSTRAINT [GRQUERY_GRCOUNTER_FK1]
GO
/****** Object:  ForeignKey [GRQUERY_GRCUSTOMPHASE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[GRUSERQUERY]  WITH CHECK ADD  CONSTRAINT [GRQUERY_GRCUSTOMPHASE_FK1] FOREIGN KEY([idStopwatch])
REFERENCES [dbo].[GRCUSTOMPHASE] ([idCustomPhase])
GO
ALTER TABLE [dbo].[GRUSERQUERY] CHECK CONSTRAINT [GRQUERY_GRCUSTOMPHASE_FK1]
GO
/****** Object:  ForeignKey [GRQUERY_GRDATEOFSTYPE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[GRUSERQUERY]  WITH CHECK ADD  CONSTRAINT [GRQUERY_GRDATEOFSTYPE_FK1] FOREIGN KEY([idFromOffsetType])
REFERENCES [dbo].[GRDATE_OFFSET_TYPE] ([idDateOffsetType])
GO
ALTER TABLE [dbo].[GRUSERQUERY] CHECK CONSTRAINT [GRQUERY_GRDATEOFSTYPE_FK1]
GO
/****** Object:  ForeignKey [GRQUERY_GRDATEOFSTYPE_FK2]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[GRUSERQUERY]  WITH CHECK ADD  CONSTRAINT [GRQUERY_GRDATEOFSTYPE_FK2] FOREIGN KEY([idToOffsetType])
REFERENCES [dbo].[GRDATE_OFFSET_TYPE] ([idDateOffsetType])
GO
ALTER TABLE [dbo].[GRUSERQUERY] CHECK CONSTRAINT [GRQUERY_GRDATEOFSTYPE_FK2]
GO
/****** Object:  ForeignKey [GRQUERY_TASK_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[GRUSERQUERY]  WITH CHECK ADD  CONSTRAINT [GRQUERY_TASK_FK1] FOREIGN KEY([idTask])
REFERENCES [dbo].[TASK] ([idTask])
GO
ALTER TABLE [dbo].[GRUSERQUERY] CHECK CONSTRAINT [GRQUERY_TASK_FK1]
GO
/****** Object:  ForeignKey [GRQUERY_USER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[GRUSERQUERY]  WITH CHECK ADD  CONSTRAINT [GRQUERY_USER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[GRUSERQUERY] CHECK CONSTRAINT [GRQUERY_USER_FK1]
GO
/****** Object:  ForeignKey [GRQUERY_WFCLASS_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[GRUSERQUERY]  WITH CHECK ADD  CONSTRAINT [GRQUERY_WFCLASS_FK1] FOREIGN KEY([idWfClass])
REFERENCES [dbo].[WFCLASS] ([idWfClass])
GO
ALTER TABLE [dbo].[GRUSERQUERY] CHECK CONSTRAINT [GRQUERY_WFCLASS_FK1]
GO
/****** Object:  ForeignKey [GRQUERY_WORKFLOW_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[GRUSERQUERY]  WITH CHECK ADD  CONSTRAINT [GRQUERY_WORKFLOW_FK1] FOREIGN KEY([idWorkflow])
REFERENCES [dbo].[WORKFLOW] ([idWorkflow])
GO
ALTER TABLE [dbo].[GRUSERQUERY] CHECK CONSTRAINT [GRQUERY_WORKFLOW_FK1]
GO
/****** Object:  ForeignKey [ASYNCHWIRUNNING_ASYNCHWI_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ASYNCHWORKITEMRUNNING]  WITH CHECK ADD  CONSTRAINT [ASYNCHWIRUNNING_ASYNCHWI_FK1] FOREIGN KEY([idAsynchWorkitem])
REFERENCES [dbo].[ASYNCHWORKITEM] ([idAsynchWorkitem])
GO
ALTER TABLE [dbo].[ASYNCHWORKITEMRUNNING] CHECK CONSTRAINT [ASYNCHWIRUNNING_ASYNCHWI_FK1]
GO
/****** Object:  ForeignKey [ASYNCHWIRETRY_ASYNCHWORKIT_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ASYNCHWIRETRY]  WITH CHECK ADD  CONSTRAINT [ASYNCHWIRETRY_ASYNCHWORKIT_FK1] FOREIGN KEY([idAsynchWorkitem])
REFERENCES [dbo].[ASYNCHWORKITEM] ([idAsynchWorkitem])
GO
ALTER TABLE [dbo].[ASYNCHWIRETRY] CHECK CONSTRAINT [ASYNCHWIRETRY_ASYNCHWORKIT_FK1]
GO
/****** Object:  ForeignKey [ALARMRECIPIENT_ALARM_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ALARMRECIPIENT]  WITH CHECK ADD  CONSTRAINT [ALARMRECIPIENT_ALARM_FK1] FOREIGN KEY([idAlarm])
REFERENCES [dbo].[ALARM] ([idAlarm])
GO
ALTER TABLE [dbo].[ALARMRECIPIENT] CHECK CONSTRAINT [ALARMRECIPIENT_ALARM_FK1]
GO
/****** Object:  ForeignKey [ALARMRECIPIENT_AREA_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ALARMRECIPIENT]  WITH CHECK ADD  CONSTRAINT [ALARMRECIPIENT_AREA_FK1] FOREIGN KEY([idArea])
REFERENCES [dbo].[AREA] ([idArea])
GO
ALTER TABLE [dbo].[ALARMRECIPIENT] CHECK CONSTRAINT [ALARMRECIPIENT_AREA_FK1]
GO
/****** Object:  ForeignKey [ALARMRECIPIENT_LOCATION_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ALARMRECIPIENT]  WITH CHECK ADD  CONSTRAINT [ALARMRECIPIENT_LOCATION_FK1] FOREIGN KEY([idLocation])
REFERENCES [dbo].[LOCATION] ([idLocation])
GO
ALTER TABLE [dbo].[ALARMRECIPIENT] CHECK CONSTRAINT [ALARMRECIPIENT_LOCATION_FK1]
GO
/****** Object:  ForeignKey [ALARMRECIPIENT_POSITION_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ALARMRECIPIENT]  WITH CHECK ADD  CONSTRAINT [ALARMRECIPIENT_POSITION_FK1] FOREIGN KEY([idPosition])
REFERENCES [dbo].[ORGPOSITION] ([idPosition])
GO
ALTER TABLE [dbo].[ALARMRECIPIENT] CHECK CONSTRAINT [ALARMRECIPIENT_POSITION_FK1]
GO
/****** Object:  ForeignKey [ALARMRECIPIENT_ROLE_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ALARMRECIPIENT]  WITH CHECK ADD  CONSTRAINT [ALARMRECIPIENT_ROLE_FK1] FOREIGN KEY([idRole])
REFERENCES [dbo].[ROLE] ([idRole])
GO
ALTER TABLE [dbo].[ALARMRECIPIENT] CHECK CONSTRAINT [ALARMRECIPIENT_ROLE_FK1]
GO
/****** Object:  ForeignKey [ALARMRECIPIENT_SKILL_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[ALARMRECIPIENT]  WITH CHECK ADD  CONSTRAINT [ALARMRECIPIENT_SKILL_FK1] FOREIGN KEY([idSkill])
REFERENCES [dbo].[SKILL] ([idSkill])
GO
ALTER TABLE [dbo].[ALARMRECIPIENT] CHECK CONSTRAINT [ALARMRECIPIENT_SKILL_FK1]
GO
/****** Object:  ForeignKey [CURRENTASSIGNEE_WFUSER_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[CURRENTASSIGNEE]  WITH CHECK ADD  CONSTRAINT [CURRENTASSIGNEE_WFUSER_FK1] FOREIGN KEY([idUser])
REFERENCES [dbo].[WFUSER] ([idUser])
GO
ALTER TABLE [dbo].[CURRENTASSIGNEE] CHECK CONSTRAINT [CURRENTASSIGNEE_WFUSER_FK1]
GO
/****** Object:  ForeignKey [CURRENTASSIGNEE_WORKITEM_FK1]    Script Date: 06/08/2017 15:53:21 ******/
ALTER TABLE [dbo].[CURRENTASSIGNEE]  WITH CHECK ADD  CONSTRAINT [CURRENTASSIGNEE_WORKITEM_FK1] FOREIGN KEY([idWorkItem])
REFERENCES [dbo].[WORKITEM] ([idWorkItem])
GO
ALTER TABLE [dbo].[CURRENTASSIGNEE] CHECK CONSTRAINT [CURRENTASSIGNEE_WORKITEM_FK1]
GO
