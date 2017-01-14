SOURCEDIR=.
SOURCES := $(shell find $(SOURCEDIR) -name '*.go')
BINARY=nagrep
VERSION=0.0.1
BUILD_TIME=`date +%FT%T%:z`
LDFLAGS=-ldflags "-X main.BUILD_DATE=${BUILD_TIME} -d"

.DEFAULT_GOAL: $(BINARY)

$(BINARY): $(SOURCES)
	env CGO_ENABLED=0 go build ${LDFLAGS} -o ${BINARY} main.go

.PHONY: install
install:
	go install ${LDFLAGS} ./...

.PHONY: clean
clean:
	if [ -f ${BINARY} ]; then rm -f ${BINARY}; fi