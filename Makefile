# Baseful Admin Panel - Development Docker Management
# Makefile for easy Docker Compose operations (Development only)

.PHONY: help build up down restart logs clean dev migrate shell db-shell status

# Default target
help:
	@echo "Baseful Admin Panel - Development Docker Management"
	@echo ""
	@echo "Available commands:"
	@echo "  make build    - Build development images"
	@echo "  make up       - Start development services"
	@echo "  make down     - Stop development services"
	@echo "  make restart  - Restart development services"
	@echo "  make logs     - Show development logs"
	@echo "  make clean    - Remove all containers, networks, and volumes"
	@echo "  make dev      - Start development environment"
	@echo "  make migrate  - Run database migrations"
	@echo "  make shell    - Access app container shell"
	@echo "  make db-shell - Access database container shell"
	@echo "  make status   - Check development service status"

# Development commands
build:
	@echo "Building development images..."
	docker-compose -f docker-compose.yml build

up:
	@echo "Starting development services..."
	docker-compose -f docker-compose.yml up

down:
	@echo "Stopping development services..."
	docker-compose -f docker-compose.yml down

restart:
	@echo "Restarting development services..."
	docker-compose -f docker-compose.yml restart

logs:
	@echo "Showing development logs..."
	docker-compose -f docker-compose.yml logs -f

clean:
	@echo "Cleaning up Docker resources..."
	docker-compose -f docker-compose.yml down -v --remove-orphans
	docker system prune -f

# Development environment
dev:
	@echo "Starting development environment..."
	docker-compose -f docker-compose.yml up -d

# Database commands
migrate:
	@echo "Running database migrations..."
	docker-compose -f docker-compose.yml exec app npm run db:migrate

# Shell access
shell:
	@echo "Accessing app container shell..."
	docker-compose -f docker-compose.yml exec app sh

db-shell:
	@echo "Accessing database container shell..."
	docker-compose -f docker-compose.yml exec db psql -U postgres -d baseful

# Quick start for development
start: dev
	@echo "Development environment started!"
	@echo "App: http://localhost:3000"
	@echo "Database: localhost:5432"

# Status check
status:
	@echo "Checking development service status..."
	docker-compose -f docker-compose.yml ps 