# Emacs.d

## Installation

To install the configuration, go into your home and clone the repository:
```shell
cd ~ && git clone https://github.com/pkestene/.emacs.d.git
```
Don't forget to remove any old .emacs.d configuration before cloning.

## Requirement


On ubuntu (e.g. 18.04), just do the following to have emacs-26

```shel
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt install emacs26

# next step is to make emacs-26 your default version (for both emacs and emacsclient)
sudo update-alternatives --config emacs
sudo update-alternatives --config emacsclient
```

### Ccls

To install [ccls](https://github.com/MaskRay/ccls), follow the steps from the [wiki](https://github.com/MaskRay/ccls/wiki/Build) and make command _ccls_ available in your PATH.

Example:
```shell
git clone https://github.com/MaskRay/ccls.git
cd ccls; mkdir build; cd build
cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_INSTALL=/home/pkestene/local/ccls -DCMAKE_PREFIX_PATH=/home/pkestene/install/ccls/github/clang_llvm/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04 ..
make; make install
# then make sure ccls bin executable is in your PATH env variable
```


To use ccls with a cmake project using C++ source code:

[Ccls](https://github.com/MaskRay/ccls) uses a [compilation database](https://clang.llvm.org/docs/JSONCompilationDatabase.html). To generate it go into the build directory of your C++ project and do:
```shell
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON /path/to/sources
```
It will generate a ```compile_commands.json``` file, containing necessary commands to compile source files.
Then, from the build directory (where ```compile_commands.json``` file is created), if you open a source file, semantic completion and navigation will be enabled.

Alternative way of generating a compile commands file : [Bear](https://github.com/rizsotto/Bear) (already available as a regular package in Ubuntu 18.04)

### Emacs client/server

As emacs startup can be long when multiple plugins are activated, you might consider using emacs in client server mode.
See for example https://www.emacswiki.org/emacs/EmacsAsDaemon#toc2

Here is my systemd config file (```.config/systemd/user/emacsd.service```):
```ìni
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

## Acknowledgements

This emacs configuration is inspired by the [centaur](https://github.com/seagle0128/.emacs.d) configuration.
