FROM python:3.9.6-slim as base
LABEL maintainer="d.gubajdullin@innopolis.university"

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONFAULTHANDLER 1

FROM base AS python-deps

WORKDIR /

RUN pip install --no-cache-dir pipenv==2022.11.30
# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends gcc

# Install python dependencies in /.venv
COPY Pipfile .
COPY Pipfile.lock .
RUN PIPENV_VENV_IN_PROJECT=1 pipenv install --deploy


FROM base AS runtime

# Copy virtual env from python-deps stage
COPY --from=python-deps /.venv /.venv
ENV PATH="/.venv/bin:$PATH"

# Create and switch to a new user
RUN useradd --create-home appuser
WORKDIR /home/appuser
USER appuser

# Install application into container
COPY . .

EXPOSE 8000

ENTRYPOINT [ "uvicorn", "moscow_time.main:app" ] 
CMD [ "--host", "0.0.0.0", "--port", "8000"]