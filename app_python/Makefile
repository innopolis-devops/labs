CODE := server

run := python -m poetry run

# Linters

.PHONY: isort
isort:
	$(run) isort --check-only $(CODE)

.PHONY: flake8
flake8:
	$(run) flake8 $(CODE)

.PHONY: mypy
mypy:
	$(run) mypy $(CODE)

.PHONY: lint
lint: isort flake8 mypy
