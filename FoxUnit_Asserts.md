## FoxUnit 代码示例

注意：每个 **测试类(Test Class)** 都可以包含多个 **测试(Tests)**, 你只需在类中定义不同的过程即可。


	Define Class CustomerTestClass As FxuTestCase Of FxuTestCase.prg

		oObject = .Null.

		Procedure Setup
		This.oObject = Createobject("cCustomerClass")
		Endproc

		Procedure testGetCustomer
			llReturn = This.oObject.GetCustomer("AKSEL")
			This.AssertTrue(llReturn, "Customer number not found.")
			If llReturn
				This.MessageOut("Customer name is  " + This.oObject.CustName)
			Endif
		Endproc

		Procedure testRaiseCreditLimit
			loCustomer = This.oObject
			lnOriginalCreditLimit = loCustomer.oData.credit_limit
			loCustomer.SetCreditLimit(lnOriginalCreditLimit + 100)
			This.AssertTrue(loCustomer.oData.credit_limit > lnOriginalCreditLimit, "Error: Credit limit not increased.")
		Endproc
		
		Procedure TearDown()
		&& Add any cleanup code here.
		Endproc
	EndDefine


**Asserts**
这些Assert方法可用于根据预期值测试实际值，并在不满足Assert语句时显示输出文本。

	AssertEquals(tuExpectedValue, tuExpression, tcMessage,tuNonCaseSensitiveStringComparison)
	(AssertEquals 现在接受对象和变量)
	AssertEqualsArrays(@taArray1, @taArray2, tcMessage)
	AssertNotEqualsArrays(@taArray1, @taArray2, tcMessage)

	AssertTrue(tuExpression, tcMessage)
	AssertFalse(tuExpression, tcMessage)
	AssertNotEmpty(tuExpression, tcMessage)
	AssertNotNull(tuExpression, tcMessage)
	AssertNotNullOrEmpty(tuExpression, tcMessage)

	AssertIsObject(toObject, tcMessage)
	AssertIsNotObject(toObject, tcMessage)

	AssertHasError(tcMessage, toException, taStackInfo)
	AssertHasErrorNo(tcMessage, toException, tnErrorNo, taStackInfo)

	AssertNotImplemented(tcMessage)  (新测试的新默认返回值)


**其他方法**
此外，在创建测试时经常使用这些方法：


	SetUp() && 在每次测试开始时自动调用
	TearDown() && 在每次测试结束时自动调用
	MessageOut(tcMessage) && 在 UI 中显示消息


* **Setup()** 方法应包含每个测试所需的任何公共代码 - 例如设置路径或实例化对象。
* **TearDown()** 方法包含应在每个测试方法结束时运行的任何清理代码。
* **MessageOut()** - 用于任何你想在 FoxUnit UI 的消息面板中显示的任何的文本。
