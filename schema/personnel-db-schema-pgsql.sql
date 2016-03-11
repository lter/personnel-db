
CREATE TABLE corearea (
                coreareaid VARCHAR(2) NOT NULL,
                coreareaname VARCHAR(80),
                CONSTRAINT pk_corearea_1 PRIMARY KEY (coreareaid)
);


CREATE SEQUENCE groups_groupid_seq;

CREATE TABLE groups (
                groupid INTEGER NOT NULL DEFAULT nextval('groups_groupid_seq'),
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
                insertdate TIMESTAMP DEFAULT now(),
                CONSTRAINT pk_groups PRIMARY KEY (groupid)
);


ALTER SEQUENCE groups_groupid_seq OWNED BY groups.groupid;

CREATE SEQUENCE network_networkid_seq;

CREATE TABLE network (
                networkid INTEGER NOT NULL DEFAULT nextval('network_networkid_seq'),
                networkname VARCHAR(50),
                networkdescription TEXT,
                countrycode CHAR(2),
                CONSTRAINT pk_network PRIMARY KEY (networkid)
);


ALTER SEQUENCE network_networkid_seq OWNED BY network.networkid;

CREATE SEQUENCE emailalternate_emailalternateid_seq;

CREATE TABLE emailalternate (
                emailalternateid INTEGER NOT NULL DEFAULT nextval('emailalternate_emailalternateid_seq'),
                emailalias VARCHAR(50),
                eaddress VARCHAR(80)
);


ALTER SEQUENCE emailalternate_emailalternateid_seq OWNED BY emailalternate.emailalternateid;

CREATE SEQUENCE person_group_persongroupid_seq;

CREATE TABLE person_group (
                persongroupid INTEGER NOT NULL DEFAULT nextval('person_group_persongroupid_seq'),
                personid INTEGER,
                groupid INTEGER NOT NULL,
                status INTEGER,
                chair CHAR(1) DEFAULT 'n',
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT now(),
                site CHAR(3),
                CONSTRAINT pk_person_group PRIMARY KEY (persongroupid)
);


ALTER SEQUENCE person_group_persongroupid_seq OWNED BY person_group.persongroupid;


CREATE SEQUENCE person_personid_seq;

CREATE TABLE person (
                personid INTEGER NOT NULL DEFAULT nextval('person_personid_seq'),
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
                interim BOOLEAN,
                id VARCHAR(43),
                modifier VARCHAR(50),
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT now(),
                ipaddress VARCHAR(255),
                status INTEGER DEFAULT 1,
                md5password VARCHAR(50),
                CONSTRAINT pk_person PRIMARY KEY (personid)
);


ALTER SEQUENCE person_personid_seq OWNED BY person.personid;

CREATE INDEX ix_person
 ON person
 ( personid ASC );

CREATE SEQUENCE person_corearea_personcoreareaid_seq;

CREATE TABLE person_corearea (
                personcoreareaid INTEGER NOT NULL DEFAULT nextval('person_corearea_personcoreareaid_seq'),
                coreareaid VARCHAR(2) NOT NULL,
                id VARCHAR(43),
                personid INTEGER NOT NULL,
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT now(),
                CONSTRAINT pk_corearea PRIMARY KEY (personcoreareaid)
);


ALTER SEQUENCE person_corearea_personcoreareaid_seq OWNED BY person_corearea.personcoreareaid;

CREATE SEQUENCE lterperson_role_lterpersonroleid_seq;

CREATE TABLE lterperson_role (
                lterpersonroleid INTEGER NOT NULL DEFAULT nextval('lterperson_role_lterpersonroleid_seq'),
                personid INTEGER,
                site VARCHAR(5),
                lterroleid VARCHAR(50),
                CONSTRAINT pk_lterperson_role PRIMARY KEY (lterpersonroleid)
);


ALTER SEQUENCE lterperson_role_lterpersonroleid_seq OWNED BY lterperson_role.lterpersonroleid;

CREATE TABLE organism (
                organismid VARCHAR(5) NOT NULL,
                organismname VARCHAR(80),
                CONSTRAINT pk_organism PRIMARY KEY (organismid)
);


CREATE SEQUENCE persontemp_persontempid_seq;

CREATE TABLE persontemp (
                persontempid INTEGER NOT NULL DEFAULT nextval('persontemp_persontempid_seq'),
                tempkey INTEGER,
                firstname VARCHAR(50) NOT NULL,
                lastname VARCHAR(50) NOT NULL,
                primaryemail VARCHAR(50) NOT NULL,
                ipaddress VARCHAR(255) NOT NULL,
                insertdate TIMESTAMP DEFAULT now() NOT NULL,
                confirmed CHAR(3),
                confirmdate VARCHAR(50),
                referer VARCHAR(255),
                CONSTRAINT pk_persontemp PRIMARY KEY (persontempid)
);


ALTER SEQUENCE persontemp_persontempid_seq OWNED BY persontemp.persontempid;

CREATE TABLE habitat (
                habitatid VARCHAR(5) NOT NULL,
                habitatname VARCHAR(80),
                CONSTRAINT pk_habitat PRIMARY KEY (habitatid)
);


CREATE SEQUENCE person_discipline_persondisciplineid_seq;

CREATE TABLE person_discipline (
                persondisciplineid INTEGER NOT NULL DEFAULT nextval('person_discipline_persondisciplineid_seq'),
                disciplineid VARCHAR(5) NOT NULL,
                id VARCHAR(43),
                personid INTEGER,
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT now(),
                CONSTRAINT pk_person_discipline PRIMARY KEY (persondisciplineid)
);


ALTER SEQUENCE person_discipline_persondisciplineid_seq OWNED BY person_discipline.persondisciplineid;

CREATE SEQUENCE person_organization_personorganizationid_seq;

CREATE TABLE person_organization (
                personorganizationid INTEGER NOT NULL DEFAULT nextval('person_organization_personorganizationid_seq'),
                personid INTEGER NOT NULL,
                organization VARCHAR(50) DEFAULT 'LTER',
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT now(),
                CONSTRAINT pk_person_organization PRIMARY KEY (personorganizationid)
);


ALTER SEQUENCE person_organization_personorganizationid_seq OWNED BY person_organization.personorganizationid;

CREATE SEQUENCE lter_role_lterroleid_seq;

CREATE TABLE lter_role (
                lterroleid INTEGER NOT NULL DEFAULT nextval('lter_role_lterroleid_seq'),
                rolesort INTEGER,
                roleid VARCHAR(50) NOT NULL,
                rolename VARCHAR(50) NOT NULL,
                roledescription TEXT,
                roletype VARCHAR(50),
                CONSTRAINT pk_lter_role PRIMARY KEY (lterroleid)
);


ALTER SEQUENCE lter_role_lterroleid_seq OWNED BY lter_role.lterroleid;

CREATE SEQUENCE affiliation_affiliationid_seq;

CREATE TABLE affiliation (
                affiliationid INTEGER NOT NULL DEFAULT nextval('affiliation_affiliationid_seq'),
                affiliationtextid VARCHAR(10) NOT NULL,
                affiliation VARCHAR(80) NOT NULL,
                url VARCHAR(50),
                CONSTRAINT pk_affiliation PRIMARY KEY (affiliationid)
);


ALTER SEQUENCE affiliation_affiliationid_seq OWNED BY affiliation.affiliationid;

CREATE SEQUENCE site_affiliation_siteaffiliationid_seq;

CREATE TABLE site_affiliation (
                siteaffiliationid INTEGER NOT NULL DEFAULT nextval('site_affiliation_siteaffiliationid_seq'),
                siteid VARCHAR(3),
                affiliationid VARCHAR(50),
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT now(),
                CONSTRAINT pk_site_affiliation PRIMARY KEY (siteaffiliationid)
);


ALTER SEQUENCE site_affiliation_siteaffiliationid_seq OWNED BY site_affiliation.siteaffiliationid;

CREATE TABLE export_for_drupal (
                firstname VARCHAR(30),
                lastname VARCHAR(50),
                primaryemail VARCHAR(80),
                emailalias VARCHAR(43),
                password VARCHAR(100),
                personid INTEGER NOT NULL
);


CREATE SEQUENCE ldap_ldaptableid_seq;

CREATE TABLE ldap (
                ldaptableid INTEGER NOT NULL DEFAULT nextval('ldap_ldaptableid_seq'),
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


ALTER SEQUENCE ldap_ldaptableid_seq OWNED BY ldap.ldaptableid;

CREATE TABLE LTERTable_Site (
                primarysite VARCHAR(5),
                sitename VARCHAR(255) NOT NULL,
                personid INTEGER
);


CREATE TABLE race (
                racename VARCHAR(255) NOT NULL,
                race VARCHAR(3) NOT NULL
);


CREATE SEQUENCE ltertable_ltertableid_seq;

CREATE TABLE ltertable (
                ltertableid INTEGER NOT NULL DEFAULT nextval('ltertable_ltertableid_seq'),
                emailalias VARCHAR(43),
                primarysitenumeric INTEGER,
                primarysite VARCHAR(5),
                primaryrole VARCHAR(50),
                specialty VARCHAR(120),
                personid INTEGER NOT NULL,
                primarynetwork CHAR(2),
                ilter CHAR(1) DEFAULT 'n',
                insertdate TIMESTAMP DEFAULT now(),
                moddate TIMESTAMP,
                CONSTRAINT pk_ltertable PRIMARY KEY (ltertableid)
);


ALTER SEQUENCE ltertable_ltertableid_seq OWNED BY ltertable.ltertableid;

CREATE SEQUENCE isocountrycodes_autocountrycode_seq;

CREATE TABLE isocountrycodes (
                autocountrycode INTEGER NOT NULL DEFAULT nextval('isocountrycodes_autocountrycode_seq'),
                countrycode CHAR(10),
                countryname VARCHAR(50)
);


ALTER SEQUENCE isocountrycodes_autocountrycode_seq OWNED BY isocountrycodes.autocountrycode;

CREATE SEQUENCE person_affiliation_personaffiliationid_seq;

CREATE TABLE person_affiliation (
                personaffiliationid INTEGER NOT NULL DEFAULT nextval('person_affiliation_personaffiliationid_seq'),
                personid INTEGER NOT NULL,
                affiliationid INTEGER NOT NULL,
                CONSTRAINT pk_person_affiliation PRIMARY KEY (personaffiliationid)
);


ALTER SEQUENCE person_affiliation_personaffiliationid_seq OWNED BY person_affiliation.personaffiliationid;

CREATE SEQUENCE demographics_demographicid_seq;

CREATE TABLE demographics (
                demographicid INTEGER NOT NULL DEFAULT nextval('demographics_demographicid_seq'),
                personid INTEGER NOT NULL,
                gender VARCHAR(50),
                race VARCHAR(50),
                ethnicity VARCHAR(50),
                modifier VARCHAR(50),
                moddate TIMESTAMP,
                CONSTRAINT pk_demographics PRIMARY KEY (demographicid)
);


ALTER SEQUENCE demographics_demographicid_seq OWNED BY demographics.demographicid;

CREATE TABLE testtesttest (
                primaryemail VARCHAR(80),
                ilter CHAR(1)
);


CREATE SEQUENCE ltergroup_type_ltergrouptypeid_seq;

CREATE TABLE ltergroup_type (
                ltergrouptypeid INTEGER NOT NULL DEFAULT nextval('ltergroup_type_ltergrouptypeid_seq'),
                grouptypename VARCHAR(100),
                grouptypedescription TEXT,
                insertdate TIMESTAMP DEFAULT now()
);


ALTER SEQUENCE ltergroup_type_ltergrouptypeid_seq OWNED BY ltergroup_type.ltergrouptypeid;

CREATE SEQUENCE contact_type_contacttypeid_seq;

CREATE TABLE contact_type (
                contacttypeid INTEGER NOT NULL DEFAULT nextval('contact_type_contacttypeid_seq'),
                contacttype VARCHAR(50) NOT NULL,
                contacttypedescription VARCHAR(255) NOT NULL,
                contacttitle VARCHAR(50) NOT NULL,
                CONSTRAINT pk_contact_type PRIMARY KEY (contacttypeid)
);


ALTER SEQUENCE contact_type_contacttypeid_seq OWNED BY contact_type.contacttypeid;

CREATE SEQUENCE person_organism_personorganismid_seq;

CREATE TABLE person_organism (
                personorganismid INTEGER NOT NULL DEFAULT nextval('person_organism_personorganismid_seq'),
                organismid VARCHAR(5) NOT NULL,
                id VARCHAR(43),
                personid INTEGER NOT NULL,
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT now(),
                CONSTRAINT pk_person_organism PRIMARY KEY (personorganismid)
);


ALTER SEQUENCE person_organism_personorganismid_seq OWNED BY person_organism.personorganismid;

CREATE TABLE jrn_phones (
                personid INTEGER NOT NULL,
                firstname VARCHAR(30),
                lastname VARCHAR(50),
                phone1 VARCHAR(30),
                phone2 VARCHAR(30),
                pagernumber VARCHAR(30),
                fax VARCHAR(30),
                mobilephone VARCHAR(30)
);


CREATE TABLE ethnicity (
                eid VARCHAR(3) NOT NULL,
                ename VARCHAR(80) NOT NULL
);


CREATE SEQUENCE person_site_contact_personsitecontactid_seq;

CREATE TABLE person_site_contact (
                personsitecontactid INTEGER NOT NULL DEFAULT nextval('person_site_contact_personsitecontactid_seq'),
                siteid INTEGER,
                personid INTEGER,
                contacttype VARCHAR(50),
                CONSTRAINT pk_person_site_contact PRIMARY KEY (personsitecontactid)
);


ALTER SEQUENCE person_site_contact_personsitecontactid_seq OWNED BY person_site_contact.personsitecontactid;

CREATE TABLE discipline (
                disciplineid VARCHAR(5) NOT NULL,
                disciplinename VARCHAR(80),
                CONSTRAINT pk_discipline PRIMARY KEY (disciplineid)
);


CREATE SEQUENCE security_securityid_seq;

CREATE TABLE security (
                securityid INTEGER NOT NULL DEFAULT nextval('security_securityid_seq'),
                personid INTEGER,
                emailalias VARCHAR(50),
                securitylevel VARCHAR(50),
                securitygroup VARCHAR(50)
);


ALTER SEQUENCE security_securityid_seq OWNED BY security.securityid;

CREATE SEQUENCE person_habitat_personhabitatid_seq;

CREATE TABLE person_habitat (
                personhabitatid INTEGER NOT NULL DEFAULT nextval('person_habitat_personhabitatid_seq'),
                habitatid VARCHAR(5) NOT NULL,
                id VARCHAR(43),
                personid INTEGER NOT NULL,
                moddate TIMESTAMP,
                insertdate TIMESTAMP DEFAULT now(),
                CONSTRAINT pk_person_habitat PRIMARY KEY (personhabitatid)
);


ALTER SEQUENCE person_habitat_personhabitatid_seq OWNED BY person_habitat.personhabitatid;

ALTER TABLE person_group ADD CONSTRAINT fk_person_group_groups
FOREIGN KEY (groupid)
REFERENCES groups (groupid)
ON DELETE CASCADE
ON UPDATE RESTRICT
NOT DEFERRABLE;

ALTER TABLE demographics ADD CONSTRAINT fk_demographics_person
FOREIGN KEY (personid)
REFERENCES person (personid)
ON DELETE CASCADE
ON UPDATE RESTRICT
NOT DEFERRABLE;

ALTER TABLE ltertable ADD CONSTRAINT fk_ltertable_person
FOREIGN KEY (personid)
REFERENCES person (personid)
ON DELETE CASCADE
ON UPDATE RESTRICT
NOT DEFERRABLE;

ALTER TABLE person_habitat ADD CONSTRAINT fk_person_habitat_person
FOREIGN KEY (personid)
REFERENCES person (personid)
ON DELETE CASCADE
ON UPDATE RESTRICT
NOT DEFERRABLE;

ALTER TABLE person_organization ADD CONSTRAINT fk_person_organization_person
FOREIGN KEY (personid)
REFERENCES person (personid)
ON DELETE CASCADE
ON UPDATE RESTRICT
NOT DEFERRABLE;

ALTER TABLE asm_poster ADD CONSTRAINT fk_asm_poster_person
FOREIGN KEY (personid)
REFERENCES person (personid)
ON DELETE RESTRICT
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE asm_workshop ADD CONSTRAINT fk_asm_workshop_person
FOREIGN KEY (personid)
REFERENCES person (personid)
ON DELETE RESTRICT
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE person_corearea ADD CONSTRAINT fk_person_corearea_person
FOREIGN KEY (personid)
REFERENCES person (personid)
ON DELETE CASCADE
ON UPDATE RESTRICT
NOT DEFERRABLE;
