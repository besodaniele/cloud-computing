
# Explanation of `docker-compose.yml`

## 1. Overview

Docker Compose manages multiple containers as one application. In this project, there are two services:

- **api**: the Flask REST API that manages books.
- **db**: the PostgreSQL database that stores book records.

Docker Compose configures the containers, networking, persistent storage, restart policies, health checks, and resource limits.

## 2. Services

```yaml
services:
```

The `services` section defines the containers that make up the application. Each service has its own configuration.

## 3. API service

### 3.1 Build configuration

```yaml
api:
  build:
    context: .
    dockerfile: Dockerfile
  image: books-api:local
```

- `api`: the name of the application service.
- `build`: instructs Docker Compose to build an image.
- `context: .`: uses the current directory as the build context.
- `dockerfile: Dockerfile`: specifies the Dockerfile to use.
- `image: books-api:local`: assigns the image the name `books-api` and tag `local`.

The Dockerfile installs Python dependencies and copies the application into the image.

### 3.2 Environment variables

```yaml
environment:
  DB_HOST: db
  DB_PORT: "5432"
  DB_NAME: ${DB_NAME:-books}
  DB_USER: ${DB_USER:-books_user}
  DB_PASSWORD: ${DB_PASSWORD:?Set DB_PASSWORD in .env}
  APP_PORT: "8000"
```

Environment variables configure the API and its database connection.

- `DB_HOST: db`: uses the database service name as the hostname. Docker Compose resolves service names on the shared network.
- `DB_PORT: "5432"`: the default PostgreSQL port inside the Docker network.
- `DB_NAME: ${DB_NAME:-books}`: reads `DB_NAME` from the shell or `.env`; otherwise, uses `books`.
- `DB_USER: ${DB_USER:-books_user}`: uses the configured database username, defaulting to `books_user`.
- `DB_PASSWORD: ${DB_PASSWORD:?Set DB_PASSWORD in .env}`: requires a non-empty password. Compose reports an error if the variable is missing or empty.
- `APP_PORT: "8000"`: configures the API to listen on port 8000 inside its container.

The syntax `${VARIABLE:-default}` provides a fallback value. The syntax `${VARIABLE:?message}` causes Compose to fail if the variable is missing or empty.

The `.env` file supplies configuration values to Compose. Values are passed into a container only when referenced in its `environment` section or otherwise configured.

### 3.3 Port mapping

```yaml
ports:
  - "${HOST_PORT:-8000}:8000"
```

This maps a port on the host machine to a port inside the container.

The format is `HOST_PORT:CONTAINER_PORT`.

- The host port defaults to `8000`.
- The container port is `8000`.

For example, `9000:8000` would make the API accessible through host port 9000.

Only the API port is published. PostgreSQL is not directly exposed on a host port.

### 3.4 Startup dependency

```yaml
depends_on:
  db:
    condition: service_healthy
```

The API starts after the database passes its health check.

This is more reliable than simply starting the database container first, because a running container does not necessarily mean PostgreSQL is ready to accept connections.

The application also retries its database connection during initialization.

### 3.5 Network

```yaml
networks:
  - books-net
```

The API connects to the `books-net` network.

This allows the API to communicate with PostgreSQL using the hostname `db`. Both services must belong to the same network.

### 3.6 Restart policy

```yaml
restart: unless-stopped
```

Docker restarts the container if it exits unexpectedly.

It also allows the container to restart when Docker restarts, unless the container was explicitly stopped.

An unhealthy container is not automatically restarted solely because its health check fails.

### 3.7 Init process

```yaml
init: true
```

Docker runs a small init process inside the container. It helps forward signals and clean up child processes.

### 3.8 Resource limits

```yaml
mem_limit: 256m
cpus: 0.50
```

- `mem_limit: 256m`: limits the API container to 256 MiB of memory.
- `cpus: 0.50`: limits the API to approximately half of one CPU's capacity.

These limits help prevent the service from consuming excessive resources on the VM.

### 3.9 API health check

```yaml
healthcheck:
  test: ["CMD", "python", "-c", "import urllib.request; urllib.request.urlopen('http://127.0.0.1:8000/health', timeout=3)"]
  interval: 30s
  timeout: 5s
  retries: 3
  start_period: 60s
```

Docker periodically requests the API's `/health` endpoint.

- `test`: command executed to verify that the API responds successfully.
- `interval: 30s`: runs the check every 30 seconds.
- `timeout: 5s`: allows five seconds for a check to complete.
- `retries: 3`: marks the container unhealthy after three consecutive failed checks.
- `start_period: 60s`: allows the application time to start before normal health-check failures count.

The endpoint also checks database connectivity. A database failure can therefore make the API report itself as unhealthy.

## 4. Database service

### 4.1 PostgreSQL image

```yaml
db:
  image: postgres:16-alpine
```

This uses the official PostgreSQL 16 image based on Alpine Linux.

Using an official database image avoids having to build a custom PostgreSQL image.

### 4.2 Database environment variables

```yaml
environment:
  POSTGRES_DB: ${DB_NAME:-books}
  POSTGRES_USER: ${DB_USER:-books_user}
  POSTGRES_PASSWORD: ${DB_PASSWORD:?Set DB_PASSWORD in .env}
```

These variables configure PostgreSQL initialization.

- `POSTGRES_DB`: database created during initialization.
- `POSTGRES_USER`: database user created during initialization.
- `POSTGRES_PASSWORD`: password assigned to that user.

The values must match the database settings used by the API.

These initialization variables do not automatically modify an existing database when the persistent volume already contains database files.

### 4.3 Persistent volume

```yaml
volumes:
  - books-data:/var/lib/postgresql/data
```

This mounts the named Docker volume `books-data` into PostgreSQL's data directory.

- `books-data`: the Docker-managed volume.
- `/var/lib/postgresql/data`: the path inside the container where PostgreSQL stores its data.

The volume preserves database files when containers are replaced or removed.

Running `docker compose down` preserves the named volume. Running `docker compose down -v` removes the Compose-managed volume and can permanently delete the database data.

A persistent volume is not a substitute for backups.

### 4.4 Network and restart policy

```yaml
networks:
  - books-net
restart: unless-stopped
```

The database joins the same network as the API, allowing connections from the API container.

The restart policy tells Docker to restart the database after unexpected exits unless it has been explicitly stopped.

### 4.5 Database resource limits

```yaml
mem_limit: 512m
cpus: 1.00
```

- `mem_limit: 512m`: limits the database container to 512 MiB of memory.
- `cpus: 1.00`: limits it to approximately one CPU's capacity.

These are example limits for a small exercise. Appropriate values depend on the VM's available resources and workload.

### 4.6 Database health check

```yaml
healthcheck:
  test: ["CMD-SHELL", "pg_isready -U \"$${POSTGRES_USER}\" -d \"$${POSTGRES_DB}\""]
  interval: 5s
  timeout: 5s
  retries: 12
  start_period: 10s
```

The `pg_isready` command checks whether PostgreSQL is accepting connections.

- `CMD-SHELL`: runs the command through a shell.
- `-U`: specifies the database user.
- `-d`: specifies the database name.
- `interval: 5s`: checks every five seconds.
- `timeout: 5s`: allows five seconds for each check.
- `retries: 12`: allows twelve consecutive failures before marking the database unhealthy.
- `start_period: 10s`: allows time for PostgreSQL initialization.

The doubled dollar signs in `$${POSTGRES_USER}` and `$${POSTGRES_DB}` are intentional. They prevent Compose from substituting these variables on the host. Instead, the shell inside the container expands them.

The API's `depends_on` condition uses this health check to determine when PostgreSQL is ready.

## 5. Network configuration

```yaml
networks:
  books-net:
    driver: bridge
```

This creates a user-defined Docker bridge network called `books-net`.

A bridge network allows containers on the same Docker host to communicate privately. Docker Compose provides DNS resolution, so the API can find the database using `db`.

The database is not exposed externally because no database port is published.

## 6. Volume configuration

```yaml
volumes:
  books-data:
```

This declares the named volume used by PostgreSQL.

Docker manages the volume's location on the host and reuses it when the project is started again.

The named volume is essential because containers can be recreated, while the database data should persist independently of the database container.

## 7. Application startup sequence

1. Docker Compose reads the YAML configuration and resolves variables from the shell and `.env`.
2. Compose builds the API image using the Dockerfile.
3. Compose creates the network and named volume if necessary.
4. PostgreSQL starts using the persistent volume.
5. The database health check waits for PostgreSQL to become ready.
6. The API starts after the database becomes healthy.
7. The API connects to PostgreSQL and creates the `books` table if necessary.
8. The API listens on port 8000 inside the container.
9. Clients send HTTP requests to the published host port, and the API reads or writes data in PostgreSQL.

## 8. Useful Docker Compose commands

Validate the configuration:

```bash
docker compose config
```

Build and start the services:

```bash
docker compose up --build -d
```

Check container status and health:

```bash
docker compose ps
```

View application logs:

```bash
docker compose logs -f api
```

View database logs:

```bash
docker compose logs -f db
```

Restart the API:

```bash
docker compose restart api
```

Stop and remove containers and the network while preserving database data:

```bash
docker compose down
```

**Warning:** The following command also removes Compose-managed volumes and can delete the database data:

```bash
docker compose down -v
```

## 9. Security considerations

- Do not commit `.env` to Git because it contains credentials.
- Use a strong, unique database password.
- Do not expose PostgreSQL directly to the internet.
- The example API does not implement authentication or authorization. Restrict access before exposing it publicly.
- Use HTTPS through a TLS reverse proxy for production deployments.
- Keep database backups; a named volume alone does not protect against data loss.
- Choose resource limits based on the VM's actual CPU and memory capacity.

## 10. Summary

The Compose file defines two containers, connects them through a private bridge network, stores database files in a named volume, and configures health checks, restart behavior, and resource limits.

The API is accessible through the published host port, while PostgreSQL remains accessible to the API through the internal Docker network. This separation makes the application easier to deploy, maintain, and test.
