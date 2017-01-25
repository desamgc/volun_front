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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: academic_levels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE academic_levels (
    id integer NOT NULL,
    name character varying NOT NULL,
    educational_type character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: academic_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE academic_levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: academic_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE academic_levels_id_seq OWNED BY academic_levels.id;


--
-- Name: activities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE activities (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone,
    transport text NOT NULL,
    pdf_url character varying,
    entity_id integer,
    area_id integer,
    project_id integer,
    share boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE activities_id_seq OWNED BY activities.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE addresses (
    id integer NOT NULL,
    road_type_id integer,
    road_name character varying,
    road_number_type character varying,
    road_number character varying,
    grader character varying,
    stairs character varying,
    floor character varying,
    door character varying,
    postal_code character varying,
    borough character varying,
    district_id integer,
    town character varying,
    province_id integer,
    country character varying,
    ndp_code character varying,
    local_code character varying,
    class_name character varying,
    latitude character varying,
    longitude character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE addresses_id_seq OWNED BY addresses.id;


--
-- Name: addresses_volunteers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE addresses_volunteers (
    address_id integer NOT NULL,
    volunteer_id integer NOT NULL
);


--
-- Name: areas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE areas (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: areas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE areas_id_seq OWNED BY areas.id;


--
-- Name: areas_projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE areas_projects (
    area_id integer NOT NULL,
    project_id integer NOT NULL
);


--
-- Name: areas_volunteers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE areas_volunteers (
    area_id integer NOT NULL,
    volunteer_id integer NOT NULL
);


--
-- Name: boroughs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE boroughs (
    id integer NOT NULL,
    name character varying,
    active character varying,
    district_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: boroughs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE boroughs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: boroughs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE boroughs_id_seq OWNED BY boroughs.id;


--
-- Name: collectives; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE collectives (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: collectives_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE collectives_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: collectives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE collectives_id_seq OWNED BY collectives.id;


--
-- Name: collectives_projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE collectives_projects (
    collective_id integer NOT NULL,
    project_id integer NOT NULL
);


--
-- Name: contact_results; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contact_results (
    id integer NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: contact_results_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contact_results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contact_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contact_results_id_seq OWNED BY contact_results.id;


--
-- Name: contact_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contact_types (
    id integer NOT NULL,
    name character varying,
    active character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: contact_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contact_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contact_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contact_types_id_seq OWNED BY contact_types.id;


--
-- Name: coordinations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE coordinations (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: coordinations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE coordinations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: coordinations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE coordinations_id_seq OWNED BY coordinations.id;


--
-- Name: coordinations_projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE coordinations_projects (
    coordination_id integer NOT NULL,
    project_id integer NOT NULL
);


--
-- Name: degree_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE degree_types (
    id integer NOT NULL,
    name character varying,
    educational_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: degree_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE degree_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: degree_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE degree_types_id_seq OWNED BY degree_types.id;


--
-- Name: degrees; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE degrees (
    id integer NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: degrees_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE degrees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: degrees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE degrees_id_seq OWNED BY degrees.id;


--
-- Name: degrees_volunteers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE degrees_volunteers (
    degree_id integer NOT NULL,
    volunteer_id integer NOT NULL
);


--
-- Name: districts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE districts (
    id integer NOT NULL,
    name character varying,
    code character varying,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: districts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE districts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: districts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE districts_id_seq OWNED BY districts.id;


--
-- Name: documents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE documents (
    id integer NOT NULL,
    name character varying,
    description text,
    documentum_id character varying,
    project_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE documents_id_seq OWNED BY documents.id;


--
-- Name: employment_statuses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE employment_statuses (
    id integer NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: employment_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE employment_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: employment_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE employment_statuses_id_seq OWNED BY employment_statuses.id;


--
-- Name: ent_trackings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ent_trackings (
    id integer NOT NULL,
    tracking_type_id integer NOT NULL,
    entity_id integer NOT NULL,
    manager_id integer,
    tracked_at timestamp without time zone NOT NULL,
    comments text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: ent_trackings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ent_trackings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ent_trackings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ent_trackings_id_seq OWNED BY ent_trackings.id;


--
-- Name: entities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE entities (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    vat_number character varying,
    email character varying NOT NULL,
    representative_name character varying NOT NULL,
    representative_last_name character varying NOT NULL,
    representative_last_name_alt character varying,
    contact_name character varying NOT NULL,
    contact_last_name character varying NOT NULL,
    contact_last_name_alt character varying,
    phone_number character varying,
    phone_number_alt character varying,
    publish_pictures boolean DEFAULT true,
    annual_survey boolean DEFAULT false,
    request_reason_id integer,
    entity_type_id integer NOT NULL,
    comments text,
    other_subscribe_reason text,
    address_id integer NOT NULL,
    active boolean DEFAULT true,
    subscribed_at timestamp without time zone,
    unsubscribed_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: entities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE entities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: entities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE entities_id_seq OWNED BY entities.id;


--
-- Name: entities_projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE entities_projects (
    entity_id integer NOT NULL,
    project_id integer NOT NULL
);


--
-- Name: entity_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE entity_types (
    id integer NOT NULL,
    kind integer,
    description text,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: entity_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE entity_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: entity_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE entity_types_id_seq OWNED BY entity_types.id;


--
-- Name: event_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE event_types (
    id integer NOT NULL,
    kind integer NOT NULL,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT kind_and_id_must_be_equal CHECK ((((id = 1) AND (kind = 1)) OR ((id = 2) AND (kind = 2))))
);


--
-- Name: event_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE event_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE event_types_id_seq OWNED BY event_types.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE events (
    id integer NOT NULL,
    publish boolean DEFAULT true,
    eventable_id integer NOT NULL,
    eventable_type character varying NOT NULL,
    event_type_id integer,
    address_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT eventable_must_be_consistent CHECK ((((event_type_id = 1) AND ((eventable_type)::text = 'Activity'::text)) OR ((event_type_id = 2) AND ((eventable_type)::text = 'Project'::text))))
);


--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: id_number_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE id_number_types (
    id integer NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: id_number_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE id_number_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: id_number_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE id_number_types_id_seq OWNED BY id_number_types.id;


--
-- Name: info_sources; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE info_sources (
    id integer NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: info_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE info_sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: info_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE info_sources_id_seq OWNED BY info_sources.id;


--
-- Name: language_levels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE language_levels (
    id integer NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: language_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE language_levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: language_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE language_levels_id_seq OWNED BY language_levels.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE languages (
    id integer NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE languages_id_seq OWNED BY languages.id;


--
-- Name: links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE links (
    id integer NOT NULL,
    url character varying,
    description text,
    kind integer,
    active boolean,
    linkable_id integer,
    linkable_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE links_id_seq OWNED BY links.id;


--
-- Name: managers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE managers (
    id integer NOT NULL,
    name character varying NOT NULL,
    profile_id integer,
    phone_number character varying,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: managers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE managers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: managers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE managers_id_seq OWNED BY managers.id;


--
-- Name: motivations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE motivations (
    id integer NOT NULL,
    name character varying,
    active character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: motivations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE motivations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: motivations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE motivations_id_seq OWNED BY motivations.id;


--
-- Name: nationalities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nationalities (
    id integer NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nationalities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nationalities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nationalities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nationalities_id_seq OWNED BY nationalities.id;


--
-- Name: notice_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE notice_types (
    id integer NOT NULL,
    kind integer,
    description text,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: notice_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE notice_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notice_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE notice_types_id_seq OWNED BY notice_types.id;


--
-- Name: pro_issues; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pro_issues (
    id integer NOT NULL,
    comments text,
    start_date timestamp without time zone,
    project_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pro_issues_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pro_issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pro_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pro_issues_id_seq OWNED BY pro_issues.id;


--
-- Name: pro_trackings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pro_trackings (
    id integer NOT NULL,
    comments text,
    start_date timestamp without time zone,
    project_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pro_trackings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pro_trackings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pro_trackings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pro_trackings_id_seq OWNED BY pro_trackings.id;


--
-- Name: professions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE professions (
    id integer NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: professions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE professions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: professions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE professions_id_seq OWNED BY professions.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE profiles (
    id integer NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE profiles_id_seq OWNED BY profiles.id;


--
-- Name: project_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE project_types (
    id integer NOT NULL,
    kind integer NOT NULL,
    description text NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT kind_and_id_must_be_equal CHECK ((((id = 1) AND (kind = 1)) OR ((id = 2) AND (kind = 2)) OR ((id = 3) AND (kind = 3)) OR ((id = 4) AND (kind = 4)) OR ((id = 5) AND (kind = 5)) OR ((id = 6) AND (kind = 6)) OR ((id = 7) AND (kind = 7))))
);


--
-- Name: project_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE project_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: project_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE project_types_id_seq OWNED BY project_types.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE projects (
    id integer NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    description text NOT NULL,
    functions character varying,
    execution_start_date date NOT NULL,
    execution_end_date date,
    contact_name character varying NOT NULL,
    contact_last_name character varying NOT NULL,
    contact_last_name_alt character varying,
    phone_number character varying NOT NULL,
    phone_number_alt character varying,
    email character varying NOT NULL,
    comments text,
    beneficiaries_num integer,
    volunteers_num integer,
    insured boolean DEFAULT false,
    volunteers_allowed boolean DEFAULT true,
    publish boolean DEFAULT true,
    outstanding boolean DEFAULT false,
    insurance_date date,
    project_type_id integer NOT NULL,
    pt_extendable_id integer,
    pt_extendable_type character varying,
    entity_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT pt_extendable_must_be_consistent CHECK ((((project_type_id = 1) AND (pt_extendable_type IS NULL)) OR ((project_type_id = 2) AND (pt_extendable_type IS NULL)) OR ((project_type_id = 3) AND (pt_extendable_type IS NULL)) OR ((project_type_id = 4) AND (pt_extendable_type IS NULL)) OR ((project_type_id = 5) AND ((pt_extendable_type)::text = 'Pt::Entity'::text)) OR ((project_type_id = 6) AND ((pt_extendable_type)::text = 'Pt::Subvention'::text)) OR ((project_type_id = 7) AND (pt_extendable_type IS NULL))))
);


--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: projects_volunteers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE projects_volunteers (
    project_id integer NOT NULL,
    volunteer_id integer NOT NULL
);


--
-- Name: proposals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE proposals (
    id integer NOT NULL,
    name character varying,
    description text,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: proposals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE proposals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: proposals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE proposals_id_seq OWNED BY proposals.id;


--
-- Name: provinces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE provinces (
    id integer NOT NULL,
    name character varying,
    code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: provinces_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE provinces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: provinces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE provinces_id_seq OWNED BY provinces.id;


--
-- Name: pt_entities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pt_entities (
    id integer NOT NULL,
    request_date date,
    request_description text,
    volunteers_profile character varying,
    activities text,
    sav_date date,
    derived_volunteers_num integer,
    added_volunteers_num integer,
    agreement_signed boolean DEFAULT false,
    agreement_date date,
    prevailing boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pt_entities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pt_entities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pt_entities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pt_entities_id_seq OWNED BY pt_entities.id;


--
-- Name: pt_subventions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pt_subventions (
    id integer NOT NULL,
    representative_name character varying,
    representative_last_name character varying,
    representative_last_name_alt character varying,
    id_num character varying,
    vat_number character varying,
    entity_registry boolean DEFAULT false,
    cost double precision,
    requested_amount double precision,
    subsidized_amount double precision,
    initial_volunteers_num integer,
    participants_num integer,
    has_quality_evaluation boolean DEFAULT false,
    proposal_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pt_subventions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pt_subventions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pt_subventions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pt_subventions_id_seq OWNED BY pt_subventions.id;


--
-- Name: record_histories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE record_histories (
    id integer NOT NULL,
    user_id integer NOT NULL,
    recordable_id integer NOT NULL,
    recordable_type character varying NOT NULL,
    recordable_changed_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: record_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE record_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: record_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE record_histories_id_seq OWNED BY record_histories.id;


--
-- Name: rejection_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rejection_types (
    id integer NOT NULL,
    kind integer NOT NULL,
    description text,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rejection_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rejection_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rejection_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rejection_types_id_seq OWNED BY rejection_types.id;


--
-- Name: request_forms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE request_forms (
    id integer NOT NULL,
    request_type_id integer,
    rt_extendable_id integer,
    rt_extendable_type character varying,
    user_id integer,
    status integer,
    status_date timestamp without time zone,
    rejection_type_id integer,
    request_reason_id integer,
    comments text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT rt_extendable_must_be_consistent CHECK ((((request_type_id = 1) AND ((rt_extendable_type)::text = 'Rt::VolunteerSubscribe'::text)) OR ((request_type_id = 2) AND ((rt_extendable_type)::text = 'Rt::VolunteerUnsubscribe'::text)) OR ((request_type_id = 3) AND ((rt_extendable_type)::text = 'Rt::VolunteerAmendment'::text)) OR ((request_type_id = 4) AND ((rt_extendable_type)::text = 'Rt::VolunteerAppointment'::text)) OR ((request_type_id = 5) AND ((rt_extendable_type)::text = 'Rt::EntitySubscribe'::text)) OR ((request_type_id = 6) AND ((rt_extendable_type)::text = 'Rt::EntityUnsubscribe'::text)) OR ((request_type_id = 7) AND ((rt_extendable_type)::text = 'Rt::VolunteersDemand'::text)) OR ((request_type_id = 8) AND ((rt_extendable_type)::text = 'Rt::ProjectPublishing'::text)) OR ((request_type_id = 9) AND ((rt_extendable_type)::text = 'Rt::ProjectUnpublishing'::text)) OR ((request_type_id = 10) AND ((rt_extendable_type)::text = 'Rt::ProjectUnsubscribe'::text)) OR ((request_type_id = 11) AND ((rt_extendable_type)::text = 'Rt::ActivityPublishing'::text)) OR ((request_type_id = 12) AND ((rt_extendable_type)::text = 'Rt::ActivityUnpublishing'::text)) OR ((request_type_id = 13) AND ((rt_extendable_type)::text = 'Rt::Other'::text))))
);


--
-- Name: request_forms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE request_forms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: request_forms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE request_forms_id_seq OWNED BY request_forms.id;


--
-- Name: request_reasons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE request_reasons (
    id integer NOT NULL,
    kind integer,
    description text,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: request_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE request_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: request_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE request_reasons_id_seq OWNED BY request_reasons.id;


--
-- Name: request_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE request_types (
    id integer NOT NULL,
    kind integer,
    description text,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT kind_and_id_must_be_equal CHECK ((((id = 1) AND (kind = 1)) OR ((id = 2) AND (kind = 2)) OR ((id = 3) AND (kind = 3)) OR ((id = 4) AND (kind = 4)) OR ((id = 5) AND (kind = 5)) OR ((id = 6) AND (kind = 6)) OR ((id = 7) AND (kind = 7)) OR ((id = 8) AND (kind = 8)) OR ((id = 9) AND (kind = 9)) OR ((id = 10) AND (kind = 10)) OR ((id = 11) AND (kind = 11)) OR ((id = 12) AND (kind = 12)) OR ((id = 13) AND (kind = 13))))
);


--
-- Name: request_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE request_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: request_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE request_types_id_seq OWNED BY request_types.id;


--
-- Name: road_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE road_types (
    id integer NOT NULL,
    name character varying,
    code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: road_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE road_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: road_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE road_types_id_seq OWNED BY road_types.id;


--
-- Name: rt_activity_publishings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rt_activity_publishings (
    id integer NOT NULL,
    name character varying,
    organizer character varying,
    description text,
    execution_date date,
    execution_hour character varying,
    road_type_id integer,
    road_name character varying,
    number_type character varying,
    road_number character varying,
    postal_code character varying,
    borough character varying,
    district_id integer,
    town character varying,
    province_id integer,
    project_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_activity_publishings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_activity_publishings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_activity_publishings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_activity_publishings_id_seq OWNED BY rt_activity_publishings.id;


--
-- Name: rt_activity_unpublishings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rt_activity_unpublishings (
    id integer NOT NULL,
    reason text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_activity_unpublishings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_activity_unpublishings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_activity_unpublishings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_activity_unpublishings_id_seq OWNED BY rt_activity_unpublishings.id;


--
-- Name: rt_entity_subscribes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rt_entity_subscribes (
    id integer NOT NULL,
    name character varying,
    description text,
    vat_number character varying,
    email character varying,
    representative_name character varying,
    representative_last_name character varying,
    representative_last_name_alt character varying,
    contact_name character varying,
    contact_last_name character varying,
    contact_last_name_alt character varying,
    phone_number character varying,
    phone_number_alt character varying,
    publish_pictures boolean DEFAULT true,
    annual_survey boolean DEFAULT false,
    entity_type_id integer,
    comments text,
    other_subscribe_reason text,
    road_type_id integer,
    road_name character varying,
    number_type character varying,
    road_number character varying,
    postal_code character varying,
    borough character varying,
    district_id integer,
    town character varying,
    province_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_entity_subscribes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_entity_subscribes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_entity_subscribes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_entity_subscribes_id_seq OWNED BY rt_entity_subscribes.id;


--
-- Name: rt_entity_unsubscribes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rt_entity_unsubscribes (
    id integer NOT NULL,
    reason text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_entity_unsubscribes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_entity_unsubscribes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_entity_unsubscribes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_entity_unsubscribes_id_seq OWNED BY rt_entity_unsubscribes.id;


--
-- Name: rt_others; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rt_others (
    id integer NOT NULL,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_others_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_others_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_others_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_others_id_seq OWNED BY rt_others.id;


--
-- Name: rt_project_publishings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rt_project_publishings (
    id integer NOT NULL,
    description text,
    road_type_id integer,
    road_name character varying,
    number_type character varying,
    road_number character varying,
    postal_code character varying,
    borough character varying,
    district_id integer,
    town character varying,
    province_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_project_publishings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_project_publishings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_project_publishings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_project_publishings_id_seq OWNED BY rt_project_publishings.id;


--
-- Name: rt_project_unpublishings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rt_project_unpublishings (
    id integer NOT NULL,
    reason text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_project_unpublishings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_project_unpublishings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_project_unpublishings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_project_unpublishings_id_seq OWNED BY rt_project_unpublishings.id;


--
-- Name: rt_project_unsubscribes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rt_project_unsubscribes (
    id integer NOT NULL,
    project_id integer,
    reason text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_project_unsubscribes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_project_unsubscribes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_project_unsubscribes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_project_unsubscribes_id_seq OWNED BY rt_project_unsubscribes.id;


--
-- Name: rt_volunteer_amendments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rt_volunteer_amendments (
    id integer NOT NULL,
    road_type_id integer,
    road_name character varying,
    number_type character varying,
    road_number character varying,
    postal_code character varying,
    borough character varying,
    district_id integer,
    town character varying,
    province_id integer,
    phone_number character varying,
    phone_number_alt character varying,
    email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_volunteer_amendments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_volunteer_amendments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_volunteer_amendments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_volunteer_amendments_id_seq OWNED BY rt_volunteer_amendments.id;


--
-- Name: rt_volunteer_appointments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rt_volunteer_appointments (
    id integer NOT NULL,
    reason text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_volunteer_appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_volunteer_appointments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_volunteer_appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_volunteer_appointments_id_seq OWNED BY rt_volunteer_appointments.id;


--
-- Name: rt_volunteer_subscribes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rt_volunteer_subscribes (
    id integer NOT NULL,
    name character varying,
    last_name character varying,
    last_name_alt character varying,
    id_number_type_id integer,
    id_number character varying,
    gender integer,
    birth_date date,
    nationality_id integer,
    phone_number character varying,
    phone_number_alt character varying,
    email character varying,
    road_type_id integer,
    road_name character varying,
    number_type character varying,
    road_number character varying,
    postal_code character varying,
    borough character varying,
    district_id integer,
    town character varying,
    province_id integer,
    status_id integer,
    employment_status_id integer,
    vocne boolean DEFAULT false,
    available boolean DEFAULT false,
    availability_date date,
    academic_level_id integer,
    comments text,
    expectations text,
    agreement boolean DEFAULT false,
    agreement_date timestamp without time zone,
    search_authorization boolean DEFAULT false,
    representative_statement boolean DEFAULT false,
    has_driving_license boolean DEFAULT false,
    publish_pictures boolean DEFAULT true,
    annual_survey boolean DEFAULT false,
    info_source_id integer,
    other_academic_info text,
    profession_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_volunteer_subscribes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_volunteer_subscribes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_volunteer_subscribes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_volunteer_subscribes_id_seq OWNED BY rt_volunteer_subscribes.id;


--
-- Name: rt_volunteer_unsubscribes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rt_volunteer_unsubscribes (
    id integer NOT NULL,
    level integer,
    reason text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_volunteer_unsubscribes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_volunteer_unsubscribes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_volunteer_unsubscribes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_volunteer_unsubscribes_id_seq OWNED BY rt_volunteer_unsubscribes.id;


--
-- Name: rt_volunteers_demands; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rt_volunteers_demands (
    id integer NOT NULL,
    description text,
    execution_start_date date,
    execution_end_date date,
    road_type_id integer,
    road_name character varying,
    number_type character varying,
    road_number character varying,
    postal_code character varying,
    borough character varying,
    district_id integer,
    town character varying,
    province_id integer,
    requested_volunteers_num character varying,
    volunteers_profile text,
    volunteer_functions_1 text,
    volunteer_functions_2 text,
    volunteer_functions_3 text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_volunteers_demands_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_volunteers_demands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_volunteers_demands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_volunteers_demands_id_seq OWNED BY rt_volunteers_demands.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: sectors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sectors (
    id integer NOT NULL,
    name character varying,
    active character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sectors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sectors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sectors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sectors_id_seq OWNED BY sectors.id;


--
-- Name: skills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE skills (
    id integer NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: skills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE skills_id_seq OWNED BY skills.id;


--
-- Name: skills_volunteers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE skills_volunteers (
    skill_id integer NOT NULL,
    volunteer_id integer NOT NULL
);


--
-- Name: statuses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE statuses (
    id integer NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE statuses_id_seq OWNED BY statuses.id;


--
-- Name: timetables; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE timetables (
    id integer NOT NULL,
    event_id integer NOT NULL,
    execution_date date NOT NULL,
    start_hour character varying NOT NULL,
    end_hour character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: timetables_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE timetables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: timetables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE timetables_id_seq OWNED BY timetables.id;


--
-- Name: tracking_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tracking_types (
    id integer NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: tracking_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tracking_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tracking_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tracking_types_id_seq OWNED BY tracking_types.id;


--
-- Name: traits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE traits (
    id integer NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: traits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE traits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: traits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE traits_id_seq OWNED BY traits.id;


--
-- Name: unsubscribe_reasons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE unsubscribe_reasons (
    id integer NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: unsubscribe_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unsubscribe_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unsubscribe_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unsubscribe_reasons_id_seq OWNED BY unsubscribe_reasons.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    login character varying,
    locale character varying,
    notice_type_id integer NOT NULL,
    loggable_id integer,
    loggable_type character varying,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: volun_assessments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE volun_assessments (
    id integer NOT NULL,
    volunteer_id integer NOT NULL,
    trait_id integer NOT NULL,
    project_id integer NOT NULL,
    trait_other character varying,
    assessment boolean DEFAULT false NOT NULL,
    comments text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: volun_assessments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE volun_assessments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: volun_assessments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE volun_assessments_id_seq OWNED BY volun_assessments.id;


--
-- Name: volun_availabilities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE volun_availabilities (
    id integer NOT NULL,
    volunteer_id integer NOT NULL,
    day character varying NOT NULL,
    start_hour character varying,
    end_hour character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: volun_availabilities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE volun_availabilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: volun_availabilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE volun_availabilities_id_seq OWNED BY volun_availabilities.id;


--
-- Name: volun_contacts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE volun_contacts (
    id integer NOT NULL,
    volunteer_id integer NOT NULL,
    contact_result_id integer NOT NULL,
    project_id integer NOT NULL,
    manager_id integer NOT NULL,
    contact_type_id integer,
    contact_date timestamp without time zone NOT NULL,
    comments text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: volun_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE volun_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: volun_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE volun_contacts_id_seq OWNED BY volun_contacts.id;


--
-- Name: volun_known_languages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE volun_known_languages (
    id integer NOT NULL,
    volunteer_id integer NOT NULL,
    language_id integer NOT NULL,
    language_level_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: volun_known_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE volun_known_languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: volun_known_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE volun_known_languages_id_seq OWNED BY volun_known_languages.id;


--
-- Name: volun_trackings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE volun_trackings (
    id integer NOT NULL,
    volunteer_id integer NOT NULL,
    tracking_type_id integer NOT NULL,
    project_id integer,
    manager_id integer,
    tracking_date timestamp without time zone NOT NULL,
    comments text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: volun_trackings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE volun_trackings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: volun_trackings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE volun_trackings_id_seq OWNED BY volun_trackings.id;


--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE volunteers (
    id integer NOT NULL,
    name character varying NOT NULL,
    last_name character varying NOT NULL,
    last_name_alt character varying,
    id_number_type_id integer,
    id_number character varying,
    gender integer,
    birth_date date,
    nationality_id integer,
    phone_number character varying,
    phone_number_alt character varying,
    email character varying,
    address_id integer NOT NULL,
    status_id integer,
    employment_status_id integer,
    vocne boolean DEFAULT false,
    available boolean DEFAULT false,
    availability_date date,
    academic_level_id integer,
    subscribe_date date,
    unsubscribe_date date,
    unsubscribe_reason_id integer,
    comments text,
    expectations text,
    agreement boolean DEFAULT false,
    agreement_date timestamp without time zone,
    search_authorization boolean DEFAULT false,
    representative_statement boolean DEFAULT false,
    has_driving_license boolean DEFAULT false,
    publish_pictures boolean DEFAULT true,
    annual_survey boolean DEFAULT false,
    subscribed_at timestamp without time zone,
    manager_id integer,
    info_source_id integer,
    other_academic_info text,
    profession_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: volunteers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE volunteers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: volunteers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE volunteers_id_seq OWNED BY volunteers.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY academic_levels ALTER COLUMN id SET DEFAULT nextval('academic_levels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY activities ALTER COLUMN id SET DEFAULT nextval('activities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY addresses ALTER COLUMN id SET DEFAULT nextval('addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY areas ALTER COLUMN id SET DEFAULT nextval('areas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY boroughs ALTER COLUMN id SET DEFAULT nextval('boroughs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY collectives ALTER COLUMN id SET DEFAULT nextval('collectives_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contact_results ALTER COLUMN id SET DEFAULT nextval('contact_results_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contact_types ALTER COLUMN id SET DEFAULT nextval('contact_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY coordinations ALTER COLUMN id SET DEFAULT nextval('coordinations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY degree_types ALTER COLUMN id SET DEFAULT nextval('degree_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY degrees ALTER COLUMN id SET DEFAULT nextval('degrees_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY districts ALTER COLUMN id SET DEFAULT nextval('districts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY documents ALTER COLUMN id SET DEFAULT nextval('documents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY employment_statuses ALTER COLUMN id SET DEFAULT nextval('employment_statuses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ent_trackings ALTER COLUMN id SET DEFAULT nextval('ent_trackings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY entities ALTER COLUMN id SET DEFAULT nextval('entities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY entity_types ALTER COLUMN id SET DEFAULT nextval('entity_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY event_types ALTER COLUMN id SET DEFAULT nextval('event_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY id_number_types ALTER COLUMN id SET DEFAULT nextval('id_number_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY info_sources ALTER COLUMN id SET DEFAULT nextval('info_sources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY language_levels ALTER COLUMN id SET DEFAULT nextval('language_levels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY languages ALTER COLUMN id SET DEFAULT nextval('languages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY links ALTER COLUMN id SET DEFAULT nextval('links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY managers ALTER COLUMN id SET DEFAULT nextval('managers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY motivations ALTER COLUMN id SET DEFAULT nextval('motivations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nationalities ALTER COLUMN id SET DEFAULT nextval('nationalities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY notice_types ALTER COLUMN id SET DEFAULT nextval('notice_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pro_issues ALTER COLUMN id SET DEFAULT nextval('pro_issues_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pro_trackings ALTER COLUMN id SET DEFAULT nextval('pro_trackings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY professions ALTER COLUMN id SET DEFAULT nextval('professions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY profiles ALTER COLUMN id SET DEFAULT nextval('profiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY project_types ALTER COLUMN id SET DEFAULT nextval('project_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY proposals ALTER COLUMN id SET DEFAULT nextval('proposals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY provinces ALTER COLUMN id SET DEFAULT nextval('provinces_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pt_entities ALTER COLUMN id SET DEFAULT nextval('pt_entities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pt_subventions ALTER COLUMN id SET DEFAULT nextval('pt_subventions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY record_histories ALTER COLUMN id SET DEFAULT nextval('record_histories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rejection_types ALTER COLUMN id SET DEFAULT nextval('rejection_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY request_forms ALTER COLUMN id SET DEFAULT nextval('request_forms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY request_reasons ALTER COLUMN id SET DEFAULT nextval('request_reasons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY request_types ALTER COLUMN id SET DEFAULT nextval('request_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY road_types ALTER COLUMN id SET DEFAULT nextval('road_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_activity_publishings ALTER COLUMN id SET DEFAULT nextval('rt_activity_publishings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_activity_unpublishings ALTER COLUMN id SET DEFAULT nextval('rt_activity_unpublishings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_entity_subscribes ALTER COLUMN id SET DEFAULT nextval('rt_entity_subscribes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_entity_unsubscribes ALTER COLUMN id SET DEFAULT nextval('rt_entity_unsubscribes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_others ALTER COLUMN id SET DEFAULT nextval('rt_others_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_project_publishings ALTER COLUMN id SET DEFAULT nextval('rt_project_publishings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_project_unpublishings ALTER COLUMN id SET DEFAULT nextval('rt_project_unpublishings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_project_unsubscribes ALTER COLUMN id SET DEFAULT nextval('rt_project_unsubscribes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_amendments ALTER COLUMN id SET DEFAULT nextval('rt_volunteer_amendments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_appointments ALTER COLUMN id SET DEFAULT nextval('rt_volunteer_appointments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_subscribes ALTER COLUMN id SET DEFAULT nextval('rt_volunteer_subscribes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_unsubscribes ALTER COLUMN id SET DEFAULT nextval('rt_volunteer_unsubscribes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteers_demands ALTER COLUMN id SET DEFAULT nextval('rt_volunteers_demands_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sectors ALTER COLUMN id SET DEFAULT nextval('sectors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY skills ALTER COLUMN id SET DEFAULT nextval('skills_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY statuses ALTER COLUMN id SET DEFAULT nextval('statuses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY timetables ALTER COLUMN id SET DEFAULT nextval('timetables_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tracking_types ALTER COLUMN id SET DEFAULT nextval('tracking_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY traits ALTER COLUMN id SET DEFAULT nextval('traits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unsubscribe_reasons ALTER COLUMN id SET DEFAULT nextval('unsubscribe_reasons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_assessments ALTER COLUMN id SET DEFAULT nextval('volun_assessments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_availabilities ALTER COLUMN id SET DEFAULT nextval('volun_availabilities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_contacts ALTER COLUMN id SET DEFAULT nextval('volun_contacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_known_languages ALTER COLUMN id SET DEFAULT nextval('volun_known_languages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_trackings ALTER COLUMN id SET DEFAULT nextval('volun_trackings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteers ALTER COLUMN id SET DEFAULT nextval('volunteers_id_seq'::regclass);


--
-- Name: academic_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY academic_levels
    ADD CONSTRAINT academic_levels_pkey PRIMARY KEY (id);


--
-- Name: activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: areas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- Name: boroughs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY boroughs
    ADD CONSTRAINT boroughs_pkey PRIMARY KEY (id);


--
-- Name: collectives_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY collectives
    ADD CONSTRAINT collectives_pkey PRIMARY KEY (id);


--
-- Name: contact_results_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contact_results
    ADD CONSTRAINT contact_results_pkey PRIMARY KEY (id);


--
-- Name: contact_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contact_types
    ADD CONSTRAINT contact_types_pkey PRIMARY KEY (id);


--
-- Name: coordinations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY coordinations
    ADD CONSTRAINT coordinations_pkey PRIMARY KEY (id);


--
-- Name: degree_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY degree_types
    ADD CONSTRAINT degree_types_pkey PRIMARY KEY (id);


--
-- Name: degrees_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY degrees
    ADD CONSTRAINT degrees_pkey PRIMARY KEY (id);


--
-- Name: districts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id);


--
-- Name: documents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: employment_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY employment_statuses
    ADD CONSTRAINT employment_statuses_pkey PRIMARY KEY (id);


--
-- Name: ent_trackings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ent_trackings
    ADD CONSTRAINT ent_trackings_pkey PRIMARY KEY (id);


--
-- Name: entities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY entities
    ADD CONSTRAINT entities_pkey PRIMARY KEY (id);


--
-- Name: entity_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY entity_types
    ADD CONSTRAINT entity_types_pkey PRIMARY KEY (id);


--
-- Name: event_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY event_types
    ADD CONSTRAINT event_types_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: id_number_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY id_number_types
    ADD CONSTRAINT id_number_types_pkey PRIMARY KEY (id);


--
-- Name: info_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY info_sources
    ADD CONSTRAINT info_sources_pkey PRIMARY KEY (id);


--
-- Name: language_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY language_levels
    ADD CONSTRAINT language_levels_pkey PRIMARY KEY (id);


--
-- Name: languages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: managers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY managers
    ADD CONSTRAINT managers_pkey PRIMARY KEY (id);


--
-- Name: motivations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY motivations
    ADD CONSTRAINT motivations_pkey PRIMARY KEY (id);


--
-- Name: nationalities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nationalities
    ADD CONSTRAINT nationalities_pkey PRIMARY KEY (id);


--
-- Name: notice_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notice_types
    ADD CONSTRAINT notice_types_pkey PRIMARY KEY (id);


--
-- Name: pro_issues_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pro_issues
    ADD CONSTRAINT pro_issues_pkey PRIMARY KEY (id);


--
-- Name: pro_trackings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pro_trackings
    ADD CONSTRAINT pro_trackings_pkey PRIMARY KEY (id);


--
-- Name: professions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY professions
    ADD CONSTRAINT professions_pkey PRIMARY KEY (id);


--
-- Name: profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: project_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY project_types
    ADD CONSTRAINT project_types_pkey PRIMARY KEY (id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: proposals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proposals
    ADD CONSTRAINT proposals_pkey PRIMARY KEY (id);


--
-- Name: provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);


--
-- Name: pt_entities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pt_entities
    ADD CONSTRAINT pt_entities_pkey PRIMARY KEY (id);


--
-- Name: pt_subventions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pt_subventions
    ADD CONSTRAINT pt_subventions_pkey PRIMARY KEY (id);


--
-- Name: record_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY record_histories
    ADD CONSTRAINT record_histories_pkey PRIMARY KEY (id);


--
-- Name: rejection_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rejection_types
    ADD CONSTRAINT rejection_types_pkey PRIMARY KEY (id);


--
-- Name: request_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY request_forms
    ADD CONSTRAINT request_forms_pkey PRIMARY KEY (id);


--
-- Name: request_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY request_reasons
    ADD CONSTRAINT request_reasons_pkey PRIMARY KEY (id);


--
-- Name: request_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY request_types
    ADD CONSTRAINT request_types_pkey PRIMARY KEY (id);


--
-- Name: road_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY road_types
    ADD CONSTRAINT road_types_pkey PRIMARY KEY (id);


--
-- Name: rt_activity_publishings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_activity_publishings
    ADD CONSTRAINT rt_activity_publishings_pkey PRIMARY KEY (id);


--
-- Name: rt_activity_unpublishings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_activity_unpublishings
    ADD CONSTRAINT rt_activity_unpublishings_pkey PRIMARY KEY (id);


--
-- Name: rt_entity_subscribes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_entity_subscribes
    ADD CONSTRAINT rt_entity_subscribes_pkey PRIMARY KEY (id);


--
-- Name: rt_entity_unsubscribes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_entity_unsubscribes
    ADD CONSTRAINT rt_entity_unsubscribes_pkey PRIMARY KEY (id);


--
-- Name: rt_others_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_others
    ADD CONSTRAINT rt_others_pkey PRIMARY KEY (id);


--
-- Name: rt_project_publishings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_project_publishings
    ADD CONSTRAINT rt_project_publishings_pkey PRIMARY KEY (id);


--
-- Name: rt_project_unpublishings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_project_unpublishings
    ADD CONSTRAINT rt_project_unpublishings_pkey PRIMARY KEY (id);


--
-- Name: rt_project_unsubscribes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_project_unsubscribes
    ADD CONSTRAINT rt_project_unsubscribes_pkey PRIMARY KEY (id);


--
-- Name: rt_volunteer_amendments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_amendments
    ADD CONSTRAINT rt_volunteer_amendments_pkey PRIMARY KEY (id);


--
-- Name: rt_volunteer_appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_appointments
    ADD CONSTRAINT rt_volunteer_appointments_pkey PRIMARY KEY (id);


--
-- Name: rt_volunteer_subscribes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_subscribes
    ADD CONSTRAINT rt_volunteer_subscribes_pkey PRIMARY KEY (id);


--
-- Name: rt_volunteer_unsubscribes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_unsubscribes
    ADD CONSTRAINT rt_volunteer_unsubscribes_pkey PRIMARY KEY (id);


--
-- Name: rt_volunteers_demands_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteers_demands
    ADD CONSTRAINT rt_volunteers_demands_pkey PRIMARY KEY (id);


--
-- Name: sectors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sectors
    ADD CONSTRAINT sectors_pkey PRIMARY KEY (id);


--
-- Name: skills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (id);


--
-- Name: statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY statuses
    ADD CONSTRAINT statuses_pkey PRIMARY KEY (id);


--
-- Name: timetables_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY timetables
    ADD CONSTRAINT timetables_pkey PRIMARY KEY (id);


--
-- Name: tracking_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tracking_types
    ADD CONSTRAINT tracking_types_pkey PRIMARY KEY (id);


--
-- Name: traits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY traits
    ADD CONSTRAINT traits_pkey PRIMARY KEY (id);


--
-- Name: unsubscribe_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY unsubscribe_reasons
    ADD CONSTRAINT unsubscribe_reasons_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: volun_assessments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_assessments
    ADD CONSTRAINT volun_assessments_pkey PRIMARY KEY (id);


--
-- Name: volun_availabilities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_availabilities
    ADD CONSTRAINT volun_availabilities_pkey PRIMARY KEY (id);


--
-- Name: volun_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_contacts
    ADD CONSTRAINT volun_contacts_pkey PRIMARY KEY (id);


--
-- Name: volun_known_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_known_languages
    ADD CONSTRAINT volun_known_languages_pkey PRIMARY KEY (id);


--
-- Name: volun_trackings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_trackings
    ADD CONSTRAINT volun_trackings_pkey PRIMARY KEY (id);


--
-- Name: volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);


--
-- Name: index_academic_levels_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_academic_levels_on_name ON academic_levels USING btree (name);


--
-- Name: index_activities_on_area_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_activities_on_area_id ON activities USING btree (area_id);


--
-- Name: index_activities_on_entity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_activities_on_entity_id ON activities USING btree (entity_id);


--
-- Name: index_activities_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_activities_on_name ON activities USING btree (name);


--
-- Name: index_activities_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_activities_on_project_id ON activities USING btree (project_id);


--
-- Name: index_addresses_on_district_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_addresses_on_district_id ON addresses USING btree (district_id);


--
-- Name: index_addresses_on_province_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_addresses_on_province_id ON addresses USING btree (province_id);


--
-- Name: index_addresses_on_road_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_addresses_on_road_type_id ON addresses USING btree (road_type_id);


--
-- Name: index_addresses_volunteers_on_address_id_and_volunteer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_addresses_volunteers_on_address_id_and_volunteer_id ON addresses_volunteers USING btree (address_id, volunteer_id);


--
-- Name: index_addresses_volunteers_on_volunteer_id_and_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_addresses_volunteers_on_volunteer_id_and_address_id ON addresses_volunteers USING btree (volunteer_id, address_id);


--
-- Name: index_areas_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_areas_on_name ON areas USING btree (name);


--
-- Name: index_areas_projects_on_area_id_and_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_areas_projects_on_area_id_and_project_id ON areas_projects USING btree (area_id, project_id);


--
-- Name: index_areas_projects_on_project_id_and_area_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_areas_projects_on_project_id_and_area_id ON areas_projects USING btree (project_id, area_id);


--
-- Name: index_areas_volunteers_on_area_id_and_volunteer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_areas_volunteers_on_area_id_and_volunteer_id ON areas_volunteers USING btree (area_id, volunteer_id);


--
-- Name: index_areas_volunteers_on_volunteer_id_and_area_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_areas_volunteers_on_volunteer_id_and_area_id ON areas_volunteers USING btree (volunteer_id, area_id);


--
-- Name: index_boroughs_on_district_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_boroughs_on_district_id ON boroughs USING btree (district_id);


--
-- Name: index_collectives_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_collectives_on_name ON collectives USING btree (name);


--
-- Name: index_collectives_projects_on_collective_id_and_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_collectives_projects_on_collective_id_and_project_id ON collectives_projects USING btree (collective_id, project_id);


--
-- Name: index_collectives_projects_on_project_id_and_collective_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_collectives_projects_on_project_id_and_collective_id ON collectives_projects USING btree (project_id, collective_id);


--
-- Name: index_contact_results_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_contact_results_on_name ON contact_results USING btree (name);


--
-- Name: index_coordinations_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_coordinations_on_name ON coordinations USING btree (name);


--
-- Name: index_coordinations_projects_on_coordination_id_and_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_coordinations_projects_on_coordination_id_and_project_id ON coordinations_projects USING btree (coordination_id, project_id);


--
-- Name: index_coordinations_projects_on_project_id_and_coordination_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_coordinations_projects_on_project_id_and_coordination_id ON coordinations_projects USING btree (project_id, coordination_id);


--
-- Name: index_degrees_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_degrees_on_name ON degrees USING btree (name);


--
-- Name: index_degrees_volunteers_on_degree_id_and_volunteer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_degrees_volunteers_on_degree_id_and_volunteer_id ON degrees_volunteers USING btree (degree_id, volunteer_id);


--
-- Name: index_degrees_volunteers_on_volunteer_id_and_degree_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_degrees_volunteers_on_volunteer_id_and_degree_id ON degrees_volunteers USING btree (volunteer_id, degree_id);


--
-- Name: index_districts_on_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_districts_on_code ON districts USING btree (code);


--
-- Name: index_districts_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_districts_on_name ON districts USING btree (name);


--
-- Name: index_documents_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_documents_on_name ON documents USING btree (name);


--
-- Name: index_documents_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_documents_on_project_id ON documents USING btree (project_id);


--
-- Name: index_employment_statuses_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_employment_statuses_on_name ON employment_statuses USING btree (name);


--
-- Name: index_ent_trackings_on_entity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ent_trackings_on_entity_id ON ent_trackings USING btree (entity_id);


--
-- Name: index_ent_trackings_on_manager_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ent_trackings_on_manager_id ON ent_trackings USING btree (manager_id);


--
-- Name: index_ent_trackings_on_tracking_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ent_trackings_on_tracking_type_id ON ent_trackings USING btree (tracking_type_id);


--
-- Name: index_entities_on_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_entities_on_address_id ON entities USING btree (address_id);


--
-- Name: index_entities_on_entity_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_entities_on_entity_type_id ON entities USING btree (entity_type_id);


--
-- Name: index_entities_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_entities_on_name ON entities USING btree (name);


--
-- Name: index_entities_on_request_reason_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_entities_on_request_reason_id ON entities USING btree (request_reason_id);


--
-- Name: index_entities_projects_on_entity_id_and_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_entities_projects_on_entity_id_and_project_id ON entities_projects USING btree (entity_id, project_id);


--
-- Name: index_entities_projects_on_project_id_and_entity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_entities_projects_on_project_id_and_entity_id ON entities_projects USING btree (project_id, entity_id);


--
-- Name: index_entity_types_on_kind; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_entity_types_on_kind ON entity_types USING btree (kind);


--
-- Name: index_event_types_on_kind; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_event_types_on_kind ON event_types USING btree (kind);


--
-- Name: index_events_on_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_address_id ON events USING btree (address_id);


--
-- Name: index_events_on_event_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_event_type_id ON events USING btree (event_type_id);


--
-- Name: index_events_on_eventable_type_and_eventable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_eventable_type_and_eventable_id ON events USING btree (eventable_type, eventable_id);


--
-- Name: index_id_number_types_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_id_number_types_on_name ON id_number_types USING btree (name);


--
-- Name: index_info_sources_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_info_sources_on_name ON info_sources USING btree (name);


--
-- Name: index_language_levels_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_language_levels_on_name ON language_levels USING btree (name);


--
-- Name: index_languages_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_languages_on_name ON languages USING btree (name);


--
-- Name: index_links_on_linkable_type_and_linkable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_links_on_linkable_type_and_linkable_id ON links USING btree (linkable_type, linkable_id);


--
-- Name: index_nationalities_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_nationalities_on_name ON nationalities USING btree (name);


--
-- Name: index_notice_types_on_kind; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_notice_types_on_kind ON notice_types USING btree (kind);


--
-- Name: index_pro_issues_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pro_issues_on_project_id ON pro_issues USING btree (project_id);


--
-- Name: index_pro_trackings_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pro_trackings_on_project_id ON pro_trackings USING btree (project_id);


--
-- Name: index_professions_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_professions_on_name ON professions USING btree (name);


--
-- Name: index_profiles_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_profiles_on_name ON profiles USING btree (name);


--
-- Name: index_project_types_on_kind; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_project_types_on_kind ON project_types USING btree (kind);


--
-- Name: index_projects_on_entity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_projects_on_entity_id ON projects USING btree (entity_id);


--
-- Name: index_projects_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_projects_on_name ON projects USING btree (name);


--
-- Name: index_projects_on_project_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_projects_on_project_type_id ON projects USING btree (project_type_id);


--
-- Name: index_projects_on_pt_extendable_type_and_pt_extendable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_projects_on_pt_extendable_type_and_pt_extendable_id ON projects USING btree (pt_extendable_type, pt_extendable_id);


--
-- Name: index_projects_volunteers_on_project_id_and_volunteer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_projects_volunteers_on_project_id_and_volunteer_id ON projects_volunteers USING btree (project_id, volunteer_id);


--
-- Name: index_projects_volunteers_on_volunteer_id_and_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_projects_volunteers_on_volunteer_id_and_project_id ON projects_volunteers USING btree (volunteer_id, project_id);


--
-- Name: index_proposals_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_proposals_on_name ON proposals USING btree (name);


--
-- Name: index_provinces_on_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_provinces_on_code ON provinces USING btree (code);


--
-- Name: index_provinces_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_provinces_on_name ON provinces USING btree (name);


--
-- Name: index_pt_subventions_on_proposal_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pt_subventions_on_proposal_id ON pt_subventions USING btree (proposal_id);


--
-- Name: index_record_histories_on_recordable_type_and_recordable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_record_histories_on_recordable_type_and_recordable_id ON record_histories USING btree (recordable_type, recordable_id);


--
-- Name: index_record_histories_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_record_histories_on_user_id ON record_histories USING btree (user_id);


--
-- Name: index_rejection_types_on_kind; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_rejection_types_on_kind ON rejection_types USING btree (kind);


--
-- Name: index_request_forms_on_rejection_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_request_forms_on_rejection_type_id ON request_forms USING btree (rejection_type_id);


--
-- Name: index_request_forms_on_request_reason_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_request_forms_on_request_reason_id ON request_forms USING btree (request_reason_id);


--
-- Name: index_request_forms_on_request_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_request_forms_on_request_type_id ON request_forms USING btree (request_type_id);


--
-- Name: index_request_forms_on_rt_extendable_type_and_rt_extendable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_request_forms_on_rt_extendable_type_and_rt_extendable_id ON request_forms USING btree (rt_extendable_type, rt_extendable_id);


--
-- Name: index_request_forms_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_request_forms_on_user_id ON request_forms USING btree (user_id);


--
-- Name: index_request_reasons_on_kind; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_request_reasons_on_kind ON request_reasons USING btree (kind);


--
-- Name: index_request_types_on_kind; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_request_types_on_kind ON request_types USING btree (kind);


--
-- Name: index_road_types_on_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_road_types_on_code ON road_types USING btree (code);


--
-- Name: index_road_types_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_road_types_on_name ON road_types USING btree (name);


--
-- Name: index_rt_activity_publishings_on_district_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_activity_publishings_on_district_id ON rt_activity_publishings USING btree (district_id);


--
-- Name: index_rt_activity_publishings_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_activity_publishings_on_project_id ON rt_activity_publishings USING btree (project_id);


--
-- Name: index_rt_activity_publishings_on_province_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_activity_publishings_on_province_id ON rt_activity_publishings USING btree (province_id);


--
-- Name: index_rt_activity_publishings_on_road_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_activity_publishings_on_road_type_id ON rt_activity_publishings USING btree (road_type_id);


--
-- Name: index_rt_entity_subscribes_on_district_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_entity_subscribes_on_district_id ON rt_entity_subscribes USING btree (district_id);


--
-- Name: index_rt_entity_subscribes_on_entity_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_entity_subscribes_on_entity_type_id ON rt_entity_subscribes USING btree (entity_type_id);


--
-- Name: index_rt_entity_subscribes_on_province_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_entity_subscribes_on_province_id ON rt_entity_subscribes USING btree (province_id);


--
-- Name: index_rt_entity_subscribes_on_road_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_entity_subscribes_on_road_type_id ON rt_entity_subscribes USING btree (road_type_id);


--
-- Name: index_rt_project_publishings_on_district_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_project_publishings_on_district_id ON rt_project_publishings USING btree (district_id);


--
-- Name: index_rt_project_publishings_on_province_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_project_publishings_on_province_id ON rt_project_publishings USING btree (province_id);


--
-- Name: index_rt_project_publishings_on_road_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_project_publishings_on_road_type_id ON rt_project_publishings USING btree (road_type_id);


--
-- Name: index_rt_project_unsubscribes_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_project_unsubscribes_on_project_id ON rt_project_unsubscribes USING btree (project_id);


--
-- Name: index_rt_volunteer_amendments_on_district_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_volunteer_amendments_on_district_id ON rt_volunteer_amendments USING btree (district_id);


--
-- Name: index_rt_volunteer_amendments_on_province_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_volunteer_amendments_on_province_id ON rt_volunteer_amendments USING btree (province_id);


--
-- Name: index_rt_volunteer_amendments_on_road_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_volunteer_amendments_on_road_type_id ON rt_volunteer_amendments USING btree (road_type_id);


--
-- Name: index_rt_volunteer_subscribes_on_academic_level_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_volunteer_subscribes_on_academic_level_id ON rt_volunteer_subscribes USING btree (academic_level_id);


--
-- Name: index_rt_volunteer_subscribes_on_district_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_volunteer_subscribes_on_district_id ON rt_volunteer_subscribes USING btree (district_id);


--
-- Name: index_rt_volunteer_subscribes_on_employment_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_volunteer_subscribes_on_employment_status_id ON rt_volunteer_subscribes USING btree (employment_status_id);


--
-- Name: index_rt_volunteer_subscribes_on_id_number_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_volunteer_subscribes_on_id_number_type_id ON rt_volunteer_subscribes USING btree (id_number_type_id);


--
-- Name: index_rt_volunteer_subscribes_on_info_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_volunteer_subscribes_on_info_source_id ON rt_volunteer_subscribes USING btree (info_source_id);


--
-- Name: index_rt_volunteer_subscribes_on_nationality_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_volunteer_subscribes_on_nationality_id ON rt_volunteer_subscribes USING btree (nationality_id);


--
-- Name: index_rt_volunteer_subscribes_on_profession_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_volunteer_subscribes_on_profession_id ON rt_volunteer_subscribes USING btree (profession_id);


--
-- Name: index_rt_volunteer_subscribes_on_province_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_volunteer_subscribes_on_province_id ON rt_volunteer_subscribes USING btree (province_id);


--
-- Name: index_rt_volunteer_subscribes_on_road_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_volunteer_subscribes_on_road_type_id ON rt_volunteer_subscribes USING btree (road_type_id);


--
-- Name: index_rt_volunteer_subscribes_on_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_volunteer_subscribes_on_status_id ON rt_volunteer_subscribes USING btree (status_id);


--
-- Name: index_rt_volunteers_demands_on_district_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_volunteers_demands_on_district_id ON rt_volunteers_demands USING btree (district_id);


--
-- Name: index_rt_volunteers_demands_on_province_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_volunteers_demands_on_province_id ON rt_volunteers_demands USING btree (province_id);


--
-- Name: index_rt_volunteers_demands_on_road_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rt_volunteers_demands_on_road_type_id ON rt_volunteers_demands USING btree (road_type_id);


--
-- Name: index_skills_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_skills_on_name ON skills USING btree (name);


--
-- Name: index_skills_volunteers_on_skill_id_and_volunteer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_skills_volunteers_on_skill_id_and_volunteer_id ON skills_volunteers USING btree (skill_id, volunteer_id);


--
-- Name: index_skills_volunteers_on_volunteer_id_and_skill_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_skills_volunteers_on_volunteer_id_and_skill_id ON skills_volunteers USING btree (volunteer_id, skill_id);


--
-- Name: index_statuses_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_statuses_on_name ON statuses USING btree (name);


--
-- Name: index_timetables_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_timetables_on_event_id ON timetables USING btree (event_id);


--
-- Name: index_tracking_types_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tracking_types_on_name ON tracking_types USING btree (name);


--
-- Name: index_traits_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_traits_on_name ON traits USING btree (name);


--
-- Name: index_unsubscribe_reasons_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_unsubscribe_reasons_on_name ON unsubscribe_reasons USING btree (name);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_loggable_type_and_loggable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_loggable_type_and_loggable_id ON users USING btree (loggable_type, loggable_id);


--
-- Name: index_users_on_notice_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_notice_type_id ON users USING btree (notice_type_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_volun_assessments_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volun_assessments_on_project_id ON volun_assessments USING btree (project_id);


--
-- Name: index_volun_assessments_on_trait_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volun_assessments_on_trait_id ON volun_assessments USING btree (trait_id);


--
-- Name: index_volun_assessments_on_volunteer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volun_assessments_on_volunteer_id ON volun_assessments USING btree (volunteer_id);


--
-- Name: index_volun_availabilities_on_volunteer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volun_availabilities_on_volunteer_id ON volun_availabilities USING btree (volunteer_id);


--
-- Name: index_volun_contacts_on_contact_result_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volun_contacts_on_contact_result_id ON volun_contacts USING btree (contact_result_id);


--
-- Name: index_volun_contacts_on_contact_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volun_contacts_on_contact_type_id ON volun_contacts USING btree (contact_type_id);


--
-- Name: index_volun_contacts_on_manager_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volun_contacts_on_manager_id ON volun_contacts USING btree (manager_id);


--
-- Name: index_volun_contacts_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volun_contacts_on_project_id ON volun_contacts USING btree (project_id);


--
-- Name: index_volun_contacts_on_volunteer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volun_contacts_on_volunteer_id ON volun_contacts USING btree (volunteer_id);


--
-- Name: index_volun_known_languages_on_language_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volun_known_languages_on_language_id ON volun_known_languages USING btree (language_id);


--
-- Name: index_volun_known_languages_on_language_level_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volun_known_languages_on_language_level_id ON volun_known_languages USING btree (language_level_id);


--
-- Name: index_volun_known_languages_on_volunteer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volun_known_languages_on_volunteer_id ON volun_known_languages USING btree (volunteer_id);


--
-- Name: index_volun_trackings_on_manager_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volun_trackings_on_manager_id ON volun_trackings USING btree (manager_id);


--
-- Name: index_volun_trackings_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volun_trackings_on_project_id ON volun_trackings USING btree (project_id);


--
-- Name: index_volun_trackings_on_tracking_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volun_trackings_on_tracking_type_id ON volun_trackings USING btree (tracking_type_id);


--
-- Name: index_volun_trackings_on_volunteer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volun_trackings_on_volunteer_id ON volun_trackings USING btree (volunteer_id);


--
-- Name: index_volunteers_on_academic_level_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteers_on_academic_level_id ON volunteers USING btree (academic_level_id);


--
-- Name: index_volunteers_on_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteers_on_address_id ON volunteers USING btree (address_id);


--
-- Name: index_volunteers_on_employment_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteers_on_employment_status_id ON volunteers USING btree (employment_status_id);


--
-- Name: index_volunteers_on_id_number_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteers_on_id_number_type_id ON volunteers USING btree (id_number_type_id);


--
-- Name: index_volunteers_on_info_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteers_on_info_source_id ON volunteers USING btree (info_source_id);


--
-- Name: index_volunteers_on_manager_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteers_on_manager_id ON volunteers USING btree (manager_id);


--
-- Name: index_volunteers_on_nationality_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteers_on_nationality_id ON volunteers USING btree (nationality_id);


--
-- Name: index_volunteers_on_profession_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteers_on_profession_id ON volunteers USING btree (profession_id);


--
-- Name: index_volunteers_on_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteers_on_status_id ON volunteers USING btree (status_id);


--
-- Name: index_volunteers_on_unsubscribe_reason_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteers_on_unsubscribe_reason_id ON volunteers USING btree (unsubscribe_reason_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_0286d8b237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT fk_rails_0286d8b237 FOREIGN KEY (province_id) REFERENCES provinces(id);


--
-- Name: fk_rails_0660269916; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_activity_publishings
    ADD CONSTRAINT fk_rails_0660269916 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_076cef1fdc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteers
    ADD CONSTRAINT fk_rails_076cef1fdc FOREIGN KEY (manager_id) REFERENCES managers(id);


--
-- Name: fk_rails_11a4b85b23; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pt_subventions
    ADD CONSTRAINT fk_rails_11a4b85b23 FOREIGN KEY (proposal_id) REFERENCES proposals(id);


--
-- Name: fk_rails_15c4c560b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY timetables
    ADD CONSTRAINT fk_rails_15c4c560b1 FOREIGN KEY (event_id) REFERENCES events(id);


--
-- Name: fk_rails_1b6a6db21c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteers
    ADD CONSTRAINT fk_rails_1b6a6db21c FOREIGN KEY (address_id) REFERENCES addresses(id);


--
-- Name: fk_rails_1b98d66e19; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT fk_rails_1b98d66e19 FOREIGN KEY (district_id) REFERENCES districts(id);


--
-- Name: fk_rails_238a7f0b81; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_trackings
    ADD CONSTRAINT fk_rails_238a7f0b81 FOREIGN KEY (tracking_type_id) REFERENCES tracking_types(id);


--
-- Name: fk_rails_23944d719f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_contacts
    ADD CONSTRAINT fk_rails_23944d719f FOREIGN KEY (volunteer_id) REFERENCES volunteers(id);


--
-- Name: fk_rails_23bbf24b49; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_subscribes
    ADD CONSTRAINT fk_rails_23bbf24b49 FOREIGN KEY (road_type_id) REFERENCES road_types(id);


--
-- Name: fk_rails_2a2c9250e8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events
    ADD CONSTRAINT fk_rails_2a2c9250e8 FOREIGN KEY (address_id) REFERENCES addresses(id);


--
-- Name: fk_rails_2a8dd8e5f4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT fk_rails_2a8dd8e5f4 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_2ec518b2c1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_amendments
    ADD CONSTRAINT fk_rails_2ec518b2c1 FOREIGN KEY (province_id) REFERENCES provinces(id);


--
-- Name: fk_rails_30ddac6918; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_trackings
    ADD CONSTRAINT fk_rails_30ddac6918 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_3184e37ad1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY record_histories
    ADD CONSTRAINT fk_rails_3184e37ad1 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_3196973a02; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pro_trackings
    ADD CONSTRAINT fk_rails_3196973a02 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_319db762f5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT fk_rails_319db762f5 FOREIGN KEY (entity_id) REFERENCES entities(id);


--
-- Name: fk_rails_332a8e8cba; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_project_publishings
    ADD CONSTRAINT fk_rails_332a8e8cba FOREIGN KEY (province_id) REFERENCES provinces(id);


--
-- Name: fk_rails_34e98e56ba; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteers
    ADD CONSTRAINT fk_rails_34e98e56ba FOREIGN KEY (academic_level_id) REFERENCES academic_levels(id);


--
-- Name: fk_rails_41e220275b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_subscribes
    ADD CONSTRAINT fk_rails_41e220275b FOREIGN KEY (employment_status_id) REFERENCES employment_statuses(id);


--
-- Name: fk_rails_42c5cc9a36; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pro_issues
    ADD CONSTRAINT fk_rails_42c5cc9a36 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_4ad249f539; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_amendments
    ADD CONSTRAINT fk_rails_4ad249f539 FOREIGN KEY (district_id) REFERENCES districts(id);


--
-- Name: fk_rails_4b2c46ecb0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_amendments
    ADD CONSTRAINT fk_rails_4b2c46ecb0 FOREIGN KEY (road_type_id) REFERENCES road_types(id);


--
-- Name: fk_rails_500ca5be40; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteers
    ADD CONSTRAINT fk_rails_500ca5be40 FOREIGN KEY (profession_id) REFERENCES professions(id);


--
-- Name: fk_rails_5048823c24; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_trackings
    ADD CONSTRAINT fk_rails_5048823c24 FOREIGN KEY (manager_id) REFERENCES managers(id);


--
-- Name: fk_rails_55cf1b51e4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_activity_publishings
    ADD CONSTRAINT fk_rails_55cf1b51e4 FOREIGN KEY (province_id) REFERENCES provinces(id);


--
-- Name: fk_rails_55cfc1b0e0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documents
    ADD CONSTRAINT fk_rails_55cfc1b0e0 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_57ce8fa08b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_project_publishings
    ADD CONSTRAINT fk_rails_57ce8fa08b FOREIGN KEY (district_id) REFERENCES districts(id);


--
-- Name: fk_rails_58ead69265; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteers
    ADD CONSTRAINT fk_rails_58ead69265 FOREIGN KEY (unsubscribe_reason_id) REFERENCES unsubscribe_reasons(id);


--
-- Name: fk_rails_5c67115a6e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_subscribes
    ADD CONSTRAINT fk_rails_5c67115a6e FOREIGN KEY (academic_level_id) REFERENCES academic_levels(id);


--
-- Name: fk_rails_5e29a4093f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_contacts
    ADD CONSTRAINT fk_rails_5e29a4093f FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_5fda6378ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ent_trackings
    ADD CONSTRAINT fk_rails_5fda6378ac FOREIGN KEY (tracking_type_id) REFERENCES tracking_types(id);


--
-- Name: fk_rails_6835f66031; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_assessments
    ADD CONSTRAINT fk_rails_6835f66031 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_6b7b9a59a1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_assessments
    ADD CONSTRAINT fk_rails_6b7b9a59a1 FOREIGN KEY (trait_id) REFERENCES traits(id);


--
-- Name: fk_rails_6c193dac04; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteers
    ADD CONSTRAINT fk_rails_6c193dac04 FOREIGN KEY (info_source_id) REFERENCES info_sources(id);


--
-- Name: fk_rails_70ffe8fd78; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_subscribes
    ADD CONSTRAINT fk_rails_70ffe8fd78 FOREIGN KEY (id_number_type_id) REFERENCES id_number_types(id);


--
-- Name: fk_rails_752e02b6ad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ent_trackings
    ADD CONSTRAINT fk_rails_752e02b6ad FOREIGN KEY (manager_id) REFERENCES managers(id);


--
-- Name: fk_rails_757c811ef3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteers
    ADD CONSTRAINT fk_rails_757c811ef3 FOREIGN KEY (status_id) REFERENCES statuses(id);


--
-- Name: fk_rails_75f14fef31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events
    ADD CONSTRAINT fk_rails_75f14fef31 FOREIGN KEY (event_type_id) REFERENCES event_types(id);


--
-- Name: fk_rails_8916b62779; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_activity_publishings
    ADD CONSTRAINT fk_rails_8916b62779 FOREIGN KEY (road_type_id) REFERENCES road_types(id);


--
-- Name: fk_rails_8fad3bcf60; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY request_forms
    ADD CONSTRAINT fk_rails_8fad3bcf60 FOREIGN KEY (rejection_type_id) REFERENCES rejection_types(id);


--
-- Name: fk_rails_908a35f934; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_entity_subscribes
    ADD CONSTRAINT fk_rails_908a35f934 FOREIGN KEY (entity_type_id) REFERENCES entity_types(id);


--
-- Name: fk_rails_90b919b5dd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteers_demands
    ADD CONSTRAINT fk_rails_90b919b5dd FOREIGN KEY (province_id) REFERENCES provinces(id);


--
-- Name: fk_rails_914a67db4a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_subscribes
    ADD CONSTRAINT fk_rails_914a67db4a FOREIGN KEY (province_id) REFERENCES provinces(id);


--
-- Name: fk_rails_931c3c76ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY entities
    ADD CONSTRAINT fk_rails_931c3c76ef FOREIGN KEY (address_id) REFERENCES addresses(id);


--
-- Name: fk_rails_9aae347038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_contacts
    ADD CONSTRAINT fk_rails_9aae347038 FOREIGN KEY (contact_type_id) REFERENCES contact_types(id);


--
-- Name: fk_rails_9d90949dfa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_known_languages
    ADD CONSTRAINT fk_rails_9d90949dfa FOREIGN KEY (language_level_id) REFERENCES language_levels(id);


--
-- Name: fk_rails_a44a6d2ea1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY boroughs
    ADD CONSTRAINT fk_rails_a44a6d2ea1 FOREIGN KEY (district_id) REFERENCES districts(id);


--
-- Name: fk_rails_a756e0883f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_subscribes
    ADD CONSTRAINT fk_rails_a756e0883f FOREIGN KEY (info_source_id) REFERENCES info_sources(id);


--
-- Name: fk_rails_a7af8553e5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_availabilities
    ADD CONSTRAINT fk_rails_a7af8553e5 FOREIGN KEY (volunteer_id) REFERENCES volunteers(id);


--
-- Name: fk_rails_abaca6d161; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteers_demands
    ADD CONSTRAINT fk_rails_abaca6d161 FOREIGN KEY (district_id) REFERENCES districts(id);


--
-- Name: fk_rails_af6823b0e6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_subscribes
    ADD CONSTRAINT fk_rails_af6823b0e6 FOREIGN KEY (profession_id) REFERENCES professions(id);


--
-- Name: fk_rails_b0091044ff; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_contacts
    ADD CONSTRAINT fk_rails_b0091044ff FOREIGN KEY (contact_result_id) REFERENCES contact_results(id);


--
-- Name: fk_rails_b0d97e7abf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_entity_subscribes
    ADD CONSTRAINT fk_rails_b0d97e7abf FOREIGN KEY (district_id) REFERENCES districts(id);


--
-- Name: fk_rails_b6d9e93c75; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_rails_b6d9e93c75 FOREIGN KEY (notice_type_id) REFERENCES notice_types(id);


--
-- Name: fk_rails_b9041ac2cc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteers_demands
    ADD CONSTRAINT fk_rails_b9041ac2cc FOREIGN KEY (road_type_id) REFERENCES road_types(id);


--
-- Name: fk_rails_b949e9dc3f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ent_trackings
    ADD CONSTRAINT fk_rails_b949e9dc3f FOREIGN KEY (entity_id) REFERENCES entities(id);


--
-- Name: fk_rails_bddba12401; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT fk_rails_bddba12401 FOREIGN KEY (area_id) REFERENCES areas(id);


--
-- Name: fk_rails_bfb3770a7f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_contacts
    ADD CONSTRAINT fk_rails_bfb3770a7f FOREIGN KEY (manager_id) REFERENCES managers(id);


--
-- Name: fk_rails_c5cc40e3a0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_assessments
    ADD CONSTRAINT fk_rails_c5cc40e3a0 FOREIGN KEY (volunteer_id) REFERENCES volunteers(id);


--
-- Name: fk_rails_c6094089f7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_trackings
    ADD CONSTRAINT fk_rails_c6094089f7 FOREIGN KEY (volunteer_id) REFERENCES volunteers(id);


--
-- Name: fk_rails_c722c76bbe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteers
    ADD CONSTRAINT fk_rails_c722c76bbe FOREIGN KEY (id_number_type_id) REFERENCES id_number_types(id);


--
-- Name: fk_rails_c92072a9cf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_activity_publishings
    ADD CONSTRAINT fk_rails_c92072a9cf FOREIGN KEY (district_id) REFERENCES districts(id);


--
-- Name: fk_rails_cc2b7ccd21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_known_languages
    ADD CONSTRAINT fk_rails_cc2b7ccd21 FOREIGN KEY (volunteer_id) REFERENCES volunteers(id);


--
-- Name: fk_rails_d2aadf7da1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_known_languages
    ADD CONSTRAINT fk_rails_d2aadf7da1 FOREIGN KEY (language_id) REFERENCES languages(id);


--
-- Name: fk_rails_d3eae920e5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteers
    ADD CONSTRAINT fk_rails_d3eae920e5 FOREIGN KEY (employment_status_id) REFERENCES employment_statuses(id);


--
-- Name: fk_rails_d4023380ab; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_project_publishings
    ADD CONSTRAINT fk_rails_d4023380ab FOREIGN KEY (road_type_id) REFERENCES road_types(id);


--
-- Name: fk_rails_d7ca4cafeb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT fk_rails_d7ca4cafeb FOREIGN KEY (project_type_id) REFERENCES project_types(id);


--
-- Name: fk_rails_d97274598d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY request_forms
    ADD CONSTRAINT fk_rails_d97274598d FOREIGN KEY (request_type_id) REFERENCES request_types(id);


--
-- Name: fk_rails_db219105a2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY request_forms
    ADD CONSTRAINT fk_rails_db219105a2 FOREIGN KEY (request_reason_id) REFERENCES request_reasons(id);


--
-- Name: fk_rails_e4656aa818; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_subscribes
    ADD CONSTRAINT fk_rails_e4656aa818 FOREIGN KEY (district_id) REFERENCES districts(id);


--
-- Name: fk_rails_e9ec8bdda4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY entities
    ADD CONSTRAINT fk_rails_e9ec8bdda4 FOREIGN KEY (request_reason_id) REFERENCES request_reasons(id);


--
-- Name: fk_rails_ed2268fc5c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_entity_subscribes
    ADD CONSTRAINT fk_rails_ed2268fc5c FOREIGN KEY (province_id) REFERENCES provinces(id);


--
-- Name: fk_rails_ee71ed6a44; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_subscribes
    ADD CONSTRAINT fk_rails_ee71ed6a44 FOREIGN KEY (status_id) REFERENCES statuses(id);


--
-- Name: fk_rails_ef6ed1df81; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_entity_subscribes
    ADD CONSTRAINT fk_rails_ef6ed1df81 FOREIGN KEY (road_type_id) REFERENCES road_types(id);


--
-- Name: fk_rails_f4b5a45eed; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY request_forms
    ADD CONSTRAINT fk_rails_f4b5a45eed FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_f547f2af04; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_project_unsubscribes
    ADD CONSTRAINT fk_rails_f547f2af04 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_f771039889; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteers
    ADD CONSTRAINT fk_rails_f771039889 FOREIGN KEY (nationality_id) REFERENCES nationalities(id);


--
-- Name: fk_rails_f8a44fe9bf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY entities
    ADD CONSTRAINT fk_rails_f8a44fe9bf FOREIGN KEY (entity_type_id) REFERENCES entity_types(id);


--
-- Name: fk_rails_fd28fedc25; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_subscribes
    ADD CONSTRAINT fk_rails_fd28fedc25 FOREIGN KEY (nationality_id) REFERENCES nationalities(id);


--
-- Name: fk_rails_fe88fb4ec0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT fk_rails_fe88fb4ec0 FOREIGN KEY (road_type_id) REFERENCES road_types(id);


--
-- Name: fk_rails_ffd1fb1016; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT fk_rails_ffd1fb1016 FOREIGN KEY (entity_id) REFERENCES entities(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES ('20170125091004');

INSERT INTO schema_migrations (version) VALUES ('20170125091005');

INSERT INTO schema_migrations (version) VALUES ('20170125091007');

INSERT INTO schema_migrations (version) VALUES ('20170125091008');

INSERT INTO schema_migrations (version) VALUES ('20170125091009');

INSERT INTO schema_migrations (version) VALUES ('20170125091011');

INSERT INTO schema_migrations (version) VALUES ('20170125091013');

INSERT INTO schema_migrations (version) VALUES ('20170125091014');

INSERT INTO schema_migrations (version) VALUES ('20170125091016');

INSERT INTO schema_migrations (version) VALUES ('20170125091017');

INSERT INTO schema_migrations (version) VALUES ('20170125091019');

INSERT INTO schema_migrations (version) VALUES ('20170125091020');

INSERT INTO schema_migrations (version) VALUES ('20170125091022');

INSERT INTO schema_migrations (version) VALUES ('20170125091023');

INSERT INTO schema_migrations (version) VALUES ('20170125091025');

INSERT INTO schema_migrations (version) VALUES ('20170125091026');

INSERT INTO schema_migrations (version) VALUES ('20170125091028');

INSERT INTO schema_migrations (version) VALUES ('20170125091029');

INSERT INTO schema_migrations (version) VALUES ('20170125091031');

INSERT INTO schema_migrations (version) VALUES ('20170125091032');

INSERT INTO schema_migrations (version) VALUES ('20170125091034');

INSERT INTO schema_migrations (version) VALUES ('20170125091035');

INSERT INTO schema_migrations (version) VALUES ('20170125091037');

INSERT INTO schema_migrations (version) VALUES ('20170125091040');

INSERT INTO schema_migrations (version) VALUES ('20170125091042');

INSERT INTO schema_migrations (version) VALUES ('20170125091043');

INSERT INTO schema_migrations (version) VALUES ('20170125091045');

INSERT INTO schema_migrations (version) VALUES ('20170125091047');

INSERT INTO schema_migrations (version) VALUES ('20170125091048');

INSERT INTO schema_migrations (version) VALUES ('20170125091050');

INSERT INTO schema_migrations (version) VALUES ('20170125091051');

INSERT INTO schema_migrations (version) VALUES ('20170125091053');

INSERT INTO schema_migrations (version) VALUES ('20170125091054');

INSERT INTO schema_migrations (version) VALUES ('20170125091056');

INSERT INTO schema_migrations (version) VALUES ('20170125091057');

INSERT INTO schema_migrations (version) VALUES ('20170125091059');

INSERT INTO schema_migrations (version) VALUES ('20170125091101');

INSERT INTO schema_migrations (version) VALUES ('20170125091102');

INSERT INTO schema_migrations (version) VALUES ('20170125091104');

INSERT INTO schema_migrations (version) VALUES ('20170125091106');

INSERT INTO schema_migrations (version) VALUES ('20170125091107');

INSERT INTO schema_migrations (version) VALUES ('20170125091109');

INSERT INTO schema_migrations (version) VALUES ('20170125091111');

INSERT INTO schema_migrations (version) VALUES ('20170125091112');

INSERT INTO schema_migrations (version) VALUES ('20170125091114');

INSERT INTO schema_migrations (version) VALUES ('20170125091116');

INSERT INTO schema_migrations (version) VALUES ('20170125091118');

INSERT INTO schema_migrations (version) VALUES ('20170125091120');

INSERT INTO schema_migrations (version) VALUES ('20170125091121');

INSERT INTO schema_migrations (version) VALUES ('20170125091123');

INSERT INTO schema_migrations (version) VALUES ('20170125091125');

INSERT INTO schema_migrations (version) VALUES ('20170125091127');

INSERT INTO schema_migrations (version) VALUES ('20170125091128');

INSERT INTO schema_migrations (version) VALUES ('20170125091130');

INSERT INTO schema_migrations (version) VALUES ('20170125091132');

INSERT INTO schema_migrations (version) VALUES ('20170125091133');

INSERT INTO schema_migrations (version) VALUES ('20170125091135');

INSERT INTO schema_migrations (version) VALUES ('20170125091137');

INSERT INTO schema_migrations (version) VALUES ('20170125091139');

INSERT INTO schema_migrations (version) VALUES ('20170125091140');

INSERT INTO schema_migrations (version) VALUES ('20170125091142');

INSERT INTO schema_migrations (version) VALUES ('20170125091144');

INSERT INTO schema_migrations (version) VALUES ('20170125091146');

INSERT INTO schema_migrations (version) VALUES ('20170125091147');

INSERT INTO schema_migrations (version) VALUES ('20170125091149');

INSERT INTO schema_migrations (version) VALUES ('20170125091151');

INSERT INTO schema_migrations (version) VALUES ('20170125091153');

INSERT INTO schema_migrations (version) VALUES ('20170125091155');

INSERT INTO schema_migrations (version) VALUES ('20170125091156');

INSERT INTO schema_migrations (version) VALUES ('20170125091158');

INSERT INTO schema_migrations (version) VALUES ('20170125091200');

INSERT INTO schema_migrations (version) VALUES ('20170125091202');

INSERT INTO schema_migrations (version) VALUES ('20170125091204');

INSERT INTO schema_migrations (version) VALUES ('20170125091205');

INSERT INTO schema_migrations (version) VALUES ('20170125091207');

INSERT INTO schema_migrations (version) VALUES ('20170125091208');

INSERT INTO schema_migrations (version) VALUES ('20170125091210');

INSERT INTO schema_migrations (version) VALUES ('20170125091212');

INSERT INTO schema_migrations (version) VALUES ('20170125091214');

INSERT INTO schema_migrations (version) VALUES ('20170125091216');

INSERT INTO schema_migrations (version) VALUES ('20170125091217');

INSERT INTO schema_migrations (version) VALUES ('20170125091219');

INSERT INTO schema_migrations (version) VALUES ('20170125091220');

INSERT INTO schema_migrations (version) VALUES ('20170125091221');

INSERT INTO schema_migrations (version) VALUES ('20170125091223');

INSERT INTO schema_migrations (version) VALUES ('20170125091224');

INSERT INTO schema_migrations (version) VALUES ('20170125091225');

INSERT INTO schema_migrations (version) VALUES ('20170125091226');

