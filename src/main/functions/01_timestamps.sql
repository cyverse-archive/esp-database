CREATE FUNCTION date_created_stamp() RETURNS trigger AS 
$date_created_stamp$
       BEGIN
        NEW.date_created := current_timestamp;
        RETURN NEW;
       END;
$date_created_stamp$ 
LANGUAGE plpgsql;

CREATE FUNCTION date_modified_stamp() RETURNS trigger AS 
$date_modified_stamp$
       BEGIN
        NEW.date_modified := current_timestamp;
        NEW.last_modified_by := current_user;
        RETURN NEW;
       END;
$date_modified_stamp$ 
LANGUAGE plpgsql;
 
