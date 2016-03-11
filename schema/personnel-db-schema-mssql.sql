CREATE TABLE dbo.corearea (
                coreareaid VARCHAR(2) NOT NULL,
                coreareaname VARCHAR(80),
                CONSTRAINT PK_corearea_1 PRIMARY KEY (coreareaid)
);

CREATE TABLE dbo.groups (
                groupid INT IDENTITY NOT NULL,
                groupname VARCHAR(200),
                groupdescription VARCHAR(200),
                grouptype VARCHAR(50) DEFAULT 'basic',
                groupownertext VARCHAR(100),
                groupowner INT,
                groupparent VARCHAR(200),
                publiclysubscribe CHAR(1),
                publiclyview CHAR(1),
                status VARCHAR(1),
                maillist CHAR(1),
                mailrestrictlist VARCHAR(300),
                mailmoderate CHAR(1),
                mailmoderater VARCHAR(100),
                maillistfronter TEXT,
                maillistfooter TEXT,
                mailarchive CHAR(1),
                moddate DATETIME,
                insertdate DATETIME DEFAULT getdate(),
                CONSTRAINT PK_groups PRIMARY KEY (groupid)
);

CREATE TABLE dbo.network (
                networkid INT IDENTITY NOT NULL,
                networkname VARCHAR(50),
                networkdescription TEXT,
                countrycode CHAR(2),
                CONSTRAINT PK_network PRIMARY KEY (networkid)
);

CREATE TABLE dbo.emailalternate (
                emailalternateid INT IDENTITY NOT NULL,
                emailalias VARCHAR(50),
                eaddress VARCHAR(80)
);

CREATE TABLE dbo.person_group (
                persongroupid INT IDENTITY NOT NULL,
                personid INT,
                groupid INT NOT NULL,
                status INT,
                chair CHAR(1) DEFAULT 'n',
                moddate DATETIME,
                insertdate DATETIME DEFAULT getdate(),
                site CHAR(3),
                CONSTRAINT PK_person_group PRIMARY KEY (persongroupid)
);

CREATE TABLE dbo.person (
                personid INT IDENTITY NOT NULL,
                password VARCHAR(100),
                title VARCHAR(80),
                firstname VARCHAR(30),
                middlename VARCHAR(20),
                lastname VARCHAR(50),
                nickname VARCHAR(50),
                nameprefix VARCHAR(12),
                namesuffix VARCHAR(12),
                primaryemail VARCHAR(80),
                username VARCHAR(50),
                address1 VARCHAR(200),
                address2 VARCHAR(200),
                address3 VARCHAR(200),
                city VARCHAR(26),
                state CHAR(2),
                province VARCHAR(20),
                zip VARCHAR(12),
                country VARCHAR(30),
                phone1 VARCHAR(30),
                phone2 VARCHAR(30),
                pagernumber VARCHAR(30),
                fax VARCHAR(30),
                mobilephone VARCHAR(30),
                email1 VARCHAR(80),
                email2 VARCHAR(80),
                url VARCHAR(80),
                newsletter VARCHAR(3),
                password_hash VARCHAR(255),
                sessionid VARCHAR(50),
                newsletterold VARCHAR(3),
                persid INT,
                lternewsletter TINYINT,
                interim BIT,
                id VARCHAR(43),
                modifier VARCHAR(50),
                moddate DATETIME,
                insertdate DATETIME DEFAULT getdate(),
                ipaddress VARCHAR(255),
                status INT DEFAULT 1,
                md5password VARCHAR(50),
                CONSTRAINT PK_person PRIMARY KEY (personid)
);
CREATE  NONCLUSTERED INDEX IX_person
 ON dbo.person
 ( personid )
;

CREATE TABLE dbo.person_corearea (
                personcoreareaid INT IDENTITY NOT NULL,
                coreareaid VARCHAR(2) NOT NULL,
                id VARCHAR(43),
                personid INT NOT NULL,
                moddate DATETIME,
                insertdate DATETIME DEFAULT getdate(),
                CONSTRAINT PK_corearea PRIMARY KEY (personcoreareaid)
);

CREATE TABLE dbo.lterperson_role (
                lterpersonroleid INT IDENTITY NOT NULL,
                personid INT,
                site VARCHAR(5),
                lterroleid VARCHAR(50),
                CONSTRAINT PK_lterperson_role PRIMARY KEY (lterpersonroleid)
);

CREATE TABLE dbo.organism (
                organismid VARCHAR(5) NOT NULL,
                organismname VARCHAR(80),
                CONSTRAINT PK_organism PRIMARY KEY (organismid)
);

CREATE TABLE dbo.persontemp (
                persontempid INT IDENTITY NOT NULL,
                tempkey INT,
                firstname VARCHAR(50) NOT NULL,
                lastname VARCHAR(50) NOT NULL,
                primaryemail VARCHAR(50) NOT NULL,
                ipaddress VARCHAR(255) NOT NULL,
                insertdate DATETIME DEFAULT getdate() NOT NULL,
                confirmed CHAR(3),
                confirmdate VARCHAR(50),
                referer VARCHAR(255),
                CONSTRAINT PK_persontemp PRIMARY KEY (persontempid)
);

CREATE TABLE dbo.habitat (
                habitatid VARCHAR(5) NOT NULL,
                habitatname VARCHAR(80),
                CONSTRAINT PK_habitat PRIMARY KEY (habitatid)
);

CREATE TABLE dbo.person_discipline (
                persondisciplineid INT IDENTITY NOT NULL,
                disciplineid VARCHAR(5) NOT NULL,
                id VARCHAR(43),
                personid INT,
                moddate DATETIME,
                insertdate DATETIME DEFAULT getdate(),
                CONSTRAINT PK_person_discipline PRIMARY KEY (persondisciplineid)
);

CREATE TABLE dbo.person_organization (
                personorganizationid INT IDENTITY NOT NULL,
                personid INT NOT NULL,
                organization VARCHAR(50) DEFAULT 'LTER',
                moddate DATETIME,
                insertdate DATETIME DEFAULT getdate(),
                CONSTRAINT PK_person_organization PRIMARY KEY (personorganizationid)
);

CREATE TABLE dbo.lter_role (
                lterroleid INT IDENTITY NOT NULL,
                rolesort INT,
                roleid VARCHAR(50) NOT NULL,
                rolename VARCHAR(50) NOT NULL,
                roledescription TEXT,
                roletype VARCHAR(50),
                CONSTRAINT PK_lter_role PRIMARY KEY (lterroleid)
);

CREATE TABLE dbo.affiliation (
                affiliationid INT IDENTITY NOT NULL,
                affiliationtextid VARCHAR(10) NOT NULL,
                affiliation VARCHAR(80) NOT NULL,
                url VARCHAR(50),
                CONSTRAINT PK_affiliation PRIMARY KEY (affiliationid)
);

CREATE TABLE dbo.export_for_drupal (
                firstname VARCHAR(30),
                lastname VARCHAR(50),
                primaryemail VARCHAR(80),
                emailalias VARCHAR(43),
                password VARCHAR(100),
                personid INT NOT NULL
);

CREATE TABLE dbo.ldap (
                ldaptableid INT IDENTITY NOT NULL,
                personid INT NOT NULL,
                emailalias VARCHAR(50),
                obfsuid VARCHAR(50),
                actiontype INT NOT NULL,
                firstname VARCHAR(50),
                lastname VARCHAR(50),
                primarysite VARCHAR(50),
                postaladdress1 VARCHAR(50),
                postaladdress2 VARCHAR(50),
                postaladdress3 VARCHAR(50),
                city VARCHAR(50),
                state VARCHAR(50),
                province VARCHAR(50),
                zip VARCHAR(50),
                country VARCHAR(50),
                telephonenumber VARCHAR(50),
                fax VARCHAR(50),
                primaryemail VARCHAR(50),
                specialty VARCHAR(50),
                password VARCHAR(50),
                moddate INT
);

CREATE TABLE dbo.LTERTable_Site (
                primarysite VARCHAR(5),
                sitename VARCHAR(255) NOT NULL,
                personid INT
);

CREATE TABLE dbo.race (
                racename VARCHAR(255) NOT NULL,
                race VARCHAR(3) NOT NULL
);

CREATE TABLE dbo.ltertable (
                ltertableid INT IDENTITY NOT NULL,
                emailalias VARCHAR(43),
                primarysitenumeric INT,
                primarysite VARCHAR(5),
                primaryrole VARCHAR(50),
                specialty VARCHAR(120),
                personid INT NOT NULL,
                primarynetwork CHAR(2),
                ilter CHAR(1) DEFAULT 'n',
                insertdate DATETIME DEFAULT getdate(),
                moddate DATETIME,
                CONSTRAINT PK_ltertable PRIMARY KEY (ltertableid)
);

CREATE TABLE dbo.isocountrycodes (
                autocountrycode INT IDENTITY NOT NULL,
                countrycode CHAR(10),
                countryname VARCHAR(50)
);

CREATE TABLE dbo.person_affiliation (
                personaffiliationid INT IDENTITY NOT NULL,
                personid INT NOT NULL,
                affiliationid INT NOT NULL,
                CONSTRAINT PK_person_affiliation PRIMARY KEY (personaffiliationid)
);

CREATE TABLE dbo.demographics (
                demographicid INT IDENTITY NOT NULL,
                personid INT NOT NULL,
                gender VARCHAR(50),
                race VARCHAR(50),
                ethnicity VARCHAR(50),
                modifier VARCHAR(50),
                moddate DATETIME,
                CONSTRAINT PK_demographics PRIMARY KEY (demographicid)
);

CREATE TABLE dbo.testtesttest (
                primaryemail VARCHAR(80),
                ilter CHAR(1)
);

CREATE TABLE dbo.ltergroup_type (
                ltergrouptypeid INT IDENTITY NOT NULL,
                grouptypename VARCHAR(100),
                grouptypedescription TEXT,
                insertdate DATETIME DEFAULT getdate()
);

CREATE TABLE dbo.person_organism (
                personorganismid INT IDENTITY NOT NULL,
                organismid VARCHAR(5) NOT NULL,
                id VARCHAR(43),
                personid INT NOT NULL,
                moddate DATETIME,
                insertdate DATETIME DEFAULT getdate(),
                CONSTRAINT PK_person_organism PRIMARY KEY (personorganismid)
);

CREATE TABLE dbo.jrn_phones (
                personid INT NOT NULL,
                firstname VARCHAR(30),
                lastname VARCHAR(50),
                phone1 VARCHAR(30),
                phone2 VARCHAR(30),
                pagernumber VARCHAR(30),
                fax VARCHAR(30),
                mobilephone VARCHAR(30)
);

CREATE TABLE dbo.ethnicity (
                eid VARCHAR(3) NOT NULL,
                ename VARCHAR(80) NOT NULL
);

CREATE TABLE dbo.person_site_contact (
                personsitecontactid INT IDENTITY NOT NULL,
                siteid INT,
                personid INT,
                contacttype VARCHAR(50),
                CONSTRAINT PK_person_site_contact PRIMARY KEY (personsitecontactid)
);

CREATE TABLE dbo.discipline (
                disciplineid VARCHAR(5) NOT NULL,
                disciplinename VARCHAR(80),
                CONSTRAINT PK_discipline PRIMARY KEY (disciplineid)
);

CREATE TABLE dbo.security (
                securityid INT IDENTITY NOT NULL,
                personid INT,
                emailalias VARCHAR(50),
                securitylevel VARCHAR(50),
                securitygroup VARCHAR(50)
);

CREATE TABLE dbo.person_habitat (
                personhabitatid INT IDENTITY NOT NULL,
                habitatid VARCHAR(5) NOT NULL,
                id VARCHAR(43),
                personid INT NOT NULL,
                moddate DATETIME,
                insertdate DATETIME DEFAULT getdate(),
                CONSTRAINT PK_person_habitat PRIMARY KEY (personhabitatid)
);

/*
Warning: Microsoft SQL Server 2000 does not support this relationship's update action (RESTRICT).
*/
ALTER TABLE dbo.person_group ADD CONSTRAINT FK_person_group_groups
FOREIGN KEY (groupid)
REFERENCES dbo.groups (groupid)
ON DELETE CASCADE;

/*
Warning: Microsoft SQL Server 2000 does not support this relationship's update action (RESTRICT).
*/
ALTER TABLE dbo.demographics ADD CONSTRAINT FK_demographics_person
FOREIGN KEY (personid)
REFERENCES dbo.person (personid)
ON DELETE CASCADE;

/*
Warning: Microsoft SQL Server 2000 does not support this relationship's update action (RESTRICT).
*/
ALTER TABLE dbo.ltertable ADD CONSTRAINT FK_ltertable_person
FOREIGN KEY (personid)
REFERENCES dbo.person (personid)
ON DELETE CASCADE;

/*
Warning: Microsoft SQL Server 2000 does not support this relationship's update action (RESTRICT).
*/
ALTER TABLE dbo.person_habitat ADD CONSTRAINT FK_person_habitat_person
FOREIGN KEY (personid)
REFERENCES dbo.person (personid)
ON DELETE CASCADE;

/*
Warning: Microsoft SQL Server 2000 does not support this relationship's update action (RESTRICT).
*/
ALTER TABLE dbo.person_organization ADD CONSTRAINT FK_person_organization_person
FOREIGN KEY (personid)
REFERENCES dbo.person (personid)
ON DELETE CASCADE;

/*
Warning: Microsoft SQL Server 2000 does not support this relationship's update action (RESTRICT).
*/
ALTER TABLE dbo.person_corearea ADD CONSTRAINT FK_person_corearea_person
FOREIGN KEY (personid)
REFERENCES dbo.person (personid)
ON DELETE CASCADE;
