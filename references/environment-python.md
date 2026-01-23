## uv for Python

[uv](https://docs.astral.sh/uv/) manages an isolated
[Python](https://docs.python.org/3/) environment, including the interpreter and
packages.

Common commands:

* Run a Python script: `uv run scripts/download-docs.py`
* Add a Python dependency, such as`requests`: `uv add requests`

Repository integration:

* `.venv/` - Python virtual environment managed by uv
* `.python-version` - Python interpreter used by the virtual environment
* `pyproject.toml` - Python project configuration for uv
* `uv.lock` - Python packages used by the project
