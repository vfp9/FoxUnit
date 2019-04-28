# FoxUnit 1.5 完整更新历史

## FXU.PRG 

* 更改版本信息常量 C_Version 以反映完整的次要版本信息（1.2  - > 1.5）。
* 添加了有关通过EXTERNAL构建时需要的文件的编译器信息（仍然不完整）。
* 重写在交互式启动期间的代码和调用（例如，不会两次调用GetFoxUnitForm（））。
* 使类 fxu 使用 FxUInstance 并清理无用的注释代码。
* 添加了 GetFoxUnitPath（）函数。
* 删除了函数 ManageFxuClassFactory（）。
* 删除了函数 CheckPath（）。
* 删除了函数 GetTestsDir（）。
* 添加了FXUShowForm（）功能（取自FXUShowForm.prg）。
* 使函数 createFxuResultsAddAllTestsAndRun（）使用 FxuInstance 修复bug，引入新变量lnTest来替换循环中的变量I，因为它与子调用中具有相同名称的变量冲突。

## FXUAssertions.prg 

* 使类 FxuAssertions 使用 FxuInstance。
* 增加新属性 ioFxuInstance。
* 强制将FxuInstance对象传递给Init（），该对象存储在ioFxuInstance中。

##  FXUNewObject.prg, FXUShowForm.prg 

* 从项目中 移除 / 排除 

##  FXUResultData.prg 

* 与 FXUAssertions 基本相同。

##  FXUTestCase.prg 

* 与 FXUAssertions 基本相同。
* 与 ilSuccess 属性相关的 BugFix。

## FXUTestCaseEnumerator.prg 

* 与 FXUAssertions 基本相同。 

##  FXUTestResult.prg 

* 与 ilCurrentResult 相关的 BugFix。 
 

##  FXUTestSuite.prg 

* 与 FXUAssertions 基本相同。 

## Fxu.vcx 

* 增加类 FxuInstance 
* 类 FrmFoxUnit 
	* 使表单可以使用 FxuInstance。
	* 增加新属性 ioFxuInstance。
	* 强制将FxuTestBroker对象传递给Init()，该对象存储在ioTestBroker中，其FxuInstance对象ioFxuInstance也存储在FrmFoxUnit的ioFxuInstance中。
	* 将Load（）中的一半代码移动到Init（）（依赖于或者可以使用FxuInstance进行优化，而FxuInstance在Load（）中尚不可用）。
	* 实验：使 DetailsZoom（）在VFP内置的备注编辑窗口中打开详细信息而不是frmShowInfo。 目标是改善体验并保存代码。
	* 与BINDEVENTS（）一起使用的方法使用正确的数据工作期。
	* 更改了多个控件的 Picture 属性以直接指向图形文件，因此编译时需要这些图形文件。
	* 使一些控件的Init（）等到 thisform.icgridrs 有效（他们的 Init（）在 form 的 Init（）之前被调用但是一些东西从Load（）移到了Init（）所以并不是所有都可用在控件的 Init（））。
	
	* Made Init() of some controls to wait until thisform.icgridrs gets valid (their Init()s are called before form's Init() but some stuff that has moved from Load() to Init() and so not everything is already available in control's Init()s). 
* Class FrmNewTestClass 
	* Made form use FxuInstance. 
	* Introduced new property ioFxuInstance. 
	* Enforced passing FxuInstance object to Init() which gets stored in ioFxuInstance. 
	* Moved all code away from Load(). 
	* Refactored SaveSettings() and RestoreSettings() methods, made them process user names containing up to 15 characters (instead of only 10 before) without losing existing settings stored in files. 
	* Changed code in txtTestClassName.Valid() event to only change enabled state of cmdCreate instead of forcing user to type some chars to be able to leave the field. 
* Class FxuFrmLoadClass 
	* Changed Picture properties of multiple controls to point to graphics files directly and therefore make compiler require those graphics files. 
* Class FxuFrmTestBroker 
	* Made form use FxuInstance. 
	* Introduced new property FxuInstance. 
	* Enforced passing FxuInstance object to Init() which gets stored in FxuInstance. 
