### for NEOVIM.

### Bundle & Pathogen 설치

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && \

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

* 이후 :PluginInstall!
---

### YouCompleteMe

```
sudo apt-get install cmake
sudo apt-get install g++
sudo apt-get install python2.7
sudo apt-get install python2.7-dev
sudo apt-get install llvm
sudo apt-get install libclang-dev

./install.py --clang-completer
```

* 이후 :PluginInstall!
---
