<p align="center">
 <img width="100px" src="https://blog.programapps.top/file/images/C-language.png" align="center" alt="CLangIDE" />
 <h1 align="center">CLangIDE</h2>
 <p align="center">一个简洁、美观的原生C/C++集成开发环境（IDE）</p>
</p>

Release发行版支持：`Windows/Win7+`

CLangIDE使用`PyQt`制作，打造基于`MinGW/GCC`的纯原生集成开发环境IDE

由于GCC编译器后缀的限制，编辑器将识别配置文件`config/config.ini`来保存源代码并确定源代码类型；若为C语言，则保持默认（写入内容为`c`），若为C++，则写入内容`cpp`。

## 功能

- [x] 基本编辑文本
- [x] 代码补全（未发布Release版本）
- [x] 高亮编辑
- [x] 居中编辑器
- [x] 布局排版设计
- [x] 设置页面（未发布Release版本）
- [x] 字体设置（未发布Release版本）
- [x] 编译设置（未发布Release版本）
- [x] 错误判断与显示（未发布Release版本）
- [x] 可以编译且自带编译器（不用配置环境即可使用）
- [ ] 多文件选项卡
- [ ] 更多……

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
pyinstaller (-F) -w -i ./bin/window.ico main.py
```

`-F`为可选参数，表示是否打包为文件。

打包完成后，在`dist`文件夹内找到`main.exe`可执行文件打开即可。

## 截图

### ![主窗口](/bin/images/a.png)
### ![关于信息](/bin/images/b.png)
### ![一个C语言程序](/bin/images/c.png)
### ![程序编译与运行](/bin/images/d.png)

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=program-zoubg/CLangIDE&type=Date)](https://star-history.com/#program-zoubg/CLangIDE&Date)

