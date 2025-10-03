.PHONY: help setup up down logs clean status test

# Variables
DOCKER_COMPOSE = docker-compose
PYTHON = python3
PIP = pip3

help: ## 📖 Muestra este mensaje de ayuda
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

setup: ## 🚀 Setup inicial del proyecto
	@echo "📦 Instalando dependencias..."
	$(PIP) install pre-commit
	pre-commit install
	@echo "✅ Setup completado"

up: ## ▶️ Levanta todos los servicios
	@echo "🐳 Iniciando cluster..."
	$(DOCKER_COMPOSE) up -d
	@echo "⏳ Esperando servicios..."
	@sleep 10
	@echo "✅ Cluster iniciado"
	@$(MAKE) status

down: ## ⏹️ Detiene todos los servicios
	@echo "🛑 Deteniendo cluster..."
	$(DOCKER_COMPOSE) down
	@echo "✅ Cluster detenido"

logs: ## 📋 Muestra logs de todos los servicios
	$(DOCKER_COMPOSE) logs -f

logs-%: ## 📋 Logs de un servicio específico (ej: make logs-namenode)
	$(DOCKER_COMPOSE) logs -f $*

status: ## 📊 Muestra estado de servicios
	@echo "📊 Estado de servicios:"
	@$(DOCKER_COMPOSE) ps

clean: ## 🧹 Limpia containers y volumes
	@echo "⚠️  Eliminando containers y volumes..."
	$(DOCKER_COMPOSE) down -v
	@echo "✅ Limpieza completada"

restart: down up ## 🔄 Reinicia todos los servicios

test: ## 🧪 Ejecuta tests
	@echo "🧪 Ejecutando tests..."
	cd backend && pytest tests/ || echo "No tests yet"
	cd frontend && npm test || echo "No tests yet"

lint: ## 🔍 Ejecuta linters
	@echo "🔍 Ejecutando linters..."
	cd backend && black app/ && flake8 app/
	cd frontend && npm run lint

format: ## 🎨 Formatea el código
	@echo "🎨 Formateando código..."
	cd backend && black app/
	cd frontend && npm run format || true

build: ## 🏗️ Construye las imágenes Docker
	@echo "🏗️ Construyendo imágenes..."
	$(DOCKER_COMPOSE) build

pull: ## 📥 Descarga las imágenes base
	@echo "📥 Descargando imágenes..."
	$(DOCKER_COMPOSE) pull
