

```shell
watch -n3 "docker logs --tail=35 cat-search-spider-1 2>&1"

watch -n3 "docker logs --tail=20 cat-search-weaviate-1 2>&1"

watch -n3 "docker logs --tail=35 cat-search-ollama-1 2>&1"

watch -n5 "docker exec -ti cat-search-ollama-1 /bin/bash -c 'ollama list'"

watch -n3 "docker logs --tail=35 cat-search-backend-1 2>&1"

watch -n3 'curl -s http://localhost/docs'
```