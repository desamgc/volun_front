--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: check_project_references(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION check_project_references() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
          DECLARE
              total integer;
              pt_model_name text;
          BEGIN
              total:= 0;
              pt_model_name := TG_ARGV[0];

              -- If any reference exists then total is set to 1
              SELECT 1 into total
              FROM projects
              WHERE pt_extendable_type = pt_model_name AND pt_extendable_id = OLD.id;

              IF total > 0 THEN
                  RAISE EXCEPTION 'Key (id)=(%) is still referenced from table "projects"', OLD.id;
              END IF;
              RETURN NULL;
          END;
      $$;


--
-- Name: check_request_form_references(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION check_request_form_references() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
          DECLARE
              total integer;
              rt_model_name text;
          BEGIN
              total:= 0;
              rt_model_name := TG_ARGV[0];

              -- If any reference exists then total is set to 1
              SELECT 1 into total
              FROM projects
              WHERE rt_extendable_type = rt_model_name AND rt_extendable_id = OLD.id;

              IF total > 0 THEN
                  RAISE EXCEPTION 'Key (id)=(%) is still referenced from table "request_forms"', OLD.id;
              END IF;
              RETURN NULL;
          END;
      $$;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: academic_levels; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: activities; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE activities (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text NOT NULL,
    start_date date NOT NULL,
    end_date date,
    transport text NOT NULL,
    pdf_url character varying,
    publish boolean DEFAULT true,
    active boolean DEFAULT true,
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
-- Name: addresses; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE addresses (
    id integer NOT NULL,
    road_type character varying,
    road_name character varying,
    road_number_type character varying,
    road_number character varying,
    grader character varying,
    stairs character varying,
    floor character varying,
    door character varying,
    postal_code character varying,
    borough character varying,
    district character varying,
    town character varying,
    province character varying,
    country character varying,
    ndp_code character varying,
    local_code character varying,
    province_code character varying,
    town_code character varying,
    district_code character varying,
    class_name character varying,
    latitude character varying,
    longitude character varying,
    normalize boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    notes text,
    comments text
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
-- Name: areas; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: areas_projects; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE areas_projects (
    area_id integer NOT NULL,
    project_id integer NOT NULL
);


--
-- Name: areas_volunteers; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE areas_volunteers (
    area_id integer NOT NULL,
    volunteer_id integer NOT NULL
);


--
-- Name: collectives; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: collectives_projects; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE collectives_projects (
    collective_id integer NOT NULL,
    project_id integer NOT NULL
);


--
-- Name: collectives_volunteers; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE collectives_volunteers (
    collective_id integer NOT NULL,
    volunteer_id integer NOT NULL
);


--
-- Name: contact_results; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: contact_types; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: coordinations; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: coordinations_projects; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE coordinations_projects (
    coordination_id integer NOT NULL,
    project_id integer NOT NULL
);


--
-- Name: degree_types; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE degree_types (
    id integer NOT NULL,
    name character varying,
    educational_type character varying,
    active character varying,
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
-- Name: degrees; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE degrees (
    id integer NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    degree_type_id integer,
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
-- Name: degrees_volunteers; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE degrees_volunteers (
    degree_id integer NOT NULL,
    volunteer_id integer NOT NULL,
    id integer NOT NULL
);


--
-- Name: degrees_volunteers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE degrees_volunteers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: degrees_volunteers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE degrees_volunteers_id_seq OWNED BY degrees_volunteers.id;


--
-- Name: districts; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: documents; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE documents (
    id integer NOT NULL,
    name character varying,
    description text,
    extension character varying,
    csv character varying,
    doc_class character varying,
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
-- Name: employment_statuses; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: ent_trackings; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE ent_trackings (
    id integer NOT NULL,
    tracking_type_id integer NOT NULL,
    entity_id integer NOT NULL,
    manager_id integer,
    request_form_id integer,
    tracked_at timestamp without time zone NOT NULL,
    automatic boolean DEFAULT false,
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
-- Name: entities; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
    req_reason_id integer,
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
-- Name: entities_projects; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE entities_projects (
    entity_id integer NOT NULL,
    project_id integer NOT NULL
);


--
-- Name: entity_types; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE entity_types (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    active boolean DEFAULT true NOT NULL,
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
-- Name: event_types; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE event_types (
    id integer NOT NULL,
    kind integer NOT NULL,
    description text NOT NULL,
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
-- Name: events; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
    notes text,
    comments text,
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
-- Name: frontpage_elements; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE frontpage_elements (
    id integer NOT NULL,
    frontpage_position_id integer NOT NULL,
    text_panel text,
    text_button text,
    image_url text,
    link_url text,
    logo_url text,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    updated_by integer
);


--
-- Name: frontpage_elements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE frontpage_elements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: frontpage_elements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE frontpage_elements_id_seq OWNED BY frontpage_elements.id;


--
-- Name: frontpage_positions; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE frontpage_positions (
    id integer NOT NULL,
    "position" integer,
    description text,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: frontpage_positions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE frontpage_positions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: frontpage_positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE frontpage_positions_id_seq OWNED BY frontpage_positions.id;


--
-- Name: id_number_types; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: info_sources; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: language_levels; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: languages; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: link_types; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE link_types (
    id integer NOT NULL,
    kind integer,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: link_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE link_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: link_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE link_types_id_seq OWNED BY link_types.id;


--
-- Name: links; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE links (
    id integer NOT NULL,
    path character varying,
    description text,
    linkable_id integer,
    linkable_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    link_type_id integer,
    file_file_name character varying,
    file_content_type character varying,
    file_file_size integer,
    file_updated_at timestamp without time zone
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
-- Name: managers; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE managers (
    id integer NOT NULL,
    name character varying NOT NULL,
    last_name character varying,
    last_name_alt character varying,
    alias_name character varying,
    role_id integer,
    profile_id integer,
    phone_number character varying,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    login character varying,
    uweb_id character varying,
    document character varying,
    email character varying,
    official_position character varying,
    personal_number character varying
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
-- Name: motivations; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: nationalities; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: notice_types; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: permissions; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE permissions (
    id integer NOT NULL,
    manager_id integer,
    resource_id integer,
    can_create boolean DEFAULT false,
    can_update boolean DEFAULT false,
    can_read boolean DEFAULT false,
    can_destroy boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE permissions_id_seq OWNED BY permissions.id;


--
-- Name: pro_issues; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: pro_trackings; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE pro_trackings (
    id integer NOT NULL,
    project_id integer,
    request_form_id integer,
    tracked_at timestamp without time zone,
    automatic boolean DEFAULT false,
    comments text,
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
-- Name: professions; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: profiles; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: project_types; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE project_types (
    id integer NOT NULL,
    kind integer NOT NULL,
    description text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT kind_and_id_must_be_equal CHECK (((((((((id = 1) AND (kind = 1)) OR ((id = 2) AND (kind = 2))) OR ((id = 3) AND (kind = 3))) OR ((id = 4) AND (kind = 4))) OR ((id = 5) AND (kind = 5))) OR ((id = 6) AND (kind = 6))) OR ((id = 7) AND (kind = 7))))
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
-- Name: projects; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
    participants_num integer,
    beneficiaries_num integer,
    volunteers_num integer,
    volunteers_allowed boolean DEFAULT true,
    publish boolean DEFAULT true,
    outstanding boolean DEFAULT false,
    insurance_date date,
    comments text,
    insured boolean DEFAULT false,
    project_type_id integer NOT NULL,
    pt_extendable_id integer NOT NULL,
    pt_extendable_type character varying NOT NULL,
    entity_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    urgent boolean DEFAULT false,
    contact_name1 character varying,
    contact_last_name1 character varying,
    contact_last_name_alt1 character varying,
    phone_number1 character varying,
    phone_number_alt1 character varying,
    contact_name2 character varying,
    contact_last_name2 character varying,
    contact_last_name_alt2 character varying,
    phone_number2 character varying,
    phone_number_alt2 character varying,
    email1 character varying,
    email2 character varying,
    CONSTRAINT pt_extendable_must_be_consistent CHECK (((((((((project_type_id = 1) AND ((pt_extendable_type)::text = 'Pt::Social'::text)) OR ((project_type_id = 2) AND ((pt_extendable_type)::text = 'Pt::Centre'::text))) OR ((project_type_id = 3) AND ((pt_extendable_type)::text = 'Pt::Permanent'::text))) OR ((project_type_id = 4) AND ((pt_extendable_type)::text = 'Pt::Punctual'::text))) OR ((project_type_id = 5) AND ((pt_extendable_type)::text = 'Pt::Entity'::text))) OR ((project_type_id = 6) AND ((pt_extendable_type)::text = 'Pt::Subvention'::text))) OR ((project_type_id = 7) AND ((pt_extendable_type)::text = 'Pt::Other'::text))))
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
-- Name: projects_volunteers; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE projects_volunteers (
    project_id integer NOT NULL,
    volunteer_id integer NOT NULL
);


--
-- Name: proposals; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: provinces; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE provinces (
    id integer NOT NULL,
    name character varying,
    code character varying,
    active boolean DEFAULT true,
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
-- Name: pt_centres; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE pt_centres (
    id integer NOT NULL,
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pt_centres_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pt_centres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pt_centres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pt_centres_id_seq OWNED BY pt_centres.id;


--
-- Name: pt_entities; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
    notes text,
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
-- Name: pt_others; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE pt_others (
    id integer NOT NULL,
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pt_others_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pt_others_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pt_others_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pt_others_id_seq OWNED BY pt_others.id;


--
-- Name: pt_permanents; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE pt_permanents (
    id integer NOT NULL,
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pt_permanents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pt_permanents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pt_permanents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pt_permanents_id_seq OWNED BY pt_permanents.id;


--
-- Name: pt_punctuals; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE pt_punctuals (
    id integer NOT NULL,
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pt_punctuals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pt_punctuals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pt_punctuals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pt_punctuals_id_seq OWNED BY pt_punctuals.id;


--
-- Name: pt_socials; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE pt_socials (
    id integer NOT NULL,
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pt_socials_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pt_socials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pt_socials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pt_socials_id_seq OWNED BY pt_socials.id;


--
-- Name: pt_subventions; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
    has_quality_evaluation boolean DEFAULT false,
    proposal_id integer,
    notes text,
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
-- Name: record_histories; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE record_histories (
    id integer NOT NULL,
    user_id integer NOT NULL,
    recordable_id integer NOT NULL,
    recordable_type character varying NOT NULL,
    recordable_changed_at timestamp without time zone,
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
-- Name: req_reasons; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE req_reasons (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: req_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE req_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: req_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE req_reasons_id_seq OWNED BY req_reasons.id;


--
-- Name: req_rejection_types; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE req_rejection_types (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: req_rejection_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE req_rejection_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: req_rejection_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE req_rejection_types_id_seq OWNED BY req_rejection_types.id;


--
-- Name: req_status_traces; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE req_status_traces (
    id integer NOT NULL,
    req_status_id integer NOT NULL,
    request_form_id integer NOT NULL,
    manager_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: req_status_traces_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE req_status_traces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: req_status_traces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE req_status_traces_id_seq OWNED BY req_status_traces.id;


--
-- Name: req_statuses; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE req_statuses (
    id integer NOT NULL,
    kind integer NOT NULL,
    description text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: req_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE req_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: req_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE req_statuses_id_seq OWNED BY req_statuses.id;


--
-- Name: request_forms; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE request_forms (
    id integer NOT NULL,
    request_type_id integer,
    rt_extendable_id integer NOT NULL,
    rt_extendable_type character varying NOT NULL,
    user_id integer,
    req_status_id integer NOT NULL,
    status_date timestamp without time zone NOT NULL,
    req_rejection_type_id integer,
    req_reason_id integer,
    manager_id integer,
    comments text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT rt_extendable_must_be_consistent CHECK ((((((((((((((request_type_id = 1) AND ((rt_extendable_type)::text = 'Rt::VolunteerSubscribe'::text)) OR ((request_type_id = 2) AND ((rt_extendable_type)::text = 'Rt::VolunteerUnsubscribe'::text))) OR ((request_type_id = 3) AND ((rt_extendable_type)::text = 'Rt::VolunteerAmendment'::text))) OR ((request_type_id = 4) AND ((rt_extendable_type)::text = 'Rt::VolunteerAppointment'::text))) OR ((request_type_id = 5) AND ((rt_extendable_type)::text = 'Rt::EntitySubscribe'::text))) OR ((request_type_id = 6) AND ((rt_extendable_type)::text = 'Rt::EntityUnsubscribe'::text))) OR ((request_type_id = 7) AND ((rt_extendable_type)::text = 'Rt::VolunteersDemand'::text))) OR ((request_type_id = 8) AND ((rt_extendable_type)::text = 'Rt::ProjectPublishing'::text))) OR ((request_type_id = 9) AND ((rt_extendable_type)::text = 'Rt::ProjectUnpublishing'::text))) OR ((request_type_id = 10) AND ((rt_extendable_type)::text = 'Rt::ActivityPublishing'::text))) OR ((request_type_id = 11) AND ((rt_extendable_type)::text = 'Rt::ActivityUnpublishing'::text))) OR ((request_type_id = 12) AND ((rt_extendable_type)::text = 'Rt::Other'::text))))
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
-- Name: request_types; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE request_types (
    id integer NOT NULL,
    kind integer NOT NULL,
    description text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT kind_and_id_must_be_equal CHECK ((((((((((((((id = 1) AND (kind = 1)) OR ((id = 2) AND (kind = 2))) OR ((id = 3) AND (kind = 3))) OR ((id = 4) AND (kind = 4))) OR ((id = 5) AND (kind = 5))) OR ((id = 6) AND (kind = 6))) OR ((id = 7) AND (kind = 7))) OR ((id = 8) AND (kind = 8))) OR ((id = 9) AND (kind = 9))) OR ((id = 10) AND (kind = 10))) OR ((id = 11) AND (kind = 11))) OR ((id = 12) AND (kind = 12))))
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
-- Name: resources; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE resources (
    id integer NOT NULL,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    active boolean DEFAULT true,
    main boolean DEFAULT false
);


--
-- Name: resources_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE resources_id_seq OWNED BY resources.id;


--
-- Name: road_types; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE road_types (
    id integer NOT NULL,
    name character varying,
    code character varying,
    active boolean DEFAULT true,
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
-- Name: roles; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE roles (
    id integer NOT NULL,
    kind integer,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: rt_activity_publishings; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE rt_activity_publishings (
    id integer NOT NULL,
    name character varying,
    organizer character varying,
    description text,
    execution_date date,
    execution_hour character varying,
    road_type character varying,
    road_name character varying,
    number_type character varying,
    road_number character varying,
    postal_code character varying,
    borough character varying,
    district character varying,
    town character varying,
    province character varying,
    project_id integer,
    notes text,
    activity_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    dates_text_free character varying,
    hours_text_free character varying,
    places_text_free character varying,
    observations_text_free character varying
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
-- Name: rt_activity_unpublishings; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE rt_activity_unpublishings (
    id integer NOT NULL,
    activity_id integer,
    notes text,
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
-- Name: rt_entity_subscribes; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
    road_type character varying,
    road_name character varying,
    road_number_type character varying,
    road_number character varying,
    postal_code character varying,
    borough character varying,
    district character varying,
    town character varying,
    province character varying,
    project_id integer,
    notes text,
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
-- Name: rt_entity_unsubscribes; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE rt_entity_unsubscribes (
    id integer NOT NULL,
    project_id integer,
    notes text,
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
-- Name: rt_others; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE rt_others (
    id integer NOT NULL,
    description text,
    notes text,
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
-- Name: rt_project_publishings; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE rt_project_publishings (
    id integer NOT NULL,
    description text,
    road_type character varying,
    road_name character varying,
    number_type character varying,
    road_number character varying,
    postal_code character varying,
    borough character varying,
    district character varying,
    town character varying,
    province character varying,
    notes text,
    project_id integer,
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
-- Name: rt_project_unpublishings; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE rt_project_unpublishings (
    id integer NOT NULL,
    project_id integer,
    notes text,
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
-- Name: rt_volunteer_amendments; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE rt_volunteer_amendments (
    id integer NOT NULL,
    road_type character varying,
    road_name character varying,
    number_type character varying,
    road_number character varying,
    postal_code character varying,
    borough character varying,
    district character varying,
    town character varying,
    province character varying,
    phone_number character varying,
    phone_number_alt character varying,
    email character varying,
    notes text,
    project_id integer,
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
-- Name: rt_volunteer_appointments; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE rt_volunteer_appointments (
    id integer NOT NULL,
    notes text,
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
-- Name: rt_volunteer_subscribes; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE rt_volunteer_subscribes (
    id integer NOT NULL,
    name character varying,
    last_name character varying,
    last_name_alt character varying,
    phone_number character varying,
    phone_number_alt character varying,
    email character varying,
    publish_pictures boolean DEFAULT true,
    annual_survey boolean DEFAULT false,
    project_id integer,
    notes text,
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
-- Name: rt_volunteer_unsubscribes; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE rt_volunteer_unsubscribes (
    id integer NOT NULL,
    unsubscribe_level_id integer,
    project_id integer,
    notes text,
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
-- Name: rt_volunteers_demands; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE rt_volunteers_demands (
    id integer NOT NULL,
    description text,
    execution_start_date date,
    execution_end_date date,
    road_type character varying,
    road_name character varying,
    number_type character varying,
    road_number character varying,
    postal_code character varying,
    borough character varying,
    district character varying,
    town character varying,
    province character varying,
    requested_volunteers_num character varying,
    volunteers_profile text,
    volunteer_functions_1 text,
    volunteer_functions_2 text,
    volunteer_functions_3 text,
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    project_id integer
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
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: sectors; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: settings; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE settings (
    id integer NOT NULL,
    key character varying,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE settings_id_seq OWNED BY settings.id;


--
-- Name: skills; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: skills_volunteers; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE skills_volunteers (
    skill_id integer NOT NULL,
    volunteer_id integer NOT NULL
);


--
-- Name: statuses; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: timetables; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: tracking_types; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE tracking_types (
    id integer NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    alias_name character varying,
    system boolean DEFAULT false
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
-- Name: traits; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: unsubscribe_levels; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE unsubscribe_levels (
    id integer NOT NULL,
    kind integer NOT NULL,
    description text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: unsubscribe_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unsubscribe_levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unsubscribe_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unsubscribe_levels_id_seq OWNED BY unsubscribe_levels.id;


--
-- Name: unsubscribe_reasons; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE users (
    id integer NOT NULL,
    login character varying,
    locale character varying,
    notice_type_id integer,
    loggable_id integer,
    loggable_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying DEFAULT ''::character varying,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    terms_of_service boolean DEFAULT false
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
-- Name: volun_assessments; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE volun_assessments (
    id integer NOT NULL,
    volunteer_id integer NOT NULL,
    trait_id integer NOT NULL,
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
-- Name: volun_assessments_projects; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE volun_assessments_projects (
    id integer NOT NULL,
    volunteer_id integer,
    trait_id integer,
    project_id integer,
    trait_other character varying,
    assessment boolean DEFAULT false,
    comments text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: volun_assessments_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE volun_assessments_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: volun_assessments_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE volun_assessments_projects_id_seq OWNED BY volun_assessments_projects.id;


--
-- Name: volun_availabilities; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE volun_availabilities (
    id integer NOT NULL,
    volunteer_id integer NOT NULL,
    day integer NOT NULL,
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
-- Name: volun_contacts; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: volun_known_languages; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
-- Name: volun_trackings; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE volun_trackings (
    id integer NOT NULL,
    volunteer_id integer NOT NULL,
    tracking_type_id integer NOT NULL,
    project_id integer,
    manager_id integer,
    request_form_id integer,
    tracked_at timestamp without time zone NOT NULL,
    automatic boolean DEFAULT false,
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
-- Name: volunteers; Type: TABLE; Schema: public; Owner: -; Tablespace:
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
    address_id integer,
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
    error_address text,
    error_other text,
    review integer,
    profession_id integer,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    initial_pass character varying,
    notes character varying,
    accompany_volunteer boolean DEFAULT false
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

ALTER TABLE ONLY degrees_volunteers ALTER COLUMN id SET DEFAULT nextval('degrees_volunteers_id_seq'::regclass);


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

ALTER TABLE ONLY frontpage_elements ALTER COLUMN id SET DEFAULT nextval('frontpage_elements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY frontpage_positions ALTER COLUMN id SET DEFAULT nextval('frontpage_positions_id_seq'::regclass);


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

ALTER TABLE ONLY link_types ALTER COLUMN id SET DEFAULT nextval('link_types_id_seq'::regclass);


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

ALTER TABLE ONLY permissions ALTER COLUMN id SET DEFAULT nextval('permissions_id_seq'::regclass);


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

ALTER TABLE ONLY pt_centres ALTER COLUMN id SET DEFAULT nextval('pt_centres_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pt_entities ALTER COLUMN id SET DEFAULT nextval('pt_entities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pt_others ALTER COLUMN id SET DEFAULT nextval('pt_others_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pt_permanents ALTER COLUMN id SET DEFAULT nextval('pt_permanents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pt_punctuals ALTER COLUMN id SET DEFAULT nextval('pt_punctuals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pt_socials ALTER COLUMN id SET DEFAULT nextval('pt_socials_id_seq'::regclass);


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

ALTER TABLE ONLY req_reasons ALTER COLUMN id SET DEFAULT nextval('req_reasons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY req_rejection_types ALTER COLUMN id SET DEFAULT nextval('req_rejection_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY req_status_traces ALTER COLUMN id SET DEFAULT nextval('req_status_traces_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY req_statuses ALTER COLUMN id SET DEFAULT nextval('req_statuses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY request_forms ALTER COLUMN id SET DEFAULT nextval('request_forms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY request_types ALTER COLUMN id SET DEFAULT nextval('request_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY resources ALTER COLUMN id SET DEFAULT nextval('resources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY road_types ALTER COLUMN id SET DEFAULT nextval('road_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


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

ALTER TABLE ONLY settings ALTER COLUMN id SET DEFAULT nextval('settings_id_seq'::regclass);


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

ALTER TABLE ONLY unsubscribe_levels ALTER COLUMN id SET DEFAULT nextval('unsubscribe_levels_id_seq'::regclass);


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

ALTER TABLE ONLY volun_assessments_projects ALTER COLUMN id SET DEFAULT nextval('volun_assessments_projects_id_seq'::regclass);


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
-- Name: academic_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY academic_levels
    ADD CONSTRAINT academic_levels_pkey PRIMARY KEY (id);


--
-- Name: activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: areas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- Name: collectives_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY collectives
    ADD CONSTRAINT collectives_pkey PRIMARY KEY (id);


--
-- Name: contact_results_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY contact_results
    ADD CONSTRAINT contact_results_pkey PRIMARY KEY (id);


--
-- Name: contact_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY contact_types
    ADD CONSTRAINT contact_types_pkey PRIMARY KEY (id);


--
-- Name: coordinations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY coordinations
    ADD CONSTRAINT coordinations_pkey PRIMARY KEY (id);


--
-- Name: degree_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY degree_types
    ADD CONSTRAINT degree_types_pkey PRIMARY KEY (id);


--
-- Name: degrees_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY degrees
    ADD CONSTRAINT degrees_pkey PRIMARY KEY (id);


--
-- Name: degrees_volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY degrees_volunteers
    ADD CONSTRAINT degrees_volunteers_pkey PRIMARY KEY (id);


--
-- Name: districts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id);


--
-- Name: documents_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: employment_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY employment_statuses
    ADD CONSTRAINT employment_statuses_pkey PRIMARY KEY (id);


--
-- Name: ent_trackings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY ent_trackings
    ADD CONSTRAINT ent_trackings_pkey PRIMARY KEY (id);


--
-- Name: entities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY entities
    ADD CONSTRAINT entities_pkey PRIMARY KEY (id);


--
-- Name: entity_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY entity_types
    ADD CONSTRAINT entity_types_pkey PRIMARY KEY (id);


--
-- Name: event_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY event_types
    ADD CONSTRAINT event_types_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: frontpage_elements_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY frontpage_elements
    ADD CONSTRAINT frontpage_elements_pkey PRIMARY KEY (id);


--
-- Name: frontpage_positions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY frontpage_positions
    ADD CONSTRAINT frontpage_positions_pkey PRIMARY KEY (id);


--
-- Name: id_number_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY id_number_types
    ADD CONSTRAINT id_number_types_pkey PRIMARY KEY (id);


--
-- Name: info_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY info_sources
    ADD CONSTRAINT info_sources_pkey PRIMARY KEY (id);


--
-- Name: language_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY language_levels
    ADD CONSTRAINT language_levels_pkey PRIMARY KEY (id);


--
-- Name: languages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: link_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY link_types
    ADD CONSTRAINT link_types_pkey PRIMARY KEY (id);


--
-- Name: links_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: managers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY managers
    ADD CONSTRAINT managers_pkey PRIMARY KEY (id);


--
-- Name: motivations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY motivations
    ADD CONSTRAINT motivations_pkey PRIMARY KEY (id);


--
-- Name: nationalities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY nationalities
    ADD CONSTRAINT nationalities_pkey PRIMARY KEY (id);


--
-- Name: notice_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY notice_types
    ADD CONSTRAINT notice_types_pkey PRIMARY KEY (id);


--
-- Name: permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: pro_issues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY pro_issues
    ADD CONSTRAINT pro_issues_pkey PRIMARY KEY (id);


--
-- Name: pro_trackings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY pro_trackings
    ADD CONSTRAINT pro_trackings_pkey PRIMARY KEY (id);


--
-- Name: professions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY professions
    ADD CONSTRAINT professions_pkey PRIMARY KEY (id);


--
-- Name: profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: project_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY project_types
    ADD CONSTRAINT project_types_pkey PRIMARY KEY (id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: proposals_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY proposals
    ADD CONSTRAINT proposals_pkey PRIMARY KEY (id);


--
-- Name: provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);


--
-- Name: pt_centres_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY pt_centres
    ADD CONSTRAINT pt_centres_pkey PRIMARY KEY (id);


--
-- Name: pt_entities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY pt_entities
    ADD CONSTRAINT pt_entities_pkey PRIMARY KEY (id);


--
-- Name: pt_others_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY pt_others
    ADD CONSTRAINT pt_others_pkey PRIMARY KEY (id);


--
-- Name: pt_permanents_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY pt_permanents
    ADD CONSTRAINT pt_permanents_pkey PRIMARY KEY (id);


--
-- Name: pt_punctuals_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY pt_punctuals
    ADD CONSTRAINT pt_punctuals_pkey PRIMARY KEY (id);


--
-- Name: pt_socials_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY pt_socials
    ADD CONSTRAINT pt_socials_pkey PRIMARY KEY (id);


--
-- Name: pt_subventions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY pt_subventions
    ADD CONSTRAINT pt_subventions_pkey PRIMARY KEY (id);


--
-- Name: record_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY record_histories
    ADD CONSTRAINT record_histories_pkey PRIMARY KEY (id);


--
-- Name: req_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY req_reasons
    ADD CONSTRAINT req_reasons_pkey PRIMARY KEY (id);


--
-- Name: req_rejection_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY req_rejection_types
    ADD CONSTRAINT req_rejection_types_pkey PRIMARY KEY (id);


--
-- Name: req_status_traces_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY req_status_traces
    ADD CONSTRAINT req_status_traces_pkey PRIMARY KEY (id);


--
-- Name: req_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY req_statuses
    ADD CONSTRAINT req_statuses_pkey PRIMARY KEY (id);


--
-- Name: request_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY request_forms
    ADD CONSTRAINT request_forms_pkey PRIMARY KEY (id);


--
-- Name: request_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY request_types
    ADD CONSTRAINT request_types_pkey PRIMARY KEY (id);


--
-- Name: resources_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);


--
-- Name: road_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY road_types
    ADD CONSTRAINT road_types_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: rt_activity_publishings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY rt_activity_publishings
    ADD CONSTRAINT rt_activity_publishings_pkey PRIMARY KEY (id);


--
-- Name: rt_activity_unpublishings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY rt_activity_unpublishings
    ADD CONSTRAINT rt_activity_unpublishings_pkey PRIMARY KEY (id);


--
-- Name: rt_entity_subscribes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY rt_entity_subscribes
    ADD CONSTRAINT rt_entity_subscribes_pkey PRIMARY KEY (id);


--
-- Name: rt_entity_unsubscribes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY rt_entity_unsubscribes
    ADD CONSTRAINT rt_entity_unsubscribes_pkey PRIMARY KEY (id);


--
-- Name: rt_others_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY rt_others
    ADD CONSTRAINT rt_others_pkey PRIMARY KEY (id);


--
-- Name: rt_project_publishings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY rt_project_publishings
    ADD CONSTRAINT rt_project_publishings_pkey PRIMARY KEY (id);


--
-- Name: rt_project_unpublishings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY rt_project_unpublishings
    ADD CONSTRAINT rt_project_unpublishings_pkey PRIMARY KEY (id);


--
-- Name: rt_volunteer_amendments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY rt_volunteer_amendments
    ADD CONSTRAINT rt_volunteer_amendments_pkey PRIMARY KEY (id);


--
-- Name: rt_volunteer_appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY rt_volunteer_appointments
    ADD CONSTRAINT rt_volunteer_appointments_pkey PRIMARY KEY (id);


--
-- Name: rt_volunteer_subscribes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY rt_volunteer_subscribes
    ADD CONSTRAINT rt_volunteer_subscribes_pkey PRIMARY KEY (id);


--
-- Name: rt_volunteer_unsubscribes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY rt_volunteer_unsubscribes
    ADD CONSTRAINT rt_volunteer_unsubscribes_pkey PRIMARY KEY (id);


--
-- Name: rt_volunteers_demands_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY rt_volunteers_demands
    ADD CONSTRAINT rt_volunteers_demands_pkey PRIMARY KEY (id);


--
-- Name: sectors_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY sectors
    ADD CONSTRAINT sectors_pkey PRIMARY KEY (id);


--
-- Name: settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: skills_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (id);


--
-- Name: statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY statuses
    ADD CONSTRAINT statuses_pkey PRIMARY KEY (id);


--
-- Name: timetables_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY timetables
    ADD CONSTRAINT timetables_pkey PRIMARY KEY (id);


--
-- Name: tracking_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY tracking_types
    ADD CONSTRAINT tracking_types_pkey PRIMARY KEY (id);


--
-- Name: traits_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY traits
    ADD CONSTRAINT traits_pkey PRIMARY KEY (id);


--
-- Name: unsubscribe_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY unsubscribe_levels
    ADD CONSTRAINT unsubscribe_levels_pkey PRIMARY KEY (id);


--
-- Name: unsubscribe_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY unsubscribe_reasons
    ADD CONSTRAINT unsubscribe_reasons_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: volun_assessments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY volun_assessments
    ADD CONSTRAINT volun_assessments_pkey PRIMARY KEY (id);


--
-- Name: volun_assessments_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY volun_assessments_projects
    ADD CONSTRAINT volun_assessments_projects_pkey PRIMARY KEY (id);


--
-- Name: volun_availabilities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY volun_availabilities
    ADD CONSTRAINT volun_availabilities_pkey PRIMARY KEY (id);


--
-- Name: volun_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY volun_contacts
    ADD CONSTRAINT volun_contacts_pkey PRIMARY KEY (id);


--
-- Name: volun_known_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY volun_known_languages
    ADD CONSTRAINT volun_known_languages_pkey PRIMARY KEY (id);


--
-- Name: volun_trackings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY volun_trackings
    ADD CONSTRAINT volun_trackings_pkey PRIMARY KEY (id);


--
-- Name: volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);


--
-- Name: index_academic_levels_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_academic_levels_on_name ON academic_levels USING btree (name);


--
-- Name: index_activities_on_area_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_activities_on_area_id ON activities USING btree (area_id);


--
-- Name: index_activities_on_entity_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_activities_on_entity_id ON activities USING btree (entity_id);


--
-- Name: index_activities_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_activities_on_name ON activities USING btree (name);


--
-- Name: index_activities_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_activities_on_project_id ON activities USING btree (project_id);


--
-- Name: index_areas_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_areas_on_name ON areas USING btree (name);


--
-- Name: index_areas_projects_on_area_id_and_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_areas_projects_on_area_id_and_project_id ON areas_projects USING btree (area_id, project_id);


--
-- Name: index_areas_projects_on_project_id_and_area_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_areas_projects_on_project_id_and_area_id ON areas_projects USING btree (project_id, area_id);


--
-- Name: index_areas_volunteers_on_area_id_and_volunteer_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_areas_volunteers_on_area_id_and_volunteer_id ON areas_volunteers USING btree (area_id, volunteer_id);


--
-- Name: index_areas_volunteers_on_volunteer_id_and_area_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_areas_volunteers_on_volunteer_id_and_area_id ON areas_volunteers USING btree (volunteer_id, area_id);


--
-- Name: index_collectives_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_collectives_on_name ON collectives USING btree (name);


--
-- Name: index_collectives_projects_on_collective_id_and_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_collectives_projects_on_collective_id_and_project_id ON collectives_projects USING btree (collective_id, project_id);


--
-- Name: index_collectives_projects_on_project_id_and_collective_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_collectives_projects_on_project_id_and_collective_id ON collectives_projects USING btree (project_id, collective_id);


--
-- Name: index_collectives_volunteers_on_collective_id_and_volunteer_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_collectives_volunteers_on_collective_id_and_volunteer_id ON collectives_volunteers USING btree (collective_id, volunteer_id);


--
-- Name: index_collectives_volunteers_on_volunteer_id_and_collective_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_collectives_volunteers_on_volunteer_id_and_collective_id ON collectives_volunteers USING btree (volunteer_id, collective_id);


--
-- Name: index_contact_results_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_contact_results_on_name ON contact_results USING btree (name);


--
-- Name: index_contact_types_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_contact_types_on_name ON contact_types USING btree (name);


--
-- Name: index_coordinations_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_coordinations_on_name ON coordinations USING btree (name);


--
-- Name: index_coordinations_projects_on_coordination_id_and_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_coordinations_projects_on_coordination_id_and_project_id ON coordinations_projects USING btree (coordination_id, project_id);


--
-- Name: index_coordinations_projects_on_project_id_and_coordination_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_coordinations_projects_on_project_id_and_coordination_id ON coordinations_projects USING btree (project_id, coordination_id);


--
-- Name: index_degree_types_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_degree_types_on_name ON degree_types USING btree (name);


--
-- Name: index_degrees_on_degree_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_degrees_on_degree_type_id ON degrees USING btree (degree_type_id);


--
-- Name: index_degrees_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_degrees_on_name ON degrees USING btree (name);


--
-- Name: index_degrees_volunteers_on_degree_id_and_volunteer_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_degrees_volunteers_on_degree_id_and_volunteer_id ON degrees_volunteers USING btree (degree_id, volunteer_id);


--
-- Name: index_degrees_volunteers_on_volunteer_id_and_degree_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_degrees_volunteers_on_volunteer_id_and_degree_id ON degrees_volunteers USING btree (volunteer_id, degree_id);


--
-- Name: index_districts_on_code; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_districts_on_code ON districts USING btree (code);


--
-- Name: index_districts_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_districts_on_name ON districts USING btree (name);


--
-- Name: index_documents_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_documents_on_name ON documents USING btree (name);


--
-- Name: index_documents_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_documents_on_project_id ON documents USING btree (project_id);


--
-- Name: index_employment_statuses_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_employment_statuses_on_name ON employment_statuses USING btree (name);


--
-- Name: index_ent_trackings_on_entity_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_ent_trackings_on_entity_id ON ent_trackings USING btree (entity_id);


--
-- Name: index_ent_trackings_on_manager_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_ent_trackings_on_manager_id ON ent_trackings USING btree (manager_id);


--
-- Name: index_ent_trackings_on_request_form_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_ent_trackings_on_request_form_id ON ent_trackings USING btree (request_form_id);


--
-- Name: index_ent_trackings_on_tracking_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_ent_trackings_on_tracking_type_id ON ent_trackings USING btree (tracking_type_id);


--
-- Name: index_entities_on_address_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_entities_on_address_id ON entities USING btree (address_id);


--
-- Name: index_entities_on_entity_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_entities_on_entity_type_id ON entities USING btree (entity_type_id);


--
-- Name: index_entities_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_entities_on_name ON entities USING btree (name);


--
-- Name: index_entities_on_req_reason_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_entities_on_req_reason_id ON entities USING btree (req_reason_id);


--
-- Name: index_entities_projects_on_entity_id_and_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_entities_projects_on_entity_id_and_project_id ON entities_projects USING btree (entity_id, project_id);


--
-- Name: index_entities_projects_on_project_id_and_entity_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_entities_projects_on_project_id_and_entity_id ON entities_projects USING btree (project_id, entity_id);


--
-- Name: index_entity_types_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_entity_types_on_name ON entity_types USING btree (name);


--
-- Name: index_event_types_on_kind; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_event_types_on_kind ON event_types USING btree (kind);


--
-- Name: index_events_on_address_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_events_on_address_id ON events USING btree (address_id);


--
-- Name: index_events_on_event_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_events_on_event_type_id ON events USING btree (event_type_id);


--
-- Name: index_events_on_eventable_type_and_eventable_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_events_on_eventable_type_and_eventable_id ON events USING btree (eventable_type, eventable_id);


--
-- Name: index_frontpage_elements_on_frontpage_position_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_frontpage_elements_on_frontpage_position_id ON frontpage_elements USING btree (frontpage_position_id);


--
-- Name: index_frontpage_positions_on_position; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_frontpage_positions_on_position ON frontpage_positions USING btree ("position");


--
-- Name: index_id_number_types_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_id_number_types_on_name ON id_number_types USING btree (name);


--
-- Name: index_info_sources_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_info_sources_on_name ON info_sources USING btree (name);


--
-- Name: index_language_levels_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_language_levels_on_name ON language_levels USING btree (name);


--
-- Name: index_languages_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_languages_on_name ON languages USING btree (name);


--
-- Name: index_link_types_on_kind; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_link_types_on_kind ON link_types USING btree (kind);


--
-- Name: index_links_on_link_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_links_on_link_type_id ON links USING btree (link_type_id);


--
-- Name: index_links_on_linkable_type_and_linkable_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_links_on_linkable_type_and_linkable_id ON links USING btree (linkable_type, linkable_id);


--
-- Name: index_managers_on_role_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_managers_on_role_id ON managers USING btree (role_id);


--
-- Name: index_nationalities_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_nationalities_on_name ON nationalities USING btree (name);


--
-- Name: index_notice_types_on_kind; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_notice_types_on_kind ON notice_types USING btree (kind);


--
-- Name: index_permissions_on_manager_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_permissions_on_manager_id ON permissions USING btree (manager_id);


--
-- Name: index_permissions_on_resource_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_permissions_on_resource_id ON permissions USING btree (resource_id);


--
-- Name: index_pro_issues_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_pro_issues_on_project_id ON pro_issues USING btree (project_id);


--
-- Name: index_pro_trackings_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_pro_trackings_on_project_id ON pro_trackings USING btree (project_id);


--
-- Name: index_pro_trackings_on_request_form_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_pro_trackings_on_request_form_id ON pro_trackings USING btree (request_form_id);


--
-- Name: index_professions_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_professions_on_name ON professions USING btree (name);


--
-- Name: index_profiles_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_profiles_on_name ON profiles USING btree (name);


--
-- Name: index_project_types_on_kind; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_project_types_on_kind ON project_types USING btree (kind);


--
-- Name: index_projects_on_entity_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_projects_on_entity_id ON projects USING btree (entity_id);


--
-- Name: index_projects_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_projects_on_name ON projects USING btree (name);


--
-- Name: index_projects_on_project_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_projects_on_project_type_id ON projects USING btree (project_type_id);


--
-- Name: index_projects_on_pt_extendable_type_and_pt_extendable_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_projects_on_pt_extendable_type_and_pt_extendable_id ON projects USING btree (pt_extendable_type, pt_extendable_id);


--
-- Name: index_projects_volunteers_on_project_id_and_volunteer_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_projects_volunteers_on_project_id_and_volunteer_id ON projects_volunteers USING btree (project_id, volunteer_id);


--
-- Name: index_projects_volunteers_on_volunteer_id_and_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_projects_volunteers_on_volunteer_id_and_project_id ON projects_volunteers USING btree (volunteer_id, project_id);


--
-- Name: index_proposals_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_proposals_on_name ON proposals USING btree (name);


--
-- Name: index_provinces_on_code; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_provinces_on_code ON provinces USING btree (code);


--
-- Name: index_provinces_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_provinces_on_name ON provinces USING btree (name);


--
-- Name: index_pt_subventions_on_proposal_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_pt_subventions_on_proposal_id ON pt_subventions USING btree (proposal_id);


--
-- Name: index_record_histories_on_recordable_type_and_recordable_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_record_histories_on_recordable_type_and_recordable_id ON record_histories USING btree (recordable_type, recordable_id);


--
-- Name: index_record_histories_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_record_histories_on_user_id ON record_histories USING btree (user_id);


--
-- Name: index_req_rejection_types_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_req_rejection_types_on_name ON req_rejection_types USING btree (name);


--
-- Name: index_req_status_traces_on_manager_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_req_status_traces_on_manager_id ON req_status_traces USING btree (manager_id);


--
-- Name: index_req_status_traces_on_req_status_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_req_status_traces_on_req_status_id ON req_status_traces USING btree (req_status_id);


--
-- Name: index_req_status_traces_on_request_form_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_req_status_traces_on_request_form_id ON req_status_traces USING btree (request_form_id);


--
-- Name: index_req_statuses_on_kind; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_req_statuses_on_kind ON req_statuses USING btree (kind);


--
-- Name: index_request_forms_on_manager_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_request_forms_on_manager_id ON request_forms USING btree (manager_id);


--
-- Name: index_request_forms_on_req_reason_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_request_forms_on_req_reason_id ON request_forms USING btree (req_reason_id);


--
-- Name: index_request_forms_on_req_rejection_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_request_forms_on_req_rejection_type_id ON request_forms USING btree (req_rejection_type_id);


--
-- Name: index_request_forms_on_req_status_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_request_forms_on_req_status_id ON request_forms USING btree (req_status_id);


--
-- Name: index_request_forms_on_request_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_request_forms_on_request_type_id ON request_forms USING btree (request_type_id);


--
-- Name: index_request_forms_on_rt_extendable_type_and_rt_extendable_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_request_forms_on_rt_extendable_type_and_rt_extendable_id ON request_forms USING btree (rt_extendable_type, rt_extendable_id);


--
-- Name: index_request_forms_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_request_forms_on_user_id ON request_forms USING btree (user_id);


--
-- Name: index_request_types_on_kind; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_request_types_on_kind ON request_types USING btree (kind);


--
-- Name: index_resources_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_resources_on_name ON resources USING btree (name);


--
-- Name: index_road_types_on_code; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_road_types_on_code ON road_types USING btree (code);


--
-- Name: index_road_types_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_road_types_on_name ON road_types USING btree (name);


--
-- Name: index_roles_on_kind; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_roles_on_kind ON roles USING btree (kind);


--
-- Name: index_rt_activity_publishings_on_activity_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_rt_activity_publishings_on_activity_id ON rt_activity_publishings USING btree (activity_id);


--
-- Name: index_rt_activity_publishings_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_rt_activity_publishings_on_project_id ON rt_activity_publishings USING btree (project_id);


--
-- Name: index_rt_activity_unpublishings_on_activity_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_rt_activity_unpublishings_on_activity_id ON rt_activity_unpublishings USING btree (activity_id);


--
-- Name: index_rt_entity_subscribes_on_entity_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_rt_entity_subscribes_on_entity_type_id ON rt_entity_subscribes USING btree (entity_type_id);


--
-- Name: index_rt_entity_subscribes_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_rt_entity_subscribes_on_project_id ON rt_entity_subscribes USING btree (project_id);


--
-- Name: index_rt_entity_unsubscribes_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_rt_entity_unsubscribes_on_project_id ON rt_entity_unsubscribes USING btree (project_id);


--
-- Name: index_rt_project_publishings_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_rt_project_publishings_on_project_id ON rt_project_publishings USING btree (project_id);


--
-- Name: index_rt_project_unpublishings_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_rt_project_unpublishings_on_project_id ON rt_project_unpublishings USING btree (project_id);


--
-- Name: index_rt_volunteer_amendments_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_rt_volunteer_amendments_on_project_id ON rt_volunteer_amendments USING btree (project_id);


--
-- Name: index_rt_volunteer_subscribes_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_rt_volunteer_subscribes_on_project_id ON rt_volunteer_subscribes USING btree (project_id);


--
-- Name: index_rt_volunteer_unsubscribes_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_rt_volunteer_unsubscribes_on_project_id ON rt_volunteer_unsubscribes USING btree (project_id);


--
-- Name: index_rt_volunteer_unsubscribes_on_unsubscribe_level_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_rt_volunteer_unsubscribes_on_unsubscribe_level_id ON rt_volunteer_unsubscribes USING btree (unsubscribe_level_id);


--
-- Name: index_rt_volunteers_demands_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_rt_volunteers_demands_on_project_id ON rt_volunteers_demands USING btree (project_id);


--
-- Name: index_skills_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_skills_on_name ON skills USING btree (name);


--
-- Name: index_skills_volunteers_on_skill_id_and_volunteer_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_skills_volunteers_on_skill_id_and_volunteer_id ON skills_volunteers USING btree (skill_id, volunteer_id);


--
-- Name: index_skills_volunteers_on_volunteer_id_and_skill_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_skills_volunteers_on_volunteer_id_and_skill_id ON skills_volunteers USING btree (volunteer_id, skill_id);


--
-- Name: index_statuses_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_statuses_on_name ON statuses USING btree (name);


--
-- Name: index_timetables_on_event_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_timetables_on_event_id ON timetables USING btree (event_id);


--
-- Name: index_tracking_types_on_alias_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_tracking_types_on_alias_name ON tracking_types USING btree (alias_name);


--
-- Name: index_tracking_types_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_tracking_types_on_name ON tracking_types USING btree (name);


--
-- Name: index_traits_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_traits_on_name ON traits USING btree (name);


--
-- Name: index_unsubscribe_levels_on_kind; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_unsubscribe_levels_on_kind ON unsubscribe_levels USING btree (kind);


--
-- Name: index_unsubscribe_reasons_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_unsubscribe_reasons_on_name ON unsubscribe_reasons USING btree (name);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_loggable_type_and_loggable_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_users_on_loggable_type_and_loggable_id ON users USING btree (loggable_type, loggable_id);


--
-- Name: index_users_on_notice_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_users_on_notice_type_id ON users USING btree (notice_type_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_volun_assessments_on_trait_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volun_assessments_on_trait_id ON volun_assessments USING btree (trait_id);


--
-- Name: index_volun_assessments_on_volunteer_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volun_assessments_on_volunteer_id ON volun_assessments USING btree (volunteer_id);


--
-- Name: index_volun_assessments_projects_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volun_assessments_projects_on_project_id ON volun_assessments_projects USING btree (project_id);


--
-- Name: index_volun_assessments_projects_on_trait_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volun_assessments_projects_on_trait_id ON volun_assessments_projects USING btree (trait_id);


--
-- Name: index_volun_assessments_projects_on_volunteer_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volun_assessments_projects_on_volunteer_id ON volun_assessments_projects USING btree (volunteer_id);


--
-- Name: index_volun_availabilities_on_volunteer_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volun_availabilities_on_volunteer_id ON volun_availabilities USING btree (volunteer_id);


--
-- Name: index_volun_contacts_on_contact_result_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volun_contacts_on_contact_result_id ON volun_contacts USING btree (contact_result_id);


--
-- Name: index_volun_contacts_on_contact_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volun_contacts_on_contact_type_id ON volun_contacts USING btree (contact_type_id);


--
-- Name: index_volun_contacts_on_manager_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volun_contacts_on_manager_id ON volun_contacts USING btree (manager_id);


--
-- Name: index_volun_contacts_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volun_contacts_on_project_id ON volun_contacts USING btree (project_id);


--
-- Name: index_volun_contacts_on_volunteer_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volun_contacts_on_volunteer_id ON volun_contacts USING btree (volunteer_id);


--
-- Name: index_volun_known_languages_on_language_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volun_known_languages_on_language_id ON volun_known_languages USING btree (language_id);


--
-- Name: index_volun_known_languages_on_language_level_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volun_known_languages_on_language_level_id ON volun_known_languages USING btree (language_level_id);


--
-- Name: index_volun_known_languages_on_volunteer_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volun_known_languages_on_volunteer_id ON volun_known_languages USING btree (volunteer_id);


--
-- Name: index_volun_trackings_on_manager_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volun_trackings_on_manager_id ON volun_trackings USING btree (manager_id);


--
-- Name: index_volun_trackings_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volun_trackings_on_project_id ON volun_trackings USING btree (project_id);


--
-- Name: index_volun_trackings_on_request_form_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volun_trackings_on_request_form_id ON volun_trackings USING btree (request_form_id);


--
-- Name: index_volun_trackings_on_tracking_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volun_trackings_on_tracking_type_id ON volun_trackings USING btree (tracking_type_id);


--
-- Name: index_volun_trackings_on_volunteer_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volun_trackings_on_volunteer_id ON volun_trackings USING btree (volunteer_id);


--
-- Name: index_volunteers_on_academic_level_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volunteers_on_academic_level_id ON volunteers USING btree (academic_level_id);


--
-- Name: index_volunteers_on_address_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volunteers_on_address_id ON volunteers USING btree (address_id);


--
-- Name: index_volunteers_on_employment_status_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volunteers_on_employment_status_id ON volunteers USING btree (employment_status_id);


--
-- Name: index_volunteers_on_id_number_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volunteers_on_id_number_type_id ON volunteers USING btree (id_number_type_id);


--
-- Name: index_volunteers_on_info_source_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volunteers_on_info_source_id ON volunteers USING btree (info_source_id);


--
-- Name: index_volunteers_on_manager_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volunteers_on_manager_id ON volunteers USING btree (manager_id);


--
-- Name: index_volunteers_on_nationality_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volunteers_on_nationality_id ON volunteers USING btree (nationality_id);


--
-- Name: index_volunteers_on_profession_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volunteers_on_profession_id ON volunteers USING btree (profession_id);


--
-- Name: index_volunteers_on_status_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volunteers_on_status_id ON volunteers USING btree (status_id);


--
-- Name: index_volunteers_on_unsubscribe_reason_id; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE INDEX index_volunteers_on_unsubscribe_reason_id ON volunteers USING btree (unsubscribe_reason_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace:
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: check_project_references; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER check_project_references BEFORE DELETE ON pt_socials FOR EACH ROW EXECUTE PROCEDURE check_project_references('Pt::Social');


--
-- Name: check_project_references; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER check_project_references BEFORE DELETE ON pt_centres FOR EACH ROW EXECUTE PROCEDURE check_project_references('Pt::Centre');


--
-- Name: check_project_references; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER check_project_references BEFORE DELETE ON pt_permanents FOR EACH ROW EXECUTE PROCEDURE check_project_references('Pt::Permanent');


--
-- Name: check_project_references; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER check_project_references BEFORE DELETE ON pt_punctuals FOR EACH ROW EXECUTE PROCEDURE check_project_references('Pt::Punctual');


--
-- Name: check_project_references; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER check_project_references BEFORE DELETE ON pt_subventions FOR EACH ROW EXECUTE PROCEDURE check_project_references('Pt::Subvention');


--
-- Name: check_project_references; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER check_project_references BEFORE DELETE ON pt_entities FOR EACH ROW EXECUTE PROCEDURE check_project_references('Pt::Entity');


--
-- Name: check_project_references; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER check_project_references BEFORE DELETE ON pt_others FOR EACH ROW EXECUTE PROCEDURE check_project_references('Pt::Other');


--
-- Name: check_request_form_references; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER check_request_form_references BEFORE DELETE ON rt_volunteer_subscribes FOR EACH ROW EXECUTE PROCEDURE check_request_form_references('Rt::VolunteerSubscribe');


--
-- Name: check_request_form_references; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER check_request_form_references BEFORE DELETE ON rt_volunteer_unsubscribes FOR EACH ROW EXECUTE PROCEDURE check_request_form_references('Rt::VolunteerUnsubscribe');


--
-- Name: check_request_form_references; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER check_request_form_references BEFORE DELETE ON rt_volunteer_amendments FOR EACH ROW EXECUTE PROCEDURE check_request_form_references('Rt::VolunteerAmendment');


--
-- Name: check_request_form_references; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER check_request_form_references BEFORE DELETE ON rt_volunteer_appointments FOR EACH ROW EXECUTE PROCEDURE check_request_form_references('Rt::VolunteerAppointment');


--
-- Name: check_request_form_references; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER check_request_form_references BEFORE DELETE ON rt_entity_subscribes FOR EACH ROW EXECUTE PROCEDURE check_request_form_references('Rt::EntitySubscribe');


--
-- Name: check_request_form_references; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER check_request_form_references BEFORE DELETE ON rt_entity_unsubscribes FOR EACH ROW EXECUTE PROCEDURE check_request_form_references('Rt::EntityUnsubscribe');


--
-- Name: check_request_form_references; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER check_request_form_references BEFORE DELETE ON rt_volunteers_demands FOR EACH ROW EXECUTE PROCEDURE check_request_form_references('Rt::VolunteersDemand');


--
-- Name: check_request_form_references; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER check_request_form_references BEFORE DELETE ON rt_project_publishings FOR EACH ROW EXECUTE PROCEDURE check_request_form_references('Rt::ProjectPublishing');


--
-- Name: check_request_form_references; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER check_request_form_references BEFORE DELETE ON rt_project_unpublishings FOR EACH ROW EXECUTE PROCEDURE check_request_form_references('Rt::ProjectUnpublishing');


--
-- Name: check_request_form_references; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER check_request_form_references BEFORE DELETE ON rt_activity_publishings FOR EACH ROW EXECUTE PROCEDURE check_request_form_references('Rt::ActivityPublishing');


--
-- Name: check_request_form_references; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER check_request_form_references BEFORE DELETE ON rt_activity_unpublishings FOR EACH ROW EXECUTE PROCEDURE check_request_form_references('Rt::ActivityUnpublishing');


--
-- Name: check_request_form_references; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER check_request_form_references BEFORE DELETE ON rt_others FOR EACH ROW EXECUTE PROCEDURE check_request_form_references('Rt::Other');


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
-- Name: fk_rails_078fb0c271; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_project_unpublishings
    ADD CONSTRAINT fk_rails_078fb0c271 FOREIGN KEY (project_id) REFERENCES projects(id);


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
-- Name: fk_rails_18766af8ad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_activity_publishings
    ADD CONSTRAINT fk_rails_18766af8ad FOREIGN KEY (activity_id) REFERENCES activities(id);


--
-- Name: fk_rails_1b6a6db21c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteers
    ADD CONSTRAINT fk_rails_1b6a6db21c FOREIGN KEY (address_id) REFERENCES addresses(id);


--
-- Name: fk_rails_1c63970ba6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ent_trackings
    ADD CONSTRAINT fk_rails_1c63970ba6 FOREIGN KEY (request_form_id) REFERENCES request_forms(id);


--
-- Name: fk_rails_1eb0844745; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY frontpage_elements
    ADD CONSTRAINT fk_rails_1eb0844745 FOREIGN KEY (frontpage_position_id) REFERENCES frontpage_positions(id);


--
-- Name: fk_rails_1f94e4af32; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_assessments_projects
    ADD CONSTRAINT fk_rails_1f94e4af32 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_218216dd2a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY req_status_traces
    ADD CONSTRAINT fk_rails_218216dd2a FOREIGN KEY (manager_id) REFERENCES managers(id);


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
-- Name: fk_rails_2e4768f7ae; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_entity_unsubscribes
    ADD CONSTRAINT fk_rails_2e4768f7ae FOREIGN KEY (project_id) REFERENCES projects(id);


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
-- Name: fk_rails_34e98e56ba; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteers
    ADD CONSTRAINT fk_rails_34e98e56ba FOREIGN KEY (academic_level_id) REFERENCES academic_levels(id);


--
-- Name: fk_rails_365de92f46; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_project_publishings
    ADD CONSTRAINT fk_rails_365de92f46 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_42c5cc9a36; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pro_issues
    ADD CONSTRAINT fk_rails_42c5cc9a36 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_442ab3e172; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_activity_unpublishings
    ADD CONSTRAINT fk_rails_442ab3e172 FOREIGN KEY (activity_id) REFERENCES activities(id);


--
-- Name: fk_rails_48cc4fb8e0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY frontpage_elements
    ADD CONSTRAINT fk_rails_48cc4fb8e0 FOREIGN KEY (updated_by) REFERENCES users(id);


--
-- Name: fk_rails_4a5d797686; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY degrees
    ADD CONSTRAINT fk_rails_4a5d797686 FOREIGN KEY (degree_type_id) REFERENCES degree_types(id);


--
-- Name: fk_rails_4e614b6d26; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_trackings
    ADD CONSTRAINT fk_rails_4e614b6d26 FOREIGN KEY (request_form_id) REFERENCES request_forms(id);


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
-- Name: fk_rails_537c7138f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_subscribes
    ADD CONSTRAINT fk_rails_537c7138f3 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_55cfc1b0e0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documents
    ADD CONSTRAINT fk_rails_55cfc1b0e0 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_5607227932; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY entities
    ADD CONSTRAINT fk_rails_5607227932 FOREIGN KEY (req_reason_id) REFERENCES req_reasons(id);


--
-- Name: fk_rails_58ead69265; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteers
    ADD CONSTRAINT fk_rails_58ead69265 FOREIGN KEY (unsubscribe_reason_id) REFERENCES unsubscribe_reasons(id);


--
-- Name: fk_rails_5c72243f21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY request_forms
    ADD CONSTRAINT fk_rails_5c72243f21 FOREIGN KEY (req_reason_id) REFERENCES req_reasons(id);


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
-- Name: fk_rails_61c7d4f0f7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_unsubscribes
    ADD CONSTRAINT fk_rails_61c7d4f0f7 FOREIGN KEY (unsubscribe_level_id) REFERENCES unsubscribe_levels(id);


--
-- Name: fk_rails_6b7b9a59a1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_assessments
    ADD CONSTRAINT fk_rails_6b7b9a59a1 FOREIGN KEY (trait_id) REFERENCES traits(id);


--
-- Name: fk_rails_6bfcef8235; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_assessments_projects
    ADD CONSTRAINT fk_rails_6bfcef8235 FOREIGN KEY (trait_id) REFERENCES traits(id);


--
-- Name: fk_rails_6c193dac04; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteers
    ADD CONSTRAINT fk_rails_6c193dac04 FOREIGN KEY (info_source_id) REFERENCES info_sources(id);


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
-- Name: fk_rails_7c5d7eb5f0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY frontpage_elements
    ADD CONSTRAINT fk_rails_7c5d7eb5f0 FOREIGN KEY (created_by) REFERENCES users(id);


--
-- Name: fk_rails_908a35f934; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_entity_subscribes
    ADD CONSTRAINT fk_rails_908a35f934 FOREIGN KEY (entity_type_id) REFERENCES entity_types(id);


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
-- Name: fk_rails_9d3f95f3b7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT fk_rails_9d3f95f3b7 FOREIGN KEY (resource_id) REFERENCES resources(id);


--
-- Name: fk_rails_9d90949dfa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_known_languages
    ADD CONSTRAINT fk_rails_9d90949dfa FOREIGN KEY (language_level_id) REFERENCES language_levels(id);


--
-- Name: fk_rails_a0518bdb63; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY req_status_traces
    ADD CONSTRAINT fk_rails_a0518bdb63 FOREIGN KEY (req_status_id) REFERENCES req_statuses(id);


--
-- Name: fk_rails_a1fc3c028f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT fk_rails_a1fc3c028f FOREIGN KEY (manager_id) REFERENCES managers(id);


--
-- Name: fk_rails_a578a39c28; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY links
    ADD CONSTRAINT fk_rails_a578a39c28 FOREIGN KEY (link_type_id) REFERENCES link_types(id);


--
-- Name: fk_rails_a6f023dc94; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY managers
    ADD CONSTRAINT fk_rails_a6f023dc94 FOREIGN KEY (role_id) REFERENCES roles(id);


--
-- Name: fk_rails_a7af8553e5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_availabilities
    ADD CONSTRAINT fk_rails_a7af8553e5 FOREIGN KEY (volunteer_id) REFERENCES volunteers(id);


--
-- Name: fk_rails_a96f5dbb87; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteers_demands
    ADD CONSTRAINT fk_rails_a96f5dbb87 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_a9ecf0a1e5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_unsubscribes
    ADD CONSTRAINT fk_rails_a9ecf0a1e5 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_b0091044ff; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_contacts
    ADD CONSTRAINT fk_rails_b0091044ff FOREIGN KEY (contact_result_id) REFERENCES contact_results(id);


--
-- Name: fk_rails_b167571955; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volun_assessments_projects
    ADD CONSTRAINT fk_rails_b167571955 FOREIGN KEY (volunteer_id) REFERENCES volunteers(id);


--
-- Name: fk_rails_b590151cfe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY req_status_traces
    ADD CONSTRAINT fk_rails_b590151cfe FOREIGN KEY (request_form_id) REFERENCES request_forms(id);


--
-- Name: fk_rails_b6d9e93c75; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_rails_b6d9e93c75 FOREIGN KEY (notice_type_id) REFERENCES notice_types(id);


--
-- Name: fk_rails_b7b1b87a80; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY request_forms
    ADD CONSTRAINT fk_rails_b7b1b87a80 FOREIGN KEY (manager_id) REFERENCES managers(id);


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
-- Name: fk_rails_cba16eb429; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pro_trackings
    ADD CONSTRAINT fk_rails_cba16eb429 FOREIGN KEY (request_form_id) REFERENCES request_forms(id);


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
-- Name: fk_rails_d68b725283; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_amendments
    ADD CONSTRAINT fk_rails_d68b725283 FOREIGN KEY (project_id) REFERENCES projects(id);


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
-- Name: fk_rails_e8163aa1d5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_entity_subscribes
    ADD CONSTRAINT fk_rails_e8163aa1d5 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_e988d26401; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY request_forms
    ADD CONSTRAINT fk_rails_e988d26401 FOREIGN KEY (req_rejection_type_id) REFERENCES req_rejection_types(id);


--
-- Name: fk_rails_f4b5a45eed; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY request_forms
    ADD CONSTRAINT fk_rails_f4b5a45eed FOREIGN KEY (user_id) REFERENCES users(id);


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
-- Name: fk_rails_f9a88e8ebd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY request_forms
    ADD CONSTRAINT fk_rails_f9a88e8ebd FOREIGN KEY (req_status_id) REFERENCES req_statuses(id);


--
-- Name: fk_rails_ffd1fb1016; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT fk_rails_ffd1fb1016 FOREIGN KEY (entity_id) REFERENCES entities(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20170302091316');

INSERT INTO schema_migrations (version) VALUES ('20170302091318');

INSERT INTO schema_migrations (version) VALUES ('20170302091319');

INSERT INTO schema_migrations (version) VALUES ('20170302091321');

INSERT INTO schema_migrations (version) VALUES ('20170302091322');

INSERT INTO schema_migrations (version) VALUES ('20170302091324');

INSERT INTO schema_migrations (version) VALUES ('20170302091325');

INSERT INTO schema_migrations (version) VALUES ('20170302091327');

INSERT INTO schema_migrations (version) VALUES ('20170302091329');

INSERT INTO schema_migrations (version) VALUES ('20170302091330');

INSERT INTO schema_migrations (version) VALUES ('20170302091332');

INSERT INTO schema_migrations (version) VALUES ('20170302091333');

INSERT INTO schema_migrations (version) VALUES ('20170302091335');

INSERT INTO schema_migrations (version) VALUES ('20170302091336');

INSERT INTO schema_migrations (version) VALUES ('20170302091338');

INSERT INTO schema_migrations (version) VALUES ('20170302091340');

INSERT INTO schema_migrations (version) VALUES ('20170302091341');

INSERT INTO schema_migrations (version) VALUES ('20170302091343');

INSERT INTO schema_migrations (version) VALUES ('20170302091344');

INSERT INTO schema_migrations (version) VALUES ('20170302091346');

INSERT INTO schema_migrations (version) VALUES ('20170302091348');

INSERT INTO schema_migrations (version) VALUES ('20170302091349');

INSERT INTO schema_migrations (version) VALUES ('20170302091351');

INSERT INTO schema_migrations (version) VALUES ('20170302091352');

INSERT INTO schema_migrations (version) VALUES ('20170302091354');

INSERT INTO schema_migrations (version) VALUES ('20170302091356');

INSERT INTO schema_migrations (version) VALUES ('20170302091357');

INSERT INTO schema_migrations (version) VALUES ('20170302091359');

INSERT INTO schema_migrations (version) VALUES ('20170302091401');

INSERT INTO schema_migrations (version) VALUES ('20170302091402');

INSERT INTO schema_migrations (version) VALUES ('20170302091404');

INSERT INTO schema_migrations (version) VALUES ('20170302091406');

INSERT INTO schema_migrations (version) VALUES ('20170302091407');

INSERT INTO schema_migrations (version) VALUES ('20170302091409');

INSERT INTO schema_migrations (version) VALUES ('20170302091411');

INSERT INTO schema_migrations (version) VALUES ('20170302091412');

INSERT INTO schema_migrations (version) VALUES ('20170302091414');

INSERT INTO schema_migrations (version) VALUES ('20170302091416');

INSERT INTO schema_migrations (version) VALUES ('20170302091417');

INSERT INTO schema_migrations (version) VALUES ('20170302091419');

INSERT INTO schema_migrations (version) VALUES ('20170302091421');

INSERT INTO schema_migrations (version) VALUES ('20170302091422');

INSERT INTO schema_migrations (version) VALUES ('20170302091424');

INSERT INTO schema_migrations (version) VALUES ('20170302091426');

INSERT INTO schema_migrations (version) VALUES ('20170302091428');

INSERT INTO schema_migrations (version) VALUES ('20170302091429');

INSERT INTO schema_migrations (version) VALUES ('20170302091431');

INSERT INTO schema_migrations (version) VALUES ('20170302091433');

INSERT INTO schema_migrations (version) VALUES ('20170302091434');

INSERT INTO schema_migrations (version) VALUES ('20170302091436');

INSERT INTO schema_migrations (version) VALUES ('20170302091438');

INSERT INTO schema_migrations (version) VALUES ('20170302091439');

INSERT INTO schema_migrations (version) VALUES ('20170302091441');

INSERT INTO schema_migrations (version) VALUES ('20170302091443');

INSERT INTO schema_migrations (version) VALUES ('20170302091445');

INSERT INTO schema_migrations (version) VALUES ('20170302091446');

INSERT INTO schema_migrations (version) VALUES ('20170302091448');

INSERT INTO schema_migrations (version) VALUES ('20170302091450');

INSERT INTO schema_migrations (version) VALUES ('20170302091452');

INSERT INTO schema_migrations (version) VALUES ('20170302091453');

INSERT INTO schema_migrations (version) VALUES ('20170302091455');

INSERT INTO schema_migrations (version) VALUES ('20170302091457');

INSERT INTO schema_migrations (version) VALUES ('20170302091459');

INSERT INTO schema_migrations (version) VALUES ('20170302091500');

INSERT INTO schema_migrations (version) VALUES ('20170302091502');

INSERT INTO schema_migrations (version) VALUES ('20170302091504');

INSERT INTO schema_migrations (version) VALUES ('20170302091506');

INSERT INTO schema_migrations (version) VALUES ('20170302091507');

INSERT INTO schema_migrations (version) VALUES ('20170302091509');

INSERT INTO schema_migrations (version) VALUES ('20170302091511');

INSERT INTO schema_migrations (version) VALUES ('20170302091513');

INSERT INTO schema_migrations (version) VALUES ('20170302091515');

INSERT INTO schema_migrations (version) VALUES ('20170302091517');

INSERT INTO schema_migrations (version) VALUES ('20170302091518');

INSERT INTO schema_migrations (version) VALUES ('20170302091520');

INSERT INTO schema_migrations (version) VALUES ('20170302091522');

INSERT INTO schema_migrations (version) VALUES ('20170302091524');

INSERT INTO schema_migrations (version) VALUES ('20170302091526');

INSERT INTO schema_migrations (version) VALUES ('20170302091527');

INSERT INTO schema_migrations (version) VALUES ('20170302091529');

INSERT INTO schema_migrations (version) VALUES ('20170302091532');

INSERT INTO schema_migrations (version) VALUES ('20170302091533');

INSERT INTO schema_migrations (version) VALUES ('20170302091535');

INSERT INTO schema_migrations (version) VALUES ('20170302091537');

INSERT INTO schema_migrations (version) VALUES ('20170302091538');

INSERT INTO schema_migrations (version) VALUES ('20170302091539');

INSERT INTO schema_migrations (version) VALUES ('20170302091541');

INSERT INTO schema_migrations (version) VALUES ('20170302091542');

INSERT INTO schema_migrations (version) VALUES ('20170302091543');

INSERT INTO schema_migrations (version) VALUES ('20170302091545');

INSERT INTO schema_migrations (version) VALUES ('20170302091546');

INSERT INTO schema_migrations (version) VALUES ('20170302091547');

INSERT INTO schema_migrations (version) VALUES ('20170302091548');

INSERT INTO schema_migrations (version) VALUES ('20170302091550');

INSERT INTO schema_migrations (version) VALUES ('20170302091551');

INSERT INTO schema_migrations (version) VALUES ('20170302091552');

INSERT INTO schema_migrations (version) VALUES ('20170302091554');

INSERT INTO schema_migrations (version) VALUES ('20170302091555');

INSERT INTO schema_migrations (version) VALUES ('20170302091556');

INSERT INTO schema_migrations (version) VALUES ('20170302091558');

INSERT INTO schema_migrations (version) VALUES ('20170306131946');

INSERT INTO schema_migrations (version) VALUES ('20170313091610');

INSERT INTO schema_migrations (version) VALUES ('20170315152345');

INSERT INTO schema_migrations (version) VALUES ('20170315153416');

INSERT INTO schema_migrations (version) VALUES ('20170315153639');

INSERT INTO schema_migrations (version) VALUES ('20170316083914');

INSERT INTO schema_migrations (version) VALUES ('20170321160845');

INSERT INTO schema_migrations (version) VALUES ('20170403094612');

INSERT INTO schema_migrations (version) VALUES ('20170405163435');

INSERT INTO schema_migrations (version) VALUES ('20170405163822');

INSERT INTO schema_migrations (version) VALUES ('20170406105006');

INSERT INTO schema_migrations (version) VALUES ('20170406105317');

INSERT INTO schema_migrations (version) VALUES ('20170406113450');

INSERT INTO schema_migrations (version) VALUES ('20170406140900');

INSERT INTO schema_migrations (version) VALUES ('20170406173450');

INSERT INTO schema_migrations (version) VALUES ('20170416174003');

INSERT INTO schema_migrations (version) VALUES ('20170416175829');

INSERT INTO schema_migrations (version) VALUES ('20170416181032');

INSERT INTO schema_migrations (version) VALUES ('20170416183328');

INSERT INTO schema_migrations (version) VALUES ('20170419152355');

INSERT INTO schema_migrations (version) VALUES ('20170419152451');

INSERT INTO schema_migrations (version) VALUES ('20170425124700');

INSERT INTO schema_migrations (version) VALUES ('20170425154420');

INSERT INTO schema_migrations (version) VALUES ('20170426070241');

INSERT INTO schema_migrations (version) VALUES ('20170426070253');

INSERT INTO schema_migrations (version) VALUES ('20170426070322');

INSERT INTO schema_migrations (version) VALUES ('20170426070330');

INSERT INTO schema_migrations (version) VALUES ('20170426070533');

INSERT INTO schema_migrations (version) VALUES ('20170427104323');

INSERT INTO schema_migrations (version) VALUES ('20170428073441');

INSERT INTO schema_migrations (version) VALUES ('20170428074708');

INSERT INTO schema_migrations (version) VALUES ('20170511083434');

INSERT INTO schema_migrations (version) VALUES ('20171003125116');

INSERT INTO schema_migrations (version) VALUES ('20171003140614');

INSERT INTO schema_migrations (version) VALUES ('20171009095533');

INSERT INTO schema_migrations (version) VALUES ('20171011132508');

INSERT INTO schema_migrations (version) VALUES ('20171013091357');


