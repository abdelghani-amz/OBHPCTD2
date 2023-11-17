CFLAGS=-g -Wall

OFLAGS=-O3

INTEL_LFLAGS=-qmkl
GNU_LFLAGS=-lm -lblas

FILES=main.c tools.c kernels.c

all: reduc

reduc:
ifeq ($(CC),icc)
	$(CC) $(CFLAGS) $(OFLAGS) $(FILES) -o $@ $(INTEL_LFLAGS)
else
ifeq ($(CC),icx)
	$(CC) $(CFLAGS) $(OFLAGS) $(FILES) -o $@ $(INTEL_LFLAGS)
else
ifeq ($(CC),gcc)
	$(CC) $(CFLAGS) -O0 $(FILES) -o $@_gcc0 $(GNU_LFLAGS)
	$(CC) $(CFLAGS) -O1 $(FILES) -o $@_gcc1 $(GNU_LFLAGS)
	$(CC) $(CFLAGS) -O2 $(FILES) -o $@_gcc2 $(GNU_LFLAGS)
	$(CC) $(CFLAGS) -O3 $(FILES) -o $@_gcc3 $(GNU_LFLAGS)
	$(CC) $(CFLAGS) -Ofast $(FILES) -o $@_gccf $(GNU_LFLAGS)
else
ifeq ($(CC),clang)
	$(CC) $(CFLAGS) -O0 $(FILES) -o $@_clang0 $(GNU_LFLAGS)
	$(CC) $(CFLAGS) -O1 $(FILES) -o $@_clang1 $(GNU_LFLAGS)
	$(CC) $(CFLAGS) -O2 $(FILES) -o $@_clang2 $(GNU_LFLAGS)
	$(CC) $(CFLAGS) -O3 $(FILES) -o $@_clang3 $(GNU_LFLAGS)
	$(CC) $(CFLAGS) -Ofast $(FILES) -o $@_clangf $(GNU_LFLAGS)
else
	@echo "ERROR: no compiler specified using CC. Possible values for CC: gcc, icc, icx, clang"
endif
endif
endif
endif

run: 
	for number in 0 1 2 3 f ; do \
    	taskset --cpu-list 0 ./reduc_gcc$$number 1000 200   > gcc$$number.data; \
		taskset --cpu-list 0 ./reduc_clang$$number 1000 200  > clang$$number.data; \
	done

clean:
	@rm -Rf reduc*
