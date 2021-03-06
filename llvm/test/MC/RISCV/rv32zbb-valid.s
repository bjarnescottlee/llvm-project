# With B extension:
# RUN: llvm-mc %s -triple=riscv32 -mattr=+experimental-b -show-encoding \
# RUN:     | FileCheck -check-prefixes=CHECK-ASM,CHECK-ASM-AND-OBJ %s
# RUN: llvm-mc -filetype=obj -triple=riscv32 -mattr=+experimental-b < %s \
# RUN:     | llvm-objdump --mattr=+experimental-b -d -r - \
# RUN:     | FileCheck --check-prefix=CHECK-ASM-AND-OBJ %s

# With Bitmanip base extension:
# RUN: llvm-mc %s -triple=riscv32 -mattr=+experimental-zbb -show-encoding \
# RUN:     | FileCheck -check-prefixes=CHECK-ASM,CHECK-ASM-AND-OBJ %s
# RUN: llvm-mc -filetype=obj -triple=riscv32 -mattr=+experimental-zbb < %s \
# RUN:     | llvm-objdump --mattr=+experimental-zbb -d -r - \
# RUN:     | FileCheck --check-prefix=CHECK-ASM-AND-OBJ %s

# CHECK-ASM-AND-OBJ: slo t0, t1, t2
# CHECK-ASM: encoding: [0xb3,0x12,0x73,0x20]
slo t0, t1, t2
# CHECK-ASM-AND-OBJ: sro t0, t1, t2
# CHECK-ASM: encoding: [0xb3,0x52,0x73,0x20]
sro t0, t1, t2
# CHECK-ASM-AND-OBJ: sloi t0, t1, 0
# CHECK-ASM: encoding: [0x93,0x12,0x03,0x20]
sloi t0, t1, 0
# CHECK-ASM-AND-OBJ: sroi t0, t1, 0
# CHECK-ASM: encoding: [0x93,0x52,0x03,0x20]
sroi t0, t1, 0
# CHECK-ASM-AND-OBJ: clz t0, t1
# CHECK-ASM: encoding: [0x93,0x12,0x03,0x60]
clz t0, t1
# CHECK-ASM-AND-OBJ: ctz t0, t1
# CHECK-ASM: encoding: [0x93,0x12,0x13,0x60]
ctz t0, t1
# CHECK-ASM-AND-OBJ: pcnt t0, t1
# CHECK-ASM: encoding: [0x93,0x12,0x23,0x60]
pcnt t0, t1
# CHECK-ASM-AND-OBJ: sext.b t0, t1
# CHECK-ASM: encoding: [0x93,0x12,0x43,0x60]
sext.b t0, t1
# CHECK-ASM-AND-OBJ: sext.h t0, t1
# CHECK-ASM: encoding: [0x93,0x12,0x53,0x60]
sext.h t0, t1
# CHECK-ASM-AND-OBJ: min t0, t1, t2
# CHECK-ASM: encoding: [0xb3,0x42,0x73,0x0a]
min t0, t1, t2
# CHECK-ASM-AND-OBJ: max t0, t1, t2
# CHECK-ASM: encoding: [0xb3,0x52,0x73,0x0a]
max t0, t1, t2
# CHECK-ASM-AND-OBJ: minu t0, t1, t2
# CHECK-ASM: encoding: [0xb3,0x62,0x73,0x0a]
minu t0, t1, t2
# CHECK-ASM-AND-OBJ: maxu t0, t1, t2
# CHECK-ASM: encoding: [0xb3,0x72,0x73,0x0a]
maxu t0, t1, t2
