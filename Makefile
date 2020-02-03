.PHONY: all clean

LINUX ?= ${PWD}/../linux
DTC ?= ${LINUX}/scripts/dtc/dtc
DTC_WARN_FLAGS = -Wno-unit_address_vs_reg -Wno-unit_address_format -Wno-avoid_unnecessary_addr_size -Wno-alias_paths -Wno-graph_child_address -Wno-simple_bus_reg -Wno-unique_unit_address -Wno-pci_device_reg
DTC_FLAGS = -O dtb -@ -b 0 -i${LINUX}/include ${DTC_WARN_FLAGS}
CPP_FLAGS = -E -nostdinc -I${LINUX}/scripts/dtc/include-prefixes -undef -D__DTS__ -x assembler-with-cpp

%.dtso.pre: %.dtso
	@gcc $(CPP_FLAGS) -o $@ $<

%.dtbo: %.dtso.pre
	@echo "  DTC $@"
	@$(DTC) $(DTC_FLAGS) -o $@ $<

src = $(wildcard */*/*.dtso)
dst = $(src:.dtso=.dtbo)

all: $(dst)

clean:
	find -name "*.dtbo" | xargs rm -f
