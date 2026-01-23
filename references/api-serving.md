### Serving stack

The Python libraries below are installed using the `[standard]` features.

[uvicorn](https://uvicorn.dev/) is a low-level HTTP server. It interfaces via
[ASGI](https://asgi.readthedocs.io/en/latest/) with
[FastAPI](https://fastapi.tiangolo.com/tutorial/). FastAPI exposes HTTP
APIs using [OpenAPI](https://spec.openapis.org/oas/latest.html) and
[JSON Schema](https://json-schema.org/specification).

File uploads are handled by FastAPI's integration with
[python-multipart](https://github.com/Kludex/python-multipart).

[fastapi-cli](https://github.com/tiangolo/fastapi-cli) provides the FastAPI
development server.

Tests use [pytest](https://docs.pytest.org/en/stable/getting-started.html).
FastAPI endpoint tests use `@pytest.mark.anyio` and communicate with the
FastAPI application via `ASGITransport` and `AsyncClient` in
[httpx](https://www.python-httpx.org/).

[FastMCP 2.0](https://gofastmcp.com/) is a
[Model Context Protocol (MCP)](https://modelcontextprotocol.io/) server.

Common commands:

* Start the development server: `uv run fastapi dev main.py`
* Serve the application: `uv run uvicorn main:app --host 0.0.0.0 --port 8000`
* Run tests: `uv run pytest`
