# CLangIDE

*A clean and beautiful native C/C++ integrated development environment (IDE).*

**Supported Releases:** `Windows/Win7+`

CLangIDE is built using `PyQt` to create a pure native integrated development environment IDE based on `MinGW/GCC`.

## Python Deployment

It is still recommended to use the `Release` version to avoid errors.

**Python Recommended Requirements: Python 3.8+ & Virtual Environment**

**Python Minimum Requirements: Python 3.6+**

Deploy using a local Python environment:

### Installation

```shell
pip install pyqt5
pip install qscintilla
```

Run `main.py` or use the following command in the terminal:

```shell
python main.py
```

## Pyinstaller Local Packaging (Optional)

You can also choose to package an executable file locally by installing the `pyinstaller` package:

```shell
pip install pyinstaller
```

```shell
pyinstaller (-F) main.py window.py
```

`-F` is an optional parameter that indicates whether to package it as a single file.

Once the packaging is complete, locate the `main.exe` executable file in the `dist` folder and open it.
