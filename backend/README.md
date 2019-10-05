For Local Development:

firt install MYSQL
brew install mysql

To add app environment
export APP_ENV=playground

To start MySQL database:
mysql -u {user} -p {password}
use gymjam;

To populate MySQL:
source {path to GymJam}/GymJam/backend/db-util/create_db.sql

To Run Server: 
go run app/main/main.go

To generate GraphQL code from schema
cd server
rm resolver.go
gqlgen -v
