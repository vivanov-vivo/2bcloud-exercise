# Use an official slim Python image
FROM python:3.10-slim

# Set environment variables to improve Python behavior in containers
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    FLASK_APP=hello-flask-app.py \
    FLASK_RUN_HOST=0.0.0.0 \
    FLASK_RUN_PORT=5000

# Set a working directory
WORKDIR /webapp

# Install OS-level dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY hello-flask-app.py .

# Expose Flask default port
EXPOSE 5000

# Health check support (optional for Docker/ECS)
HEALTHCHECK --interval=30s --timeout=3s CMD curl -f http://localhost:5000/healthz || exit 1

# Use Flask's CLI for better dev/ops integration
CMD ["flask", "run"]
