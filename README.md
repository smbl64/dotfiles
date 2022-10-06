# dotfiles
My dotfiles for different apps

## Usage
- `vim` folder must be linked to `~/.vim` folder.
- `nvim` folder must be linked to `~/.config/nvim` folder.
- `tmux/tmux.conf` must be linked to `~/.tmux.conf` file.
- `bat` folder must be linked to `~/.config/bat` folder.
- `ctags` folder contains the configurations for [universal ctags][ctags] and must be linked to `~/.ctags.d` folder.
- `postgres/psqlrc` contains the configurations for `psql` command and must be linked to `~/.psqlrc` file.
- `inputrc` must be linked to `~/.inputrc` file.
- `ripgrep/ripgreprc` must be linked to `~/.ripgreprc` file.
- `emacs.d` must be linked to `~/.emacs.d`.
- `bash/bash_profile`, `bash/bashrc`, and `bash/bash_prompt` must be linked to `~/.bash_profile`, `~/.bashrc`, and `~/.bash_prompt` respectively.
- `bash/scripts` must be added to the `$PATH`. This is already covered by the provided `bash/bashrc` file, if this repo is cloned into `~/scripts` folder.

## Inspiraton
- [wouter bolsterlee][wbolster-dotfiles]
- [Chris Toomey][christoomey-dotfiles]



[ctags]: https://github.com/universal-ctags/ctags
[wbolster-dotfiles]: https://github.com/wbolster/dotfiles
[christoomey-dotfiles]: https://github.com/christoomey/dotfiles
