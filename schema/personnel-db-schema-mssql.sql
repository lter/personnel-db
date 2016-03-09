CREATE TABLE dbo.sysconstraints (
                constid INT,
                id INT,
                colid SMALLINT,
                spare1 TINYINT,
                status INT,
                actions INT,
                error INT
);

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

CREATE TABLE dbo.asm_gs_lunch (
                asmgslunchid INT IDENTITY NOT NULL,
                host INT NOT NULL,
                cohost INT,
                lunchday VARCHAR(50),
                numberofpeople INT,
                room VARCHAR(50),
                status VARCHAR(50),
                CONSTRAINT PK_asm_gs_lunch PRIMARY KEY (asmgslunchid)
);

CREATE TABLE dbo.asm_gs_lunch_schedule (
                asmgslunchscheduleid INT IDENTITY NOT NULL,
                asmgslunchid INT,
                personid INT,
                insertdate DATETIME DEFAULT getdate(),
                moddate DATETIME,
                CONSTRAINT PK_asm_gs_lunch_schedule PRIMARY KEY (asmgslunchscheduleid)
);

CREATE TABLE dbo.research_site (
                researchsiteid INT IDENTITY NOT NULL,
                siteid INT NOT NULL,
                siteidtext VARCHAR(3) NOT NULL,
                research_site_name VARCHAR(255),
                type VARCHAR(100) NOT NULL,
                description TEXT,
                parentresearchsiteid INT,
                area VARCHAR(53),
                latitude_degrees VARCHAR(50),
                latitude_minutes VARCHAR(50),
                latitude_seconds VARCHAR(50),
                longitude_degrees VARCHAR(50),
                longitude_minutes VARCHAR(50),
                longitude_seconds VARCHAR(50),
                latitude_nw_degrees VARCHAR(50),
                latitude_nw_minutes VARCHAR(50),
                latitude_nw_seconds VARCHAR(50),
                longitude_nw_degrees VARCHAR(50),
                longitude_nw_minutes VARCHAR(50),
                longitude_nw_seconds VARCHAR(50),
                latitude_se_degrees VARCHAR(50),
                latitude_se_minutes VARCHAR(50),
                latitude_se_seconds VARCHAR(50),
                longitude_se_degrees VARCHAR(50),
                longitude_se_minutes VARCHAR(50),
                longitude_se_seconds VARCHAR(50),
                low_elevation VARCHAR(53),
                mean_elevation VARCHAR(53),
                high_elevation VARCHAR(53),
                disturbance_regime TEXT,
                research_site_history TEXT,
                research_site_url VARCHAR(255),
                moddate DATETIME,
                insertdate DATETIME DEFAULT getdate(),
                CONSTRAINT PK_research_site PRIMARY KEY (researchsiteid)
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

CREATE TABLE dbo.syssegments (
                segment INT NOT NULL,
                name VARCHAR(10) NOT NULL,
                status INT NOT NULL
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

CREATE TABLE dbo.asm_workshop (
                workshopid INT IDENTITY NOT NULL,
                title VARCHAR(300),
                personid INT NOT NULL,
                abstract TEXT,
                comments TEXT,
                proposeddate VARCHAR(100),
                keywords VARCHAR(500),
                moddate DATETIME,
                insertdate DATETIME,
                keyparticipants TEXT,
                assigneddate VARCHAR(50),
                assignedtime VARCHAR(50),
                sessionid VARCHAR(50),
                modifier VARCHAR(50),
                room VARCHAR(50),
                CONSTRAINT PK_asm_workshop PRIMARY KEY (workshopid)
);

CREATE TABLE dbo.asm_poster (
                posterid INT IDENTITY NOT NULL,
                personid INT NOT NULL,
                postertitle VARCHAR(255) NOT NULL,
                posterleadauthor VARCHAR(50) NOT NULL,
                postercoauthors VARCHAR(255),
                posterabstract TEXT NOT NULL,
                institutions VARCHAR(255),
                preferreddate VARCHAR(50),
                assignedday CHAR(10),
                assignednumber INT,
                ipaddress VARCHAR(255) NOT NULL,
                assignedid VARCHAR(3),
                assignedgroup VARCHAR(50),
                insertdate DATETIME DEFAULT getdate() NOT NULL,
                moddate DATETIME,
                primarysite VARCHAR(4),
                comments VARCHAR(255),
                accepted VARCHAR(12),
                CONSTRAINT PK_asm_poster PRIMARY KEY (posterid)
);

CREATE TABLE dbo.site_organization (
                siteorganizationid INT IDENTITY NOT NULL,
                siteid INT,
                siteidtext VARCHAR(50),
                organization VARCHAR(50),
                insertdate DATETIME DEFAULT getdate()
);

CREATE TABLE dbo.lterperson_role (
                lterpersonroleid INT IDENTITY NOT NULL,
                personid INT,
                site VARCHAR(5),
                lterroleid VARCHAR(50),
                CONSTRAINT PK_lterperson_role PRIMARY KEY (lterpersonroleid)
);

CREATE TABLE dbo.dtproperties (
                id INT IDENTITY NOT NULL,
                property VARCHAR(64) NOT NULL,
                objectid INT,
                value VARCHAR(255),
                lvalue IMAGE,
                version INT DEFAULT 0 NOT NULL,
                uvalue NVARCHAR(255),
                CONSTRAINT pk_dtproperties PRIMARY KEY (id, property)
);

CREATE TABLE dbo.organism (
                organismid VARCHAR(5) NOT NULL,
                organismname VARCHAR(80),
                CONSTRAINT PK_organism PRIMARY KEY (organismid)
);

CREATE TABLE dbo.research_site_descriptor (
                researchsitedescriptorid INT IDENTITY NOT NULL,
                researchsiteid INT,
                descriptorname VARCHAR(200),
                CONSTRAINT PK_research_site_descriptor PRIMARY KEY (researchsitedescriptorid)
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

CREATE TABLE dbo.biome (
                biomeid INT IDENTITY NOT NULL,
                biomename VARCHAR(255),
                moddate DATETIME,
                insertdate DATETIME DEFAULT getdate(),
                CONSTRAINT PK_biome PRIMARY KEY (biomeid)
);

CREATE TABLE dbo.group_organization (
                grouporganizationid INT IDENTITY NOT NULL,
                groupid INT,
                organization VARCHAR(50),
                insertdate DATETIME DEFAULT getdate()
);

CREATE TABLE dbo.asm_worshop_schedule (
                asmworshopscheduleid INT IDENTITY NOT NULL,
                personid INT NOT NULL,
                fridaypm INT,
                saturdayam INT,
                saturdaypm INT,
                sundayam INT,
                sundaypm INT,
                CONSTRAINT PK_asm_worshop_schedule PRIMARY KEY (asmworshopscheduleid)
);

CREATE TABLE dbo.site_affiliation (
                siteaffiliationid INT IDENTITY NOT NULL,
                siteid VARCHAR(3),
                affiliationid VARCHAR(50),
                moddate DATETIME,
                insertdate DATETIME DEFAULT getdate(),
                CONSTRAINT PK_site_affiliation PRIMARY KEY (siteaffiliationid)
);

CREATE TABLE dbo.research_site_type (
                researchsitetypeid INT IDENTITY NOT NULL,
                typename VARCHAR(100),
                typedescription VARCHAR(500)
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

CREATE TABLE dbo.research_site_descriptor_type (
                research_site_descriptor_typeid INT IDENTITY NOT NULL,
                researchsitetypeid INT,
                descriptorname VARCHAR(200),
                descriptordescription VARCHAR(500),
                CONSTRAINT PK_research_site_descriptor_type PRIMARY KEY (research_site_descriptor_typeid)
);

CREATE TABLE dbo.race (
                racename VARCHAR(255) NOT NULL,
                race VARCHAR(3) NOT NULL
);

CREATE TABLE dbo.metstationtype (
                metstationtypeid INT IDENTITY NOT NULL,
                moddate DATETIME,
                insertdate DATETIME DEFAULT getdate()
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

CREATE TABLE dbo.site_biome (
                sitebiomeid INT,
                siteid INT,
                biomeid INT,
                moddate DATETIME,
                insertdate DATETIME DEFAULT getdate()
);

CREATE TABLE dbo.isocountrycodes (
                autocountrycode INT IDENTITY NOT NULL,
                countrycode CHAR(10),
                countryname VARCHAR(50)
);

CREATE TABLE dbo.site_bailey (
                sitebaileyid INT IDENTITY NOT NULL,
                siteid INT NOT NULL,
                baileyid VARCHAR(10),
                moddate DATETIME,
                insertdate DATETIME DEFAULT getdate()
);

CREATE TABLE dbo.iltertable (
                iltertableid INT IDENTITY NOT NULL,
                emailalias VARCHAR(43),
                primarysite VARCHAR(5),
                primaryrole VARCHAR(50),
                specialty VARCHAR(120),
                personid INT,
                primarynetwork CHAR(2),
                ilter CHAR(1),
                insertdate DATETIME DEFAULT getdate(),
                moddate DATETIME
);

CREATE TABLE dbo.person_affiliation (
                personaffiliationid INT IDENTITY NOT NULL,
                personid INT NOT NULL,
                affiliationid INT NOT NULL,
                CONSTRAINT PK_person_affiliation PRIMARY KEY (personaffiliationid)
);

CREATE TABLE dbo.contact (
                contactid INT IDENTITY NOT NULL,
                personid INT NOT NULL,
                username VARCHAR(50),
                address1 VARCHAR(200),
                address2 VARCHAR(200),
                address3 VARCHAR(200),
                city VARCHAR(26),
                state VARCHAR(2),
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
                contacttypeid INT,
                contacttype VARCHAR(10) DEFAULT 'primary',
                persid INT,
                modifier VARCHAR(50),
                moddate DATETIME,
                modname VARCHAR(50),
                insertdate DATETIME DEFAULT getdate(),
                email3 VARCHAR(80),
                CONSTRAINT PK_contact PRIMARY KEY (contactid)
);

CREATE TABLE dbo.michelle_VIEW (
                title VARCHAR(80),
                nameprefix VARCHAR(12),
                firstname VARCHAR(30),
                middlename VARCHAR(20),
                lastname VARCHAR(50),
                nickname VARCHAR(50),
                namesuffix VARCHAR(12),
                address1 VARCHAR(200),
                address2 VARCHAR(200),
                address3 VARCHAR(200),
                city VARCHAR(26),
                state VARCHAR(2),
                zip VARCHAR(12),
                primaryemail VARCHAR(80),
                sitename VARCHAR(255) NOT NULL,
                disciplinename VARCHAR(80),
                primaryrole VARCHAR(50)
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

CREATE TABLE dbo.site_contact (
                sitecontactid INT IDENTITY NOT NULL,
                siteid INT,
                address1 VARCHAR(200),
                address2 VARCHAR(200),
                address3 VARCHAR(200),
                city VARCHAR(26),
                state VARCHAR(2),
                province VARCHAR(20),
                zip VARCHAR(12),
                country VARCHAR(30),
                phone1 VARCHAR(30),
                phone2 VARCHAR(30),
                fax VARCHAR(30),
                email1 VARCHAR(80),
                email2 VARCHAR(80),
                url VARCHAR(80),
                contacttypeid INT NOT NULL,
                modifier VARCHAR(50),
                moddate DATETIME,
                insertdate DATETIME DEFAULT getdate(),
                CONSTRAINT PK_site_contact PRIMARY KEY (sitecontactid)
);

CREATE TABLE dbo.ltergroup_type (
                ltergrouptypeid INT IDENTITY NOT NULL,
                grouptypename VARCHAR(100),
                grouptypedescription TEXT,
                insertdate DATETIME DEFAULT getdate()
);

CREATE TABLE dbo.contact_type (
                contacttypeid INT IDENTITY NOT NULL,
                contacttype VARCHAR(50) NOT NULL,
                contacttypedescription VARCHAR(255) NOT NULL,
                contacttitle VARCHAR(50) NOT NULL,
                CONSTRAINT PK_contact_type PRIMARY KEY (contacttypeid)
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

CREATE TABLE dbo.committee_member (
                committeeid INT,
                personid INT,
                persid VARCHAR(200),
                committeecode VARCHAR(50),
                siteid VARCHAR(50),
                organizationid VARCHAR(50),
                startdate DATETIME,
                enddate DATETIME
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

CREATE TABLE dbo.site (
                siteid INT IDENTITY NOT NULL,
                siteidtext VARCHAR(3) NOT NULL,
                sitename VARCHAR(255) NOT NULL,
                sitedescription TEXT,
                shortsitedescription VARCHAR(500),
                sitesynonyms VARCHAR(100),
                sitehistory TEXT,
                shortsitehistory VARCHAR(500),
                researchtopics TEXT,
                shortresearchtopics VARCHAR(500),
                address VARCHAR(100),
                city VARCHAR(50),
                state VARCHAR(30),
                zip VARCHAR(15),
                country VARCHAR(50),
                siteemail VARCHAR(30),
                sitephone VARCHAR(18),
                fax VARCHAR(20),
                homepage VARCHAR(255),
                siteimage VARCHAR(255),
                sitemap VARCHAR(255),
                dataurl VARCHAR(255),
                bibliourl VARCHAR(255),
                personnelurl VARCHAR(255),
                newsletterurl VARCHAR(255),
                educationurl VARCHAR(300),
                imurl VARCHAR(300),
                latitudesite VARCHAR(50),
                longitudesite VARCHAR(50),
                networkname CHAR(2),
                moddate DATETIME,
                modifier VARCHAR(50),
                CONSTRAINT PK_site PRIMARY KEY (siteid)
);

CREATE TABLE dbo.comments (
                commentsid INT NOT NULL,
                personid INT NOT NULL,
                emailalias VARCHAR(50),
                commenttitle VARCHAR(250) NOT NULL,
                comment TEXT NOT NULL,
                url VARCHAR(250) NOT NULL,
                insertdate DATETIME NOT NULL
);

CREATE TABLE dbo.committees_members (
                firstname VARCHAR(30),
                lastname VARCHAR(50),
                personid INT NOT NULL,
                primarysite VARCHAR(5),
                chair CHAR(1),
                groupid INT,
                grouptype VARCHAR(50),
                groupname VARCHAR(200)
);

CREATE TABLE dbo.ethnicity (
                eid VARCHAR(3) NOT NULL,
                ename VARCHAR(80) NOT NULL
);

CREATE TABLE dbo.newsletter_temp (
                tempkey INT NOT NULL,
                firstname VARCHAR(50),
                lastname VARCHAR(50),
                email VARCHAR(50),
                ipaddress VARCHAR(255),
                lternewsletter TINYINT,
                tempaction VARCHAR(50)
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

CREATE TABLE dbo.workshop (
                workshopid INT IDENTITY NOT NULL,
                title VARCHAR(300),
                organizer VARCHAR(300),
                abstract VARCHAR(1000),
                description TEXT,
                proposeddate VARCHAR(100),
                keywords VARCHAR(500),
                CONSTRAINT PK_workshop PRIMARY KEY (workshopid)
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

CREATE TABLE dbo.bailey (
                baileyid INT IDENTITY NOT NULL,
                baileynumber VARCHAR(10) NOT NULL,
                baileyname VARCHAR(255),
                moddate DATETIME,
                insertdate DATETIME DEFAULT getdate(),
                CONSTRAINT PK_bailey PRIMARY KEY (baileyid)
);

CREATE TABLE dbo.field_station (
                fieldstationid INT IDENTITY NOT NULL,
                siteid INT,
                fieldstationidtext VARCHAR(5),
                fieldstationname VARCHAR(80),
                latdegrees CHAR(10),
                latminutes CHAR(10),
                latseconds CHAR(10),
                longdegrees CHAR(10),
                longminutes CHAR(10),
                longseconds CHAR(10),
                lowelevation CHAR(10),
                highelevation CHAR(10),
                areaowned VARCHAR(50),
                researcharea VARCHAR(50),
                directions TEXT,
                busaccess CHAR(1),
                vehicleaccess VARCHAR(500),
                stationopen CHAR(10),
                stationclose CHAR(10),
                freshwaterbody CHAR(1),
                waterdescription VARCHAR(200),
                marineaccess CHAR(1),
                marineaccessdescription VARCHAR(200),
                dorms CHAR(1),
                cabins CHAR(1),
                camping CHAR(1),
                trailerhookups CHAR(1),
                occupancyfacilities VARCHAR(200),
                classrooms CHAR(1),
                avequipment CHAR(1),
                computers CHAR(1),
                netaccess CHAR(1),
                educationalfacilities VARCHAR(200),
                drylab CHAR(1),
                wetlab CHAR(1),
                researchfacilities CHAR(10),
                foodservice CHAR(1),
                foodfacilities VARCHAR(200),
                k12program CHAR(1),
                k12dayvisits CHAR(1),
                numberannualvisitors CHAR(4),
                k12extendeddayvisits CHAR(4),
                kto2percent CHAR(3),
                threetofivepercent CHAR(3),
                sixtoeightpercent CHAR(3),
                ninetotwelvepercent CHAR(3),
                k12teachertrainingdays CHAR(7),
                k12researchdays CHAR(7),
                k12activities VARCHAR(200),
                teachertraining CHAR(1),
                numberundergradcourses VARCHAR(4),
                numberundergradenrolled VARCHAR(4),
                teachingfirstmonth VARCHAR(3),
                teachinglastmonth VARCHAR(3),
                residentfaculty CHAR(1),
                residentfacultynumber VARCHAR(4),
                visitingfaculty CHAR(1),
                visitingfacultynumber VARCHAR(4),
                visitingclassfacilities CHAR(1),
                maxclasssize VARCHAR(4),
                researchplan CHAR(1),
                publicationlist CHAR(1),
                datamanagementplan CHAR(1),
                specieslist CHAR(1),
                climatedata CHAR(1),
                annualreport CHAR(1),
                sitemasterplan CHAR(1),
                undergradresearch CHAR(1),
                numberundergradresearch VARCHAR(50),
                paidundergradresearch VARCHAR(1),
                researchkeywords VARCHAR(200),
                facultykeywords CHAR(10),
                researchprogramdescription TEXT,
                contactfirstname VARCHAR(30),
                contactmiddlename VARCHAR(20),
                contactlastname VARCHAR(50),
                contactnameprefix VARCHAR(12),
                contactnamesuffix VARCHAR(12),
                contactnametitle VARCHAR(80),
                address1 VARCHAR(200),
                address2 VARCHAR(200),
                address3 VARCHAR(200),
                city VARCHAR(26),
                state VARCHAR(2),
                province VARCHAR(20),
                zip VARCHAR(12),
                country VARCHAR(30),
                phone1 VARCHAR(30),
                phone2 VARCHAR(30),
                fax VARCHAR(30),
                mobilephone VARCHAR(30),
                email VARCHAR(80),
                url VARCHAR(100),
                comments VARCHAR(50),
                moddate DATETIME,
                insertdate DATETIME DEFAULT getdate()
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
Warning: Microsoft SQL Server 2000 does not support this relationship's delete action (RESTRICT).
*/
ALTER TABLE dbo.asm_poster ADD CONSTRAINT FK_asm_poster_person
FOREIGN KEY (personid)
REFERENCES dbo.person (personid)
ON UPDATE CASCADE;

/*
Warning: Microsoft SQL Server 2000 does not support this relationship's delete action (RESTRICT).
*/
ALTER TABLE dbo.asm_workshop ADD CONSTRAINT FK_asm_workshop_person
FOREIGN KEY (personid)
REFERENCES dbo.person (personid)
ON UPDATE CASCADE;

/*
Warning: Microsoft SQL Server 2000 does not support this relationship's update action (RESTRICT).
*/
ALTER TABLE dbo.person_corearea ADD CONSTRAINT FK_person_corearea_person
FOREIGN KEY (personid)
REFERENCES dbo.person (personid)
ON DELETE CASCADE;
