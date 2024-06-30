--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: tbladmin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbladmin (
    strpassword character varying(100) NOT NULL,
    strusername character varying(150) NOT NULL,
    intadminid bigint NOT NULL
);


ALTER TABLE public.tbladmin OWNER TO postgres;

--
-- Name: tbladmin_intadminid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbladmin_intadminid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbladmin_intadminid_seq OWNER TO postgres;

--
-- Name: tbladmin_intadminid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbladmin_intadminid_seq OWNED BY public.tbladmin.intadminid;


--
-- Name: tblattendance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tblattendance (
    datdate date NOT NULL,
    intcadetid bigint,
    inteventid bigint,
    intattendanceid bigint NOT NULL
);


ALTER TABLE public.tblattendance OWNER TO postgres;

--
-- Name: tblattendance_intattendanceid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tblattendance_intattendanceid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tblattendance_intattendanceid_seq OWNER TO postgres;

--
-- Name: tblattendance_intattendanceid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tblattendance_intattendanceid_seq OWNED BY public.tblattendance.intattendanceid;


--
-- Name: tblcadet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tblcadet (
    strfirstname character varying(100) NOT NULL,
    strmiddlename character varying(100),
    strsurname character varying(100) NOT NULL,
    strstudentnumber character varying(20) NOT NULL,
    straddress character varying(300) NOT NULL,
    datdateofbirth date NOT NULL,
    datdateofenrollment date NOT NULL,
    intrankid bigint,
    intcourseid bigint,
    intenrollmentstatusid bigint,
    introleid bigint,
    intplatoonid bigint,
    intcadetid bigint NOT NULL
);


ALTER TABLE public.tblcadet OWNER TO postgres;

--
-- Name: tblcadet_intcadetid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tblcadet_intcadetid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tblcadet_intcadetid_seq OWNER TO postgres;

--
-- Name: tblcadet_intcadetid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tblcadet_intcadetid_seq OWNED BY public.tblcadet.intcadetid;


--
-- Name: tblcollege; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tblcollege (
    strcollegename character varying(250) NOT NULL,
    intcollegeid bigint NOT NULL
);


ALTER TABLE public.tblcollege OWNER TO postgres;

--
-- Name: tblcollege_intcollegeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tblcollege_intcollegeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tblcollege_intcollegeid_seq OWNER TO postgres;

--
-- Name: tblcollege_intcollegeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tblcollege_intcollegeid_seq OWNED BY public.tblcollege.intcollegeid;


--
-- Name: tblcourse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tblcourse (
    strcoursename character varying(250) NOT NULL,
    intcourseid bigint NOT NULL,
    intcollegeid bigint
);


ALTER TABLE public.tblcourse OWNER TO postgres;

--
-- Name: tblcourse_intcourseid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tblcourse_intcourseid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tblcourse_intcourseid_seq OWNER TO postgres;

--
-- Name: tblcourse_intcourseid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tblcourse_intcourseid_seq OWNED BY public.tblcourse.intcourseid;


--
-- Name: tblenrollmentstatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tblenrollmentstatus (
    strenrollmentstatus character varying(100) NOT NULL,
    intenrollmentstatusid bigint NOT NULL
);


ALTER TABLE public.tblenrollmentstatus OWNER TO postgres;

--
-- Name: tblenrollmentstatus_intenrollmentstatusid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tblenrollmentstatus_intenrollmentstatusid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tblenrollmentstatus_intenrollmentstatusid_seq OWNER TO postgres;

--
-- Name: tblenrollmentstatus_intenrollmentstatusid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tblenrollmentstatus_intenrollmentstatusid_seq OWNED BY public.tblenrollmentstatus.intenrollmentstatusid;


--
-- Name: tblequipment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tblequipment (
    strequipment character varying(250) NOT NULL,
    intequipmentid bigint NOT NULL
);


ALTER TABLE public.tblequipment OWNER TO postgres;

--
-- Name: tblequipment_intequipmentid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tblequipment_intequipmentid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tblequipment_intequipmentid_seq OWNER TO postgres;

--
-- Name: tblequipment_intequipmentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tblequipment_intequipmentid_seq OWNED BY public.tblequipment.intequipmentid;


--
-- Name: tblequipmentused; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tblequipmentused (
    inteventid bigint,
    intequipmentid bigint,
    intquantity integer NOT NULL,
    intequipmentusedid bigint NOT NULL
);


ALTER TABLE public.tblequipmentused OWNER TO postgres;

--
-- Name: tblequipmentused_intequipmentusedid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tblequipmentused_intequipmentusedid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tblequipmentused_intequipmentusedid_seq OWNER TO postgres;

--
-- Name: tblequipmentused_intequipmentusedid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tblequipmentused_intequipmentusedid_seq OWNED BY public.tblequipmentused.intequipmentusedid;


--
-- Name: tblevent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tblevent (
    streventname character varying(300) NOT NULL,
    dateventdate date NOT NULL,
    inteventid bigint NOT NULL
);


ALTER TABLE public.tblevent OWNER TO postgres;

--
-- Name: tblevent_inteventid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tblevent_inteventid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tblevent_inteventid_seq OWNER TO postgres;

--
-- Name: tblevent_inteventid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tblevent_inteventid_seq OWNED BY public.tblevent.inteventid;


--
-- Name: tblinstructor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tblinstructor (
    strfirstname character varying(100) NOT NULL,
    strmiddlename character varying(100),
    strsurname character varying(100) NOT NULL,
    datdateassigned date NOT NULL,
    intrankid bigint,
    intinstructorid bigint NOT NULL
);


ALTER TABLE public.tblinstructor OWNER TO postgres;

--
-- Name: tblinstructor_intinstructorid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tblinstructor_intinstructorid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tblinstructor_intinstructorid_seq OWNER TO postgres;

--
-- Name: tblinstructor_intinstructorid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tblinstructor_intinstructorid_seq OWNED BY public.tblinstructor.intinstructorid;


--
-- Name: tblplatoon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tblplatoon (
    strplatoonname character varying(100) NOT NULL,
    intplatoonid bigint NOT NULL
);


ALTER TABLE public.tblplatoon OWNER TO postgres;

--
-- Name: tblplatoon_intplatoonid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tblplatoon_intplatoonid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tblplatoon_intplatoonid_seq OWNER TO postgres;

--
-- Name: tblplatoon_intplatoonid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tblplatoon_intplatoonid_seq OWNED BY public.tblplatoon.intplatoonid;


--
-- Name: tblrank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tblrank (
    strrank character varying(150) NOT NULL,
    intrankid bigint NOT NULL
);


ALTER TABLE public.tblrank OWNER TO postgres;

--
-- Name: tblrank_intrankid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tblrank_intrankid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tblrank_intrankid_seq OWNER TO postgres;

--
-- Name: tblrank_intrankid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tblrank_intrankid_seq OWNED BY public.tblrank.intrankid;


--
-- Name: tblrole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tblrole (
    strrolename character varying(150) NOT NULL,
    introleid bigint NOT NULL
);


ALTER TABLE public.tblrole OWNER TO postgres;

--
-- Name: tblrole_introleid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tblrole_introleid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tblrole_introleid_seq OWNER TO postgres;

--
-- Name: tblrole_introleid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tblrole_introleid_seq OWNED BY public.tblrole.introleid;


--
-- Name: tbladmin intadminid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbladmin ALTER COLUMN intadminid SET DEFAULT nextval('public.tbladmin_intadminid_seq'::regclass);


--
-- Name: tblattendance intattendanceid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblattendance ALTER COLUMN intattendanceid SET DEFAULT nextval('public.tblattendance_intattendanceid_seq'::regclass);


--
-- Name: tblcadet intcadetid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblcadet ALTER COLUMN intcadetid SET DEFAULT nextval('public.tblcadet_intcadetid_seq'::regclass);


--
-- Name: tblcollege intcollegeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblcollege ALTER COLUMN intcollegeid SET DEFAULT nextval('public.tblcollege_intcollegeid_seq'::regclass);


--
-- Name: tblcourse intcourseid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblcourse ALTER COLUMN intcourseid SET DEFAULT nextval('public.tblcourse_intcourseid_seq'::regclass);


--
-- Name: tblenrollmentstatus intenrollmentstatusid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblenrollmentstatus ALTER COLUMN intenrollmentstatusid SET DEFAULT nextval('public.tblenrollmentstatus_intenrollmentstatusid_seq'::regclass);


--
-- Name: tblequipment intequipmentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblequipment ALTER COLUMN intequipmentid SET DEFAULT nextval('public.tblequipment_intequipmentid_seq'::regclass);


--
-- Name: tblequipmentused intequipmentusedid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblequipmentused ALTER COLUMN intequipmentusedid SET DEFAULT nextval('public.tblequipmentused_intequipmentusedid_seq'::regclass);


--
-- Name: tblevent inteventid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblevent ALTER COLUMN inteventid SET DEFAULT nextval('public.tblevent_inteventid_seq'::regclass);


--
-- Name: tblinstructor intinstructorid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblinstructor ALTER COLUMN intinstructorid SET DEFAULT nextval('public.tblinstructor_intinstructorid_seq'::regclass);


--
-- Name: tblplatoon intplatoonid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblplatoon ALTER COLUMN intplatoonid SET DEFAULT nextval('public.tblplatoon_intplatoonid_seq'::regclass);


--
-- Name: tblrank intrankid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblrank ALTER COLUMN intrankid SET DEFAULT nextval('public.tblrank_intrankid_seq'::regclass);


--
-- Name: tblrole introleid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblrole ALTER COLUMN introleid SET DEFAULT nextval('public.tblrole_introleid_seq'::regclass);


--
-- Name: tbladmin tbladmin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbladmin
    ADD CONSTRAINT tbladmin_pkey PRIMARY KEY (intadminid);


--
-- Name: tblattendance tblattendance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblattendance
    ADD CONSTRAINT tblattendance_pkey PRIMARY KEY (intattendanceid);


--
-- Name: tblcadet tblcadet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblcadet
    ADD CONSTRAINT tblcadet_pkey PRIMARY KEY (intcadetid);


--
-- Name: tblcadet tblcadet_strstudentnumber_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblcadet
    ADD CONSTRAINT tblcadet_strstudentnumber_key UNIQUE (strstudentnumber);


--
-- Name: tblcollege tblcollege_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblcollege
    ADD CONSTRAINT tblcollege_pkey PRIMARY KEY (intcollegeid);


--
-- Name: tblcollege tblcollege_strcollegename_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblcollege
    ADD CONSTRAINT tblcollege_strcollegename_key UNIQUE (strcollegename);


--
-- Name: tblcourse tblcourse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblcourse
    ADD CONSTRAINT tblcourse_pkey PRIMARY KEY (intcourseid);


--
-- Name: tblcourse tblcourse_strcoursename_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblcourse
    ADD CONSTRAINT tblcourse_strcoursename_key UNIQUE (strcoursename);


--
-- Name: tblenrollmentstatus tblenrollmentstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblenrollmentstatus
    ADD CONSTRAINT tblenrollmentstatus_pkey PRIMARY KEY (intenrollmentstatusid);


--
-- Name: tblenrollmentstatus tblenrollmentstatus_strenrollmentstatus_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblenrollmentstatus
    ADD CONSTRAINT tblenrollmentstatus_strenrollmentstatus_key UNIQUE (strenrollmentstatus);


--
-- Name: tblequipment tblequipment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblequipment
    ADD CONSTRAINT tblequipment_pkey PRIMARY KEY (intequipmentid);


--
-- Name: tblequipment tblequipment_strequipment_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblequipment
    ADD CONSTRAINT tblequipment_strequipment_key UNIQUE (strequipment);


--
-- Name: tblequipmentused tblequipmentused_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblequipmentused
    ADD CONSTRAINT tblequipmentused_pkey PRIMARY KEY (intequipmentusedid);


--
-- Name: tblevent tblevent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblevent
    ADD CONSTRAINT tblevent_pkey PRIMARY KEY (inteventid);


--
-- Name: tblinstructor tblinstructor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblinstructor
    ADD CONSTRAINT tblinstructor_pkey PRIMARY KEY (intinstructorid);


--
-- Name: tblplatoon tblplatoon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblplatoon
    ADD CONSTRAINT tblplatoon_pkey PRIMARY KEY (intplatoonid);


--
-- Name: tblplatoon tblplatoon_strplatoonname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblplatoon
    ADD CONSTRAINT tblplatoon_strplatoonname_key UNIQUE (strplatoonname);


--
-- Name: tblrank tblrank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblrank
    ADD CONSTRAINT tblrank_pkey PRIMARY KEY (intrankid);


--
-- Name: tblrank tblrank_strrank_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblrank
    ADD CONSTRAINT tblrank_strrank_key UNIQUE (strrank);


--
-- Name: tblrole tblrole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblrole
    ADD CONSTRAINT tblrole_pkey PRIMARY KEY (introleid);


--
-- Name: tblrole tblroles_strrolename_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblrole
    ADD CONSTRAINT tblroles_strrolename_key UNIQUE (strrolename);


--
-- Name: tbladmin uniqueusername; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbladmin
    ADD CONSTRAINT uniqueusername UNIQUE (strusername);


--
-- Name: tblattendance fkcadet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblattendance
    ADD CONSTRAINT fkcadet FOREIGN KEY (intcadetid) REFERENCES public.tblcadet(intcadetid);


--
-- Name: tblattendance fkevent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblattendance
    ADD CONSTRAINT fkevent FOREIGN KEY (inteventtid) REFERENCES public.tblevent(inteventid);


--
-- Name: tblcourse fkcollege; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblcourse
    ADD CONSTRAINT fkcollege FOREIGN KEY (intcollegeid) REFERENCES public.tblcollege(intcollegeid);


--
-- Name: tblcadet fkcourseid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblcadet
    ADD CONSTRAINT fkcourseid FOREIGN KEY (intcourseid) REFERENCES public.tblcourse(intcourseid);


--
-- Name: tblcadet fkenrollmentstatusid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblcadet
    ADD CONSTRAINT fkenrollmentstatusid FOREIGN KEY (intenrollmentstatusid) REFERENCES public.tblenrollmentstatus(intenrollmentstatusid);


--
-- Name: tblequipmentused fkequipment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblequipmentused
    ADD CONSTRAINT fkequipment FOREIGN KEY (intequipmentid) REFERENCES public.tblequipment(intequipmentid);


--
-- Name: tblequipmentused fkevent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblequipmentused
    ADD CONSTRAINT fkevent FOREIGN KEY (inteventid) REFERENCES public.tblevent(inteventid);


--
-- Name: tblcadet fkplatoonid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblcadet
    ADD CONSTRAINT fkplatoonid FOREIGN KEY (intplatoonid) REFERENCES public.tblplatoon(intplatoonid);


--
-- Name: tblcadet fkrank; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblcadet
    ADD CONSTRAINT fkrank FOREIGN KEY (intrankid) REFERENCES public.tblrank(intrankid);


--
-- Name: tblinstructor fkrank; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblinstructor
    ADD CONSTRAINT fkrank FOREIGN KEY (intrankid) REFERENCES public.tblrank(intrankid);


--
-- Name: tblcadet fkrole; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tblcadet
    ADD CONSTRAINT fkrole FOREIGN KEY (introleid) REFERENCES public.tblrole(introleid);


--
-- PostgreSQL database dump complete
--

