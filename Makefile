export GOOS=linux
export GOPATH=$(PWD)

sw:
	go build github.com/barun/cmd/node/
	mv node bin/
	go build github.com/barun/cmd/log/
	mv log bin/
	cp bin/* test/

test: FORCE
	@cd test && ./build.sh
	@cd test && ./setup.sh

all: sw test

FORCE:
