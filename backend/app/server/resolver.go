package server

import (
	"context"
	"fmt"

	auth "github.com/rahulmadduluri/GymJam/backend/app/auth"

	"github.com/99designs/gqlgen/graphql"
)

type Resolver struct{}
type queryResolver struct{ *Resolver }
type mutationResolver struct{ *Resolver }
type subscriptionResolver struct{ *Resolver }

func (r *Resolver) Query() QueryResolver {
	return &queryResolver{r}
}
func (r *Resolver) Mutation() MutationResolver {
	return &mutationResolver{r}
}
func (r *Resolver) Subscription() SubscriptionResolver {
	return &subscriptionResolver{r}
}

func New() Config {
	resolver := Resolver{}
	jwtMiddleware := auth.JWTMiddleware()
	isAuthenticated := func(ctx context.Context, obj interface{}, next graphql.Resolver) (res interface{}, err error) {
		token := auth.JWTFromContext(ctx)

		didValidate, err := auth.ValidateToken(jwtMiddleware, token)
		errorStr := "Access denied"
		if didValidate == false {
			if err != nil {
				errorStr = errorStr + ": " + err.Error()
			}
			return nil, fmt.Errorf(errorStr)
		}

		//get uuid from token
		uuid := auth.GetUUIDFromValidatedToken(token)
		ctxWithUUID := auth.ContextWithUUID(ctx, uuid)

		return next(ctxWithUUID)
	}
	directive := DirectiveRoot{
		IsAuthenticated: isAuthenticated,
	}

	return Config{
		Resolvers:  &resolver,
		Directives: directive,
	}
}
