package server

import (
	"context"
	"errors"

	auth "github.com/rahulmadduluri/GymJam/backend/app/auth"
	db "github.com/rahulmadduluri/GymJam/backend/app/db"
	models "github.com/rahulmadduluri/GymJam/backend/app/models"
)

func (r *mutationResolver) CreateUser(ctx context.Context, userInfo models.CreateUserInput) (bool, error) {
	err := db.Handler().SQL().CreateUser(userInfo.UUID, userInfo.FirstName, userInfo.LastName, userInfo.Email)
	if err != nil {
		return false, err
	}
	return true, nil
}
func (r *mutationResolver) UpdateUser(ctx context.Context, userInfo models.UpdateUserInput) (bool, error) {
	panic("not implemented")
}

func (r *queryResolver) User(ctx context.Context, uuid string) (*models.User, error) {
	if auth.UUIDFromContext(ctx) == uuid {
		user, err := db.Handler().SQL().GetUser(uuid)
		if err != nil {
			return nil, err
		}
		return user, err
	} else {
		return nil, errors.New("Access Denied: auth info is incorrect")
	}
}
