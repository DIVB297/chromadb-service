# Use Python base image and install ChromaDB manually
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install ChromaDB
RUN pip install chromadb==0.4.15

# Create data directory
RUN mkdir -p /app/chroma

# Expose port
EXPOSE 8000

# Set environment variables
ENV ANONYMIZED_TELEMETRY=False
ENV IS_PERSISTENT=True
ENV PERSIST_DIRECTORY=/app/chroma

# Start ChromaDB using Python module
CMD ["python", "-m", "chromadb.cli.cli", "run", "--host", "0.0.0.0", "--port", "8000", "--path", "/app/chroma"]
