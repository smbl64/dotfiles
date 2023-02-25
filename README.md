# dotfiles
My dotfiles for different apps

## Usage
- `vim` folder must be linked to `~/.vim` folder.
- `nvim` folder must be linked to `~/.config/nvim` folder.
- `alacritty` folder must be linked to `~/.config/alacritty` folder.
- `direnv` folder must be linked to `~/.config/direnv` folder.
- `tmux/tmux.conf` must be linked to `~/.tmux.conf` file.
- `bat` folder must be linked to `~/.config/bat` folder.
- `starship/starship.toml`  must be linked to `~/.config/starship.toml` file.
- `ctags` folder contains the configurations for [universal ctags][ctags] and must be linked to `~/.ctags.d` folder.
- `postgres/psqlrc` contains the configurations for `psql` command and must be linked to `~/.psqlrc` file.
- `sqlite/sqliterc` contains the configurations for `sqlite` command and must be linked to `~/.sqliterc` file.
- `inputrc` must be linked to `~/.inputrc` file.
- `vscode` folder's contents must be symlinked to the proper location on each OS. on macOS:
    ```
    ln -s $HOME/dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
    ln -s $HOME/dotfiles/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
    ln -s $HOME/dotfiles/vscode/snippets $HOME/Library/Application\ Support/Code/User/snippets
    ```
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
