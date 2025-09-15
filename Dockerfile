# Use official ChromaDB image
FROM chromadb/chroma:0.4.15

# Set working directory
WORKDIR /chroma

# Expose port
EXPOSE 8000

# Set environment variables
ENV ANONYMIZED_TELEMETRY=False
ENV IS_PERSISTENT=True
ENV PERSIST_DIRECTORY=/chroma/chroma

# Create directory for data
RUN mkdir -p /chroma/chroma

# Start ChromaDB server
CMD ["chroma", "run", "--host", "0.0.0.0", "--port", "8000", "--path", "/chroma/chroma"]
