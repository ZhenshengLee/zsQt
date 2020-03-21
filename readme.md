# zsqt

- 使用cmake 而不是qmake
- 使用qml(qt quick app)而不是qt widgets
-

## 参考

https://retifrav.github.io/blog/2019/05/11/vscode-cmake-qt/

https://doc.qt.io/qt-5/cmake-manual.html


## 关于构建系统

After numerous promises of how Qbs will be the Qt’s default build system, The Qt Company suddenly killed it, announced that qmake is a dead man walking too, and actually Qt is switching to CMake.

应该使用cmake

同时要能够看懂qmake

本项目同时使用cmake and qmake，拒绝自动生成，全手写

## 关于qt widgets和qml

In summary, what I would suggest is to use Qt Widgets if you only aim to design a native looking desktop application without animations, fancy transitions or touch inputs. It will still allow you to integrate Qt Quick/QML in some parts of the UI by using QQuickWidget. For everything else, I would recommend to use Qt Quick/QML.

Need a modern fluid interface? Use Quick/QML.
Need a touch-friendly interface? Use Quick/QML.
Needs a language which designers can tinker with? Use Quick/QML.

qt widgets适用于键盘鼠标交互的桌面程序，而qml适用于现代移动和嵌入式设备交互程序（如汽车）

- 了解widgets，并且学会使用其他软件系统提供给qt的插件，如pcl::qt
- 重点掌握qml,并且学会使用在移动设备上进行编程

### pcl对qt的支持情况

## 程序文件组织

- c文件，h文件，ui文件均放置在src目录下，资源文件放置在res文件夹下
- src文件夹下根据不同功能模块来设置文件夹
