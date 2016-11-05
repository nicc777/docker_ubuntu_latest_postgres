--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.4

-- Started on 2016-11-05 12:52:02 SAST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2107 (class 1262 OID 16385)
-- Name: docker; Type: DATABASE; Schema: -; Owner: docker
--
--
-- CREATE DATABASE docker WITH TEMPLATE = template0 ENCODING = 'SQL_ASCII' LC_COLLATE = 'C' LC_CTYPE = 'C';
--
--
-- ALTER DATABASE docker OWNER TO docker;
--
-- \connect docker

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12359)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2110 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 16391)
-- Name: test_table; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE test_table (
    test_id integer NOT NULL,
    test_key character varying(128) NOT NULL,
    test_value text
);


ALTER TABLE test_table OWNER TO docker;

--
-- TOC entry 181 (class 1259 OID 16389)
-- Name: test_table_test_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE test_table_test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE test_table_test_id_seq OWNER TO docker;

--
-- TOC entry 2111 (class 0 OID 0)
-- Dependencies: 181
-- Name: test_table_test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE test_table_test_id_seq OWNED BY test_table.test_id;


--
-- TOC entry 1984 (class 2604 OID 16394)
-- Name: test_id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY test_table ALTER COLUMN test_id SET DEFAULT nextval('test_table_test_id_seq'::regclass);


--
-- TOC entry 2102 (class 0 OID 16391)
-- Dependencies: 182
-- Data for Name: test_table; Type: TABLE DATA; Schema: public; Owner: docker
--

INSERT INTO test_table VALUES (1, 'key_1', 'Value 1');
INSERT INTO test_table VALUES (2, 'key_2', 'Value 2');
INSERT INTO test_table VALUES (3, 'key_3', 'Value 3');


--
-- TOC entry 2112 (class 0 OID 0)
-- Dependencies: 181
-- Name: test_table_test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('test_table_test_id_seq', 3, true);


--
-- TOC entry 1986 (class 2606 OID 16399)
-- Name: test_table_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY test_table
    ADD CONSTRAINT test_table_pkey PRIMARY KEY (test_id);


--
-- TOC entry 2109 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--
-- 
-- REVOKE ALL ON SCHEMA public FROM PUBLIC;
-- REVOKE ALL ON SCHEMA public FROM postgres;
-- GRANT ALL ON SCHEMA public TO postgres;
-- GRANT ALL ON SCHEMA public TO PUBLIC;
--

-- Completed on 2016-11-05 12:52:02 SAST

--
-- PostgreSQL database dump complete
--

