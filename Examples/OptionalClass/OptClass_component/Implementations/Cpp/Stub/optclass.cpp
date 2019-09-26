/*++

Copyright (C) 2019 ACT Developers


This file has been generated by the Automatic Component Toolkit (ACT) version 1.6.0.

Abstract: This is an autogenerated C++ implementation file in order to allow easy
development of Optional Class Library. It needs to be generated only once.

Interface version: 1.0.0

*/

#include "optclass_abi.hpp"
#include "optclass_interfaces.hpp"
#include "optclass_interfaceexception.hpp"

#include "optclass_base.hpp"

#include <map>
#include <iostream>

using namespace OptClass;
using namespace OptClass::Impl;

std::map<std::string, PIBase> gObjects;

void CWrapper::AcquireInstance(IBase* pInstance)
{
	IBase::AcquireBaseClassInterface(pInstance);
}

void CWrapper::ReleaseInstance(IBase* pInstance)
{
	IBase::ReleaseBaseClassInterface(pInstance);
}

void CWrapper::GetVersion(OptClass_uint32 & nMajor, OptClass_uint32 & nMinor, OptClass_uint32 & nMicro)
{
	nMajor = OPTCLASS_VERSION_MAJOR;
	nMinor = OPTCLASS_VERSION_MINOR;
	nMicro = OPTCLASS_VERSION_MICRO;
}

bool CWrapper::GetLastError(IBase* pInstance, std::string & sErrorMessage)
{
	throw EOptClassInterfaceException(OPTCLASS_ERROR_NOTIMPLEMENTED);
}

void CWrapper::CreateInstanceWithName(const std::string & sIdentifier)
{
	gObjects.insert(std::make_pair(sIdentifier, PIBase(new CBase)));
}

IBase * CWrapper::FindInstanceA(const std::string & sIdentifier)
{
	try {
		PIBase pBase = gObjects.at(sIdentifier);
		return pBase.getCoOwningPtr();
	}
	catch (...) {
		return nullptr;
	}
}

void CWrapper::FindInstanceB(const std::string & sIdentifier, IBase*& pInstance)
{
	try {
		PIBase pBase = gObjects.at(sIdentifier);
		pInstance = pBase.getCoOwningPtr();
	}
	catch (...) {
		pInstance =  nullptr;
	}
}

bool CWrapper::UseInstanceMaybe(IBase* pInstance)
{
	return pInstance != nullptr;
}


