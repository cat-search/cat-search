#!/bin/sh
set -e

# Start Ollama in background
ollama serve &
# Process id
pid=$!

# Wait for server initialization
sleep 3

# Pull models. Place models here
ollama pull snowflake-arctic-embed
ollama pull nomic-embed-text
ollama pull llama3
ollama pull mistral

# Keep container running, wait for ollama process to finish
wait $pid
