--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE accounts (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    encrypted_password text NOT NULL,
    metadata json DEFAULT '{}'::json NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: brands; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE brands (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    metadata jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: lines; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE lines (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    brand_id uuid NOT NULL,
    metadata jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: polishes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE polishes (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    brand_id uuid NOT NULL,
    line_id uuid NOT NULL,
    metadata jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: brands_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: lines_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lines
    ADD CONSTRAINT lines_pkey PRIMARY KEY (id);


--
-- Name: polishes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY polishes
    ADD CONSTRAINT polishes_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_accounts_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_accounts_on_email ON accounts USING btree (email);


--
-- Name: index_lines_on_brand_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lines_on_brand_id ON lines USING btree (brand_id);


--
-- Name: index_polishes_on_brand_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_polishes_on_brand_id ON polishes USING btree (brand_id);


--
-- Name: index_polishes_on_line_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_polishes_on_line_id ON polishes USING btree (line_id);


--
-- Name: fk_rails_2946dd051e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lines
    ADD CONSTRAINT fk_rails_2946dd051e FOREIGN KEY (brand_id) REFERENCES brands(id);


--
-- Name: fk_rails_38844623b3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY polishes
    ADD CONSTRAINT fk_rails_38844623b3 FOREIGN KEY (brand_id) REFERENCES brands(id);


--
-- Name: fk_rails_5aa8e18f6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY polishes
    ADD CONSTRAINT fk_rails_5aa8e18f6f FOREIGN KEY (line_id) REFERENCES lines(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES ('20161015085741'), ('20161015085742'), ('20161015085745'), ('20161015110429'), ('20161015110435');


