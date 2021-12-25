<div align="center">

# Dotfiles

![Latest commit](https://img.shields.io/github/last-commit/g6ai/dotfiles?style=flat)

My dotfiles. Some of my considerations are explained in [Wiki](https://github.com/g6ai/dotfiles/wiki).

[Deployment](#deploy-with-ease) • [Bash](#bash) • [Zsh](#zsh) • [Vim](#vim) • [Neovim](#neovim) • [Doom Emacs](#doom-emacs) • [tmux](#tmux) • [Git](#git) • [Terminal emulators](#terminal-emulators) • [Other config](#other-config)

![](https://github.com/g6ai/dotfiles/wiki/screenshots/complex.png)

More screenshots [here](https://github.com/g6ai/dotfiles/wiki/Screenshots).

</div>

## Features

### Deploy with ease

[*chezmoi*](https://www.chezmoi.io/) is used to bootstrap dotfiles.

* Deploy with shell one-liner:
    ```sh
    sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply g6ai
    ```

### Bash
* [`.shrc`](https://github.com/g6ai/dotfiles/blob/master/shrc) configures terminal color for *Linux* and *macOS* respectively. It also configures highlighting of *less* pager. It is then sourced by [`.bashrc`](https://github.com/g6ai/dotfiles/blob/master/bash/bashrc).
* [`motd`](https://github.com/g6ai/dotfiles/tree/master/motd) folder has a Bash script to personalise motd, which is run by *Dotbot*.

### Zsh
* [`zsh`](https://github.com/g6ai/dotfiles/tree/master/zsh) folder contains common settings from Bash, while utilising *oh-my-zsh* for fancy features.

### Vim
* [`.vimrc`](https://github.com/g6ai/dotfiles/blob/master/vim/vimrc) works for *Linux*, *macOS* and *Windows*! It checks if system is good enough to enable plugins.
  * *macOS* and *Windows* are good, as they usually have large memory for desktop environment.
  * For *Linux*, it only enables plugins if computer has memory larger than 3600 MB.
  * For clipboard enabled *Vim* installation, within an *SSH* session, primary and/or clipboard content on the remote server can be sent to local machine by *X11* forwarding.
  * *pyenv* is supported.

### Neovim
* The [`init.vim`](https://github.com/g6ai/dotfiles/blob/master/vim/nvim/init.vim) uses the versatile configs in [`.vimrc`](https://github.com/g6ai/dotfiles/blob/master/vim/vimrc).
* Adopts the mighty [*coc.nvim*](https://github.com/neoclide/coc.nvim). Its config is `coc-settings.json`.
* Some experimetal features in *Neovim* 0.5+ are also embraced:
  * [*nvim-treesitter*](https://github.com/nvim-treesitter/nvim-treesitter), provides beautiful code highlighting and more.
  * [*telescope.nvim*](https://github.com/nvim-telescope/telescope.nvim), next generation fuzzy finder.

### Doom Emacs

* Configs for [*org-journal*](https://github.com/bastibe/org-journal) and [*Org-roam*](https://github.com/org-roam/org-roam), to cooperate with [*beorg*](https://beorgapp.com/manual/).

### tmux
* [`.tmux.conf`](https://github.com/g6ai/dotfiles/blob/master/tmux/tmux.conf) sources [*tmuxline.vim*](https://github.com/edkolev/tmuxline.vim) configuration if exists. The configuration defines vi key bindings. Access to system clipboard is supported:
  * For *macOS*, *pbcopy* is used. *pbcopy* is installed on *macOS* by default.
  * For *Linux*, *xclip* is used. *xclip* needs to be installed. Within an *SSH* session, primary and/or clipboard content on the remote server can be sent to local machine by *X11* forwarding.
* Helper scripts [`update_display_tmuxline.sh`](https://github.com/g6ai/dotfiles/blob/master/tmux/update_display_tmuxline.sh) and [`update_tmuxline.sh`](https://github.com/g6ai/dotfiles/blob/master/tmux/update_tmuxline.sh) update environment variable `$DISPLAY` and tmuxline for various scenarios.

### Git

Global `.gitignore` [files](https://github.com/g6ai/dotfiles/tree/master/git) per OS. [GitHub’s collection of `.gitignore` file templates](https://github.com/github/gitignore) are used.

### Terminal emulators
From my experience, there's no perfect terminal emulator. I have tried *Terminal.app*, *iTerm2*, *kitty* and *Alacritty*. Currently I'm using *kitty*.
* [`kitty`](https://github.com/g6ai/dotfiles/tree/master/kitty) folder includes the *kitty* configuration file `kitty.conf` for different OS.
* [`alacritty`](https://github.com/g6ai/dotfiles/tree/master/alacritty) folder includes the *Alacritty* configuration file `alacritty.yml` for different OS.

### Other config
These configuration files may have versions for different OS, and is deployed per-OS thanks to *Dotbot*'s *if* parameter in *link* command.
* [`jupyter`](https://github.com/g6ai/dotfiles/tree/master/jupyter) folder includes config files for *JupyterLab*. See [config file and command line options of Jupyter Server](https://jupyter-server.readthedocs.io/en/latest/other/full-config.html) for details.
* [`aria2`](https://github.com/g6ai/dotfiles/tree/master/aria2) folder includes config file for *aria2*. See [options section of aria2 documentation](https://aria2.github.io/manual/en/html/aria2c.html#options) for more options.
* [`mpv`](https://github.com/g6ai/dotfiles/tree/master/mpv) folder includes config files for *mpv*. See [mpv documentation](https://mpv.io/manual/master/) for more options.
