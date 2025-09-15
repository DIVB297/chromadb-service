# Use official ChromaDB image
FROM chromadb/chroma:latest

# Expose port
EXPOSE 8000

# Set environment variables
ENV ANONYMIZED_TELEMETRY=False
ENV IS_PERSISTENT=True
ENV PERSIST_DIRECTORY=/chroma/chroma

# Create volume for persistence
VOLUME ["/chroma/chroma"]

# Start ChromaDB
CMD ["chroma", "run", "--host", "0.0.0.0", "--port", "8000", "--path", "/chroma/chroma"]
