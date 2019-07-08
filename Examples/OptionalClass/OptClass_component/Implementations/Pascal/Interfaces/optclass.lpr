(*++

Copyright (C) 2019 ACT Developers


This file has been generated by the Automatic Component Toolkit (ACT) version 1.6.0-RC1.

Abstract: This is an autogenerated Pascal project file in order to allow easy
development of Optional Class Library.

Interface version: 1.0.0

*)

{$MODE DELPHI}
library optclass;

uses
{$IFDEF UNIX}
  cthreads,
{$ENDIF UNIX}
  syncobjs,
  optclass_types,
  optclass_exports,
  Classes,
  sysutils;

exports
  optclass_acquireinstance,
  optclass_releaseinstance,
  optclass_getversion,
  optclass_getlasterror,
  optclass_setjournal,
  optclass_createinstancewithname,
  optclass_findinstancea,
  optclass_findinstanceb,
  optclass_useinstancemaybe;

begin

end.
