/*++

Copyright (C) 2021 ADSK

All rights reserved.

This file has been generated by the Automatic Component Toolkit (ACT) version 1.7.0-develop.

Abstract: This is an autogenerated Java file in order to allow an easy
 use of RTTI

Interface version: 1.0.0

*/

package rtti;

import com.sun.jna.Library;
import com.sun.jna.Memory;
import com.sun.jna.Native;
import com.sun.jna.Pointer;
import java.lang.ref.Cleaner;


import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.List;

public class Tiger extends Mammal {

	public Tiger(RTTIWrapper wrapper, Pointer handle) {
		super(wrapper, handle);
	}

	/**
	 * Roar like a tiger
	 *
	 * @throws RTTIException
	 */
	public void roar() throws RTTIException {
		mWrapper.checkError(this, mWrapper.rtti_tiger_roar.invokeInt(new java.lang.Object[]{mHandle}));
	}


}

