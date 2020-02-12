# Introduction

This repo is meant to contain device tree source files that are not appropriate
for inclusion in the linux kernel.

Today this means overlays.
See the dt\_overlay/README for current usage

# Status

This is just a demo of a concept.  It uses TI's overlays as an example.

The idea is to have SOC and common board dt source in the kernel.
Daughter card overlays and other bootloader applied overlays will be kept here
as the kernel does not want them until the bigger issues around overlays are
solved.

TI's usage of overlays is bootloader applied.  Overlays applied by the kernel
dynamically at runtime are out of scope.

The Makefile definitly needs work
v0.1:
The first version only built the dtbo's here and relied on the base dtb's to be
built by the kernel.  However to support overlays the dtb's have to be built
with symbol support so the user must define DTC\_FLAGS=-@ when building the
kernel

v0.2:
Builds the dtb's and dtbo's from this makefile.  The source for the dtbs is
still from the kernel.  However this Makefile is messy and TI specific.

v0.3: (does not exist yet)
This makefile should basicly be similar to an out of tree module.  It should
require that the kernel be already built and should reuse the config used to
control what portions of this tree are used.  (The "kernel dir" needed will be
the output directory not the source directory; just like a oot module.)

# Poor Man's Demo

```
bill@m:~/w/demo/dt-overlays/dt_overlay$ LINUX=../../korg-master DTC=../../build/korg-master/armv7/scripts/dtc/dtc make
  DTC arch/arm/boot/dts/am57xx-beagle-x15.dtb
  DTC arch/arm/boot/dts/am57xx-beagle-x15-revb1.dtb
  DTC arch/arm/boot/dts/am57xx-beagle-x15-revc.dtb
  DTC arch/arm/boot/dts/am57xx-cl-som-am57x.dtb
  DTC arch/arm/boot/dts/am57xx-sbc-am57x.dtb
  DTC arch/arm/boot/dts/am572x-idk.dtb
  DTC arch/arm/boot/dts/am571x-idk.dtb
  DTC arch/arm/boot/dts/am574x-idk.dtb
  DTC arch/arm/boot/dts/dra7-evm.dtb
  DTC arch/arm/boot/dts/dra72-evm.dtb
  DTC arch/arm/boot/dts/dra72-evm-revc.dtb
  DTC arch/arm/boot/dts/dra71-evm.dtb
  DTC arch/arm/boot/dts/dra76-evm.dtb
  DTC arch/arm/boot/dts/am437x-cm-t43.dtb
  DTC arch/arm/boot/dts/am437x-gp-evm.dtb
  DTC arch/arm/boot/dts/am437x-idk-evm.dtb
  DTC arch/arm/boot/dts/am437x-sbc-t43.dtb
  DTC arch/arm/boot/dts/am437x-sk-evm.dtb
  DTC arch/arm64/boot/dts/ti/k3-am654-base-board.dtb
  DTC arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb
  DTC arch/arm64/boot/dts/ti/k3-am654-evm-hdmi.dtbo
  DTC arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtbo
  DTC arch/arm64/boot/dts/ti/k3-am654-evm-oldi-lcd1evm.dtbo
  DTC arch/arm64/boot/dts/ti/k3-am654-gp.dtbo
  DTC arch/arm64/boot/dts/ti/k3-am654-evm-tc358876.dtbo
  DTC arch/arm64/boot/dts/ti/k3-am654-base-board-jailhouse.dtbo
  DTC arch/arm/boot/dts/ti/am571x-idk-touchscreen.dtbo
  DTC arch/arm/boot/dts/ti/dra7x-evm-osd-lcd-common.dtbo
  DTC arch/arm/boot/dts/ti/dra76-evm-tfp410.dtbo
  DTC arch/arm/boot/dts/ti/dra74-evm-touchscreen.dtbo
  DTC arch/arm/boot/dts/ti/am57xx-idk-osd-lcd-common.dtbo
  DTC arch/arm/boot/dts/ti/lcd-osd101t2587.dtbo
  DTC arch/arm/boot/dts/ti/am572x-idk-touchscreen.dtbo
  DTC arch/arm/boot/dts/ti/ov10635.dtbo
arch/arm/boot/dts/ti/ov10635.dtso:54.8-61.3: Warning (graph_port): /fragment@1/__overlay__: graph port node name should be 'port'
  DTC arch/arm/boot/dts/ti/lcd-osd101t2045.dtbo
  DTC arch/arm/boot/dts/ti/dra71-evm-lcd-auo-g101evn01.0.dtbo
  DTC arch/arm/boot/dts/ti/dra72-evm-touchscreen.dtbo
  DTC arch/arm/boot/dts/ti/am57xx-evm.dtbo
bill@m:~/w/demo/dt-overlays/dt_overlay$
```
