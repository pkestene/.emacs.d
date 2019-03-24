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

To use ccls with a cmake project:

[Ccls](https://github.com/MaskRay/ccls) uses a [compilation database](https://clang.llvm.org/docs/JSONCompilationDatabase.html). To generate it go into the build directory and do:
```shell
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON /path/to/sources
```
It will generate a ```compile_commands.json``` file, containing necessary commands to compile source files.

### Irony

Currently, you will have to manually install [irony](https://github.com/Sarcasm/irony-mode) server. From emacs, just type "M-x irony-install-server"

## Acknowledgements

This emacs configuration is inspired by the [centaur](https://github.com/seagle0128/.emacs.d) configuration.
