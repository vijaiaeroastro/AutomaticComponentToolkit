(*++

Copyright (C) 2019 Numbers developers

All rights reserved.

This file has been generated by the Automatic Component Toolkit (ACT) version 1.7.0-develop.

Abstract: This is an autogenerated Pascal implementation file in order to allow easy
development of Numbers library. It needs to be generated only once.

Interface version: 1.0.0

*)

{$MODE DELPHI}
Unit numbers_impl;

interface

uses
  numbers_types,
  numbers_exception,
  numbers_interfaces,
  numbers_impl_variable,
  Classes,
  sysutils;

type
  TNumbersWrapper = class(TObject)
    public
      class function CreateVariable(const AInitialValue: Double): TObject;
      class procedure GetVersion(out AMajor: Cardinal; out AMinor: Cardinal; out AMicro: Cardinal);
      class function GetLastError(AInstance: TObject; out AErrorMessage: String): Boolean;
      class procedure ReleaseInstance(AInstance: TObject);
      class procedure AcquireInstance(AInstance: TObject);
  end;


implementation

class function TNumbersWrapper.CreateVariable(const AInitialValue: Double): TObject;
begin
  result := TNumbersVariable.Create(AInitialValue);
end;

class procedure TNumbersWrapper.GetVersion(out AMajor: Cardinal; out AMinor: Cardinal; out AMicro: Cardinal);
begin
  AMajor := NUMBERS_VERSION_MAJOR;
  AMinor := NUMBERS_VERSION_MINOR;
  AMicro := NUMBERS_VERSION_MICRO;
end;

class function TNumbersWrapper.GetLastError(AInstance: TObject; out AErrorMessage: String): Boolean;
begin
  result := false;
  if supports(AInstance, INumbersBase) then
    result := (AInstance as INumbersBase).GetLastErrorMessage(AErrorMessage);
end;

class procedure TNumbersWrapper.ReleaseInstance(AInstance: TObject);
begin
  (AInstance as INumbersBase).DecRefCount(); 
end;

class procedure TNumbersWrapper.AcquireInstance(AInstance: TObject);
begin
  (AInstance as INumbersBase).IncRefCount(); 
end;


end.
