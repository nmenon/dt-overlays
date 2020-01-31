include ../vars.mk

.PHONY: clean all

src = $(wildcard *.dtso)
dst = $(src:.dtso=.dtbo)

all: $(dst)

clean:
	rm -f *.dtbo *.dtso.pre
