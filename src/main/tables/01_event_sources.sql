CREATE SEQUENCE event_sources_id_seq
       START WITH 1
       INCREMENT BY 1
       NO MAXVALUE
       NO MINVALUE
       CACHE 1;

CREATE TABLE event_sources (
       id bigint DEFAULT nextval('event_sources_id_seq'::regclass) NOT NULL primary key,
       tag character varying(255) NOT NULL,
       source_data text NOT NULL,
       source_uuid uuid UNIQUE NOT NULL,
       date_created timestamp with time zone,
       date_modified timestamp with time zone,
       last_modified_by text
);

CREATE TRIGGER es_date_created BEFORE INSERT ON event_sources
       FOR EACH ROW EXECUTE PROCEDURE date_created_stamp();

CREATE TRIGGER es_date_modified BEFORE INSERT OR UPDATE ON event_sources
       FOR EACH ROW EXECUTE PROCEDURE date_modified_stamp();
       
