## Document OCR

Models are served using [vLLM](https://docs.vllm.ai/) and
[SGLang](https://github.com/sgl-project/sglang).

The baseline OCR is supplied by the
[pytesseract](https://pypi.org/project/pytesseract/), which wraps the
[the Tesseract library](https://github.com/tesseract-ocr/tesseract).

The deep learning OCR is supplied by
[PaddlePaddle OCR](https://github.com/PaddlePaddle/PaddleOCR).

The one-shot all-text document extraction pipeline is provided by
[the olmOCR2 toolkit](https://github.com/allenai/olmocr).

Common commands:

* Process a PDF: `uv run python -m olmocr.pipeline ./olmocr-outputs --markdown --pdfs input.pdf`
