// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XSTREAM8X2_H
#define XSTREAM8X2_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xstream8x2_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XStream8x2_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XStream8x2;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XStream8x2_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XStream8x2_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XStream8x2_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XStream8x2_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XStream8x2_Initialize(XStream8x2 *InstancePtr, u16 DeviceId);
XStream8x2_Config* XStream8x2_LookupConfig(u16 DeviceId);
int XStream8x2_CfgInitialize(XStream8x2 *InstancePtr, XStream8x2_Config *ConfigPtr);
#else
int XStream8x2_Initialize(XStream8x2 *InstancePtr, const char* InstanceName);
int XStream8x2_Release(XStream8x2 *InstancePtr);
#endif


u32 XStream8x2_Get_recv(XStream8x2 *InstancePtr);
u32 XStream8x2_Get_recv_vld(XStream8x2 *InstancePtr);
u32 XStream8x2_Get_send(XStream8x2 *InstancePtr);
u32 XStream8x2_Get_send_vld(XStream8x2 *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
