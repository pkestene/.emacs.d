# Emacs.d

## Installation

To install the configuration, go into your home and clone the repository:
```shell
cd ~ && git clone https://github.com/pkestene/.emacs.d.git
```
Don't forget to remove any old .emacs.d configuration before cloning.

## Requirement

emacs-26

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

[Ccls](https://github.com/MaskRay/ccls) uses a [compilation database](https://clang.llvm.org/docs/JSONCompilationDatabase.html). To generate it go into the build directory and do:
```shell
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON /path/to/sources
```
It will generate a ```compile_commands.json``` file, containing necessary commands to compile source files.

<!-- ### Compdb -->

<!-- It can also be usefull to have 'compile commands' for header files. They can be provided by [compdb](https://github.com/Sarcasm/compdb), using the ```compile_commands.json``` file and generating a new one. -->
<!-- ```shell -->
<!-- compdb -p build -c compdb.complementers=headerdb update -->
<!-- compdb -p build -c compdb.complementers=headerdb list > compile_commands.json -->
<!-- ``` -->

## Acknowledgements

This emacs configuration is inspired by the [centaur](https://github.com/seagle0128/.emacs.d) configuration.
