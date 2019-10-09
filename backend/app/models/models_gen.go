// Code generated by github.com/99designs/gqlgen, DO NOT EDIT.

package models

type CreateUserInput struct {
	UUID      string `json:"uuid"`
	FirstName string `json:"firstName"`
	LastName  string `json:"lastName"`
	Email     string `json:"email"`
}

type GroupWorkout struct {
	UUID                string                `json:"uuid"`
	Workout             *Workout              `json:"workout"`
	WorkoutPerformances []*WorkoutPerformance `json:"workoutPerformances"`
}

type UpdateUserInput struct {
	UUID      string  `json:"uuid"`
	FirstName *string `json:"firstName"`
	LastName  *string `json:"lastName"`
	Email     *string `json:"email"`
}

type User struct {
	UUID      string  `json:"uuid"`
	FirstName string  `json:"firstName"`
	LastName  string  `json:"lastName"`
	PhotoURI  *string `json:"photoURI"`
}

type Workout struct {
	UUID        string  `json:"uuid"`
	Name        *string `json:"name"`
	DurationSec int     `json:"durationSec"`
}

type WorkoutPerformance struct {
	UUID             string   `json:"uuid"`
	User             *User    `json:"user"`
	Workout          *Workout `json:"workout"`
	RepTimestampsSec []*int   `json:"repTimestampsSec"`
	Completed        *bool    `json:"completed"`
}
