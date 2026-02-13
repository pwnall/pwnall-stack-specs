## uv for Python

[uv](https://docs.astral.sh/uv/) manages an isolated
[Python](https://docs.python.org/3/) environment, including the interpreter and
packages.

Python code uses the following conventions
* [ruff](https://docs.astral.sh/ruff/) defaults for linting and formatting,
  except
    * Google-style docstrings
* [mypy](https://mypy.readthedocs.io/) strict mode for static type checking
* [pytest](https://docs.pytest.org/) for unit tests
* [pytest-cov](https://pytest-cov.readthedocs.io/) for test coverage reporting

Names that are not part of a public interface are prefixed with an underscore.
This applies to
* file names in directories with an `__init__.py` file
* class and function names in a module
* function and subclass names in a class

Common commands:

* Run a Python script: `uv run scripts/download-docs.py`
* Add a Python dependency, such as`requests`: `uv add requests`
* Fix formatting for a file or directory: `uv run ruff format file_or_path`
* Show lint errors for a file or directory: `uv run ruff check file_or_path`
* Check static types for a file or directory: `uv run mypy file_or_path`
* Run tests: `uv run pytest`
* Produce JSON coverage report: `uv run pytest --cov-report=json:.coverage.json`
* Produce HTML coverage report: `uv run pytest --cov-report=html:.coverage-html`
* Serve the HTML coverage report:
  `uv run python -m http.server --bind 127.0.0.1 --directory .coverage-html/`

Repository integration:

* `.coverage` - Python test coverage database
* `.coverage.json` - JSON-formatted test coverage (software-friendly)
* `.coverage-html/` - HTML-formatted test coverage (human-friendly)
* `.mypy_cache/`, `.pytest_cache/`, `.ruff_cache/` - Python tool caches
* `.venv/` - Python virtual environment managed by uv
* `.python-version` - Python interpreter used by the virtual environment
* `dist/` - Python packaging tool output
* `pyproject.toml` - Python project configuration for all the tools listed here
* `uv.lock` - Python packages used by the project

New projects use a [pyproject.toml template](assets/pyproject.toml) that
configures these tools.
