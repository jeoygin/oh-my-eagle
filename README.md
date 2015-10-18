# Oh my emacs

## Prerequisites

### Go

#### System Env

```bash
export GOPATH=/path/to/gopath
export PATH=${PATH}:${GOPATH}/bin
```

#### Binaries

```bash
$ go get -u github.com/dougm/goflymake
$ go get -u github.com/nsf/gocode
```

### C/C++

* [GNU Global](http://www.gnu.org/software/global/)
* $ brew install llvm --with-clang
* M-x irony-install-server RET
* export GTAGSLIBPATH=$HOME/.gtags/

