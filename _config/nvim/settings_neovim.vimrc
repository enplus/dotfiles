let fpath_nvim = expand('$HOME/.config/nvim/settings_neovim')
let uname = system("uname -s")

for fpath in split(globpath(fpath_nvim, '*.vimrc'), '\n')

  if (fpath == expand(fpath_nvim) . "/enplus-keymap-mac.vim") && uname[:4] ==? "linux"
    continue " skip mac mappings for linux
  endif

  if (fpath == expand(fpath_nvim) . "/enplus-keymap-linux.vim") && uname[:4] !=? "linux"
    continue " skip linux mappings for mac
  endif

  exe 'source' fpath
endfor
