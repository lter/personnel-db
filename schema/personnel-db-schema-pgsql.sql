
CREATE TABLE dbo.sysconstraints (
                constid INTEGER,
                id INTEGER,
                colid SMALLINT,
                spare1 SMALLINT,
                status INTEGER,
                actions INTEGER,
                error INTEGER
);


CREATE TABLE dbo.corearea (
                coreareaid VARCHAR(2) NOT NULL,
                coreareaname VARCHAR(80),
                CONSTRAINT pk_corearea_1 PRIMARY KEY (coreareaid)
);


CREATE SEQUENCE dbo.groups_groupid_seq;

CREATE TABLE dbo.groups (
                groupid INTEGER NOT NULL DEFAULT nextval('dbo.groups_groupid_seq'),
                groupname VARCHAR(200),
                groupdescription VARCHAR(200),
                grouptype VARCHAR(50) DEFAULT 'basic',
                groupownertext VARCHAR(100),
                groupowner INTEGER,
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
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT getdate(),
                CONSTRAINT pk_groups PRIMARY KEY (groupid)
);


ALTER SEQUENCE dbo.groups_groupid_seq OWNED BY dbo.groups.groupid;

CREATE SEQUENCE dbo.network_networkid_seq;

CREATE TABLE dbo.network (
                networkid INTEGER NOT NULL DEFAULT nextval('dbo.network_networkid_seq'),
                networkname VARCHAR(50),
                networkdescription TEXT,
                countrycode CHAR(2),
                CONSTRAINT pk_network PRIMARY KEY (networkid)
);


ALTER SEQUENCE dbo.network_networkid_seq OWNED BY dbo.network.networkid;

CREATE SEQUENCE dbo.emailalternate_emailalternateid_seq;

CREATE TABLE dbo.emailalternate (
                emailalternateid INTEGER NOT NULL DEFAULT nextval('dbo.emailalternate_emailalternateid_seq'),
                emailalias VARCHAR(50),
                eaddress VARCHAR(80)
);


ALTER SEQUENCE dbo.emailalternate_emailalternateid_seq OWNED BY dbo.emailalternate.emailalternateid;

CREATE SEQUENCE dbo.asm_gs_lunch_asmgslunchid_seq;

CREATE TABLE dbo.asm_gs_lunch (
                asmgslunchid INTEGER NOT NULL DEFAULT nextval('dbo.asm_gs_lunch_asmgslunchid_seq'),
                host INTEGER NOT NULL,
                cohost INTEGER,
                lunchday VARCHAR(50),
                numberofpeople INTEGER,
                room VARCHAR(50),
                status VARCHAR(50),
                CONSTRAINT pk_asm_gs_lunch PRIMARY KEY (asmgslunchid)
);


ALTER SEQUENCE dbo.asm_gs_lunch_asmgslunchid_seq OWNED BY dbo.asm_gs_lunch.asmgslunchid;

CREATE SEQUENCE dbo.asm_gs_lunch_schedule_asmgslunchscheduleid_seq;

CREATE TABLE dbo.asm_gs_lunch_schedule (
                asmgslunchscheduleid INTEGER NOT NULL DEFAULT nextval('dbo.asm_gs_lunch_schedule_asmgslunchscheduleid_seq'),
                asmgslunchid INTEGER,
                personid INTEGER,
                insertdate TIMESTAMP DEFAULT getdate(),
                moddate TIMESTAMP,
                CONSTRAINT pk_asm_gs_lunch_schedule PRIMARY KEY (asmgslunchscheduleid)
);


ALTER SEQUENCE dbo.asm_gs_lunch_schedule_asmgslunchscheduleid_seq OWNED BY dbo.asm_gs_lunch_schedule.asmgslunchscheduleid;

CREATE SEQUENCE dbo.research_site_researchsiteid_seq;

CREATE TABLE dbo.research_site (
                researchsiteid INTEGER NOT NULL DEFAULT nextval('dbo.research_site_researchsiteid_seq'),
                siteid INTEGER NOT NULL,
                siteidtext VARCHAR(3) NOT NULL,
                research_site_name VARCHAR(255),
                type VARCHAR(100) NOT NULL,
                description TEXT,
                parentresearchsiteid INTEGER,
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
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT getdate(),
                CONSTRAINT pk_research_site PRIMARY KEY (researchsiteid)
);


ALTER SEQUENCE dbo.research_site_researchsiteid_seq OWNED BY dbo.research_site.researchsiteid;

CREATE SEQUENCE dbo.person_group_persongroupid_seq;

CREATE TABLE dbo.person_group (
                persongroupid INTEGER NOT NULL DEFAULT nextval('dbo.person_group_persongroupid_seq'),
                personid INTEGER,
                groupid INTEGER NOT NULL,
                status INTEGER,
                chair CHAR(1) DEFAULT 'n',
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT getdate(),
                site CHAR(3),
                CONSTRAINT pk_person_group PRIMARY KEY (persongroupid)
);


ALTER SEQUENCE dbo.person_group_persongroupid_seq OWNED BY dbo.person_group.persongroupid;

CREATE TABLE dbo.syssegments (
                segment INTEGER NOT NULL,
                name VARCHAR(10) NOT NULL,
                status INTEGER NOT NULL
);


CREATE SEQUENCE dbo.person_personid_seq;

CREATE TABLE dbo.person (
                personid INTEGER NOT NULL DEFAULT nextval('dbo.person_personid_seq'),
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
                persid INTEGER,
                lternewsletter SMALLINT,
                interim BIT,
                id VARCHAR(43),
                modifier VARCHAR(50),
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT getdate(),
                ipaddress VARCHAR(255),
                status INTEGER DEFAULT 1,
                md5password VARCHAR(50),
                CONSTRAINT pk_person PRIMARY KEY (personid)
);


ALTER SEQUENCE dbo.person_personid_seq OWNED BY dbo.person.personid;

CREATE INDEX ix_person
 ON dbo.person
 ( personid ASC );

CREATE SEQUENCE dbo.person_corearea_personcoreareaid_seq;

CREATE TABLE dbo.person_corearea (
                personcoreareaid INTEGER NOT NULL DEFAULT nextval('dbo.person_corearea_personcoreareaid_seq'),
                coreareaid VARCHAR(2) NOT NULL,
                id VARCHAR(43),
                personid INTEGER NOT NULL,
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT getdate(),
                CONSTRAINT pk_corearea PRIMARY KEY (personcoreareaid)
);


ALTER SEQUENCE dbo.person_corearea_personcoreareaid_seq OWNED BY dbo.person_corearea.personcoreareaid;

CREATE SEQUENCE dbo.asm_workshop_workshopid_seq;

CREATE TABLE dbo.asm_workshop (
                workshopid INTEGER NOT NULL DEFAULT nextval('dbo.asm_workshop_workshopid_seq'),
                title VARCHAR(300),
                personid INTEGER NOT NULL,
                abstract TEXT,
                comments TEXT,
                proposeddate VARCHAR(100),
                keywords VARCHAR(500),
                moddate TIMESTAMP,
                insertdate TIMESTAMP,
                keyparticipants TEXT,
                assigneddate VARCHAR(50),
                assignedtime VARCHAR(50),
                sessionid VARCHAR(50),
                modifier VARCHAR(50),
                room VARCHAR(50),
                CONSTRAINT pk_asm_workshop PRIMARY KEY (workshopid)
);


ALTER SEQUENCE dbo.asm_workshop_workshopid_seq OWNED BY dbo.asm_workshop.workshopid;

CREATE SEQUENCE dbo.asm_poster_posterid_seq;

CREATE TABLE dbo.asm_poster (
                posterid INTEGER NOT NULL DEFAULT nextval('dbo.asm_poster_posterid_seq'),
                personid INTEGER NOT NULL,
                postertitle VARCHAR(255) NOT NULL,
                posterleadauthor VARCHAR(50) NOT NULL,
                postercoauthors VARCHAR(255),
                posterabstract TEXT NOT NULL,
                institutions VARCHAR(255),
                preferreddate VARCHAR(50),
                assignedday CHAR(10),
                assignednumber INTEGER,
                ipaddress VARCHAR(255) NOT NULL,
                assignedid VARCHAR(3),
                assignedgroup VARCHAR(50),
                insertdate TIMESTAMP DEFAULT getdate() NOT NULL,
                moddate TIMESTAMP,
                primarysite VARCHAR(4),
                comments VARCHAR(255),
                accepted VARCHAR(12),
                CONSTRAINT pk_asm_poster PRIMARY KEY (posterid)
);


ALTER SEQUENCE dbo.asm_poster_posterid_seq OWNED BY dbo.asm_poster.posterid;

CREATE SEQUENCE dbo.site_organization_siteorganizationid_seq;

CREATE TABLE dbo.site_organization (
                siteorganizationid INTEGER NOT NULL DEFAULT nextval('dbo.site_organization_siteorganizationid_seq'),
                siteid INTEGER,
                siteidtext VARCHAR(50),
                organization VARCHAR(50),
                insertdate TIMESTAMP DEFAULT getdate()
);


ALTER SEQUENCE dbo.site_organization_siteorganizationid_seq OWNED BY dbo.site_organization.siteorganizationid;

CREATE SEQUENCE dbo.lterperson_role_lterpersonroleid_seq;

CREATE TABLE dbo.lterperson_role (
                lterpersonroleid INTEGER NOT NULL DEFAULT nextval('dbo.lterperson_role_lterpersonroleid_seq'),
                personid INTEGER,
                site VARCHAR(5),
                lterroleid VARCHAR(50),
                CONSTRAINT pk_lterperson_role PRIMARY KEY (lterpersonroleid)
);


ALTER SEQUENCE dbo.lterperson_role_lterpersonroleid_seq OWNED BY dbo.lterperson_role.lterpersonroleid;

CREATE SEQUENCE dbo.dtproperties_id_seq;

CREATE TABLE dbo.dtproperties (
                id INTEGER NOT NULL DEFAULT nextval('dbo.dtproperties_id_seq'),
                property VARCHAR(64) NOT NULL,
                objectid INTEGER,
                value VARCHAR(255),
                lvalue BYTEA,
                version INTEGER DEFAULT 0 NOT NULL,
                uvalue NVARCHAR(255),
                CONSTRAINT pk_dtproperties PRIMARY KEY (id, property)
);


ALTER SEQUENCE dbo.dtproperties_id_seq OWNED BY dbo.dtproperties.id;

CREATE TABLE dbo.organism (
                organismid VARCHAR(5) NOT NULL,
                organismname VARCHAR(80),
                CONSTRAINT pk_organism PRIMARY KEY (organismid)
);


CREATE SEQUENCE dbo.research_site_descriptor_researchsitedescriptorid_seq;

CREATE TABLE dbo.research_site_descriptor (
                researchsitedescriptorid INTEGER NOT NULL DEFAULT nextval('dbo.research_site_descriptor_researchsitedescriptorid_seq'),
                researchsiteid INTEGER,
                descriptorname VARCHAR(200),
                CONSTRAINT pk_research_site_descriptor PRIMARY KEY (researchsitedescriptorid)
);


ALTER SEQUENCE dbo.research_site_descriptor_researchsitedescriptorid_seq OWNED BY dbo.research_site_descriptor.researchsitedescriptorid;

CREATE SEQUENCE dbo.persontemp_persontempid_seq;

CREATE TABLE dbo.persontemp (
                persontempid INTEGER NOT NULL DEFAULT nextval('dbo.persontemp_persontempid_seq'),
                tempkey INTEGER,
                firstname VARCHAR(50) NOT NULL,
                lastname VARCHAR(50) NOT NULL,
                primaryemail VARCHAR(50) NOT NULL,
                ipaddress VARCHAR(255) NOT NULL,
                insertdate TIMESTAMP DEFAULT getdate() NOT NULL,
                confirmed CHAR(3),
                confirmdate VARCHAR(50),
                referer VARCHAR(255),
                CONSTRAINT pk_persontemp PRIMARY KEY (persontempid)
);


ALTER SEQUENCE dbo.persontemp_persontempid_seq OWNED BY dbo.persontemp.persontempid;

CREATE TABLE dbo.habitat (
                habitatid VARCHAR(5) NOT NULL,
                habitatname VARCHAR(80),
                CONSTRAINT pk_habitat PRIMARY KEY (habitatid)
);


CREATE SEQUENCE dbo.person_discipline_persondisciplineid_seq;

CREATE TABLE dbo.person_discipline (
                persondisciplineid INTEGER NOT NULL DEFAULT nextval('dbo.person_discipline_persondisciplineid_seq'),
                disciplineid VARCHAR(5) NOT NULL,
                id VARCHAR(43),
                personid INTEGER,
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT getdate(),
                CONSTRAINT pk_person_discipline PRIMARY KEY (persondisciplineid)
);


ALTER SEQUENCE dbo.person_discipline_persondisciplineid_seq OWNED BY dbo.person_discipline.persondisciplineid;

CREATE SEQUENCE dbo.person_organization_personorganizationid_seq;

CREATE TABLE dbo.person_organization (
                personorganizationid INTEGER NOT NULL DEFAULT nextval('dbo.person_organization_personorganizationid_seq'),
                personid INTEGER NOT NULL,
                organization VARCHAR(50) DEFAULT 'LTER',
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT getdate(),
                CONSTRAINT pk_person_organization PRIMARY KEY (personorganizationid)
);


ALTER SEQUENCE dbo.person_organization_personorganizationid_seq OWNED BY dbo.person_organization.personorganizationid;

CREATE SEQUENCE dbo.lter_role_lterroleid_seq;

CREATE TABLE dbo.lter_role (
                lterroleid INTEGER NOT NULL DEFAULT nextval('dbo.lter_role_lterroleid_seq'),
                rolesort INTEGER,
                roleid VARCHAR(50) NOT NULL,
                rolename VARCHAR(50) NOT NULL,
                roledescription TEXT,
                roletype VARCHAR(50),
                CONSTRAINT pk_lter_role PRIMARY KEY (lterroleid)
);


ALTER SEQUENCE dbo.lter_role_lterroleid_seq OWNED BY dbo.lter_role.lterroleid;

CREATE SEQUENCE dbo.affiliation_affiliationid_seq;

CREATE TABLE dbo.affiliation (
                affiliationid INTEGER NOT NULL DEFAULT nextval('dbo.affiliation_affiliationid_seq'),
                affiliationtextid VARCHAR(10) NOT NULL,
                affiliation VARCHAR(80) NOT NULL,
                url VARCHAR(50),
                CONSTRAINT pk_affiliation PRIMARY KEY (affiliationid)
);


ALTER SEQUENCE dbo.affiliation_affiliationid_seq OWNED BY dbo.affiliation.affiliationid;

CREATE SEQUENCE dbo.biome_biomeid_seq;

CREATE TABLE dbo.biome (
                biomeid INTEGER NOT NULL DEFAULT nextval('dbo.biome_biomeid_seq'),
                biomename VARCHAR(255),
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT getdate(),
                CONSTRAINT pk_biome PRIMARY KEY (biomeid)
);


ALTER SEQUENCE dbo.biome_biomeid_seq OWNED BY dbo.biome.biomeid;

CREATE SEQUENCE dbo.group_organization_grouporganizationid_seq;

CREATE TABLE dbo.group_organization (
                grouporganizationid INTEGER NOT NULL DEFAULT nextval('dbo.group_organization_grouporganizationid_seq'),
                groupid INTEGER,
                organization VARCHAR(50),
                insertdate TIMESTAMP DEFAULT getdate()
);


ALTER SEQUENCE dbo.group_organization_grouporganizationid_seq OWNED BY dbo.group_organization.grouporganizationid;

CREATE SEQUENCE dbo.asm_worshop_schedule_asmworshopscheduleid_seq;

CREATE TABLE dbo.asm_worshop_schedule (
                asmworshopscheduleid INTEGER NOT NULL DEFAULT nextval('dbo.asm_worshop_schedule_asmworshopscheduleid_seq'),
                personid INTEGER NOT NULL,
                fridaypm INTEGER,
                saturdayam INTEGER,
                saturdaypm INTEGER,
                sundayam INTEGER,
                sundaypm INTEGER,
                CONSTRAINT pk_asm_worshop_schedule PRIMARY KEY (asmworshopscheduleid)
);


ALTER SEQUENCE dbo.asm_worshop_schedule_asmworshopscheduleid_seq OWNED BY dbo.asm_worshop_schedule.asmworshopscheduleid;

CREATE SEQUENCE dbo.site_affiliation_siteaffiliationid_seq;

CREATE TABLE dbo.site_affiliation (
                siteaffiliationid INTEGER NOT NULL DEFAULT nextval('dbo.site_affiliation_siteaffiliationid_seq'),
                siteid VARCHAR(3),
                affiliationid VARCHAR(50),
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT getdate(),
                CONSTRAINT pk_site_affiliation PRIMARY KEY (siteaffiliationid)
);


ALTER SEQUENCE dbo.site_affiliation_siteaffiliationid_seq OWNED BY dbo.site_affiliation.siteaffiliationid;

CREATE SEQUENCE dbo.research_site_type_researchsitetypeid_seq;

CREATE TABLE dbo.research_site_type (
                researchsitetypeid INTEGER NOT NULL DEFAULT nextval('dbo.research_site_type_researchsitetypeid_seq'),
                typename VARCHAR(100),
                typedescription VARCHAR(500)
);


ALTER SEQUENCE dbo.research_site_type_researchsitetypeid_seq OWNED BY dbo.research_site_type.researchsitetypeid;

CREATE TABLE dbo.export_for_drupal (
                firstname VARCHAR(30),
                lastname VARCHAR(50),
                primaryemail VARCHAR(80),
                emailalias VARCHAR(43),
                password VARCHAR(100),
                personid INTEGER NOT NULL
);


CREATE SEQUENCE dbo.ldap_ldaptableid_seq;

CREATE TABLE dbo.ldap (
                ldaptableid INTEGER NOT NULL DEFAULT nextval('dbo.ldap_ldaptableid_seq'),
                personid INTEGER NOT NULL,
                emailalias VARCHAR(50),
                obfsuid VARCHAR(50),
                actiontype INTEGER NOT NULL,
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
                moddate INTEGER
);


ALTER SEQUENCE dbo.ldap_ldaptableid_seq OWNED BY dbo.ldap.ldaptableid;

CREATE TABLE dbo.LTERTable_Site (
                primarysite VARCHAR(5),
                sitename VARCHAR(255) NOT NULL,
                personid INTEGER
);


CREATE SEQUENCE dbo.research_site_descriptor_type_research_site_descriptor_typei608;

CREATE TABLE dbo.research_site_descriptor_type (
                research_site_descriptor_typeid INTEGER NOT NULL DEFAULT nextval('dbo.research_site_descriptor_type_research_site_descriptor_typei608'),
                researchsitetypeid INTEGER,
                descriptorname VARCHAR(200),
                descriptordescription VARCHAR(500),
                CONSTRAINT pk_research_site_descriptor_type PRIMARY KEY (research_site_descriptor_typeid)
);


ALTER SEQUENCE dbo.research_site_descriptor_type_research_site_descriptor_typei608 OWNED BY dbo.research_site_descriptor_type.research_site_descriptor_typeid;

CREATE TABLE dbo.race (
                racename VARCHAR(255) NOT NULL,
                race VARCHAR(3) NOT NULL
);


CREATE SEQUENCE dbo.metstationtype_metstationtypeid_seq;

CREATE TABLE dbo.metstationtype (
                metstationtypeid INTEGER NOT NULL DEFAULT nextval('dbo.metstationtype_metstationtypeid_seq'),
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT getdate()
);


ALTER SEQUENCE dbo.metstationtype_metstationtypeid_seq OWNED BY dbo.metstationtype.metstationtypeid;

CREATE SEQUENCE dbo.ltertable_ltertableid_seq;

CREATE TABLE dbo.ltertable (
                ltertableid INTEGER NOT NULL DEFAULT nextval('dbo.ltertable_ltertableid_seq'),
                emailalias VARCHAR(43),
                primarysitenumeric INTEGER,
                primarysite VARCHAR(5),
                primaryrole VARCHAR(50),
                specialty VARCHAR(120),
                personid INTEGER NOT NULL,
                primarynetwork CHAR(2),
                ilter CHAR(1) DEFAULT 'n',
                insertdate TIMESTAMP DEFAULT getdate(),
                moddate TIMESTAMP,
                CONSTRAINT pk_ltertable PRIMARY KEY (ltertableid)
);


ALTER SEQUENCE dbo.ltertable_ltertableid_seq OWNED BY dbo.ltertable.ltertableid;

CREATE TABLE dbo.site_biome (
                sitebiomeid INTEGER,
                siteid INTEGER,
                biomeid INTEGER,
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT getdate()
);


CREATE SEQUENCE dbo.isocountrycodes_autocountrycode_seq;

CREATE TABLE dbo.isocountrycodes (
                autocountrycode INTEGER NOT NULL DEFAULT nextval('dbo.isocountrycodes_autocountrycode_seq'),
                countrycode CHAR(10),
                countryname VARCHAR(50)
);


ALTER SEQUENCE dbo.isocountrycodes_autocountrycode_seq OWNED BY dbo.isocountrycodes.autocountrycode;

CREATE SEQUENCE dbo.site_bailey_sitebaileyid_seq;

CREATE TABLE dbo.site_bailey (
                sitebaileyid INTEGER NOT NULL DEFAULT nextval('dbo.site_bailey_sitebaileyid_seq'),
                siteid INTEGER NOT NULL,
                baileyid VARCHAR(10),
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT getdate()
);


ALTER SEQUENCE dbo.site_bailey_sitebaileyid_seq OWNED BY dbo.site_bailey.sitebaileyid;

CREATE SEQUENCE dbo.iltertable_iltertableid_seq;

CREATE TABLE dbo.iltertable (
                iltertableid INTEGER NOT NULL DEFAULT nextval('dbo.iltertable_iltertableid_seq'),
                emailalias VARCHAR(43),
                primarysite VARCHAR(5),
                primaryrole VARCHAR(50),
                specialty VARCHAR(120),
                personid INTEGER,
                primarynetwork CHAR(2),
                ilter CHAR(1),
                insertdate TIMESTAMP DEFAULT getdate(),
                moddate TIMESTAMP
);


ALTER SEQUENCE dbo.iltertable_iltertableid_seq OWNED BY dbo.iltertable.iltertableid;

CREATE SEQUENCE dbo.person_affiliation_personaffiliationid_seq;

CREATE TABLE dbo.person_affiliation (
                personaffiliationid INTEGER NOT NULL DEFAULT nextval('dbo.person_affiliation_personaffiliationid_seq'),
                personid INTEGER NOT NULL,
                affiliationid INTEGER NOT NULL,
                CONSTRAINT pk_person_affiliation PRIMARY KEY (personaffiliationid)
);


ALTER SEQUENCE dbo.person_affiliation_personaffiliationid_seq OWNED BY dbo.person_affiliation.personaffiliationid;

CREATE SEQUENCE dbo.contact_contactid_seq;

CREATE TABLE dbo.contact (
                contactid INTEGER NOT NULL DEFAULT nextval('dbo.contact_contactid_seq'),
                personid INTEGER NOT NULL,
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
                contacttypeid INTEGER,
                contacttype VARCHAR(10) DEFAULT 'primary',
                persid INTEGER,
                modifier VARCHAR(50),
                moddate TIMESTAMP,
                modname VARCHAR(50),
                insertdate TIMESTAMP DEFAULT getdate(),
                email3 VARCHAR(80),
                CONSTRAINT pk_contact PRIMARY KEY (contactid)
);


ALTER SEQUENCE dbo.contact_contactid_seq OWNED BY dbo.contact.contactid;

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


CREATE SEQUENCE dbo.demographics_demographicid_seq;

CREATE TABLE dbo.demographics (
                demographicid INTEGER NOT NULL DEFAULT nextval('dbo.demographics_demographicid_seq'),
                personid INTEGER NOT NULL,
                gender VARCHAR(50),
                race VARCHAR(50),
                ethnicity VARCHAR(50),
                modifier VARCHAR(50),
                moddate TIMESTAMP,
                CONSTRAINT pk_demographics PRIMARY KEY (demographicid)
);


ALTER SEQUENCE dbo.demographics_demographicid_seq OWNED BY dbo.demographics.demographicid;

CREATE TABLE dbo.testtesttest (
                primaryemail VARCHAR(80),
                ilter CHAR(1)
);


CREATE SEQUENCE dbo.site_contact_sitecontactid_seq;

CREATE TABLE dbo.site_contact (
                sitecontactid INTEGER NOT NULL DEFAULT nextval('dbo.site_contact_sitecontactid_seq'),
                siteid INTEGER,
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
                contacttypeid INTEGER NOT NULL,
                modifier VARCHAR(50),
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT getdate(),
                CONSTRAINT pk_site_contact PRIMARY KEY (sitecontactid)
);


ALTER SEQUENCE dbo.site_contact_sitecontactid_seq OWNED BY dbo.site_contact.sitecontactid;

CREATE SEQUENCE dbo.ltergroup_type_ltergrouptypeid_seq;

CREATE TABLE dbo.ltergroup_type (
                ltergrouptypeid INTEGER NOT NULL DEFAULT nextval('dbo.ltergroup_type_ltergrouptypeid_seq'),
                grouptypename VARCHAR(100),
                grouptypedescription TEXT,
                insertdate TIMESTAMP DEFAULT getdate()
);


ALTER SEQUENCE dbo.ltergroup_type_ltergrouptypeid_seq OWNED BY dbo.ltergroup_type.ltergrouptypeid;

CREATE SEQUENCE dbo.contact_type_contacttypeid_seq;

CREATE TABLE dbo.contact_type (
                contacttypeid INTEGER NOT NULL DEFAULT nextval('dbo.contact_type_contacttypeid_seq'),
                contacttype VARCHAR(50) NOT NULL,
                contacttypedescription VARCHAR(255) NOT NULL,
                contacttitle VARCHAR(50) NOT NULL,
                CONSTRAINT pk_contact_type PRIMARY KEY (contacttypeid)
);


ALTER SEQUENCE dbo.contact_type_contacttypeid_seq OWNED BY dbo.contact_type.contacttypeid;

CREATE SEQUENCE dbo.person_organism_personorganismid_seq;

CREATE TABLE dbo.person_organism (
                personorganismid INTEGER NOT NULL DEFAULT nextval('dbo.person_organism_personorganismid_seq'),
                organismid VARCHAR(5) NOT NULL,
                id VARCHAR(43),
                personid INTEGER NOT NULL,
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT getdate(),
                CONSTRAINT pk_person_organism PRIMARY KEY (personorganismid)
);


ALTER SEQUENCE dbo.person_organism_personorganismid_seq OWNED BY dbo.person_organism.personorganismid;

CREATE TABLE dbo.committee_member (
                committeeid INTEGER,
                personid INTEGER,
                persid VARCHAR(200),
                committeecode VARCHAR(50),
                siteid VARCHAR(50),
                organizationid VARCHAR(50),
                startdate TIMESTAMP,
                enddate TIMESTAMP
);


CREATE TABLE dbo.jrn_phones (
                personid INTEGER NOT NULL,
                firstname VARCHAR(30),
                lastname VARCHAR(50),
                phone1 VARCHAR(30),
                phone2 VARCHAR(30),
                pagernumber VARCHAR(30),
                fax VARCHAR(30),
                mobilephone VARCHAR(30)
);


CREATE SEQUENCE dbo.site_siteid_seq;

CREATE TABLE dbo.site (
                siteid INTEGER NOT NULL DEFAULT nextval('dbo.site_siteid_seq'),
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
                moddate TIMESTAMP,
                modifier VARCHAR(50),
                CONSTRAINT pk_site PRIMARY KEY (siteid)
);


ALTER SEQUENCE dbo.site_siteid_seq OWNED BY dbo.site.siteid;

CREATE TABLE dbo.comments (
                commentsid INTEGER NOT NULL,
                personid INTEGER NOT NULL,
                emailalias VARCHAR(50),
                commenttitle VARCHAR(250) NOT NULL,
                comment TEXT NOT NULL,
                url VARCHAR(250) NOT NULL,
                insertdate TIMESTAMP NOT NULL
);


CREATE TABLE dbo.committees_members (
                firstname VARCHAR(30),
                lastname VARCHAR(50),
                personid INTEGER NOT NULL,
                primarysite VARCHAR(5),
                chair CHAR(1),
                groupid INTEGER,
                grouptype VARCHAR(50),
                groupname VARCHAR(200)
);


CREATE TABLE dbo.ethnicity (
                eid VARCHAR(3) NOT NULL,
                ename VARCHAR(80) NOT NULL
);


CREATE TABLE dbo.newsletter_temp (
                tempkey INTEGER NOT NULL,
                firstname VARCHAR(50),
                lastname VARCHAR(50),
                email VARCHAR(50),
                ipaddress VARCHAR(255),
                lternewsletter SMALLINT,
                tempaction VARCHAR(50)
);


CREATE SEQUENCE dbo.person_site_contact_personsitecontactid_seq;

CREATE TABLE dbo.person_site_contact (
                personsitecontactid INTEGER NOT NULL DEFAULT nextval('dbo.person_site_contact_personsitecontactid_seq'),
                siteid INTEGER,
                personid INTEGER,
                contacttype VARCHAR(50),
                CONSTRAINT pk_person_site_contact PRIMARY KEY (personsitecontactid)
);


ALTER SEQUENCE dbo.person_site_contact_personsitecontactid_seq OWNED BY dbo.person_site_contact.personsitecontactid;

CREATE TABLE dbo.discipline (
                disciplineid VARCHAR(5) NOT NULL,
                disciplinename VARCHAR(80),
                CONSTRAINT pk_discipline PRIMARY KEY (disciplineid)
);


CREATE SEQUENCE dbo.workshop_workshopid_seq;

CREATE TABLE dbo.workshop (
                workshopid INTEGER NOT NULL DEFAULT nextval('dbo.workshop_workshopid_seq'),
                title VARCHAR(300),
                organizer VARCHAR(300),
                abstract VARCHAR(1000),
                description TEXT,
                proposeddate VARCHAR(100),
                keywords VARCHAR(500),
                CONSTRAINT pk_workshop PRIMARY KEY (workshopid)
);


ALTER SEQUENCE dbo.workshop_workshopid_seq OWNED BY dbo.workshop.workshopid;

CREATE SEQUENCE dbo.security_securityid_seq;

CREATE TABLE dbo.security (
                securityid INTEGER NOT NULL DEFAULT nextval('dbo.security_securityid_seq'),
                personid INTEGER,
                emailalias VARCHAR(50),
                securitylevel VARCHAR(50),
                securitygroup VARCHAR(50)
);


ALTER SEQUENCE dbo.security_securityid_seq OWNED BY dbo.security.securityid;

CREATE SEQUENCE dbo.person_habitat_personhabitatid_seq;

CREATE TABLE dbo.person_habitat (
                personhabitatid INTEGER NOT NULL DEFAULT nextval('dbo.person_habitat_personhabitatid_seq'),
                habitatid VARCHAR(5) NOT NULL,
                id VARCHAR(43),
                personid INTEGER NOT NULL,
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT getdate(),
                CONSTRAINT pk_person_habitat PRIMARY KEY (personhabitatid)
);


ALTER SEQUENCE dbo.person_habitat_personhabitatid_seq OWNED BY dbo.person_habitat.personhabitatid;

CREATE SEQUENCE dbo.bailey_baileyid_seq;

CREATE TABLE dbo.bailey (
                baileyid INTEGER NOT NULL DEFAULT nextval('dbo.bailey_baileyid_seq'),
                baileynumber VARCHAR(10) NOT NULL,
                baileyname VARCHAR(255),
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT getdate(),
                CONSTRAINT pk_bailey PRIMARY KEY (baileyid)
);


ALTER SEQUENCE dbo.bailey_baileyid_seq OWNED BY dbo.bailey.baileyid;

CREATE SEQUENCE dbo.field_station_fieldstationid_seq;

CREATE TABLE dbo.field_station (
                fieldstationid INTEGER NOT NULL DEFAULT nextval('dbo.field_station_fieldstationid_seq'),
                siteid INTEGER,
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
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT getdate()
);


ALTER SEQUENCE dbo.field_station_fieldstationid_seq OWNED BY dbo.field_station.fieldstationid;

ALTER TABLE dbo.person_group ADD CONSTRAINT fk_person_group_groups
FOREIGN KEY (groupid)
REFERENCES dbo.groups (groupid)
ON DELETE CASCADE
ON UPDATE RESTRICT
NOT DEFERRABLE;

ALTER TABLE dbo.demographics ADD CONSTRAINT fk_demographics_person
FOREIGN KEY (personid)
REFERENCES dbo.person (personid)
ON DELETE CASCADE
ON UPDATE RESTRICT
NOT DEFERRABLE;

ALTER TABLE dbo.ltertable ADD CONSTRAINT fk_ltertable_person
FOREIGN KEY (personid)
REFERENCES dbo.person (personid)
ON DELETE CASCADE
ON UPDATE RESTRICT
NOT DEFERRABLE;

ALTER TABLE dbo.person_habitat ADD CONSTRAINT fk_person_habitat_person
FOREIGN KEY (personid)
REFERENCES dbo.person (personid)
ON DELETE CASCADE
ON UPDATE RESTRICT
NOT DEFERRABLE;

ALTER TABLE dbo.person_organization ADD CONSTRAINT fk_person_organization_person
FOREIGN KEY (personid)
REFERENCES dbo.person (personid)
ON DELETE CASCADE
ON UPDATE RESTRICT
NOT DEFERRABLE;

ALTER TABLE dbo.asm_poster ADD CONSTRAINT fk_asm_poster_person
FOREIGN KEY (personid)
REFERENCES dbo.person (personid)
ON DELETE RESTRICT
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE dbo.asm_workshop ADD CONSTRAINT fk_asm_workshop_person
FOREIGN KEY (personid)
REFERENCES dbo.person (personid)
ON DELETE RESTRICT
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE dbo.person_corearea ADD CONSTRAINT fk_person_corearea_person
FOREIGN KEY (personid)
REFERENCES dbo.person (personid)
ON DELETE CASCADE
ON UPDATE RESTRICT
NOT DEFERRABLE;
