GO_ARGS=-tags '$(GO_TAGS)'
GO_BUILD=go build $(GO_ARGS)

C2GOASM=c2goasm -a -f
CC=clang
C_FLAGS=-masm=intel -mno-red-zone -mstackrealign -mllvm -inline-threshold=1000 -fno-asynchronous-unwind-tables \
	-fno-exceptions -fno-rtti -O3
ASM_FLAGS=-mavx2 -mfma -march=native

GO_SOURCES := $(shell find . -path ./_lib -prune -o -name '*.go' -not -name '*_test.go')
ALL_SOURCES := $(shell find . -path ./_lib -prune -o -name '*.go' -name '*.s' -not -name '*_test.go')

.PHONEY: test bench

bench: $(GO_SOURCES) add_amd64.s
	go test -bench=. -run=- ./...

test: $(GO_SOURCES) add_amd64.s
	go test ./...

_lib/add.s: _lib/add.c
	$(CC) -S $(C_FLAGS) $(ASM_FLAGS) $^ -o $@

add_amd64.s: _lib/add.s
	$(C2GOASM) -a -f $^ $@

