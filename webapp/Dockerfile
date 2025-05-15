# Use an official lightweight Python image
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /webapp

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY hello-flask-app.py .

# Expose port 5000 for the Flask app
EXPOSE 5000

# Run the app
CMD ["python", "hello-flask-app.py"]
