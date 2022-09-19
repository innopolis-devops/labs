BIN_PATH=target
EXE=moscow-time-app-exe
EXEC=${BIN_PATH}/${EXE}

hpack:
	hpack

test:
	make hpack
	stack test

build:
	make hpack
	stack --local-bin-path ${BIN_PATH} install --test

run:
	make hpack
	make build
	${EXEC}

profile:
	make hpack
	stack --profile install --local-bin-path ${BIN_PATH} --ghc-options="-O2 -threaded -rtsopts -eventlog"
	${EXEC} +RTS -P -lf

.PHONY: run test
