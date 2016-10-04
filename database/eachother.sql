#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: eachother_user
#------------------------------------------------------------

CREATE TABLE eachother_user(
        user_id                    int (11) Auto_increment  NOT NULL ,
        user_email                 Varchar (255) NOT NULL ,
        user_password              Varchar (255) NOT NULL ,
        user_firstname             Varchar (255) NOT NULL ,
        user_lastname              Varchar (255) NOT NULL ,
        user_picture               Varchar (255) ,
        user_date_of_birth         Date NOT NULL ,
        user_description           Text ,
        user_sex                   Boolean NOT NULL ,
        user_subscription_end_date Datetime ,
        PRIMARY KEY (user_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: eachother_event
#------------------------------------------------------------

CREATE TABLE eachother_event(
        event_id          int (11) Auto_increment  NOT NULL ,
        event_date        Datetime NOT NULL ,
        event_picture     Varchar (255) ,
        event_description Text ,
        location_id       Int NOT NULL ,
        PRIMARY KEY (event_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: eachother_location
#------------------------------------------------------------

CREATE TABLE eachother_location(
        location_id        int (11) Auto_increment  NOT NULL ,
        location_address   Varchar (255) ,
        location_city      Varchar (255) NOT NULL ,
        location_longitude Float ,
        location_latitude  Float ,
        event_id           Int NOT NULL ,
        PRIMARY KEY (location_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: eachother_category
#------------------------------------------------------------

CREATE TABLE eachother_category(
        category_id   int (11) Auto_increment  NOT NULL ,
        category_name Varchar (255) NOT NULL ,
        PRIMARY KEY (category_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: eachother_note
#------------------------------------------------------------

CREATE TABLE eachother_note(
        note_id          int (11) Auto_increment  NOT NULL ,
        note_value       Float NOT NULL ,
        note_title       Varchar (255) ,
        note_description Text ,
        PRIMARY KEY (note_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: eachother_follow
#------------------------------------------------------------

CREATE TABLE eachother_follow(
        follower_id                Int NOT NULL ,
        followed_id	    Int NOT NULL ,
        PRIMARY KEY (follower_id ,followed_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: eachother_rate
#------------------------------------------------------------

CREATE TABLE eachother_rate(
        rater_id                Int NOT NULL ,
        rated_id	Int NOT NULL ,
        note_id                Int NOT NULL ,
        event_id               Int NOT NULL ,
        PRIMARY KEY (rater_id,rated_id ,note_id ,event_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: eachother_event_category
#------------------------------------------------------------

CREATE TABLE eachother_event_category(
        category_id Int NOT NULL ,
        event_id    Int NOT NULL ,
        PRIMARY KEY (category_id ,event_id )
)ENGINE=InnoDB;

ALTER TABLE eachother_event ADD CONSTRAINT FK_eachother_event_location_id FOREIGN KEY (location_id) REFERENCES eachother_location(location_id);
ALTER TABLE eachother_location ADD CONSTRAINT FK_eachother_location_event_id FOREIGN KEY (event_id) REFERENCES eachother_event(event_id);
ALTER TABLE eachother_follow ADD CONSTRAINT FK_eachother_follow_follower_id FOREIGN KEY (follower_id) REFERENCES eachother_user(user_id);
ALTER TABLE eachother_follow ADD CONSTRAINT FK_eachother_follow_followed_id FOREIGN KEY (followed_id) REFERENCES eachother_user(user_id);
ALTER TABLE eachother_rate ADD CONSTRAINT FK_eachother_rater_id FOREIGN KEY (rater_id) REFERENCES eachother_user(user_id);
ALTER TABLE eachother_rate ADD CONSTRAINT FK_eachother_rated_id FOREIGN KEY (rated_id) REFERENCES eachother_user(user_id);
ALTER TABLE eachother_rate ADD CONSTRAINT FK_eachother_rate_note_id FOREIGN KEY (note_id) REFERENCES eachother_note(note_id);
ALTER TABLE eachother_rate ADD CONSTRAINT FK_eachother_rate_event_id FOREIGN KEY (event_id) REFERENCES eachother_event(event_id);
ALTER TABLE eachother_event_category ADD CONSTRAINT FK_eachother_event_category_category_id FOREIGN KEY (category_id) REFERENCES eachother_category(category_id);
ALTER TABLE eachother_event_category ADD CONSTRAINT FK_eachother_event_category_event_id FOREIGN KEY (event_id) REFERENCES eachother_event(event_id);
