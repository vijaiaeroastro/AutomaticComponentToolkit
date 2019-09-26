(*++

Copyright (C) 2019 Calculation developers

All rights reserved.

This file has been generated by the Automatic Component Toolkit (ACT) version 1.6.0.

Abstract: This is an autogenerated Pascal export implementation file in order to allow easy
development of Calculation library. The functions in this file need to be implemented. It needs to be generated only once.

Interface version: 1.0.0

*)

{$MODE DELPHI}
unit calculation_exports;

interface

uses
  calculation_impl,
  calculation_types,
  calculation_interfaces,
  calculation_exception,
  Classes,
  Unit_Numbers,
  sysutils;

(*************************************************************************************************************************
 Class export definition of Base 
**************************************************************************************************************************)

(*************************************************************************************************************************
 Class export definition of Calculator 
**************************************************************************************************************************)

(**
* Adds a Variable to the list of Variables this calculator works on
*
* @param[in] pCalculator - Calculator instance.
* @param[in] pVariable - The new variable in this calculator
* @return error code or 0 (success)
*)
function calculation_calculator_enlistvariable(pCalculator: TCalculationHandle; pVariable: TCalculationHandle): TCalculationResult; cdecl;

(**
* Returns an instance of a enlisted variable
*
* @param[in] pCalculator - Calculator instance.
* @param[in] nIndex - The index of the variable to query
* @param[out] pVariable - The Index-th variable in this calculator
* @return error code or 0 (success)
*)
function calculation_calculator_getenlistedvariable(pCalculator: TCalculationHandle; nIndex: Cardinal; pVariable: PCalculationHandle): TCalculationResult; cdecl;

(**
* Clears all variables in enlisted in this calculator
*
* @param[in] pCalculator - Calculator instance.
* @return error code or 0 (success)
*)
function calculation_calculator_clearvariables(pCalculator: TCalculationHandle): TCalculationResult; cdecl;

(**
* Multiplies all enlisted variables
*
* @param[in] pCalculator - Calculator instance.
* @param[out] pInstance - Variable that holds the product of all enlisted Variables
* @return error code or 0 (success)
*)
function calculation_calculator_multiply(pCalculator: TCalculationHandle; pInstance: PCalculationHandle): TCalculationResult; cdecl;

(**
* Sums all enlisted variables
*
* @param[in] pCalculator - Calculator instance.
* @param[out] pInstance - Variable that holds the sum of all enlisted Variables
* @return error code or 0 (success)
*)
function calculation_calculator_add(pCalculator: TCalculationHandle; pInstance: PCalculationHandle): TCalculationResult; cdecl;

(*************************************************************************************************************************
 Global function export definition
**************************************************************************************************************************)

(**
* Creates a new Calculator instance
*
* @param[out] pInstance - New Calculator instance
* @return error code or 0 (success)
*)
function calculation_createcalculator(pInstance: PCalculationHandle): TCalculationResult; cdecl;

(**
* retrieves the binary version of this library.
*
* @param[out] pMajor - returns the major version of this library
* @param[out] pMinor - returns the minor version of this library
* @param[out] pMicro - returns the micro version of this library
* @return error code or 0 (success)
*)
function calculation_getversion(pMajor: PCardinal; pMinor: PCardinal; pMicro: PCardinal): TCalculationResult; cdecl;

(**
* Returns the last error recorded on this object
*
* @param[in] pInstance - Instance Handle
* @param[in] nErrorMessageBufferSize - size of the buffer (including trailing 0)
* @param[out] pErrorMessageNeededChars - will be filled with the count of the written bytes, or needed buffer size.
* @param[out] pErrorMessageBuffer -  buffer of Message of the last error, may be NULL
* @param[out] pHasError - Is there a last error to query
* @return error code or 0 (success)
*)
function calculation_getlasterror(pInstance: TCalculationHandle; nErrorMessageBufferSize: Cardinal; pErrorMessageNeededChars: PCardinal; pErrorMessageBuffer: PAnsiChar; pHasError: PByte): TCalculationResult; cdecl;

(**
* Releases shared ownership of an Instance
*
* @param[in] pInstance - Instance Handle
* @return error code or 0 (success)
*)
function calculation_releaseinstance(pInstance: TCalculationHandle): TCalculationResult; cdecl;

(**
* Acquires shared ownership of an Instance
*
* @param[in] pInstance - Instance Handle
* @return error code or 0 (success)
*)
function calculation_acquireinstance(pInstance: TCalculationHandle): TCalculationResult; cdecl;

(**
* Injects an imported component for usage within this component
*
* @param[in] pNameSpace - NameSpace of the injected component
* @param[in] pSymbolAddressMethod - Address of the SymbolAddressMethod of the injected component
* @return error code or 0 (success)
*)
function calculation_injectcomponent(pNameSpace: PAnsiChar; pSymbolAddressMethod: Pointer): TCalculationResult; cdecl;

(**
* Returns the address of the SymbolLookupMethod
*
* @param[out] pSymbolLookupMethod - Address of the SymbolAddressMethod
* @return error code or 0 (success)
*)
function calculation_getsymbollookupmethod(pSymbolLookupMethod: PPointer): TCalculationResult; cdecl;


(*************************************************************************************************************************
 Function table lookup implementation
**************************************************************************************************************************)

function _calculation_getprocaddress_internal(pProcName: PAnsiChar; out ppProcAddress: Pointer): TCalculationResult cdecl;

implementation

function calculation_calculator_enlistvariable(pCalculator: TCalculationHandle; pVariable: TCalculationHandle): TCalculationResult; cdecl;
var
  ObjectVariable: TNumbersVariable;
  ObjectCalculator: TObject;
  IntfCalculator: ICalculationCalculator;
begin
  try
    ObjectVariable := TNumbersVariable.Create(TCalculationWrapper.NumbersWrapper, pVariable);
    TCalculationWrapper.NumbersWrapper.AcquireInstance(ObjectVariable);
    
    if not Assigned(pCalculator) then
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDPARAM);

    ObjectCalculator := TObject(pCalculator);
    if Supports(ObjectCalculator, ICalculationCalculator) then begin
      IntfCalculator := ObjectCalculator as ICalculationCalculator;
      IntfCalculator.EnlistVariable(ObjectVariable);

    end else
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDCAST);

    Result := CALCULATION_SUCCESS;
  except
    On E: ECalculationException do begin
      Result := HandleCalculationException(ObjectCalculator , E);
    end;
    On E: Exception do begin
      Result := HandleStdException(ObjectCalculator , E);
    end
    else begin
      Result := HandleUnhandledException(ObjectCalculator);
    end;
  end;
end;

function calculation_calculator_getenlistedvariable(pCalculator: TCalculationHandle; nIndex: Cardinal; pVariable: PCalculationHandle): TCalculationResult; cdecl;
var
  ResultVariable: TNumbersVariable;
  ObjectCalculator: TObject;
  IntfCalculator: ICalculationCalculator;
begin
  try
    if not Assigned(pVariable) then
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDPARAM);
    if not Assigned(pCalculator) then
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDPARAM);

    ObjectCalculator := TObject(pCalculator);
    if Supports(ObjectCalculator, ICalculationCalculator) then begin
      IntfCalculator := ObjectCalculator as ICalculationCalculator;
      ResultVariable := IntfCalculator.GetEnlistedVariable(nIndex);

      TCalculationWrapper.NumbersWrapper.AcquireInstance(ResultVariable);
      pVariable^ := ResultVariable.TheHandle;
    end else
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDCAST);

    Result := CALCULATION_SUCCESS;
  except
    On E: ECalculationException do begin
      Result := HandleCalculationException(ObjectCalculator , E);
    end;
    On E: Exception do begin
      Result := HandleStdException(ObjectCalculator , E);
    end
    else begin
      Result := HandleUnhandledException(ObjectCalculator);
    end;
  end;
end;

function calculation_calculator_clearvariables(pCalculator: TCalculationHandle): TCalculationResult; cdecl;
var
  ObjectCalculator: TObject;
  IntfCalculator: ICalculationCalculator;
begin
  try
    if not Assigned(pCalculator) then
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDPARAM);

    ObjectCalculator := TObject(pCalculator);
    if Supports(ObjectCalculator, ICalculationCalculator) then begin
      IntfCalculator := ObjectCalculator as ICalculationCalculator;
      IntfCalculator.ClearVariables();

    end else
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDCAST);

    Result := CALCULATION_SUCCESS;
  except
    On E: ECalculationException do begin
      Result := HandleCalculationException(ObjectCalculator , E);
    end;
    On E: Exception do begin
      Result := HandleStdException(ObjectCalculator , E);
    end
    else begin
      Result := HandleUnhandledException(ObjectCalculator);
    end;
  end;
end;

function calculation_calculator_multiply(pCalculator: TCalculationHandle; pInstance: PCalculationHandle): TCalculationResult; cdecl;
var
  ResultInstance: TNumbersVariable;
  ObjectCalculator: TObject;
  IntfCalculator: ICalculationCalculator;
begin
  try
    if not Assigned(pInstance) then
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDPARAM);
    if not Assigned(pCalculator) then
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDPARAM);

    ObjectCalculator := TObject(pCalculator);
    if Supports(ObjectCalculator, ICalculationCalculator) then begin
      IntfCalculator := ObjectCalculator as ICalculationCalculator;
      ResultInstance := IntfCalculator.Multiply();

      TCalculationWrapper.NumbersWrapper.AcquireInstance(ResultInstance);
      pInstance^ := ResultInstance.TheHandle;
    end else
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDCAST);

    Result := CALCULATION_SUCCESS;
  except
    On E: ECalculationException do begin
      Result := HandleCalculationException(ObjectCalculator , E);
    end;
    On E: Exception do begin
      Result := HandleStdException(ObjectCalculator , E);
    end
    else begin
      Result := HandleUnhandledException(ObjectCalculator);
    end;
  end;
end;

function calculation_calculator_add(pCalculator: TCalculationHandle; pInstance: PCalculationHandle): TCalculationResult; cdecl;
var
  ResultInstance: TNumbersVariable;
  ObjectCalculator: TObject;
  IntfCalculator: ICalculationCalculator;
begin
  try
    if not Assigned(pInstance) then
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDPARAM);
    if not Assigned(pCalculator) then
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDPARAM);

    ObjectCalculator := TObject(pCalculator);
    if Supports(ObjectCalculator, ICalculationCalculator) then begin
      IntfCalculator := ObjectCalculator as ICalculationCalculator;
      ResultInstance := IntfCalculator.Add();

      TCalculationWrapper.NumbersWrapper.AcquireInstance(ResultInstance);
      pInstance^ := ResultInstance.TheHandle;
    end else
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDCAST);

    Result := CALCULATION_SUCCESS;
  except
    On E: ECalculationException do begin
      Result := HandleCalculationException(ObjectCalculator , E);
    end;
    On E: Exception do begin
      Result := HandleStdException(ObjectCalculator , E);
    end
    else begin
      Result := HandleUnhandledException(ObjectCalculator);
    end;
  end;
end;

function calculation_createcalculator(pInstance: PCalculationHandle): TCalculationResult; cdecl;
var
  ResultInstance: TObject;
begin
  try
    if not Assigned(pInstance) then
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDPARAM);

    ResultInstance := TCalculationWrapper.CreateCalculator();

    pInstance^ := ResultInstance;
    Result := CALCULATION_SUCCESS;
  except
    On E: ECalculationException do begin
      Result := E.ErrorCode;
    end
    else begin
      Result := CALCULATION_ERROR_GENERICEXCEPTION;
    end
  end;
end;

function calculation_getversion(pMajor: PCardinal; pMinor: PCardinal; pMicro: PCardinal): TCalculationResult; cdecl;
begin
  try
    if (not Assigned(pMajor)) then
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDPARAM);

    if (not Assigned(pMinor)) then
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDPARAM);

    if (not Assigned(pMicro)) then
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDPARAM);


    TCalculationWrapper.GetVersion(pMajor^, pMinor^, pMicro^);

    Result := CALCULATION_SUCCESS;
  except
    On E: ECalculationException do begin
      Result := E.ErrorCode;
    end
    else begin
      Result := CALCULATION_ERROR_GENERICEXCEPTION;
    end
  end;
end;

function calculation_getlasterror(pInstance: TCalculationHandle; nErrorMessageBufferSize: Cardinal; pErrorMessageNeededChars: PCardinal; pErrorMessageBuffer: PAnsiChar; pHasError: PByte): TCalculationResult; cdecl;
var
  ObjectInstance: TObject;
  ResultErrorMessage: String;
  LenErrorMessage: Cardinal;
  ResultHasError: Boolean;
begin
  try
    ObjectInstance := TObject(pInstance);
    if (not Supports(ObjectInstance, ICalculationBase)) then
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDCAST);
    
    if ((not Assigned(pErrorMessageBuffer)) and (not Assigned(pErrorMessageNeededChars))) then
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDPARAM);
    if not Assigned(pHasError) then
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDPARAM);

    ResultHasError := TCalculationWrapper.GetLastError(ObjectInstance, ResultErrorMessage);

    LenErrorMessage := Length(ResultErrorMessage);
    if Assigned(pErrorMessageNeededChars) then
      pErrorMessageNeededChars^ := LenErrorMessage + 1;
    if Assigned(pErrorMessageBuffer) then begin
      if (LenErrorMessage >= nErrorMessageBufferSize) then
        raise ECalculationException.Create(CALCULATION_ERROR_BUFFERTOOSMALL);
      Move(PAnsiChar(ResultErrorMessage)^, pErrorMessageBuffer^, LenErrorMessage);
      pErrorMessageBuffer[LenErrorMessage] := Char(0);
    end;
    pHasError^ := Ord(ResultHasError);
    Result := CALCULATION_SUCCESS;
  except
    On E: ECalculationException do begin
      Result := E.ErrorCode;
    end
    else begin
      Result := CALCULATION_ERROR_GENERICEXCEPTION;
    end
  end;
end;

function calculation_releaseinstance(pInstance: TCalculationHandle): TCalculationResult; cdecl;
var
  ObjectInstance: TObject;
begin
  try
    ObjectInstance := TObject(pInstance);
    if (not Supports(ObjectInstance, ICalculationBase)) then
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDCAST);
    

    TCalculationWrapper.ReleaseInstance(ObjectInstance);

    Result := CALCULATION_SUCCESS;
  except
    On E: ECalculationException do begin
      Result := E.ErrorCode;
    end
    else begin
      Result := CALCULATION_ERROR_GENERICEXCEPTION;
    end
  end;
end;

function calculation_acquireinstance(pInstance: TCalculationHandle): TCalculationResult; cdecl;
var
  ObjectInstance: TObject;
begin
  try
    ObjectInstance := TObject(pInstance);
    if (not Supports(ObjectInstance, ICalculationBase)) then
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDCAST);
    

    TCalculationWrapper.AcquireInstance(ObjectInstance);

    Result := CALCULATION_SUCCESS;
  except
    On E: ECalculationException do begin
      Result := E.ErrorCode;
    end
    else begin
      Result := CALCULATION_ERROR_GENERICEXCEPTION;
    end
  end;
end;

function calculation_injectcomponent(pNameSpace: PAnsiChar; pSymbolAddressMethod: Pointer): TCalculationResult; cdecl;
var
  ANameSpaceFound: boolean;
begin
  try
    if (not Assigned(pNameSpace)) then
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDPARAM);

    ANameSpaceFound := False;
    if (StrPas(pNameSpace) = 'Numbers') then begin
      TCalculationWrapper.NumbersWrapper := TNumbersWrapper.CreateFromSymbolLookupMethod(pSymbolAddressMethod);
      ANameSpaceFound := True;
    end;
    if not ANameSpaceFound then
      raise ECalculationException.Create(CALCULATION_ERROR_COULDNOTLOADLIBRARY);
    Result := CALCULATION_SUCCESS;
  except
    On E: ECalculationException do begin
      Result := E.ErrorCode;
    end
    else begin
      Result := CALCULATION_ERROR_GENERICEXCEPTION;
    end
  end;
end;

function calculation_getsymbollookupmethod(pSymbolLookupMethod: PPointer): TCalculationResult; cdecl;
begin
  try
    if not Assigned(pSymbolLookupMethod) then
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDPARAM);

    pSymbolLookupMethod^ := @_calculation_getprocaddress_internal;
    Result := CALCULATION_SUCCESS;
  except
    On E: ECalculationException do begin
      Result := E.ErrorCode;
    end
    else begin
      Result := CALCULATION_ERROR_GENERICEXCEPTION;
    end
  end;
end;



(*************************************************************************************************************************
 Function table lookup implementation
**************************************************************************************************************************)

function _calculation_getprocaddress_internal(pProcName: PAnsiChar; out ppProcAddress: Pointer): TCalculationResult cdecl;

begin
  result := CALCULATION_SUCCESS;
  ppProcAddress := nil;
  
  if (pProcName = 'calculation_calculator_enlistvariable') then
    ppProcAddress := @calculation_calculator_enlistvariable
  else if (pProcName = 'calculation_calculator_getenlistedvariable') then
    ppProcAddress := @calculation_calculator_getenlistedvariable
  else if (pProcName = 'calculation_calculator_clearvariables') then
    ppProcAddress := @calculation_calculator_clearvariables
  else if (pProcName = 'calculation_calculator_multiply') then
    ppProcAddress := @calculation_calculator_multiply
  else if (pProcName = 'calculation_calculator_add') then
    ppProcAddress := @calculation_calculator_add
  else if (pProcName = 'calculation_createcalculator') then
    ppProcAddress := @calculation_createcalculator
  else if (pProcName = 'calculation_getversion') then
    ppProcAddress := @calculation_getversion
  else if (pProcName = 'calculation_getlasterror') then
    ppProcAddress := @calculation_getlasterror
  else if (pProcName = 'calculation_releaseinstance') then
    ppProcAddress := @calculation_releaseinstance
  else if (pProcName = 'calculation_acquireinstance') then
    ppProcAddress := @calculation_acquireinstance
  else if (pProcName = 'calculation_injectcomponent') then
    ppProcAddress := @calculation_injectcomponent
  else if (pProcName = 'calculation_getsymbollookupmethod') then
    ppProcAddress := @calculation_getsymbollookupmethod
  else
    result := CALCULATION_ERROR_COULDNOTFINDLIBRARYEXPORT;
end;

end.

