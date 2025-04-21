#!/bin/sh
set -e

# Start Ollama in background
ollama serve &
# Process id
pid=$!

# Wait for server initialization
sleep 3

# Pull models. Place models here
ollama pull jeffh/intfloat-multilingual-e5-large:f16
ollama pull llama3

# Keep container running, wait for ollama process to finish
wait $pid
