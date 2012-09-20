CREATE SEQUENCE partitioners_id_seq
       START WITH 1
       INCREMENT BY 1
       NO MAXVALUE
       NO MINVALUE
       CACHE 1;

CREATE TABLE partitioners (
       id bigint DEFAULT nextval('partitioners_id_seq'::regclass) primary key,
       part_key VARCHAR(255) NOT NULL,
       last_run_time timestamp with time zone NOT NULL,
       date_created timestamp with time zone,
       date_modified timestamp with time zone,
       last_modified_by text
);

CREATE TRIGGER part_date_created BEFORE INSERT ON partitioners
       FOR EACH ROW EXECUTE PROCEDURE date_created_stamp();

CREATE TRIGGER part_date_modified BEFORE INSERT OR UPDATE ON partitioners
       FOR EACH ROW EXECUTE PROCEDURE date_modified_stamp();
