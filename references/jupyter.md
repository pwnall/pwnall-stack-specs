## JupyterLab notebooks

Local development uses [JupyterLab](https://jupyter.org/) with the following
extensions.

* [Jupytext](https://jupytext.readthedocs.io/) and
  [jupyterlab-myst](https://github.com/jupyter-book/jupyterlab-myst) for
  MyST Markdown support
* [jupyter-lsp and jupyterlab-lsp](https://jupyterlab-lsp.readthedocs.io/en/latest/),
  and [python-lsp-server](https://github.com/python-lsp/python-lsp-server)
  for LSP (Language Server Protocol) support for Python

[python-dotenv](https://pypi.org/project/python-dotenv/) helps avoid having
API keys in notebooks.

Common commands:

* Start a Jupyter Lab local server: `uv run jupyter lab --notebook-dir=src/`
* Add a Python dependency, such as Jupyter extension: `uv add jupyter-extension`

Repository integration:

* `.ipynb_checkpoints` - temporary snapshots, listed in `.gitignore`
* `.jupyter_ystore.db` - RTC (Real Time Collaboration) data store, listed in
  `.gitignore`
