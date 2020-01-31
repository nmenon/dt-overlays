.PHONY: all clean

all:
	make -s -C arm
	make -s -C arm64

clean:
	make -C arm clean
	make -C arm64 clean
