CODE := server

run := poetry run

# Linters

.PHONY: isort
isort:
	$(run) isort $(CODE)

.PHONY: flake8
flake8:
	$(run) flake8 $(CODE)

.PHONY: mypy
mypy:
	$(run) mypy $(CODE)

.PHONY: lint
lint: isort flake8 mypy
