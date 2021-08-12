<div align="center">

# Dotfiles

![Latest commit](https://img.shields.io/github/last-commit/g6ai/dotfiles?style=flat)

My dotfiles. Some of my considerations are explained in [Wiki](https://github.com/g6ai/dotfiles/wiki).

[Deployment](https://github.com/g6ai/dotfiles#deploy-with-ease) • [Bash](https://github.com/g6ai/dotfiles#bash) • [Zsh](https://github.com/g6ai/dotfiles#zsh) • [Vim](https://github.com/g6ai/dotfiles#vim) • [Neovim](https://github.com/g6ai/dotfiles#neovim) • [Doom Emacs](https://github.com/g6ai/dotfiles#doom-emacs) • [tmux](https://github.com/g6ai/dotfiles#tmux) • [Git](https://github.com/g6ai/dotfiles#git) • [Terminal emulators](https://github.com/g6ai/dotfiles#terminal-emulators) • [Other config](https://github.com/g6ai/dotfiles#other-config)

![](https://github.com/g6ai/dotfiles/wiki/screenshots/complex.png)

More screenshots [here](https://github.com/g6ai/dotfiles/wiki/Screenshots).

</div>

## Features

### Deploy with ease

[Dotbot](https://github.com/anishathalye/dotbot) is used to bootstrap dotfiles.

* Deploy with one-liner shell command:
    ```console
    git clone https://github.com/g6ai/dotfiles && cd dotfiles && ./install
    ```
* See [install.conf.yaml](https://github.com/g6ai/dotfiles/blob/master/install.conf.yaml) for my Dotbot configuration.

### Bash
* `.bashrc` configures terminal color for *Linux* and *macOS* respectively. It also configures highlighting of `less` pager.
* `motd` folder has a Bash script to personalise motd, which is run by Dotbot.

### Zsh
* `.zshrc` uses common settings from Bash, while utilising oh-my-zsh for fancy features.

### Vim
* `.vimrc` works for *Linux*, *macOS* and *Windows*! It checks if system is good enough to enable plugins.
  * *macOS* and *Windows* are good, as they usually have large memory for desktop environment.
  * For *Linux*, it only enables plugins if computer has memory larger than 3600 MB.
  * For clipboard enabled Vim installation, within an SSH session, primary and/or clipboard content on the remote server can be sent to local machine by X11 forwarding.
  * `pyenv` is supported.

### Neovim
* The `init.vim` uses the versatile configs in `.vimrc`.
* Adopts the mighty [`coc.nvim`](https://github.com/neoclide/coc.nvim). Its config is [`coc-settings.json`](https://github.com/g6ai/dotfiles/blob/master/vim/nvim/coc-settings.json)
* Some experimetal features in Neovim 0.5 (nightly) are also embraced:
  * [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter), provides beautiful code highlighting and more.
  * [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim), next generation fuzzy finder.

### Doom Emacs

* Configs for org-journal, to cooperate with beorg.

### tmux
* `.tmux.conf` sources [tmuxline.vim](https://github.com/edkolev/tmuxline.vim) configuration if exists. The configuration defines vi key bindings. Access to system clipboard is supported:
  * For *macOS*, `pbcopy` is used. `pbcopy` is installed on *macOS* by default.
  * For *Linux*, `xclip` is used. `xclip` needs to be installed. Within an SSH session, primary and/or clipboard content on the remote server can be sent to local machine by X11 forwarding.
* Helper scripts `update_display_tmuxline.sh` and `update_tmuxline.sh` update environment variable `$DISPLAY` and tmuxline for various scenarios.

### Git

Global `.gitignore` files per OS. [GitHub’s collection of `.gitignore` file templates](https://github.com/github/gitignore) are used.

### Terminal emulators
From my experience, there's no perfect terminal emulator. I have tried **Terminal.app**, **iTerm2**, **kitty** and **Alacritty**. Currently I'm jumping between kitty and Alacritty.
* `kitty` folder includes the kitty configuration file `kitty.conf` for different OS.
* `alacritty` folder includes the Alacritty configuration file `alacritty.yml` for different OS.

### Other config
These configuration files may have versions for different OS, and is deployed per OS thanks to Dotbot's `if` parameter in `link` command.
* `jupyter` folder includes config files for JupyterLab. See [config file and command line options of Jupyter Server](https://jupyter-server.readthedocs.io/en/latest/other/full-config.html) for details.
* `aria2` folder includes config file for aria2. See [options section of aria2 documentation](https://aria2.github.io/manual/en/html/aria2c.html#options) for more options.
* `mpv` folder includes config files for mpv. See [mpv documentation](https://mpv.io/manual/master/) for more options.
