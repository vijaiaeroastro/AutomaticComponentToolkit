(*++

Copyright (C) 2019 PrimeDevelopers

All rights reserved.

This file has been generated by the Automatic Component Toolkit (ACT) version 1.6.0.

Abstract: This is an autogenerated Pascal interface definition file in order to allow easy
development of Prime Numbers Library. The functions in this file need to be implemented. It needs to be generated only once.

Interface version: 1.2.0

*)

{$MODE DELPHI}
{$INTERFACES CORBA}
unit libprimes_interfaces;

interface

uses
  libprimes_types,
  Classes,
  sysutils;


type

(*************************************************************************************************************************
 Interface definition for Base
**************************************************************************************************************************)

ILibPrimesBase = interface
  ['{52FDFC07-2182-454F-963F-5F0F9A621D72}']

  function GetLastErrorMessage(out AErrorMessage: String): Boolean;
  procedure ClearErrorMessages();
  procedure RegisterErrorMessage(const AErrorMessage: String);
  procedure IncRefCount();
  function DecRefCount(): Boolean;
end;


(*************************************************************************************************************************
 Interface definition for Calculator
**************************************************************************************************************************)

ILibPrimesCalculator = interface(ILibPrimesBase)
  ['{9566C74D-1003-4C4D-BBBB-0407D1E2C649}']

  function GetValue(): QWord;
  procedure SetValue(const AValue: QWord);
  procedure Calculate();
  procedure SetProgressCallback(const AProgressCallback: PLibPrimes_ProgressCallback);
end;


(*************************************************************************************************************************
 Interface definition for FactorizationCalculator
**************************************************************************************************************************)

ILibPrimesFactorizationCalculator = interface(ILibPrimesCalculator)
  ['{81855AD8-681D-4D86-91E9-1E00167939CB}']

  procedure GetPrimeFactors(const APrimeFactorsCount: QWord; PPrimeFactorsNeededCount: PQWord; APrimeFactors: PLibPrimesPrimeFactor);
end;


(*************************************************************************************************************************
 Interface definition for SieveCalculator
**************************************************************************************************************************)

ILibPrimesSieveCalculator = interface(ILibPrimesCalculator)
  ['{6694D2C4-22AC-4208-A007-2939487F6999}']

  procedure GetPrimes(const APrimesCount: QWord; PPrimesNeededCount: PQWord; APrimes: PQWord);
end;

implementation

end.
