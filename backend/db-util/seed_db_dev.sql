delete from users;
delete from friendships;
delete from workouts;
delete from workout_performances;
delete from workout_performance_stats;
delete from group_workouts;
delete from group_workout_friends;

		id 							int 			NOT NULL AUTO_INCREMENT,
	uuid						varchar(36)		NOT NULL,
	name 						varchar(200)	NOT NULL,
	duration_in_seconds 		int,
	photo_uri 					varchar(200)	NOT NULL,
	created_timestamp_server	int				NOT NULL,
	UNIQUE KEY (uuid),
	PRIMARY KEY (id)


INSERT INTO users VALUES
	(NULL, 'uuid-1', 'Rob', 'Vanderhoven', 'robisthebest@gmail.com', 'uuid-1_rob', 500),
	(NULL, 'uuid-2', 'Jessica', 'Lo', 'jessicaisthebest@gmail.com', 'uuid-2_jessica', 500),
	(NULL, 'uuid-3', 'Mayuri', 'Ramasubramaniam', 'mayuristhebest@gmail.com', 'uuid-3_mayuri', 500),
	(NULL, 'uuid-4', 'Liam', 'Neeson', 'liamneeson@gmail.com', 'uuid-4_liam', 500);
INSERT INTO workouts VALUES
	(NULL, 'uuid-1', 'Blistering Twisters', 'blistering_twisters', 500),
	(NULL, 'uuid-2', 'Sisyphean Squats', 'blistering_twisters', 500),
	(NULL, 'uuid-3', 'Ludicrous Lunges', 'blistering_twisters', 500),
	(NULL, 'uuid-4', 'Needless Knee Raises', 'blistering_twisters', 500),
	(NULL, 'uuid-5', 'Jupiter Jumps', 'blistering_twisters', 500),
	(NULL, 'uuid-6', 'Blistering Twisters', 'blistering_twisters', 500),
	(NULL, 'uuid-7', 'Blistering Twisters', 'blistering_twisters', 500);
