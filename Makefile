export GOOS=linux
export GOPATH=$(PWD)

sw:
	go build github.com/barun/cmd/node/
	cp node test/

test: FORCE
	@cd test && ./build.sh
	@cd test && ./setup.sh

all: sw test

FORCE:
