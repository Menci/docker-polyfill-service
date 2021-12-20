# Docker Image of polyfill-service

It's a dockerized [polyfill-service](https://github.com/Financial-Times/polyfill-service), which could help you run a self-hosted https://polyfill.io.

It's built on GitHub Actions automatically everyday when there's a new release of [polyfill-service](https://github.com/Financial-Times/polyfill-service).

By default it listens port 80 in container. You could start it with:

```bash
docker run -d --name polyfill-service --restart unless-stopped -p 8080:80 menci/polyfill-service
```
