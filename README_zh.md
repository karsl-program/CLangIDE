# CLangIDE

*一个简洁、美观的原生C/C++集成开发环境（IDE） | A clean and beautiful native C/C++ integrated development environment (IDE).*

Release发行版支持：`Windows/Win7+`

CLangIDE使用`PyQt`制作，打造基于`MinGW/GCC`的纯原生集成开发环境IDE

## Python部署

依然推荐使用`Release`发行版避免出错。

**Python推荐要求：Python 3.8+ & 虚拟环境**

**Python最低要求：Python 3.6+**

使用本地Python环境部署：

### 安装包

```shell
pip install pyqt5
pip install qscintilla
```

运行`main.py`或在命令行使用：

```shell
python main.py
```

## Pyinstaller本地打包（可选）

也可以选择本地打包一份可执行文件，安装`pyinstaller`包：

```shell
pip install pyinstaller
```

```shell
pyinstaller (-F) main.py window.py
```

`-F`为可选参数，表示是否打包为文件。

打包完成后，在`dist`文件夹内找到`main.exe`可执行文件打开即可。
