package db

import (
	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
	"github.com/nleof/goyesql"
)

const (
	_userQueriesPath = "db/sql/userQueries.sql"
)

type SQLDB interface {
	UserDB
}

type sqlQueries struct {
	userQueries goyesql.Queries
}

type sqlDB struct {
	db      *sqlx.DB
	queries sqlQueries
}

func generateQueries() sqlQueries {
	userQueries := goyesql.MustParseFile(_userQueriesPath)
	return sqlQueries{
		userQueries: userQueries,
	}
}
