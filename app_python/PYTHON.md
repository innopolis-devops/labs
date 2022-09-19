# Best Python practises from my experience

1. `FastAPI` is modern, async-native framework that allows to do great things. I do not like `flask` because it's old and I
don't like `Django` because it's huge. As alternative, you could use `falcon`, but it's more low-level. Also, integration
with Pydantic is awsome. And auto-generating swagger docs is wonderful.

2. Use Pydantic because it helps to create simple datastructures and provide some validation on it. Also, it's easy to 
get config via it.

3. YOU JUST MUST use type hints and mypy. It makes code easy-to-read and helps to avoid mistakes.

4. Linters are also very-very-very-nice-to-have. I use `isort` to sort imports, `flake8` for formatting and `mypy` for 
type checking.

5. If you choose FastAPI, then use `uvicorn` for local testing and `gunicorn` for production. Because `uvicorn` is not
production ready.

6. Freeze your requirements at least in minor version. Better to check every package that you gonna use and read
versioning politics.

7. Try to not use default json and base64 utils. They are so slow. Use something like `pybase64` and `orjson/ujson`.

# Others

1. If there is some error while processing request it's better to return RequestID to be able to trace error in logs.

2. Makefile is convenient and friendly. Just write it once and make every developer happy.

3. It's cool to write docs and leave contacts.

4. Do not use `root` user in your Dockerfiles. You have to create user and run application as non-root. I believe, it's
more secure.

5. It's obvious, but do not store any `.env` files in repositories. Store them in some SecretManager (Hello, AWS). But
it's cool to provide `.env.example` file.

6. I use several `docker-compose` files to be able to switch between server and local environments. Base file describes
services that always should be run. Local file setup some outside services as RabbitMQ, databases etc. And server file
setup logs exporter and image monitoring, to be able to make code updates.

7. Sometimes it's better to hide you app behind `nginx` (for example if you do not have any external load 
balancers/proxies). In this case use unix socket to avoid any performance issues. And I always hide documentation behind 
basic auth.

8. Limit logs size in docker compose.

9. Create healthcheck endpoints to be able to check healthiness of the service. It will help when you will scale your
application.


# Unit Tests

1. I use pytest, because I've experience with it. It's powerfully and well-known in community. You can find a lot of 
plugins and extensions and do different things.

2. To be able to run tests of async functions (and api is mostly async when you add DB etc), I use AnyIO plugin with 
HTTPX AsyncClient. This allows to test code directly without running application.

3. Pytest has a lot of tools to run tests with dependencies, in different order, with different backends (asyncio, 
uvloop etc.) and can easily provide mocks by using fixtures.

4. Better to split tests into multiple files, i.e. by endpoints.

5. 