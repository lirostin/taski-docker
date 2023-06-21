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