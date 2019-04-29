FAQ

Q.  什么是 FoxUnit?
A.  FoxUnit 是针对 Microsoft Visual FoxPro 的开源单元测试框架。它是基于 Kent Beck 所著《Test Driven Development by Example》一书中的单元测试框架，但它仅仅是针对 Visual FoxPro 。

Q.  运行 FoxUnit 什么运行环境?
A.  FoxUnit 需要 Microsoft Visual FoxPro 8 或更高版本。如果运行于 VFP 9, 则可利用 VFP 9 中的用户界面增强功能。


Q.  我们为什么需要它?
A.  我们希望，FoxUnit 将促进 Visual FoxPro 的测试驱动开发模式，从而扩展 Visual FoxPro 开发者所关注的领域。

FoxUnit 快速指南 	

启动并运行 FoxUnit 的步骤:

1. 下载解压 FOXuNIT 压缩包到您项目文件夹下 (请确保是 FoxUnit 文件夹）。您需要将 FoxUnit 文件夹添加到您的 VFP 路径。你也可以通过 Thor 来安装 FoxUnit 。

强烈建议：, 在项目目录下添加一个 Tests 文件夹，并将其添加到搜索路径中。您应当将 tests 文件夹加入到项目中，以便源代码管理工具也可以使用它。针对测试去dog开发模式，在重构过程中进行测试并记录测试目的，这是至关重要的一个步骤。

2. 在命令窗口执行 Do FXU.prg 或 FoxUnit.app 。如果你使用 Thor 的自定义菜单，可以定义一个快捷键来运行 FoxUnit.app(例如：Ctrl+Alt_U)

3. 第一次增加测试类，点击【创建新的测试类】按钮。如果你将测试类放在 tests 文件夹，那么在 inputbox 里一定要键入路径（例如：Tests\MyFirstTestClass）。

一个测试类将显示在代码编辑窗口。FoxUnit 将以自己的方式式承认任何在 FxuTestCase 超类中尚未声明的方法名称。在类中增加方法，并在方法中增加一个或几个断点，用这样的方式可以测试其他附加的功能。记住它，虽然它是一个很小的步骤。

这里存在三个重要的方法：AssertEquals, AssertTrue, 和 AssertNotNull。虽然有其他方法也可以实现，但是它们是更好的方式。这些方法可以用来显示测试意图、测试和将被测试的代码。智能感应可以用于这些方法。一个示例：this.AssertEquals(1,1,'1等于1吗？')。结果将会成功通过测试（并给我们一个绿色标记！！！）。

针对每一个 vfp 类（对象）创建一个单独的测试类并在其中每个方法中设置多个断点是一个好主意，测试类的 Setup() 方法用于实例化对象。如果测试后你需要清理，那么可以在 TearDown() 中执行清理过程。
