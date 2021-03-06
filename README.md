# Emacs.d

## Installation

To install the configuration, go into your home and clone the repository:
```shell
cd ~ && git clone https://github.com/pkestene/.emacs.d.git
```
Don't forget to remove any old .emacs.d configuration before cloning.

## Requirement


On ubuntu (e.g. 18.04), just do the following to have emacs-26

```shell
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt install emacs26

# next step is to make emacs-26 your default version (for both emacs and emacsclient)
sudo update-alternatives --config emacs
sudo update-alternatives --config emacsclient
```

### Ccls or clangd

To install [ccls](https://github.com/MaskRay/ccls), follow the steps from the [wiki](https://github.com/MaskRay/ccls/wiki/Build) and make command _ccls_ available in your PATH.

Example:
```shell
git clone https://github.com/MaskRay/ccls.git
cd ccls; mkdir build; cd build
cmake -H. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/home/pkestene/local/ccls  ..
make; make install
# then make sure ccls bin executable is in your PATH env variable
```

To use ccls with a cmake project using C++ source code:

[Ccls](https://github.com/MaskRay/ccls) uses a [compilation database](https://clang.llvm.org/docs/JSONCompilationDatabase.html). To generate it go into the build directory of your C++ project and do:
```shell
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON /path/to/sources
```
It will generate a ```compile_commands.json``` file, containing necessary commands to compile source files.
Then, you should copy (or make a symbolic link) ```compile_commands.json``` in the project top-level. If you open a source file, semantic completion and navigation will be enabled.

Alternative way of generating a compile commands file : [Bear](https://github.com/rizsotto/Bear) (already available as a regular package in Ubuntu 18.04). It works well with autotools-based projects.

If you don't want to build ccls, clangd (available as a package on Ubuntu) is a good alternative. It will be used if ccls is not found in your PATH environment variable.

### Emacs client/server

As emacs startup can be long when multiple plugins are activated, you might consider using emacs in client server mode.
See for example https://www.emacswiki.org/emacs/EmacsAsDaemon#toc2

Here is my systemd config file (```.config/systemd/user/emacsd.service```):
```ini
[Unit]
Description=Emacs: the extensible, self-documenting text editor
Documentation=man:emacs(1) info:Emacs

[Service]
Type=forking
ExecStart=/usr/bin/emacs --daemon
ExecStop=/usr/bin/emacsclient --eval "(progn (setq kill-emacs-hook nil) (kill-emacs))"
Restart=on-failure
Environment=DISPLAY=:%i
# Provide access to SSH (probably already setup)
# Environment=SSH_AUTH_SOCK=/run/user/1001/keyring/ssh
# Setup modules
TimeoutStartSec=0

[Install]
WantedBy=default.target
```

### Irony

Currently, you will have to manually install [irony](https://github.com/Sarcasm/irony-mode) server. From emacs, just type "M-x irony-install-server"

### Company

To improve reactivity, you may change parameter `company-idle-delay` and turn it into 0.

### Python - LSP

If you want to edit a python file, and if LSP (Language Server Protocol) tells you `Command "pyls" is not present on the path.`, you can customize file `init/init-lsp.el` and set variable `lsp-pyls-server-command` to the full path of `pyls`, e.g.

``` emacs-lisp
(use-package lsp-mode
  :ensure t
  :hook ((c-mode c++-mode objc-mode python-mode) . lsp)
  :init
  (setq lsp-clients-clangd-executable "/usr/bin/clangd-9"
        lsp-pyls-server-command "/home/pkestene/local/miniconda3/envs/eclairs/bin/pyls")
  :config (use-package lsp-clients))
```

Don't forget to restart emacs server afterwards:

``` shell
systemctl restart --user emacsd
```

## Acknowledgements

This emacs configuration is inspired by the [centaur](https://github.com/seagle0128/.emacs.d) configuration.
