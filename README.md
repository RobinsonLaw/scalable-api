# 🐳 Scalable Docker API with Caddy Reverse Proxy

This project demonstrates a **horizontally-scalable Flask API** powered by **Docker Compose**, served through a production-ready **Caddy reverse proxy** with automatic HTTPS and flexible service scaling.

Each API container responds with its hostname so you can observe Docker’s internal load balancing in action — perfect for demos, testing, or scaffolding production microservices.

## 📁 Project Structure

```
.
├── app.py              # Simple Flask API returning hostname
├── Dockerfile          # Containerizes the Flask app
├── Caddyfile           # Configures Caddy as reverse proxy
├── docker-compose.yml  # Defines multi-container stack
└── README.md           # You're reading this 😉
```

## 🚀 Quick Start

1. **Clean and rebuild your stack**

   ```bash
   docker-compose down --volumes --remove-orphans
   docker-compose build --no-cache
   docker-compose up --scale api=3 -d
   ```

2. **Visit your API**

   Navigate to: https://localhost  
   Refresh to see responses from different `api` containers.

   > On first run, Caddy automatically requests a certificate and saves its config in Docker volumes.

## 🧠 How It Works

- Multiple `api` containers run a lightweight Flask app that returns its hostname.
- A single **Caddy** container listens on ports 80/443 and proxies traffic to the `api` service.
- Docker's internal DNS provides round-robin load balancing between `api` instances.
- TLS is fully managed by Caddy — no cert hassle.

## ⚙️ Configuration Highlights

- Example `Caddyfile`:

  ```
  :443 {
      reverse_proxy api:80
  }
  ```

- Volumes `caddy_data` and `caddy_config` persist HTTPS certs and runtime config.
- Clean rebuilds can be triggered any time:

  ```bash
  docker-compose down --volumes --remove-orphans
  docker-compose up --build --scale api=3 -d
  ```

## 🔧 Potential Enhancements

- Swap to Ubuntu base for custom debugging tools
- Add logging (e.g., via JSON logs to file)
- Implement health checks, sticky sessions, or resource-based autoscaling
- Visualize traffic via Prometheus + Grafana

---

Made with ❤️ + 🐳 by [RobinsonLaw](https://github.com/RobinsonLaw)
