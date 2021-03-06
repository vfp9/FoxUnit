*
*  FXUInheritsFromFXUTestCase.PRG
*  RETURNs a logical value indicating whether
*  the passed ClassName, ClassLibrary ultimately
*  inherits from FXUTestCase.PRG/FXUTestCase
*
*  lParameters
*     tcClass (R) ClassName of the class to be tested
*  tcClassLib (R) ClassLib (.PRG) containing the class to be tested
*
LPARAMETERS tcClass, tcClassLib

IF PCOUNT() < 2 ;
     OR (ISNULL(m.tcClass) OR ISNULL(m.tcClass)) ;
     OR (EMPTY(m.tcClass) OR EMPTY(m.tcClassLib)) ;
     OR (NOT VARTYPE(m.tcClass)="C" OR NOT VARTYPE(m.tcClassLib)="C") 
  ASSERT .f. message "尚未正确传递所需的 tcClass 和 tcClassLib 参数。"
  RETURN .f.
ENDIF

IF UPPER(ALLTRIM(m.tcClass)) == UPPER("FXUTestCase") ;
     AND UPPER(JUSTSTEM(m.tcClassLib)) == UPPER("FXUTestCase")
  *
  *  FXUTestCase, FXUTestCase.PRG was passed
  *     
  RETURN .t.
ENDIF

IF OCCURS(".",m.tcClassLib)>0 AND NOT UPPER(JUSTEXT(m.tcClassLib)) == "PRG"
  ASSERT .f. message "tcClassLib 参数必须作为带有 .PRG 扩展名的文件名传递"
  RETURN .f.
ENDIF

IF NOT FILE(m.tcClassLib)
  ASSERT .f. MESSAGE "无法定位 " + m.tcClassLib
  RETURN .f.
ENDIF

LOCAL loObject, lcClass, lcClassLib, llRetVal
lcClass = UPPER(ALLTRIM(m.tcClass))
lcClassLib = UPPER(ALLTRIM(m.tcClassLib))
*
*  instantiate the passed class, to check its inheritance
*
IF VERSION(5) >= 900
  *  VFP 9 or higher, pass 0 as 3rd parameter to NEWOBJECT()
  *  to suppress the Init() altogether
  TRY
  loObject = NEWOBJECT(m.lcClass,m.lcClassLib,0)
  CATCH
  ENDTRY
 ELSE  
  *  VFP 8
  TRY
  LOCAL loTestResult
  loTestResult = NEWOBJECT("FxuTestResult","FxuTestResult.prg")
  loObject = NEWOBJECT(m.lcClass,m.lcClassLib,.NULL.,loTestResult)
  CATCH
  ENDTRY
ENDIF
IF NOT VARTYPE(m.loObject) = "O"
  ASSERT .f. MESSAGE "无法实例化 " + m.lcClass + "," + m.lcClassLib
 ELSE
  LOCAL laClasses[1]
  IF ACLASS(laClasses,m.loObject) > 0
    llRetVal = ASCAN(laClasses,"FXUTestCase",1,-1,1,15)>0
  ENDIF
ENDIF
TRY
*  suppress any loObject::Destroy() errors in VFP8
loObject = .NULL.
CATCH
ENDTRY

RETURN m.llRetVal
 