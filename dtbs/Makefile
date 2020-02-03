.PHONY: all clean

LINUX ?= ${PWD}/../../linux
LINUX := $(shell readlink -f $(LINUX))
DTC ?= ${LINUX}/scripts/dtc/dtc
DTC_WARN_FLAGS = -Wno-unit_address_vs_reg -Wno-unit_address_format -Wno-avoid_unnecessary_addr_size -Wno-alias_paths -Wno-graph_child_address -Wno-simple_bus_reg -Wno-unique_unit_address -Wno-pci_device_reg
DTC_FLAGS = -O dtb -@ -b 0 -i${LINUX}/include -i${LINUX}/arch/arm/boot/dts ${DTC_WARN_FLAGS}
CPP_FLAGS = -E -nostdinc -I${LINUX}/scripts/dtc/include-prefixes -undef -D__DTS__ -x assembler-with-cpp

src_arm = \
	am57xx-beagle-x15.dts \
	am57xx-beagle-x15-revb1.dts \
	am57xx-beagle-x15-revc.dts \
	am57xx-cl-som-am57x.dts \
	am57xx-sbc-am57x.dts \
	am572x-idk.dts \
	am571x-idk.dts \
	am574x-idk.dts \
	dra7-evm.dts \
	dra72-evm.dts \
	dra72-evm-revc.dts \
	dra71-evm.dts \
	dra76-evm.dts

src_arm += \
	am43x-epos-evm.dts \
	am43x-epos-evm-hdmi.dts \
	am437x-cm-t43.dts \
	am437x-gp-evm.dts \
	am437x-gp-evm-hdmi.dts \
	am437x-idk-evm.dts \
	am437x-sbc-t43.dts \
	am437x-sk-evm.dts

src_arm64 = \
	ti/k3-am654-base-board.dts \
	ti/k3-j721e-common-proc-board.dts \
	ti/k3-j721e-proc-board-tps65917.dts

src = $(src_arm:%=$(LINUX)/arch/arm/boot/dts/%)
src += $(src_arm64:%=$(LINUX)/arch/arm64/boot/dts/%)

tmps = $(src:$(LINUX)/%.dts=%.dts.pre)
objs = $(src:$(LINUX)/%.dts=%.dtb)

all: $(objs)

$(tmps): %.dts.pre : $(LINUX)/%.dts
	@mkdir -p `dirname $@`
	@gcc $(CPP_FLAGS) -o $@ $<

$(objs): %.dtb : %.dts.pre
	@echo "  DTC $@"
	@$(DTC) $(DTC_FLAGS) -o $@ $<
	@rm $<

clean:
	rm -rf arch
