CODE := server

run := python -m poetry run

# Tests

.PHONY: test
test:
	PYTHONPATH=./ $(run) pytest --cov --verbosity=2 --showlocals --strict-markers

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
