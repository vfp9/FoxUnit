## 更新历史

**Version 1.7 - November 28, 2017**
* 每个测试都在其自己的数据工作期中运行，以实现最佳封装和可重复性
* 增加 [比较](FoxUnit_CompareButton.md) 功能，使分析更多的结果更容易

**Version 1.61 - September 15, 2017**
* 取消删除类工厂基表中导致 FoxUnit 在启动时失败的类
* 修复了编辑后重新加载测试的BUG。

**Version 1.6 - September 20, 2016**
* 使用Visual Studio图形库中的图标
* 将图标分组为更合理的排列，包括组标题
* 添加了使用类库中所有未实现测试创建测试类的功能
* 允许对测试成功/失败自定义颜色
* 除非打开过滤器切换，否则隐藏过滤器面板

![](FoxUnit_Changes_FoxUnitIcons.png)


**Version 1.51 - July 29, 2015**
* 将许多表单重构为新fxuFrmUser的子类，它包含ioFxuInstance对象以及SettingsSave（）和SettingsRestore（）函数。
* 移除检查所进行的测试是否在 FoxUnit Path 中
* 在fxu_fxuFrmUserTests.prg中为表单添加了更多单元测试
* 其他 U/I 清理
* 切换到FoxBin2Prg for SCM

**Version 1.5 - July 13, 2015**
* 增加新类 fxu.fxuInstance
* 移除 fxuShowForm.prg
* 移除 fxuNewObject.prg

(请在此处查看完整的更改列表 - [FoxUnit 1.5 完整更新列表](FoxUnit-1.5-Full-Changes.md))

**Version 1.42**
* Added option to retain visual results of previous tests between each run.

**Version 1.41 - November 11, 2014**
* Added a new assertion, AssertNotImplemented()
* Made that the default function call on new tests
* Changed name of new tests to testNewTest to conform with standard of test names beginning with 'test'
* The problem was that if a new test was added but no test code was written, that test would PASS. This is wrong. Now the new test will fail with a message of "Not Implemented Yet" to indicate to the developer that the test has yet to be written.

![](FoxUnit_Changes_FoxUnit-1.41-Change.png)

![](FoxUnit_Changes_FoxUnit-1.41-NewTestFails.png)


**Version 1.4 - August 1, 2014**
* Added a filter to only show failed tests
* Promoted the "Options" button to the main screen

![](FoxUnit_Changes_Changes1.png)

* Added an About tab to the Options form for easy access to the license, getting started, acknowledgments, and version history.

![](FoxUnit_Changes_Foxunit_Options.png)

* Reworked the New Test Class form (and underlying classes) for clarity

![](FoxUnit_Changes_FoxUnit_NewTestClass.png)



**Version 1.3 - July 29, 2014**
Burkhard Stiller Added these assertions:
* AssertEqualsArrays
* AssertEqualsObjects
* AssertEqualsValues
* AssertHasError
* AssertHasErrorNo
* AssertIsObject

[Eric Selje](https://github.com/ESelje) added the unit tests he uses to confirm FoxUnit hasn't broken.

**Version 1.21 - July 11, 2014**
Doug Meerschaert found a bug that caused AssertEquals to ignore the NonCaseSensitive flag. (work item 34625)

**Version 1.2 - July 9, 2014**
[Fernando Bozzo](https://github.com/fdbozzo/) introduced the following changes:

* In FXU main window, the font of editboxes was changed to Courier New to enhance output of tabular data
* Solved some historical problems with data path (or I think so, reading the comments on the code)
* Configured Anchor of textboxes used for search (conditioned for version(5) >= 900)
* Added the possibility of running FoxUnit from a CI server like CruiseControl, using this DOS syntax: <path>\foxunit.app createFxuResultsAddAllTestsAndRun
* Closed various ENDPROC/ENDFUNC
* Text logs converted using STRCONV(Logtext,9) for special characters support (Spanish, German, etc)
* Expanded the default size of the test-cases loading form because they were too small for large test names when using BDD-style naming (verbose names that describe the tests)
* Expanded the default size of the FoxUnit main window considering a minimal conservative setup of 800x600
* Expanded TClass C(80) to C(110) ==> So the Unit Test file name can be 'ut_libraryName__className__methodName.prg'
* Expanded TName C(100) to C(130) ==> So the method name can be 'SHOULD_DoSomething__WHEN_SomeConditions'
* Fxu.prg => Added AlwaysOnTop and Zoom Max when executed from CI Server (createFxuResultsAddAllTestsAndRun procedure)
* fxuresultdata.prg => Bug Fix: Found a very old bug that throws an error sometimes when filtering tests on main window and adding a new test
* All changes are backward compatible


**Version 1.11 - Nov 2013**
[Matt Slay](https://github.com/mattslay) introduced a splitter bar (using the SFSplitter Class Library) to separate the tests from the results.

**Version 1.1 - Sept 2012**
First version in VFPX. Uses changes by H. Alan Stevens which standardizes the parameter order for Assert calls.
