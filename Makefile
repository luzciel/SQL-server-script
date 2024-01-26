setup:
	docker-compose -f docker-compose.yml up -d
	sleep 10  # Esperar a que SQL Server se inicie completamente

down:
	docker-compose -f docker-compose.yml down

run-init:
	docker exec -it db-sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "<YourStrong@Passw0rd>" -i /scripts/init-db.sql

run-create-procedures:
	docker exec -it db-sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "<YourStrong@Passw0rd>" -i /scripts/create-procedures.sql

run-procedures:
	docker exec -it db-sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "<YourStrong@Passw0rd>" -i /scripts/exec-procedures.sql

run-all: setup run-init run-create-procedures run-procedures