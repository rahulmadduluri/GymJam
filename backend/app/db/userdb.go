package db

import (
	"time"

	models "github.com/rahulmadduluri/GymJam/backend/app/models"
)

const (
	_GetUser    = "getUser"
	_CreateUser = "createUser"
)

type UserDB interface {
	GetUser(userUUID string) (*models.User, error)
	CreateUser(userUUID string, firstName string, lastName string, email string) error
}

func (sql *sqlDB) GetUser(userUUID string) (*models.User, error) {
	var user *models.User

	// get user
	rows, err := sql.db.NamedQuery(
		sql.queries.userQueries[_GetUser],
		map[string]interface{}{
			"user_uuid": userUUID,
		},
	)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	for rows.Next() {
		var temp models.User
		err := rows.StructScan(&temp)
		if err != nil {
			return nil, err
		}
		user = &temp
		break
	}

	return user, err
}

func (sql *sqlDB) CreateUser(userUUID string, firstName string, lastName string, email string) error {
	createdTimestamp := int(time.Now().Unix())
	_, err := sql.db.NamedQuery(
		sql.queries.userQueries[_CreateUser],
		map[string]interface{}{
			"user_uuid":                userUUID,
			"first_name":               firstName,
			"last_name":                lastName,
			"email":                    email,
			"created_timestamp_server": createdTimestamp,
		},
	)
	if err != nil {
		return err
	}
	return nil
}
