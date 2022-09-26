VENV ?= .venv
CODE = superclock


.PHONY: venv
venv:
	python -m venv $(VENV)
	$(VENV)/bin/python -m pip install --upgrade pip
	$(VENV)/bin/python -m pip install poetry
	$(VENV)/bin/poetry install

.PHONY: test
test:
	$(VENV)/bin/pytest -v tests


.PHONY: lint
lint:
	$(VENV)/bin/poetry lock --check
	# python linters
	$(VENV)/bin/pflake8 --jobs 4 --statistics --show-source $(CODE)
	$(VENV)/bin/pylint --jobs 4 $(CODE)
	$(VENV)/bin/mypy --show-error-codes $(CODE)
	$(VENV)/bin/black --skip-string-normalization --check $(CODE)


.PHONY: format
format:
	$(VENV)/bin/isort $(CODE)
	$(VENV)/bin/black $(CODE)
	$(VENV)/bin/pautoflake --recursive --remove-all-unused-imports --in-place $(CODE)


.PHONY: ci
ci:	lint test


.PHONY: build_docker
build_docker:
	docker build -t markovvn1/iu-devops:lab4_python .


.PHONY: up_dev
up_dev:
	$(VENV)/bin/uvicorn --port 8080 superclock:app --reload


.PHONY: up
up:
	$(VENV)/bin/uvicorn --host 0.0.0.0 --port 8080 superclock:app


.PHONY: up_docker
up_docker:
	docker run -it --rm -h devops --name devops_lab4_python -p 8080:80 markovvn1/iu-devops:lab4_python