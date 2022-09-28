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

### app_python: Docker build

 1. `Command palette` -> `Tasks: Run Task` -> `app_python: Docker build`
     1. Or `$ app-python-docker-build`

### app_python: Docker run

 1. `Command palette` -> `Tasks: Run Task` -> `app_python: Docker run`
     1. Or `$ app-python-docker-run`

 2. Open [page](http://127.0.0.1:8002) in a browser

### app_python: Docker stop

 1. `Command palette` -> `Tasks: Run Task` -> `app_python: Docker stop`
     1. Or `$ app-python-docker-rm`

### app_python: Run

 1. `Command palette` -> `Tasks: Run Task` -> `app_python: Run`
     1. Or `$ app-python`

 2. Open [page](http://127.0.0.1:8000) in a browser

### Stop app_python

 1. Press `Ctrl` (`Cmd`) + `C` in the terminal

## app_purescript actions

### app_purescript: Docker build

 1. `Command palette` -> `Tasks: Run Task` -> `app_purescript: Docker build`
     1. Or `$ app-purescript-docker-build`

### app_purescript: Docker run

 1. `Command palette` -> `Tasks: Run Task` -> `app_purescript: Docker run`
     1. Or `$ app-purescript-docker-run`

 2. Open [page](http://127.0.0.1:8003) in a browser

### app_purescript: Docker stop

 1. `Command palette` -> `Tasks: Run Task` -> `app_purescript: Docker stop`
     1. Or `$ app-purescript-docker-rm`

### app_purescript: Run

 1. `Command palette` -> `Tasks: Run Task` -> `app_purescript: Run`
     1. Or `$ app-purescript`

 2. Open [page](http://127.0.0.1:8001) in a browser

### Stop app_purescript

 1. Press `Ctrl` (`Cmd`) + `C` in the terminal
