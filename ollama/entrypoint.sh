#!/bin/sh
set -e

# Start Ollama in background
ollama serve &

# Wait for server initialization
sleep 2

# Pull models. Place models here
ollama pull snowflake-arctic-embed
ollama pull nomic-embed-text
ollama pull llama3
ollama pull mistral

# Keep container running
wait
