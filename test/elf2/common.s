// RUN: llvm-mc -filetype=obj -triple=x86_64-pc-linux %s -o %t
// RUN: llvm-mc -filetype=obj -triple=x86_64-pc-linux %p/Inputs/common.s -o %t2
// RUN: lld -flavor gnu2 %t %t2 -o %t3
// RUN: llvm-readobj -t -s %t3 | FileCheck %s
// REQUIRES: x86

// CHECK:      Name: .bss
// CHECK-NEXT: Type: SHT_NOBITS
// CHECK-NEXT: Flags [
// CHECK-NEXT:   SHF_ALLOC
// CHECK-NEXT:   SHF_WRITE
// CHECK-NEXT: ]
// CHECK-NEXT: Address: 0x1000


// CHECK:      Name: sym2
// CHECK-NEXT: Value: 0x1008
// CHECK-NEXT: Size: 8
// CHECK-NEXT: Binding: Global
// CHECK-NEXT: Type: Object
// CHECK-NEXT: Other: 0
// CHECK-NEXT: Section: .bss

// CHECK:      Name: sym1
// CHECK-NEXT: Value: 0x1000
// CHECK-NEXT: Size: 8
// CHECK-NEXT: Binding: Global
// CHECK-NEXT: Type: Object
// CHECK-NEXT: Other: 0
// CHECK-NEXT: Section: .bss


.globl _start
_start:

.comm sym1,4,4
.comm sym2,8,4
