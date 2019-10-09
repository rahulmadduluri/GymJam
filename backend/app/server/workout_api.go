package server

import (
	"context"
	// "errors"
	// auth "github.com/rahulmadduluri/GymJam/backend/app/auth"
	// db "github.com/rahulmadduluri/GymJam/backend/app/db"
	models "github.com/rahulmadduluri/GymJam/backend/app/models"
)

func (r *mutationResolver) StartWorkout(ctx context.Context, workoutUUID string) (bool, error) {
	panic("not implemented")
}

func (r *mutationResolver) EndWorkout(ctx context.Context) (bool, error) {
	panic("not implemented")
}

func (r *subscriptionResolver) GroupWorkoutUpdates(ctx context.Context, groupWorkoutUUID string) (<-chan *models.GroupWorkout, error) {
	panic("not implemented")
}
