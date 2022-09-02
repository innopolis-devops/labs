BIN_PATH=target
EXE=app-haskell-exe
EXEC=${BIN_PATH}/${EXE}

build:
	stack --local-bin-path ${BIN_PATH} install --test

run:
	make build
	${EXEC}

profile:
	stack --profile install --local-bin-path ${BIN_PATH} --ghc-options="-O2 -threaded -rtsopts -eventlog"
	${EXEC} +RTS -P -lf

.PHONY: run
