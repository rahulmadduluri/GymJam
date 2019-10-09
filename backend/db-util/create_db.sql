DROP DATABASE IF EXISTS gymjam;
CREATE DATABASE gymjam;
USE gymjam;

CREATE TABLE IF NOT EXISTS users (
	id 							int 			NOT NULL AUTO_INCREMENT,
	uuid						varchar(36)		NOT NULL,
	first_name 					varchar(200)	NOT NULL,
	last_name 					varchar(200)	NOT NULL,
	email						varchar(200)	NOT NULL,
	photo_uri 					varchar(200),
	created_timestamp_server	int				NOT NULL,
	UNIQUE KEY (uuid),
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS friendships (
	friend_a_id  			int 			NOT NULL,
	friend_b_id				int 			NOT NULL,
	FOREIGN KEY (friend_a_id) REFERENCES users (id),
	FOREIGN KEY (friend_b_id) REFERENCES users (id)
);

CREATE TABLE IF NOT EXISTS workouts (
	id 							int 			NOT NULL AUTO_INCREMENT,
	uuid						varchar(36)		NOT NULL,
	name 						varchar(200)	NOT NULL,
	duration_in_seconds 		int,
	photo_uri 					varchar(200)	NOT NULL,
	created_timestamp_server	int				NOT NULL,
	UNIQUE KEY (uuid),
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS workout_performances (
	id 							int 			NOT NULL AUTO_INCREMENT,
	uuid						varchar(36)		NOT NULL,
	user_id						int				NOT NULL,
	workout_id					int				NOT NULL,
	created_timestamp_server	int				NOT NULL,
	UNIQUE KEY (uuid),
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES users (id),
	FOREIGN KEY (workout_id) REFERENCES workouts (id)
);

CREATE TABLE IF NOT EXISTS group_workouts (
	id 							int 			NOT NULL AUTO_INCREMENT,
	uuid						varchar(36)		NOT NULL,
	workout_id					int				NOT NULL,
	created_timestamp_server	int				NOT NULL,
	UNIQUE KEY (uuid),
	PRIMARY KEY (id),
	FOREIGN KEY (workout_id) REFERENCES workouts (id)
);

CREATE TABLE IF NOT EXISTS group_workout_friends (
	group_workout_id  		int 			NOT NULL,
	user_id					int 			NOT NULL,
	FOREIGN KEY (group_workout_id) REFERENCES group_workouts (id),
	FOREIGN KEY (user_id) REFERENCES users (id)
);
