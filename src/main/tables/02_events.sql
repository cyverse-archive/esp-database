CREATE SEQUENCE events_id_seq
       START WITH 1
       INCREMENT BY 1
       NO MAXVALUE
       NO MINVALUE
       CACHE 1;

CREATE TABLE events (
       id bigint DEFAULT nextval('events_id_seq'::regclass) primary key,
       event_uuid uuid UNIQUE NOT NULL,
       event_sources_id bigint NOT NULL references event_sources(id),
       event_data text NOT NULL,
       event_type VARCHAR(255) NOT NULL,
       date_created timestamp with time zone,
       date_modified timestamp with time zone,
       last_modified_by text
);

CREATE TRIGGER event_date_created BEFORE INSERT ON events
       FOR EACH ROW EXECUTE PROCEDURE date_created_stamp();

CREATE TRIGGER event_date_modified BEFORE INSERT OR UPDATE on events
       FOR EACH ROW EXECUTE PROCEDURE date_modified_stamp();
