# Moscow time app

## Overview

Web application that displays current time in Moscow.

## Usage

### Build

    make build

After build binaries will be placed to `target` directory.

### Run

You can either run binary file generated after build or simply run

    make run

## Development

For the development you will need to use `stack` ([link](https://docs.haskellstack.org/en/stable/README/)).

### Install pre-commit hooks

    pip install pre-commit
    stack install hlint stylish-haskell
    pre-commit install

### Interactive shell

    stack repl

### Run stylish-haskell

#### Check formatting

    stylish-haskell src -r
    stylish-haskell app -r
    stylish-haskell test -r

#### Automatically fix formatting  (done in pre-commit)

    stylish-haskell src -r --inplace
    stylish-haskell app -r --inplace
    stylish-haskell test -r --inplace

### Run hlint (done in pre-commit)

    hlint .

## CI

### stylish-haskell

You can quickly download the latest binary and run `stylish-haskell` like so:

    curl -sL https://raw.github.com/haskell/stylish-haskell/master/scripts/latest.sh | sh -s .

Where the `.` can be replaced with the arguments you pass to stylish-haskell.

### hlint

You can quickly download the latest binary and run `hlint` like so:

    curl -sSL https://raw.github.com/ndmitchell/hlint/master/misc/run.sh | sh -s .

The arguments after `-s` are passed to hlint, so modify the final `.` if you want other arguments. This command works on Windows, Mac and Linux.
