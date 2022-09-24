# Best practicies for Docker Hub in CI workflow
1. Do unit testing inside Socker container to avoid errors in containers
2. Use access token for CI and do not expose it on code
3. Use build cache
4. Separate production and test Docker images (I use `lab` tag in my CI while `latest` is reserved for release images)