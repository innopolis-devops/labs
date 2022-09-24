# Available actions

## Keybindings

- `Command palette` - press `Ctrl` (`Cmd`) + `Shift` + `P`

## Warning

Commands may not work inside VSCodium.

In this case, you may use an ordinary terminal.

Open it in the project's root directory and explore the available `devShells`.

```sh
$ nix repl
nix-repl> :lf .
nix-repl> devShells.<TAB>
# formatted for demo purpose
devShells.aarch64-darwin  
devShells.aarch64-linux   
devShells.i686-linux      
devShells.x86_64-darwin   
devShells.x86_64-linux
nix-repl> p = devShells.x86_64-linux
nix-repl> p.<TAB>
# formatted for demo purpose
p.app-purescript               
p.app-purescript-docker-build  
p.app-purescript-docker-rm     
p.app-purescript-docker-run    
p.app-python                   
p.app-python-docker-build      
p.app-python-docker-rm         
p.app-python-docker-run        
p.codium
p.default
p.update-flakes
nix-repl> :?
# list of available commands
nix-repl> :q
# the line below is a command in a terminal
$ nix develop .#app-python

```

## app_python actions

### Build app_python in Docker

 1. `Command palette` -> `Tasks: Run Task` -> `Build app_python in Docker`
     1. Or `nix develop .#app-python-docker-build`

### Run app_python in Docker

 1. `Command palette` -> `Tasks: Run Task` -> `Run app_python in Docker`
     1. Or `nix develop .#app-python-docker-run`

 2. Open [page](http://127.0.0.1:8002) in a browser

### Stop app_python in Docker

 1. `Command palette` -> `Tasks: Run Task` -> `Stop app_python in Docker`
     1. Or `nix develop .#app-python-docker-rm`

### Run app_python

 1. `Command palette` -> `Tasks: Run Task` -> `Run app_python`
     1. Or `nix develop .#app-python`

 2. Open [page](http://127.0.0.1:8000) in a browser

### Stop app_python

 1. Press `Ctrl` (`Cmd`) + `C` in the terminal

## app_purescript actions

### Build app_purescript in Docker

 1. `Command palette` -> `Tasks: Run Task` -> `Build app_purescript in Docker`
     1. Or `nix develop .#app-purescript-docker-build`

### Run app_purescript in Docker

 1. `Command palette` -> `Tasks: Run Task` -> `Run app_purescript in Docker`
     1. Or `nix develop .#app-purescript-docker-run`

 2. Open [page](http://127.0.0.1:8003) in a browser

### Stop app_purescript in Docker

 1. `Command palette` -> `Tasks: Run Task` -> `Stop app_purescript in Docker`
     1. Or `nix develop .#app-purescript-docker-rm`

### Run app_purescript

 1. `Command palette` -> `Tasks: Run Task` -> `Run app_purescript`
     1. Or `nix develop .#app-purescript`

 2. Open [page](http://127.0.0.1:8001) in a browser

### Stop app_purescript

 1. Press `Ctrl` (`Cmd`) + `C` in the terminal
