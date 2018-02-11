GO_ARGS=-tags '$(GO_TAGS)'
GO_BUILD=go build $(GO_ARGS)
GOPATH=$(realpath ../../../..)

# this converts rotate instructions from "ro[lr] <reg>" -> "ro[lr] <reg>, 1" for yasm compatibility
PERL_FIXUP_ROTATE=perl -i -pe 's/(ro[rl]\s+\w{2,3})$$/\1, 1/'

C2GOASM=c2goasm -a -f
CC=clang
C_FLAGS=-target x86_64-unknown-none -masm=intel -mno-red-zone -mstackrealign -mllvm -inline-threshold=1000 -fno-asynchronous-unwind-tables \
	-fno-exceptions -fno-rtti -O3 -fno-builtin -ffast-math -fno-jump-tables -I_lib
ASM_FLAGS_AVX2=-mavx2 -mfma -mllvm -force-vector-width=8
ASM_FLAGS_SSE4=-msse4

GO_SOURCES := $(shell find . -path ./_lib -prune -o -name '*.go' -not -name '*_test.go')
ALL_SOURCES := $(shell find . -path ./_lib -prune -o -name '*.go' -name '*.s' -not -name '*_test.go')

INTEL_SOURCES := \
	sum_avx2_amd64.s sum_sse4_amd64.s


.PHONEY: test bench

assembly: $(INTEL_SOURCES)

bench: $(GO_SOURCES) $(INTEL_SOURCES)
	go test -bench=. -run=- ./...

test: $(GO_SOURCES) $(INTEL_SOURCES)
	go test ./...

_lib/sum_avx2.s: _lib/sum.c
	$(CC) -S $(C_FLAGS) $(ASM_FLAGS_AVX2) $^ -o $@ ; $(PERL_FIXUP_ROTATE) $@

sum_avx2_amd64.s: _lib/sum_avx2.s
	$(C2GOASM) -a -f $^ $@

_lib/sum_sse4.s: _lib/sum.c
	$(CC) -S $(C_FLAGS) $(ASM_FLAGS_SSE4) $^ -o $@ ; $(PERL_FIXUP_ROTATE) $@

sum_sse4_amd64.s: _lib/sum_sse4.s
	$(C2GOASM) -a -f $^ $@
