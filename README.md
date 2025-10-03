# Sistema Distribuido de Detección de Fraude Bancario

[![CI/CD](https://github.com/TU-USUARIO/banking-fraud-detection/workflows/CI-CD/badge.svg)](https://github.com/TU-USUARIO/banking-fraud-detection/actions)
[![Python](https://img.shields.io/badge/Python-3.11+-blue.svg)](https://www.python.org/)
[![Docker](https://img.shields.io/badge/Docker-24.0+-blue.svg)](https://www.docker.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

---

## Descripción

Sistema distribuido para **almacenamiento y procesamiento masivo de transacciones bancarias**, con **detección automática de anomalías mediante Machine Learning**.  

Este proyecto integra tecnologías de **Big Data**, **ML** y **DevOps** para ofrecer una solución escalable de **detección de fraude bancario en tiempo real y batch**.

---

## Arquitectura

- **Almacenamiento:** Hadoop HDFS con replicación.
- **Procesamiento:** Apache Spark (PySpark).
- **Backend API:** FastAPI + gRPC.
- **Frontend:** React + TypeScript.
- **Streaming (Opcional):** Apache Kafka.
- **Monitoreo:** Prometheus + Grafana.

<p align="center">
  <img src="docs/arquitectura.png" alt="Arquitectura del sistema" width="600"/>
</p>

---

## Quick Start

### Prerrequisitos

- [Docker Desktop 24.0+](https://www.docker.com/)  
- Docker Compose 2.0+  
- 16GB RAM (mínimo recomendado)  
- 100GB de espacio en disco  

### Instalación

```bash
# Clonar el repositorio
git clone https://github.com/adref404/banking-fraud-detection.git
cd banking-fraud-detection

# Levantar cluster básico (HDFS + servicios esenciales)
make up

# Verificar servicios activos
make status

# Revisar logs
make logs
````

---

## Acceso a Servicios

| Servicio        | URL                                            | Puerto |
| --------------- | ---------------------------------------------- | ------ |
| **NameNode UI** | [http://localhost:9870](http://localhost:9870) | 9870   |
| **DataNode 1**  | [http://localhost:9864](http://localhost:9864) | 9864   |
| **Backend API** | [http://localhost:8000](http://localhost:8000) | 8000   |
| **Frontend**    | [http://localhost:3000](http://localhost:3000) | 3000   |
| **Grafana**     | [http://localhost:3001](http://localhost:3001) | 3001   |

---

## Documentación

* [Setup Guide](docs/setup.md)
* [Arquitectura](docs/arquitectura.md)
* [API Docs](docs/api.md)
* [Troubleshooting](docs/troubleshooting.md)

---

## Equipo

* **Integrante 1:** Infraestructura (Hadoop + Kafka)
* **Integrante 2:** ML / Spark (Algoritmos de detección)
* **Integrante 3:** Backend (FastAPI + gRPC)
* **Integrante 4:** Frontend (React + Visualizaciones)
* **Integrante 5:** DevOps (Docker + CI/CD + Monitoreo)

---

## Licencia

Este proyecto está bajo la licencia **MIT**.
Consulta el archivo [LICENSE](LICENSE) para más detalles.

---

## Contacto

📌 Proyecto Final - **Sistemas Distribuidos 2025-2**
Universidad Nacional Mayor de San Marcos

```
