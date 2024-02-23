"""
LICENSE: GPL v3
Author: Program-zoubg
Copyright (c) CLangIDE 2024

██████╗ ██████╗  ██████╗  ██████╗ ██████╗  █████╗ ███╗   ███╗     ███████╗ ██████╗ ██╗   ██╗██████╗  ██████╗
██╔══██╗██╔══██╗██╔═══██╗██╔════╝ ██╔══██╗██╔══██╗████╗ ████║     ╚══███╔╝██╔═══██╗██║   ██║██╔══██╗██╔════╝
██████╔╝██████╔╝██║   ██║██║  ███╗██████╔╝███████║██╔████╔██║█████╗ ███╔╝ ██║   ██║██║   ██║██████╔╝██║  ███╗
██╔═══╝ ██╔══██╗██║   ██║██║   ██║██╔══██╗██╔══██║██║╚██╔╝██║╚════╝███╔╝  ██║   ██║██║   ██║██╔══██╗██║   ██║
██║     ██║  ██║╚██████╔╝╚██████╔╝██║  ██║██║  ██║██║ ╚═╝ ██║     ███████╗╚██████╔╝╚██████╔╝██████╔╝╚██████╔╝
╚═╝     ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝  ╚═════╝

 ██████╗██╗      █████╗ ███╗   ██╗ ██████╗ ██╗██████╗ ███████╗
██╔════╝██║     ██╔══██╗████╗  ██║██╔════╝ ██║██╔══██╗██╔════╝
██║     ██║     ███████║██╔██╗ ██║██║  ███╗██║██║  ██║█████╗
██║     ██║     ██╔══██║██║╚██╗██║██║   ██║██║██║  ██║██╔══╝
╚██████╗███████╗██║  ██║██║ ╚████║╚██████╔╝██║██████╔╝███████╗
 ╚═════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝╚═════╝ ╚══════╝
"""

import sys
import os
from PyQt5.QtWidgets import (QApplication, QMainWindow, QDesktopWidget, QMessageBox, QAction, QStatusBar, QFileDialog,
                             QInputDialog, QLineEdit, QWidget, QComboBox, QPushButton, QGroupBox, QVBoxLayout,
                             QHBoxLayout, QPlainTextEdit)
from PyQt5.Qsci import QsciScintilla, QsciLexerCPP, QsciAPIs
from PyQt5.QtGui import QFont, QColor, QIcon, QPixmap, QFontDatabase

with open('config/config.ini', 'r') as f:
    if f.read() == 'cpp':
        codetype = 'cpp'
    else:
        codetype = 'c'
filename = f"untitled.{codetype}"
IsSave = False

with open('config/font.ini', 'r') as f:
    fontname = f.read()

with open('config/addtext.ini', 'r') as f:
    compile_add_text = f.read()

with open('config/font_size.ini', 'r') as f:
    try:
        fontsize = int(f.read())
    except Exception as e:
        QMessageBox.warning(QWidget(), "Error", f"Return error：\n{e}")


# Highlight of C/C++
class highlight(QsciLexerCPP):
    def __init__(self, parent):
        QsciLexerCPP.__init__(self, parent)
        global fontname, fontsize
        font = QFont()
        font.setFamily(fontname)
        font.setPointSize(fontsize)
        self.setFont(font)
        self.setFont(QFont(fontname, fontsize, italic=True), QsciLexerCPP.Comment)
        self.setFont(QFont(fontname, fontsize, italic=True), QsciLexerCPP.CommentLine)
        self.setFont(QFont(fontname, fontsize, weight=QFont.Bold), QsciLexerCPP.Keyword)


# Class of Compile Setting window
class CompileSetting(QWidget):
    def __init__(self):
        super().__init__()
        try:
            self.setWindowTitle('Compile Setting')
            self.setGeometry(100, 100, 500, 500)

            self.font_layout = QHBoxLayout()
            self.compile_layout = QHBoxLayout()
            self.font_group = QGroupBox("Fonts")
            self.compile_group = QGroupBox("Compile")
            self.boxlayout = QVBoxLayout()

            self.center()

            icon = QIcon()
            icon.addPixmap(QPixmap("./bin/window.ico"), QIcon.Normal, QIcon.Off)
            self.setWindowIcon(icon)

            font = QFont()
            font.setPointSize(10)
            self.setFont(font)

            fonts = QFontDatabase().families()

            # Show Fonts family
            self.combo = QComboBox(self)
            self.font_layout.addWidget(self.combo)
            for font in fonts:
                self.combo.addItem(font)
            global fontname, fontsize
            self.combo.setCurrentText(fontname)
            self.font_size_edit = QLineEdit(self)
            self.font_size_edit.setText(str(fontsize))
            self.font_layout.addWidget(self.font_size_edit)
            push_button_ok = QPushButton('确定', self)
            push_button_ok.clicked.connect(self.push_ok)

            self.compile_text = QPlainTextEdit(self)
            global compile_add_text
            self.compile_text.setPlainText(compile_add_text)
            self.compile_layout.addWidget(self.compile_text)

            # create the central widget
            self.setLayout(self.boxlayout)
            self.font_group.setLayout(self.font_layout)
            self.compile_group.setLayout(self.compile_layout)
            self.boxlayout.addWidget(self.font_group)
            self.boxlayout.addWidget(self.compile_group)
            self.boxlayout.addWidget(push_button_ok)
        except Exception as e:
            QMessageBox.warning(self, "Error", f"Return error：\n{e}")

    # Copy of Main window (x, y)
    def center(self):
        screen = QDesktopWidget().screenGeometry()
        sizes = self.geometry()
        WindowLeft, WindowTop = int((screen.width() - sizes.width()) / 2), int((screen.height() - sizes.height()) * (1 - 0.618))  # It's pure beauty. It's the golden ratio.
        self.move(WindowLeft, WindowTop)

    def push_ok(self):
        global fontname, compile_add_text, fontsize
        with open('config/font.ini', 'w') as f:
            fontname = self.combo.currentText()
            f.write(fontname)
        with open('config/addtext.ini', 'w') as f:
            compile_add_text = self.compile_text.toPlainText()
            f.write(compile_add_text)
        with open('config/font_size.ini', 'w') as f:
            fontsize = self.font_size_edit.text()
            f.write(fontsize)
            fontsize = int(fontsize)
        self.close()


# Class of Main window
class TextEditor(QMainWindow):
    def __init__(self):
        super().__init__()

        # Global
        self.setWindowTitle("CLangIDE - " + filename)
        self.setGeometry(100, 100, 800, 600)
        self.center()
        icon = QIcon()
        icon.addPixmap(QPixmap("./bin/window.ico"), QIcon.Normal, QIcon.Off)
        self.setWindowIcon(icon)

        font = QFont()
        font.setPointSize(10)
        self.setFont(font)

        # Editor
        self.editor = QsciScintilla(self)
        self.setCentralWidget(self.editor)
        self.lexer = highlight(self)
        self.editor.setLexer(self.lexer)
        self.__api = QsciAPIs(self.lexer)
        autocode = ['if', 'else', 'while', 'signed', 'throw', 'union', 'this', 'int',
                    'char', 'double', 'unsigned', 'const', 'goto', 'virtual', 'for', 'float',
                    'break', 'continue', 'auto', 'class', 'operator', 'case', 'do', 'long',
                    'typedef', 'static', 'friend', 'template', 'default', 'new', 'void', 'register',
                    'extern', 'return', 'enum', 'inline', 'try', 'short', 'sizeof', 'switch', 'private',
                    'protected', 'asm', 'catch', 'delete', 'public', 'volatile', 'struct', '#include',
                    'string', 'bool', 'namespace', 'printf', 'using', '#ifndef', '#endif', 'std']
        self.editor.setAutoCompletionThreshold(1)
        for ac in autocode:
            self.__api.add(ac)
        self.__api.prepare()
        self.editor.autoCompleteFromAll()
        self.editor.setAutoCompletionSource(QsciScintilla.AcsAll)
        self.editor.setAutoCompletionCaseSensitivity(True)
        self.editor.setAutoCompletionReplaceWord(False)
        self.editor.setAutoCompletionUseSingle(QsciScintilla.AcusExplicit)
        self.editor.setCaretLineVisible(True)
        self.editor.setCaretLineBackgroundColor(QColor('lightyellow'))
        self.editor.setIndentationsUseTabs(True)
        self.editor.setIndentationWidth(4)
        self.editor.setIndentationGuides(True)
        self.editor.setTabIndents(True)
        self.editor.setAutoIndent(True)
        self.editor.setTabWidth(4)
        self.editor.setMarginsFont(font)
        self.editor.setMarginLineNumbers(0, True)
        self.editor.setMarginWidth(0, '000')
        self.editor.setMarkerForegroundColor(QColor("white"), 0)
        self.editor.setEolMode(QsciScintilla.EolUnix)
        self.editor.setAutoIndent(True)
        self.editor.setUtf8(True)
        self.editor.textChanged.connect(self.Changed)

        # StatusBar
        self.statusbar = QStatusBar(self)
        self.setStatusBar(self.statusbar)

        # Menu
        self.menu = self.menuBar()
        self.FileOperator = self.menu.addMenu("文件")
        self.TextOperator = self.menu.addMenu("编辑")
        self.RunOperator = self.menu.addMenu("运行")
        self.SettingOperator = self.menu.addMenu("设置")
        self.HelpOperator = self.menu.addMenu("帮助")
        # FileOperator
        self.NewAction = QAction("新建", self)
        self.NewAction.setStatusTip("新建一个源代码文件")
        self.NewAction.setShortcut("Ctrl+N")
        self.NewAction.triggered.connect(self.NewFile)
        self.FileOperator.addAction(self.NewAction)
        self.OpenAction = QAction("打开", self)
        self.OpenAction.setStatusTip("打开一个源代码文件")
        self.OpenAction.setShortcut("Ctrl+O")
        self.OpenAction.triggered.connect(self.OpenFile)
        self.FileOperator.addAction(self.OpenAction)
        self.SaveAction = QAction("保存", self)
        self.SaveAction.setStatusTip("保存源代码文件")
        self.SaveAction.setShortcut("Ctrl+S")
        self.SaveAction.triggered.connect(self.savefile)
        self.FileOperator.addAction(self.SaveAction)
        self.SavesAction = QAction("另存为", self)
        self.SavesAction.setStatusTip("另存为源代码文件")
        self.SavesAction.setShortcut("Ctrl+Shift+S")
        self.FileOperator.addAction(self.SavesAction)
        self.CloseAction = QAction("退出", self)
        self.CloseAction.setStatusTip("退出进程并关闭窗口")
        self.CloseAction.setShortcut("Ctrl+Q")
        self.CloseAction.triggered.connect(self.close)
        self.FileOperator.addAction(self.CloseAction)
        # TextOperator
        self.UndoAction = QAction("撤销", self)
        self.UndoAction.setStatusTip("撤销上一步操作")
        self.UndoAction.setShortcut("Ctrl+Z")
        self.UndoAction.triggered.connect(self.editor.undo)
        self.RedoAction = QAction("重做", self)
        self.RedoAction.setStatusTip("重做上一步操作")
        self.RedoAction.setShortcut("Ctrl+Shift+Z")
        self.RedoAction.triggered.connect(self.editor.redo)
        self.CutAction = QAction("剪切", self)
        self.CutAction.setStatusTip("剪切文本到其他地方")
        self.CutAction.setShortcut("Ctrl+X")
        self.CutAction.triggered.connect(self.editor.cut)
        self.CopyAction = QAction("复制", self)
        self.CopyAction.setStatusTip("复制文本到其他地方")
        self.CopyAction.setShortcut("Ctrl+C")
        self.CopyAction.triggered.connect(self.editor.copy)
        self.PAction = QAction("粘贴", self)
        self.PAction.setStatusTip("把剪贴板里的文本拷贝到此处")
        self.PAction.setShortcut("Ctrl+V")
        self.PAction.triggered.connect(self.editor.paste)
        self.TextOperator.addAction(self.UndoAction)
        self.TextOperator.addAction(self.RedoAction)
        self.TextOperator.addAction(self.CutAction)
        self.TextOperator.addAction(self.CopyAction)
        self.TextOperator.addAction(self.PAction)
        # RunOperator
        self.CompileAction = QAction("编译", self)
        self.RunAction = QAction("运行", self)
        self.CompileAndRunAction = QAction("编译并运行", self)
        self.CompileAction.setShortcut("F5")
        self.RunAction.setShortcut("F10")
        self.CompileAndRunAction.setShortcut("F11")
        self.CompileAction.setStatusTip("编译源代码并生成可执行程序")
        self.RunAction.setStatusTip("运行可执行程序")
        self.CompileAndRunAction.setStatusTip("编译源代码生成可执行程序并运行")
        self.CompileAction.triggered.connect(self.compile_btn)
        self.RunAction.triggered.connect(self.run_btn)
        self.CompileAndRunAction.triggered.connect(self.CompileAndRun_btn)
        self.RunOperator.addAction(self.CompileAction)
        self.RunOperator.addAction(self.RunAction)
        self.RunOperator.addAction(self.CompileAndRunAction)
        # SettingOperator
        self.CompileSettingAction = QAction("编译器选项", self)
        self.CompileSettingAction.setShortcut("Ctrl+Alt+L")
        self.CompileSettingAction.setStatusTip("对编译器进行详细配置")
        self.CompileSettingAction.triggered.connect(self.compilesetshow)
        self.SettingOperator.addAction(self.CompileSettingAction)
        # HelpOperator
        self.AboutAction = QAction("关于CLangIDE", self)
        self.AboutAction.setStatusTip("关于CLangIDE的更多信息")
        self.AboutAction.triggered.connect(self.about)
        self.HelpOperator.addAction(self.AboutAction)

    def Changed(self):
        global IsSave
        IsSave = False
        self.setWindowTitle("CLangIDE - " + filename + "*")
        # Global Font name changed
        global fontname
        font = QFont()
        font.setFamily(fontname)
        font.setPointSize(fontsize)
        self.lexer.setFont(font)

    def center(self):
        screen = QDesktopWidget().screenGeometry()
        sizes = self.geometry()
        WindowLeft, WindowTop = int((screen.width() - sizes.width()) / 2), int((screen.height() - sizes.height()) * (1 - 0.618))  # It's pure beauty. It's the golden ratio.
        self.move(WindowLeft, WindowTop)

    def compile_btn(self):
        try:
            global filename, compile_add_text
            self.savefile()
            h = os.system(f"bin\\MinGW\\bin\\g++.exe -o {filename}.exe {filename} {compile_add_text}")
            if h != 0:
                os.system(f'start cmd /C "bin\\MinGW\\bin\\g++.exe -o {filename}.exe {filename} {compile_add_text} & pause"')
                return 1
            else:
                return 0
        except Exception as e:
            QMessageBox.warning(self, "Error", f"Return error：\n{e}")

    def run_btn(self):
        try:
            global filename
            os.system(f'start cmd /C "{filename}.exe & @echo. & @echo ------------------------------ & pause"')
        except Exception as e:
            QMessageBox.warning(self, "Error", f"Return error：\n{e}")

    def CompileAndRun_btn(self):
        try:
            ifok = self.compile_btn()
            if ifok != 1:
                self.run_btn()
        except Exception as e:
            QMessageBox.warning(self, "Error", f"Return error：\n{e}")

    def NewFile(self):
        try:
            global filename, codetype
            self.editor.setText("")
            filename = f"untitled.{codetype}"
            self.setWindowTitle("CLangIDE - " + filename + "*")
        except Exception as e:
            QMessageBox.warning(self, "Error", f"Return error：\n{e}")

    def savefile(self):
        try:
            global filename, codetype
            if f"untitled.{codetype}" == filename:
                filews = QMessageBox.question(self, "重命名", "是否重命名？",
                                                        QMessageBox.Yes | QMessageBox.No,
                                                        QMessageBox.Yes)
                if filews == QMessageBox.Yes:
                    filename, ok = QInputDialog.getText(self, "重命名", "请输入重命名标题：", QLineEdit.Normal, "title")
                    filename = filename+"."+codetype
            savefile = open(filename, 'w+', encoding='utf-8')
            will = self.editor.text()
            savefile.write(will)
            savefile.close()
            global IsSave
            IsSave = True
            self.setWindowTitle("CLangIDE - " + filename)
        except Exception as e:
            QMessageBox.about(self, "错误", f"发生错误：\n{e}")

    def OpenFile(self):
        try:
            global filename, IsSave
            filename, _buff = QFileDialog.getOpenFileName(self, '打开', './', '源代码 (*.*)')
            if filename:
                if not IsSave:
                    filews = QMessageBox.question(self, "未保存", "是否保存？",
                                                            QMessageBox.Yes | QMessageBox.No,
                                                            QMessageBox.Yes)
                    if filews == QMessageBox.Yes:
                        self.savefile()
                self.editor.setText("")
                with open(filename, 'r', encoding='utf-8') as obj:
                    for objs in obj.readlines():
                        self.editor.setText(self.editor.text() + objs)
                filename = filename.replace("/", "\\")
                self.setWindowTitle("CLangIDE - " + filename)
            IsSave = True
        except Exception as e:
            QMessageBox.about(self, "错误", f"发生错误：\n{e}")

    def about(self):
        ideversion = "1.1.1 2024.2 Release"
        QMessageBox.about(self, "关于CLangIDE",
                                    f"Copyright (c) 2024 CLangIDE\n\nC/C++ Core: MinGW-w64\nCLangIDE version: {ideversion}\nCompile Core: GCC\nOpen Source: Github - Program-zoubg/CLangIDE\nOpen Source LICENSE: GPL v3\n\nThank you!")

    def compilesetshow(self):
        self.compile_window = CompileSetting()
        self.compile_window.show()


if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = TextEditor()
    window.show()
    sys.exit(app.exec_())

