**********************************************************************
DEFINE CLASS FxuResultExceptionInfo as FxuCustom OF FxuCustom.prg
**********************************************************************

	#IF .f.
		LOCAL this as FxuResultExceptionInfo OF FxuResultExceptionInfo.prg
	#ENDIF
	
	DIMENSION iaStackInfo[1,1]
	ioException = .NULL.
	icMessage = ''
	inErrorNumber = 0
	inLineNumber = 0
	icProcedure = ''
	icLineContents = ''
	
	********************************************************************
	FUNCTION SetExceptionInfo(toException as Exception, taStackInfo)
	********************************************************************
	
		this.ioException = toException
		this.icMessage = toException.Message
		this.inErrorNumber = toException.ErrorNo
		this.inLineNumber = toException.LineNo
		this.icProcedure = toException.Procedure
		this.icLineContents = toException.LineContents
		=ACOPY(taStackInfo,this.iaStackInfo)
		
	
	********************************************************************
	ENDFUNC
	********************************************************************
	
	********************************************************************
	FUNCTION ToString(toException as Exception)
	********************************************************************
	
	
		IF EMPTY(toException)
			IF !ISNULL(this.ioException)
				toException = this.ioException
			ELSE
				RETURN ''
			ENDIF
		ENDIF
		
		LOCAL lcException
		
		lcException = ("********错误/异常 **********" + CHR(10))
		
		lcException = (lcException + toException.Procedure + " 第 " + TRANSFORM(toException.LineNo) + " 行存在错误。" )
			
		lcException = lcException + (CHR(10))
		
		lcException = lcException + ("错误编号： " + TRANSFORM(toException.ErrorNo))
		
		lcException = lcException + (CHR(10))
		
		lcException = lcException + ("错误消息： " + toException.Message)
		
		lcException = lcException + CHR(10)
		
		lcException = lcException + ("******** 产生错误的代码 **********" + CHR(10))
		
		lcException = lcException + (toException.LineContents + CHR(10))
		
		lcException = lcException + ("*********************************" + CHR(10))
		
		RETURN lcException
	
	********************************************************************
	ENDFUNC
	********************************************************************

**********************************************************************
ENDDEFINE && CLASS
**********************************************************************