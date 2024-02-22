<p align="center">
 <img width="100px" src="https://blog.programapps.top/file/images/C-language.png" align="center" alt="CLangIDE" />
 <h1 align="center">CLangIDE</h2>
 <p align="center">A clean and beautiful native C/C++ integrated development environment (IDE)</p>
</p>

**Supported Releases:** `Windows/Win7+`

CLangIDE is built using `PyQt` to create a pure native integrated development environment IDE based on `MinGW/GCC`.

Due to the limitation of GCC compiler's suffix, the editor will recognize the file configuration `config/config.ini` for saving source code and determining source code type; for C, keep the default (write 'c'), and for C++, write 'cpp'.

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
