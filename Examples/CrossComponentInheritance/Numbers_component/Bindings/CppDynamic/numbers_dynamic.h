/*++

Copyright (C) 2019 Numbers developers

All rights reserved.

This file has been generated by the Automatic Component Toolkit (ACT) version 1.7.0-develop.

Abstract: This is an autogenerated C++-Header file in order to allow an easy
 use of Numbers library

Interface version: 1.0.0

*/

#ifndef __NUMBERS_DYNAMICHEADER_CPPTYPES
#define __NUMBERS_DYNAMICHEADER_CPPTYPES

#include "numbers_types.hpp"



/*************************************************************************************************************************
 Class definition for Base
**************************************************************************************************************************/

/**
* Returns the address of the SymbolLookupMethod
*
* @param[in] pBase - Base instance.
* @param[out] pSymbolLookupMethod - Address of the SymbolAddressMethod
* @return error code or 0 (success)
*/
typedef NumbersResult (*PNumbersBase_GetSymbolLookupMethodPtr) (Numbers_Base pBase, Numbers_pvoid * pSymbolLookupMethod);

/**
* Releases shared ownership of an Instance
*
* @param[in] pBase - Base instance.
* @return error code or 0 (success)
*/
typedef NumbersResult (*PNumbersBase_ReleaseInstancePtr) (Numbers_Base pBase);

/**
* Acquires shared ownership of an Instance
*
* @param[in] pBase - Base instance.
* @return error code or 0 (success)
*/
typedef NumbersResult (*PNumbersBase_AcquireInstancePtr) (Numbers_Base pBase);

/**
* retrieves the binary version of this library.
*
* @param[in] pBase - Base instance.
* @param[out] pMajor - returns the major version of this library
* @param[out] pMinor - returns the minor version of this library
* @param[out] pMicro - returns the micro version of this library
* @return error code or 0 (success)
*/
typedef NumbersResult (*PNumbersBase_GetVersionPtr) (Numbers_Base pBase, Numbers_uint32 * pMajor, Numbers_uint32 * pMinor, Numbers_uint32 * pMicro);

/**
* Returns the last error recorded on this object
*
* @param[in] pBase - Base instance.
* @param[in] nErrorMessageBufferSize - size of the buffer (including trailing 0)
* @param[out] pErrorMessageNeededChars - will be filled with the count of the written bytes, or needed buffer size.
* @param[out] pErrorMessageBuffer -  buffer of Message of the last error, may be NULL
* @param[out] pHasError - Is there a last error to query
* @return error code or 0 (success)
*/
typedef NumbersResult (*PNumbersBase_GetLastErrorPtr) (Numbers_Base pBase, const Numbers_uint32 nErrorMessageBufferSize, Numbers_uint32* pErrorMessageNeededChars, char * pErrorMessageBuffer, bool * pHasError);

/*************************************************************************************************************************
 Class definition for Variable
**************************************************************************************************************************/

/**
* Returns the current value of this Variable
*
* @param[in] pVariable - Variable instance.
* @param[out] pValue - The current value of this Variable
* @return error code or 0 (success)
*/
typedef NumbersResult (*PNumbersVariable_GetValuePtr) (Numbers_Variable pVariable, Numbers_double * pValue);

/**
* Set the numerical value of this Variable
*
* @param[in] pVariable - Variable instance.
* @param[in] dValue - The new value of this Variable
* @return error code or 0 (success)
*/
typedef NumbersResult (*PNumbersVariable_SetValuePtr) (Numbers_Variable pVariable, Numbers_double dValue);

/*************************************************************************************************************************
 Class definition for VariableImpl
**************************************************************************************************************************/

/*************************************************************************************************************************
 Global functions
**************************************************************************************************************************/

/**
* Checks whether a variable is an Instance of VariableImpl
*
* @param[in] pInstance - Checks 
* @param[out] pIsImpl - Is this variable an Instance of VariableImpl?
* @return error code or 0 (success)
*/
typedef NumbersResult (*PNumbersInvestigateVariablePtr) (Numbers_Variable pInstance, bool * pIsImpl);

/**
* Creates a new Variable instance
*
* @param[in] dInitialValue - Initial value of the new Variable
* @param[out] pInstance - New Variable instance
* @return error code or 0 (success)
*/
typedef NumbersResult (*PNumbersCreateVariablePtr) (Numbers_double dInitialValue, Numbers_Variable * pInstance);

/**
* Creates a new Variable instance
*
* @param[in] dInitialValue - Initial value of the new Variable
* @param[out] pInstance - New Variable instance
* @return error code or 0 (success)
*/
typedef NumbersResult (*PNumbersCreateVariableImplPtr) (Numbers_double dInitialValue, Numbers_VariableImpl * pInstance);

/**
* Returns the address of the SymbolLookupMethod
*
* @param[out] pSymbolLookupMethod - Address of the SymbolAddressMethod
* @return error code or 0 (success)
*/
typedef NumbersResult (*PNumbersGetSymbolLookupMethodPtr) (Numbers_pvoid * pSymbolLookupMethod);

/**
* Returns the last error recorded on component
*
* @param[in] nErrorMessageBufferSize - size of the buffer (including trailing 0)
* @param[out] pErrorMessageNeededChars - will be filled with the count of the written bytes, or needed buffer size.
* @param[out] pErrorMessageBuffer -  buffer of Message of the last error, may be NULL
* @param[out] pHasError - Is there a last error to query
* @return error code or 0 (success)
*/
typedef NumbersResult (*PNumbersGetLastErrorPtr) (const Numbers_uint32 nErrorMessageBufferSize, Numbers_uint32* pErrorMessageNeededChars, char * pErrorMessageBuffer, bool * pHasError);

/**
* retrieves the binary version of this library.
*
* @param[out] pMajor - returns the major version of this library
* @param[out] pMinor - returns the minor version of this library
* @param[out] pMicro - returns the micro version of this library
* @return error code or 0 (success)
*/
typedef NumbersResult (*PNumbersGetVersionPtr) (Numbers_uint32 * pMajor, Numbers_uint32 * pMinor, Numbers_uint32 * pMicro);

/*************************************************************************************************************************
 Function Table Structure
**************************************************************************************************************************/

typedef struct {
	void * m_LibraryHandle;
	PNumbersBase_GetSymbolLookupMethodPtr m_Base_GetSymbolLookupMethod;
	PNumbersBase_ReleaseInstancePtr m_Base_ReleaseInstance;
	PNumbersBase_AcquireInstancePtr m_Base_AcquireInstance;
	PNumbersBase_GetVersionPtr m_Base_GetVersion;
	PNumbersBase_GetLastErrorPtr m_Base_GetLastError;
	PNumbersVariable_GetValuePtr m_Variable_GetValue;
	PNumbersVariable_SetValuePtr m_Variable_SetValue;
	PNumbersInvestigateVariablePtr m_InvestigateVariable;
	PNumbersCreateVariablePtr m_CreateVariable;
	PNumbersCreateVariableImplPtr m_CreateVariableImpl;
	PNumbersGetSymbolLookupMethodPtr m_GetSymbolLookupMethod;
	PNumbersGetLastErrorPtr m_GetLastError;
	PNumbersGetVersionPtr m_GetVersion;
} sNumbersDynamicWrapperTable;

typedef struct {
	PNumbersBase_GetSymbolLookupMethodPtr m_Base_GetSymbolLookupMethod;
	PNumbersBase_ReleaseInstancePtr m_Base_ReleaseInstance;
	PNumbersBase_AcquireInstancePtr m_Base_AcquireInstance;
	PNumbersBase_GetVersionPtr m_Base_GetVersion;
	PNumbersBase_GetLastErrorPtr m_Base_GetLastError;
} sNumbersFunctionTableBase;

typedef struct : sNumbersFunctionTableBase {
	PNumbersVariable_GetValuePtr m_Variable_GetValue;
	PNumbersVariable_SetValuePtr m_Variable_SetValue;
} sNumbersFunctionTableVariable;

typedef struct : sNumbersFunctionTableVariable {
} sNumbersFunctionTableVariableImpl;

#endif // __NUMBERS_DYNAMICHEADER_CPPTYPES

