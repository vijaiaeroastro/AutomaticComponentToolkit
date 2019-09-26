/*++

Copyright (C) 2019 PrimeDevelopers

All rights reserved.

This file has been generated by the Automatic Component Toolkit (ACT) version 1.6.0.

Abstract: This is an autogenerated C++ application that demonstrates the
 usage of the C++ bindings of Prime Numbers Library

Interface version: 1.0.0

*/

#include <iostream>
#include "libprimes_implicit.hpp"

void progressCallback(LibPrimes_single progress, bool* shouldAbort)
{
	std::cout << "Progress = " << std::round(progress * 100) << "%" << std::endl;
	if (shouldAbort) {
		*shouldAbort = progress > 0.5;
	}
}

int main()
{
  try
  {
    auto wrapper = LibPrimes::CWrapper::loadLibrary();
	wrapper->SetJournal("journal_cpp.xml");
	LibPrimes_uint32 nMajor, nMinor, nMicro;
	wrapper->GetVersion(nMajor, nMinor, nMicro);
	std::cout << "LibPrimes.Version = " << nMajor << "." << nMinor << "." << nMicro;
	std::cout << std::endl;

	auto factorization = wrapper->CreateFactorizationCalculator();
	factorization->SetValue(735);
	factorization->SetProgressCallback(progressCallback);
	factorization->Calculate();
	std::vector<LibPrimes::sPrimeFactor > primeFactors;
	factorization->GetPrimeFactors(primeFactors);

	std::cout << factorization->GetValue() << " = ";
	for (size_t i = 0; i < primeFactors.size(); i++) {
		auto pF = primeFactors[i];
		std::cout << pF.m_Prime << "^" << pF.m_Multiplicity << ((i < (primeFactors.size() - 1)) ? " * " : "");
	}
	std::cout << std::endl;
  }
  catch (std::exception &e)
  {
    std::cout << e.what() << std::endl;
    return 1;
  }
  return 0;
}

