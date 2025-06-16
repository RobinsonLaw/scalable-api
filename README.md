# 🐳 Scalable Docker API (Flask + NGINX + Compose)

This is a simple horizontally-scalable API demo using Docker Compose, Flask, and NGINX.

Each API container responds with its own hostname, so you can see which container handled each request — perfect for understanding how container scaling and load balancing works locally.

---

## 📁 Project Structure

```
.
├── app.py              # Flask API returning hostname
├── Dockerfile          # Containerizes the app
├── nginx.conf          # Load balances across API containers
└── docker-compose.yml  # Defines and scales services
```

---

## 🚀 Quick Start

1. **Clone or create this project**
   ```bash
   git clone https://github.com/your-username/scalable-api.git
   cd scalable-api
   ```

2. **Start it up and scale**
   ```bash
   docker compose up --build --scale api=3 -d
   ```

3. **Visit your API**
   Open your browser at: [http://localhost:8080](http://localhost:8080)  
   Refresh a few times — each response should show a different container hostname.

---

## 🧠 How It Works

- The Flask `api` service runs in multiple containers.
- NGINX receives all incoming traffic and forwards it to a randomly selected container.
- Docker Compose handles building, scaling, and networking between services.

---

## ⚙️ Commands

Scale up/down the number of containers:
```bash
docker compose up --scale api=5 -d
```

Stop and remove everything:
```bash
docker compose down
```

---

## 🚧 Possible Next Steps

- Add automatic CPU-based scaling
- Add monitoring with Prometheus + Grafana
- Deploy on Kubernetes for production-ready orchestration

---

Made with 🧠 & 🐳 by [RobinsonLaw](https://github.com/RobinsonLaw)
