
/*DROP TABLE IF EXISTS [dbo].[speeches]
DROP TABLE IF EXISTS [dbo].[equipment]
DROP TABLE IF EXISTS [dbo].[speakers]
DROP TABLE IF EXISTS [dbo].[sections]
DROP TABLE IF EXISTS [dbo].[conferences]
DROP TABLE IF EXISTS [dbo].[office]
DROP TABLE IF EXISTS [dbo].[venues]

GO

CREATE TABLE [dbo].[office](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[venue_id] [int] NOT NULL,
	[office_number] [int] NOT NULL
 CONSTRAINT [PK_office] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[speeches](
	[id] [uniqueidentifier]  NOT NULL,
	[office_id] [int] NOT NULL,
	[topic] [nvarchar](max) NOT NULL,
	[section_id] [int] NOT NULL,
	[start_time] [smalldatetime] NOT NULL,
	[duration] [time] NOT NULL,
	[speaker_id] [int] NOT NULL,
	[equipment_needed] [int] NOT NULL,
	
 CONSTRAINT [PK_speeches] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[equipment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[equipment_list] [nvarchar](max) NOT NULL
	
 CONSTRAINT [PK_equipment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[speakers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[dagree] [nvarchar](max) NOT NULL,
	[workplace] [nvarchar](max) NULL,
	[position] [nvarchar](max) NULL,
	[bio] [nvarchar](max) NOT NULL,
	
 CONSTRAINT [PK_speakers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[sections](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[chairperson] [nvarchar](max) NOT NULL,
	[venue_id] [int] NOT NULL,
	[conferences_id] [int] NOT NULL,
	
 CONSTRAINT [PK_sections] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[venues](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	
 CONSTRAINT [PK_venues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[conferences](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
	[conderence_address] [nvarchar](max) NOT NULL,
	
 CONSTRAINT [PK_conferences] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE [dbo].[office] WITH CHECK ADD CONSTRAINT [FK_office_venue] FOREIGN KEY([venue_id])
REFERENCES [dbo].[venues] ([id])
ON DELETE NO ACTION
GO

ALTER TABLE [dbo].[speeches] WITH CHECK ADD CONSTRAINT [FK_speeches_office] FOREIGN KEY([office_id])
REFERENCES [dbo].[office] ([id])
ON DELETE NO ACTION
GO

ALTER TABLE [dbo].[speeches] WITH CHECK ADD CONSTRAINT [FK_speeches_sections] FOREIGN KEY([section_id])
REFERENCES [dbo].[sections] ([id])
ON DELETE NO ACTION
GO

ALTER TABLE [dbo].[speeches] WITH CHECK ADD CONSTRAINT [FK_speeches_equipment] FOREIGN KEY([equipment_needed])
REFERENCES [dbo].[equipment] ([id])
ON DELETE NO ACTION
GO

ALTER TABLE [dbo].[speeches] WITH CHECK ADD CONSTRAINT [FK_speeches_speakers] FOREIGN KEY([speaker_id])
REFERENCES [dbo].[speakers] ([id])
ON DELETE NO ACTION
GO

ALTER TABLE [dbo].[sections] WITH CHECK ADD CONSTRAINT [FK_sections_venues] FOREIGN KEY([venue_id])
REFERENCES [dbo].[venues] ([id])
ON DELETE NO ACTION
GO

ALTER TABLE [dbo].[sections] WITH CHECK ADD CONSTRAINT [FK_sections_conferences] FOREIGN KEY([conferences_id])
REFERENCES [dbo].[conferences] ([id])
ON DELETE NO ACTION
GO

DELETE FROM [dbo].[speeches]
DELETE FROM [dbo].[office]
DELETE FROM [dbo].[equipment]
DELETE FROM [dbo].[speakers]
DELETE FROM [dbo].[sections]
DELETE FROM [dbo].[venues]
DELETE FROM [dbo].[conferences]
GO

INSERT INTO [dbo].[conferences]
	([name],[start_date],[end_date],[conderence_address])
VALUES
	(N'Exploring the Frontiers of Innovation: A Journey Towards a Sustainable Future','2023-10-17','2023-10-19',N'The Grand Hotel and Conference Center, 123 Main Street, Cityville, USA')

INSERT INTO [dbo].[venues]
	([name],[address])
VALUES
	(N'The Grand Hotel and Conference Center',N'123 Main Street, Cityville, USA')

INSERT INTO [dbo].[office]
	([office_number],[venue_id])
VALUES
	(1,1)
INSERT INTO [dbo].[office]
	([office_number],[venue_id])
VALUES
	(2,1)

INSERT INTO [dbo].[equipment]
	([equipment_list])
VALUES(N'Microphone, spotlight, camera')

INSERT INTO [dbo].[equipment]
	([equipment_list])
VALUES(N'Microphone, spotlight, camera, projector')

INSERT INTO [dbo].[speakers]
	([name],[dagree],[workplace],[position],[bio])
VALUES(N'Maya', N'PhD', N'The Institute for Advanced Science and Technology at a leading research institution',N'CTO',N'Maya Patel is a highly accomplished individual with a passion for understanding the human mind. She earned her Doctor of Philosophy in Computer Science (PhD) from a prestigious university, with a focus on cognitive neuroscience. Currently, Maya serves as the Chief Technology Officer (CTO) at the Institute for Advanced Science and Technology, where she leads cutting-edge research in the field of brain-computer interfaces. With a keen interest in interdisciplinary research, Maya has also collaborated with experts in the fields of computer science, engineering, and medicine. Her work has been widely published in leading scientific journals and has received numerous accolades from the academic community. In her free time, Maya enjoys hiking, practicing yoga, and exploring new cuisines.')
INSERT INTO [dbo].[speakers]
	([name],[dagree],[workplace],[position],[bio])
VALUES(N'Owen', N'PhD', N'The Center for Artificial Intelligence and Robotics at a top-tier research university',N'Lead Research Scientist',N'Owen Lee is a highly accomplished Lead Research Scientist with a strong background in computer science and artificial intelligence. He has spent many years at the forefront of research in the field of robotics, focusing on the development of intelligent machines that can interact with humans in natural and intuitive ways. Owen obtained his PhD in Computer Science from a top-tier research university, and went on to lead research efforts at the Center for Artificial Intelligence and Robotics. His work has been published in numerous prestigious scientific journals, and has been recognized with several awards and honors. Beyond his research, Owen is also an avid traveler and enjoys exploring new cultures and cuisines.')

INSERT INTO [dbo].[sections]
	([name],[chairperson],[venue_id],[conferences_id])
VALUES(N'Towards Net-Zero: Sustainable Energy and Climate Solutions',N'Dr. Samantha Kim',1,1)
INSERT INTO [dbo].[sections]
	([name],[chairperson],[venue_id],[conferences_id])
VALUES(N'Revolutionizing Transportation: Smart Mobility and Green Infrastructure',N'Dr. Javier Rodriguez',1,1)

INSERT INTO [dbo].[speeches]
	([office_id],[topic],[section_id],[start_time],[duration],[speaker_id],[equipment_needed])
VALUES(1,N'The Role of Electric and Autonomous Vehicles in Sustainable Transportation',2,'2023-10-18 09:00:00','02:30:00',1,1)
INSERT INTO [dbo].[speeches]
	([office_id],[topic],[section_id],[start_time],[duration],[speaker_id],[equipment_needed])
VALUES(2,N'Clean Energy Innovations: Advancements and Challenges',1,'2023-10-17 09:00:00','03:00:00',2,2)

SELECT * FROM [conferences]



*/
--TASK1
--AND
SELECT *
FROM [sections] S
WHERE S.chairperson='Dr. Samantha Kim' AND S.conferences_id=1
GO

--OR
SELECT *
FROM [sections] S
WHERE S.chairperson='Dr. Samantha Kim' OR S.conferences_id=1
GO

--TASK2
SELECT S.venue_id AS 'VENUE' , COUNT(*) AS 'AMOUNT OF SECTIONS IN VENUE'
FROM [sections] S
GROUP BY S.venue_id
GO

--TASK3
--AND
SELECT *
FROM [sections] S
LEFT JOIN [speeches] SP ON SP.section_id=S.id
WHERE S.chairperson='Dr. Javier Rodriguez' AND SP.topic='The Role of Electric and Autonomous Vehicles in Sustainable Transportation'
GO

--OR
SELECT *
FROM [sections] S
LEFT JOIN [speeches] SP ON SP.section_id=S.id
WHERE S.chairperson='Dr. Javier Rodriguez' OR SP.start_time='2023-10-17 09:00:00'
GO

--TASK4
--OUTER JOIN
SELECT S.name, SP.topic
FROM [sections] S
FULL OUTER JOIN [speeches] SP ON SP.section_id=S.id
GO

--TASK5
--LIKE
SELECT *
FROM [sections] S
WHERE S.chairperson LIKE 'D%'
GO

--BETWEEN
SELECT *
FROM [speeches] SP
WHERE SP.start_time BETWEEN '2023-10-17 09:00:00' AND '2023-10-17 12:00:00'
GO

--IN
SELECT *
FROM [sections] S
WHERE S.chairperson IN ('Dr. Samantha Kim', 'Dr. Javier Kim')
GO

--EXISTS
SELECT *
FROM [speeches] SP
WHERE EXISTS
(
	SELECT *
	FROM [equipment] E
	WHERE E.equipment_list LIKE '%projector%' AND E.id=SP.equipment_needed
)
GO

--ALL
SELECT *
FROM [speeches] SP
WHERE SP.equipment_needed != ALL
(
	SELECT E.id
	FROM [equipment] E
	WHERE E.equipment_list LIKE '%projector%' AND E.id=SP.equipment_needed
)
GO

--A
SELECT *
FROM [speeches] SP
WHERE SP.equipment_needed = ANY
(
	SELECT E.id
	FROM [equipment] E
	WHERE E.equipment_list LIKE '%projector%' AND E.id=SP.equipment_needed
)
GO

--TASK6
--SUM WITH GROUPING
SELECT RES.office_id , SUM(RES.[Amount of tools]) AS 'Amount of tools needed for specific office'
FROM 
(
	SELECT SP.office_id, len(E.equipment_list) - len(replace(E.equipment_list,',',''))+1 AS 'Amount of tools'
	FROM [speeches] SP
	LEFT JOIN [equipment] E ON E.id=SP.equipment_needed
) AS RES
GROUP BY RES.office_id
GO

--TASK7
SELECT *
FROM [speeches] SP
WHERE SP.equipment_needed = ANY
(
	SELECT E.id
	FROM [equipment] E
	WHERE E.equipment_list LIKE '%projector%' AND E.id=SP.equipment_needed
)
GO

--TASK8
SELECT RES.office_id , SUM(RES.[Amount of tools]) AS 'Amount of tools needed for specific office'
FROM 
(
	SELECT SP.office_id, len(E.equipment_list) - len(replace(E.equipment_list,',',''))+1 AS 'Amount of tools'
	FROM [speeches] SP
	LEFT JOIN [equipment] E ON E.id=SP.equipment_needed
) AS RES
GROUP BY RES.office_id
GO

--TASK9
--Imposible to create due to database stucture

--TASK10
SELECT 'AMOUNT OF TOOLS' AS 'OFFICE ID', [1] AS '1', [2] AS '2'
FROM 
(
	SELECT SP.office_id, len(E.equipment_list) - len(replace(E.equipment_list,',',''))+1 AS Amount_of_tools
	FROM [speeches] SP
	LEFT JOIN [equipment] E ON E.id=SP.equipment_needed
) AS FromTable
PIVOT
(
	SUM(Amount_of_tools)
	FOR office_id IN ([1],[2])
) AS PivotTable
GO

--TASK11
--UPDATE ON BASE OF ONE TABLE
UPDATE [equipment] 
SET equipment_list='TEST'
WHERE equipment_list='Microphone, spotlight, camera'
GO

--TASK11
--UPDATE ON BASE OF ONE TABLE
UPDATE [equipment] 
SET equipment_list='TEST'
WHERE equipment_list='Microphone, spotlight, camera'
GO

--TASK12
UPDATE E
SET E.equipment_list='Microphone'

FROM [equipment] E
	JOIN [speeches] SP ON SP.equipment_needed=E.id
	
WHERE SP.id=1 AND E.equipment_list='TEST'
GO

--TASK13
--INSERT INTO TABLE
INSERT INTO [equipment]
	([equipment_list])
VALUES('Sound station')

--TASK14
--INSERT INTO TABLE
DROP TABLE IF EXISTS [Temp]
GO

CREATE TABLE [Temp](
	[id] [int] NOT NULL,
	[equipment_list] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Temp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO [Temp] 
	([id],[equipment_list]) 
VALUES 
	(1,'Bottle of water')
GO

SELECT * FROM [equipment]
GO

INSERT INTO [equipment]
SELECT T.equipment_list FROM [Temp] T
GO

SELECT * FROM [equipment]
GO

DROP TABLE IF EXISTS [Temp]
GO

--TASK15
--DELETE DATA FROM TABLE
DROP TABLE IF EXISTS [Temp]
GO

CREATE TABLE [Temp](
	[id] [int] NOT NULL,
	[equipment_list] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Temp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SELECT * FROM [Temp]
GO

INSERT INTO [Temp] 
	([id],[equipment_list]) 
VALUES 
	(1,'Bottle of water')
GO

SELECT * FROM [Temp]
GO

DELETE FROM [Temp]
GO

SELECT * FROM [Temp]
GO

DROP TABLE IF EXISTS [Temp]
GO

--TASK16
--DELETE SPECIFIC DATA FROM TABLE
DROP TABLE IF EXISTS [Temp]
GO

CREATE TABLE [Temp](
	[id] [int] NOT NULL,
	[equipment_list] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Temp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SELECT * FROM [Temp]
GO

INSERT INTO [Temp] 
	([id],[equipment_list]) 
VALUES 
	(1,'Bottle of water'),
	(2,'Something')
GO

SELECT * FROM [Temp]
GO

DELETE FROM [Temp] WHERE [equipment_list]='Something'
GO

SELECT * FROM [Temp]
GO

DROP TABLE IF EXISTS [Temp]
GO

--REPORT1
SELECT 
	C.name AS 'Conference title', 
	CONCAT( C.start_date, ' - ' , C.end_date) AS 'Date of start and end', 
	V.address AS 'Address', 
	SP.topic AS 'Speech topic',
	SP.start_time AS 'Speech start time',
	SP.duration AS 'Speech duration',
	SR.bio AS 'Speacker bio'
FROM [conferences] C
LEFT JOIN [sections] S ON S.conferences_id=C.id
LEFT JOIN [venues] V ON V.id=S.venue_id
LEFT JOIN [speeches] SP ON SP.section_id=S.id
LEFT JOIN [speakers] SR ON SR.id=SP.speaker_id
GO

--REPORT2
SELECT C.name AS 'Title of conference', SR.name, SR.workplace, SR.position
FROM [conferences] C
LEFT JOIN [sections] S ON S.conferences_id=C.id
LEFT JOIN [speeches] SP ON SP.section_id=S.id
LEFT JOIN [speakers] SR ON SR.id=SP.speaker_id
GO

--REPORT3
SELECT E.equipment_list AS 'EQUIPMENT LIST', V.name AS 'VENUE NAME', V.address AS 'VENUE ADDRESS', O.office_number AS 'OFFICE NUMBER'
FROM [equipment] E
RIGHT JOIN [speeches] SP ON SP.equipment_needed=E.id
LEFT JOIN [sections] S ON S.id=SP.section_id
LEFT JOIN [venues] V ON V.id=S.venue_id
LEFT JOIN [office] O ON O.venue_id=V.id*/




/*DROP PROCEDURE IF EXISTS [Conference_rating]
GO

CREATE PROCEDURE [Conference_rating] @conference_id int
AS

DECLARE
	@amount_of_tools AS int,
	@amount_of_speackers AS int,
	@amount_of_speeches AS int,
	@amount_of_time AS decimal(5,2)

SELECT @amount_of_tools = SUM(len(result.EQUIPMENT) - len(replace(result.EQUIPMENT,',',''))+1)
FROM
(
	SELECT C.id AS CONF_ID, E.equipment_list AS EQUIPMENT
	FROM [conferences] C
	LEFT JOIN [sections] S ON S.conferences_id=C.id
	LEFT JOIN [speeches] SP ON SP.section_id=S.id
	LEFT JOIN [equipment] E ON E.id=SP.equipment_needed

	WHERE C.id=@conference_id
)
 AS result

 GROUP BY result.CONF_ID

 SELECT @amount_of_speackers = COUNT(SP.speaker_id)
 FROM [conferences] C
 LEFT JOIN [sections] S ON S.conferences_id=C.id
 LEFT JOIN [speeches] SP ON SP.section_id=S.id

 GROUP BY C.id

 HAVING C.id=@conference_id

 SELECT @amount_of_speeches = COUNT(SP.id)
 FROM [conferences] C
 LEFT JOIN [sections] S ON S.conferences_id=C.id
 LEFT JOIN [speeches] SP ON SP.section_id=S.id

 GROUP BY C.id

 HAVING C.id=@conference_id

 SELECT @amount_of_time = SUM(DATEDIFF(MINUTE, '0:00:00', SP.duration))
 FROM [conferences] C
 LEFT JOIN [sections] S ON S.conferences_id=C.id
 LEFT JOIN [speeches] SP ON SP.section_id=S.id

 GROUP BY C.id

 HAVING C.id=@conference_id

 DECLARE
	@points_for_tools AS decimal(5,2) = CASE 
									WHEN @amount_of_tools <= 1 THEN 0 
									WHEN @amount_of_tools > 1 AND @amount_of_tools < 10 THEN LOG(@amount_of_tools,1.6) 
									ELSE 10 END,
	@points_for_speackers AS decimal(5,2) = CASE WHEN @amount_of_speackers <= 1 THEN 0 
									WHEN @amount_of_speackers > 1 AND @amount_of_speackers < 10 THEN LOG(@amount_of_speackers,1.6) 
									ELSE 10 END,
	@points_for_speeches AS decimal(5,2) = CASE WHEN @amount_of_speeches <= 1 THEN 0 
									WHEN @amount_of_speeches > 1 AND @amount_of_speeches < 10 THEN LOG(@amount_of_speeches,1.6) 
									ELSE 10 END,
	@points_for_time AS decimal(5,2) = CASE WHEN @amount_of_time <= 1 THEN 0 
									WHEN @amount_of_time > 1 AND @amount_of_time < 24 THEN LOG(@amount_of_time,1.37) 
									ELSE 10 END

SELECT C.id, C.name, @points_for_tools+@points_for_speackers+@points_for_speeches+@points_for_time AS Rate
FROM [conferences] C
WHERE C.id=@conference_id

DROP PROCEDURE IF EXISTS [Conferences_rate];
GO


CREATE PROCEDURE [Conferences_rate]
AS

DECLARE @conference_id AS int, @Amount_of_conferences AS int, @Index AS int = 0

SELECT @Amount_of_conferences = COUNT(*)
FROM [conferences]

WHILE(@Index < @Amount_of_conferences)
BEGIN

SELECT @conference_id=C.id 
FROM [conferences] C
ORDER BY C.id ASC
OFFSET @Index ROWS 
FETCH NEXT 1 ROW ONLY

SET @Index = @Index + 1

EXEC [Conference_rating] @conference_id

END
GO

EXEC [Conferences_rate]*/
/*ALTER TABLE [conferences] ADD 
	[UCR] [nvarchar](max) NULL,
	[DCR] [datetime2] NULL,
	[ULR] [nvarchar](max) NULL,
	[DLC] [datetime2] NULL;
GO

ALTER TABLE [equipment] ADD 
	[UCR] [nvarchar](max) NULL,
	[DCR] [datetime2] NULL,
	[ULR] [nvarchar](max) NULL,
	[DLC] [datetime2] NULL;
GO

ALTER TABLE [office] ADD 
	[UCR] [nvarchar](max) NULL,
	[DCR] [datetime2] NULL,
	[ULR] [nvarchar](max) NULL,
	[DLC] [datetime2] NULL;
GO

ALTER TABLE [sections] ADD 
	[UCR] [nvarchar](max) NULL,
	[DCR] [datetime2] NULL,
	[ULR] [nvarchar](max) NULL,
	[DLC] [datetime2] NULL;
 
ALTER TABLE [speeches] ADD 
	[UCR] [nvarchar](max) NULL,
	[DCR] [datetime2] NULL,
	[ULR] [nvarchar](max) NULL,
	[DLC] [datetime2] NULL;
GO

ALTER TABLE [venues] ADD 
	[UCR] [nvarchar](max) NULL,
	[DCR] [datetime2] NULL,
	[ULR] [nvarchar](max) NULL,
	[DLC] [datetime2] NULL;
GO*/

--TRIGGERS
/*DROP TRIGGER IF EXISTS [conferences_insertion_trigger] 
GO

CREATE TRIGGER [conferences_insertion_trigger]
   ON [conferences]
   INSTEAD OF INSERT
AS 
BEGIN

	INSERT INTO [conferences](name, start_date, end_date, conderence_address, UCR, DCR)
    SELECT name, start_date, end_date, conderence_address, USER_NAME(), GETDATE() FROM inserted;

END
GO

DROP TRIGGER IF EXISTS [conferences_update_trigger] 
GO

CREATE TRIGGER [conferences_update_trigger]
   ON  [conferences]
   AFTER UPDATE
AS
BEGIN
	
	DECLARE @id AS int 

	SELECT @id = i.id FROM inserted i

	UPDATE [conferences]
	SET ULR = USER_NAME(), DLC = GETDATE()
	WHERE id=@id

END
GO

DROP TRIGGER IF EXISTS [equipment_insertion_trigger] 
GO

CREATE TRIGGER [equipment_insertion_trigger]
   ON [equipment]
   INSTEAD OF INSERT
AS 
BEGIN

	INSERT INTO [equipment]( equipment_list, UCR, DCR)
    SELECT equipment_list, USER_NAME(), GETDATE() FROM inserted;

END
GO

DROP TRIGGER IF EXISTS [equipment_update_trigger] 
GO

CREATE TRIGGER [equipment_update_trigger]
   ON  [equipment]
   AFTER UPDATE
AS
BEGIN
	
	DECLARE @id AS int 

	SELECT @id = i.id FROM inserted i

	UPDATE [equipment]
	SET ULR = USER_NAME(), DLC = GETDATE()
	WHERE id=@id

END
GO

DROP TRIGGER IF EXISTS [office_insertion_trigger] 
GO

CREATE TRIGGER [office_insertion_trigger]
   ON [office]
   INSTEAD OF INSERT
AS 
BEGIN

	INSERT INTO [office](office_number, venue_id, UCR, DCR)
    SELECT office_number, venue_id, USER_NAME(), GETDATE() FROM inserted;

END
GO

DROP TRIGGER IF EXISTS [office_update_trigger] 
GO

CREATE TRIGGER [office_update_trigger]
   ON  [office]
   AFTER UPDATE
AS
BEGIN
	
	DECLARE @id AS int 

	SELECT @id = i.id FROM inserted i

	UPDATE [office]
	SET ULR = USER_NAME(), DLC = GETDATE()
	WHERE id=@id

END
GO

DROP TRIGGER IF EXISTS [sections_insertion_trigger] 
GO

CREATE TRIGGER [sections_insertion_trigger]
   ON [sections]
   INSTEAD OF INSERT
AS 
BEGIN

	INSERT INTO [sections](conferences_id, chairperson, name, venue_id, UCR, DCR)
    SELECT conferences_id, chairperson, name, venue_id, USER_NAME(), GETDATE() FROM inserted;

END
GO

DROP TRIGGER IF EXISTS [sections_update_trigger] 
GO

CREATE TRIGGER [sections_update_trigger]
   ON  [sections]
   AFTER UPDATE
AS
BEGIN
	
	DECLARE @id AS int 

	SELECT @id = i.id FROM inserted i

	UPDATE [sections]
	SET ULR = USER_NAME(), DLC = GETDATE()
	WHERE id=@id

END
GO

DROP TRIGGER IF EXISTS [speakers_insertion_trigger] 
GO

CREATE TRIGGER [speakers_insertion_trigger]
   ON [speakers]
   INSTEAD OF INSERT
AS 
BEGIN

	INSERT INTO [speakers](name, workplace, position, dagree, bio, UCR, DCR)
    SELECT name, workplace, position, dagree, bio, USER_NAME(), GETDATE() FROM inserted;

END
GO

DROP TRIGGER IF EXISTS [speakers_update_trigger] 
GO

CREATE TRIGGER [speakers_update_trigger]
   ON  [speakers]
   AFTER UPDATE
AS
BEGIN
	
	DECLARE @id AS int 

	SELECT @id = i.id FROM inserted i

	UPDATE [speakers]
	SET ULR = USER_NAME(), DLC = GETDATE()
	WHERE id=@id

END
GO

DROP TRIGGER IF EXISTS [speeches_insertion_trigger] 
GO

CREATE TRIGGER [speeches_insertion_trigger]
   ON [speeches]
   INSTEAD OF INSERT
AS 
BEGIN

	DECLARE @speaker_id int, @start_time smalldatetime, @section_id int, @office_id int, @duration time

	SELECT @speaker_id=speaker_id, @start_time = start_time, @section_id=section_id, @office_id=office_id, @duration=duration
	FROM inserted

	DECLARE @end_time as smalldatetime

	SELECT @end_time=CAST(@start_time AS smalldatetime) + CAST(@duration AS smalldatetime);

	IF 
	CAST(@start_time as date) IN 
	(
		SELECT CAST(SS.start_time AS date) FROM speeches SS
		WHERE SS.speaker_id=@speaker_id AND SS.section_id!=@section_id
	) 
	OR	
	@end_time > ANY
	( 
		SELECT SS.start_time FROM speeches SS 
		LEFT JOIN office O ON O.id=SS.office_id
		WHERE O.id=@office_id AND CAST(@start_time as date)=CAST(SS.start_time AS date) AND SS.start_time >= @start_time 
	)
	OR
	@start_time < ANY
	( 
		SELECT CAST(SS.start_time AS smalldatetime) + CAST(SS.duration AS smalldatetime) AS end_time FROM speeches SS 
		LEFT JOIN office O ON O.id=SS.office_id
		WHERE O.id=@office_id AND CAST(@start_time as date)=CAST(SS.start_time AS date) AND SS.start_time <= @start_time
	)
	BEGIN
			PRINT 'Cannot assign this speacker to another speech in another section this day AND different sections cannot perform in the same venue'
		END
	ELSE
		BEGIN
			INSERT INTO [speeches](id ,section_id, speaker_id, start_time, duration, topic, equipment_needed, office_id, UCR, DCR)
			SELECT NEWID() ,section_id, speaker_id, start_time, duration, topic, equipment_needed, office_id, USER_NAME(), GETDATE() FROM inserted;
		END
END
GO

DROP TRIGGER IF EXISTS [speeches_update_trigger] 
GO

CREATE TRIGGER [speeches_update_trigger]
   ON  [speeches]
   AFTER UPDATE
AS
BEGIN
	
	DECLARE @id AS uniqueidentifier 

	SELECT @id = i.id FROM inserted i

	UPDATE [speeches]
	SET ULR = USER_NAME(), DLC = GETDATE()
	WHERE id=@id

END
GO

DROP TRIGGER IF EXISTS [venues_insertion_trigger] 
GO

CREATE TRIGGER [venues_insertion_trigger]
   ON [venues]
   INSTEAD OF INSERT
AS 
BEGIN

	INSERT INTO [venues](name, address ,UCR, DCR)
    SELECT name, address, USER_NAME(), GETDATE() FROM inserted;

END
GO

DROP TRIGGER IF EXISTS [venues_update_trigger] 
GO

CREATE TRIGGER [venues_update_trigger]
   ON  [venues]
   AFTER UPDATE
AS
BEGIN
	
	DECLARE @id AS int 

	SELECT @id = i.id FROM inserted i

	UPDATE [venues]
	SET ULR = USER_NAME(), DLC = GETDATE()
	WHERE id=@id

END
GO

INSERT INTO [dbo].[speeches]
	([office_id],[topic],[section_id],[start_time],[duration],[speaker_id],[equipment_needed])
VALUES(1,N'The Role of Electric and Autonomous Vehicles in Sustainable Transportation',1,'2023-10-18 12:00:00','02:30:00',1,1)

INSERT INTO [dbo].[speeches]
	([office_id],[topic],[section_id],[start_time],[duration],[speaker_id],[equipment_needed])
VALUES(1,N'The Role of Electric and Autonomous Vehicles in Sustainable Transportation',2,'2023-10-18 20:00:00','02:30:00',1,1)*/
CREATE LOGIN technician_Steave
WITH PASSWORD='Steave_SUPERB';

CREATE USER technician
FOR LOGIN technician_Steave;

GRANT SELECT, INSERT
ON [equipment] TO technician;
GO

CREATE LOGIN realtor_Stacey
WITH PASSWORD='St@cey_';

CREATE USER realtor
FOR LOGIN realtor_Stacey;

GRANT SELECT, INSERT
ON [venues] TO realtor;
GO

CREATE LOGIN Casting_manager_Tamara
WITH PASSWORD='_LampYU_';

CREATE USER Casting_manager
FOR LOGIN Casting_manager_Tamara;

GRANT SELECT, INSERT
ON [speakers] TO Casting_manager;
GO

EXECUTE AS LOGIN = 'technician_Steave';

PRINT 'Using account of technician_Steave'

SELECT *
FROM [dbo].[equipment] e

SELECT *
FROM [dbo].[speakers] s

PRINT 'Exiting account'

REVERT
GO

EXECUTE AS LOGIN = 'realtor_Stacey';

PRINT 'Using account of realtor_Stacey'

SELECT *
FROM [dbo].[venues] v

SELECT *
FROM [dbo].[speakers] s

PRINT 'Exiting account'

REVERT
GO

EXECUTE AS LOGIN = 'Casting_manager_Tamara';

PRINT 'Using account of Casting_manager_Tamara'

SELECT *
FROM [dbo].[venues] v

SELECT *
FROM [dbo].[speakers] s

PRINT 'Exiting account'

REVERT
GO

CREATE ROLE producer;
CREATE ROLE visitor;

ALTER SCHEMA  [back] TRANSFER [equipment];
ALTER SCHEMA  [front] TRANSFER [conferences];
ALTER SCHEMA [front] TRANSFER [venues];
ALTER SCHEMA [front] TRANSFER [speakers];
ALTER SCHEMA [front] TRANSFER [speeches];
ALTER SCHEMA [front] TRANSFER [sections];

GRANT SELECT
ON SCHEMA::front
TO visitor;

GRANT SELECT, INSERT, DELETE, UPDATE
ON SCHEMA::front
TO producer;

GRANT SELECT, INSERT, DELETE, UPDATE
ON SCHEMA::back
TO producer;
GO

CREATE LOGIN producer_Demien
WITH PASSWORD='Demien_low';

CREATE USER producer_Demien
FOR LOGIN producer_Demien;

ALTER ROLE producer
ADD MEMBER producer_Demien;
GO

CREATE LOGIN visitor_Simons
WITH PASSWORD='Sim7';

CREATE USER visitor_Simons
FOR LOGIN visitor_Simons;

ALTER ROLE visitor
ADD MEMBER visitor_Simons;
GO

EXECUTE AS LOGIN = 'producer_Demien';

PRINT 'Using account of producer_Demien'

SELECT *
FROM [front].[venues] v

SELECT *
FROM [front].[speakers] s

PRINT 'Exiting account'

REVERT
GO

EXECUTE AS LOGIN = 'visitor_Simons';

PRINT 'Using account of visitor_Simons'

SELECT *
FROM [front].[venues] v

SELECT *
FROM [back].[equipment] e

PRINT 'Exiting account'

REVERT
GO

CREATE LOGIN expert_Liam
WITH PASSWORD='EXP_LAIM';

CREATE USER expert_Liam
FOR LOGIN expert_Liam;

GRANT SELECT
ON [back].[equipment] TO expert_Liam;

ALTER ROLE visitor
ADD MEMBER expert_Liam;

DENY SELECT
ON [front].[venues]
TO expert_Liam;
GO

EXECUTE AS LOGIN = 'expert_Liam';

PRINT 'Using account of expert_Liam'

SELECT *
FROM [front].[venues] v

SELECT *
FROM [front].[conferences] c

SELECT *
FROM [back].[equipment] e

PRINT 'Exiting account'

REVERT
GO

EXEC sp_droprolemember 'visitor', 'expert_Liam';
GO

EXECUTE AS LOGIN = 'expert_Liam';

PRINT 'Using account of expert_Liam'

SELECT *
FROM [front].[venues] v

SELECT *
FROM [front].[conferences] c

SELECT *
FROM [back].[equipment] e

PRINT 'Exiting account'

REVERT
GO

DROP USER expert_Liam;

EXEC sp_droprolemember 'visitor', 'visitor_Simons';
GO
DROP ROLE visitor;

ALTER SCHEMA [dbo] TRANSFER [back].[equipment];
ALTER SCHEMA [dbo] TRANSFER [front].[conferences];
ALTER SCHEMA [dbo] TRANSFER [front].[venues];
ALTER SCHEMA [dbo] TRANSFER [front].[speakers];
ALTER SCHEMA [dbo] TRANSFER [front].[speeches];
ALTER SCHEMA [dbo] TRANSFER [front].[sections];
GO