# FoxUnit Folders

FoxUnit项目的文件夹层次结构包含五个目录：

`.\Documentation` 包含文本文件，提供有关FoxUnit项目的一般信息以及许可证和开发人员信息。

`.\Graphics` 存放整个FoxUnit项目中使用的所有图片和图标文件 - 没有屏幕截图或其他文档文件。

`.\Source` FoxUnit源代码文件。

`.\Text` 包含两个内置测试用例的模板资源文件。

`.\Tests` 提供了一个存储测试的地方 -  FoxUnit提供的测试可以从一开始就在这里找到。

位于这些子目录中的所有文件都包含在构建的FoxUnit应用程序文件中。 如果要将FoxUnit部署到开发人员团队，只需提供FoxUnit应用程序文件和类工厂基表（见下文）。 您还可以使用SCC系统部署FoxUnit，因为这些所需的文件都不必是可写的。

## The FoxUnit Path

术语FoxUnit Path指的是FoxUnit项目的主目录或包含FoxUnit应用程序文件的目录（例如FoxUnit.app），具体取决于FoxUnit的启动方式。 如果FoxUnit是通过执行FXU.PRG运行的，那么FoxUnit Path就是FoxUnit.pjx的路径。 如果FoxUnit作为已编译的二进制文件（例如FoxUnit.app）启动，则FoxUnit路径是包含该文件的目录。 根据自述文件中提到的建议，必须在Visual FoxPro搜索路径中配置FoxUnit路径。 因此，FoxUnit Path应该是存储可重用测试用例类及其相应模板文件的首选。

## The FoxUnit Data Path

这是存储测试结果和FoxUnit设置的地方。 FoxUnit数据路径始终指向名为Tests的目录，但该目录是特定于项目的。 如果有可用的项目，FoxUnit数据路径是项目主目录的子文件夹 Tests。 如果没有可用的项目，则FoxUnit数据路径是当前目录的子文件夹 Tests。

## `FxuClassFactoryBase.dbf`

类工厂基表

这个文件对FoxUnit的类工厂至关重要。 它必须位于FoxUnit路径中。 它不需要是可写的。 如果它丢失或损坏，FoxUnit将无法启动。

## `FxuClassFactory.dbf`

The class factory table

The second file the FoxUnit class factory works with. This table is also located in the FoxUnit Path, but is created automatically if it doesn't exist. 

## `FXURresults.dbf`

FoxUnit results

Test results are stored in these table files. Because test results are project specific in most cases, the test result files are stored in the FoxUnit Data Path.

## `FXUPersist*.xml`

FoxUnit settings files

Several forms used in FoxUnit persist their settings in this sort of file. All settings are saved per user and the files are stored in the FoxUnit Data Path, so actually all settings are maintained per user and per project. Because of their volatile nature, these files are also not deployed in FoxUnit download packages.
