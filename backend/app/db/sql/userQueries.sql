-- name: getUser
select
	users.uuid as uuid,
	users.first_name as firstname,
	users.last_name as lastname,
	users.photo_uri as photouri
from users
where users.uuid = :user_uuid
;

--name: createUser
insert into users (uuid, first_name, last_name, email, created_timestamp_server)
	select
		:user_uuid,
		:first_name,
		:last_name,
		:email,
		:created_timestamp_server
;
