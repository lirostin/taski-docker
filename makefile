PROJECT_NAME = .

db:
	docker run --name db \
		--env-file .env \
		-e PGDATA=/var/lib/postgresql/data/pgdata \
		-v pg_data:/var/lib/postgresql/data \
		--net django-network \
		postgres:13.10

django:
	docker run --env-file .env \
           --net django-network \
           --name taski_backend_container \
           -p 8000:8000 taski_backend 

lint:
	isort ${PROJECT_NAME}
	black  --line-length 79 ${PROJECT_NAME}
	flake8 ${PROJECT_NAME} 