// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2013.3
// Copyright (C) 2013 Xilinx Inc. All rights reserved.
// 
// ==============================================================

#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xnco.h"

extern XNco_Config XNco_ConfigTable[];

XNco_Config *XNco_LookupConfig(u16 DeviceId) {
	XNco_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XNCO_NUM_INSTANCES; Index++) {
		if (XNco_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XNco_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XNco_Initialize(XNco *InstancePtr, u16 DeviceId) {
	XNco_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XNco_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XNco_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

