<div align="center">

# Dotfiles

![Latest commit](https://img.shields.io/github/last-commit/g6ai/dotfiles?style=flat)

My dotfiles. Some of my considerations are explained in [Wiki](https://github.com/g6ai/dotfiles/wiki).

[Deployment](#deploy-with-ease-and-efficiency) • [Bash](#bash) • [Zsh](#zsh) • [Vim/Neovim](#vimneovim) • [Doom Emacs](#doom-emacs) • [tmux](#tmux) • [Git](#git) • [Terminal emulators](#terminal-emulators) • [Other config](#other-config)

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/g6ai/dotfiles/wiki/screenshots/dark.png">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/g6ai/dotfiles/wiki/screenshots/light.png">
  <img alt="" src="https://github.com/g6ai/dotfiles/wiki/screenshots/dark.png">
</picture>

More screenshots [here](https://github.com/g6ai/dotfiles/wiki/Screenshots).

</div>

## Features

### Deploy with ease and efficiency

[*chezmoi*](https://www.chezmoi.io/) is used to bootstrap dotfiles.

* Deploy with shell one-liner:
    ```sh
    sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply g6ai
    ```

* Uses [`text/template`](https://pkg.go.dev/text/template) syntax from Go extended with [text template functions from `sprig`](http://masterminds.github.io/sprig/).

    For instance, here is a typical snippet in one of my dotfiles, [`init.vim.tmpl`](https://github.com/g6ai/dotfiles/blob/main/private_dot_config/nvim/init.vim.tmpl), residing in [`private_dot_config/nvim`](https://github.com/g6ai/dotfiles/tree/main/private_dot_config/nvim):
    ```go
    {{ $x := splitList "_" .chezmoi.sourceFile /* private dot config/nvim/init.vim.tmpl */ -}}
    {{ $y := last $x | dir /* config/nvim */ -}}
    {{ $rtp := list "~/." $y | join "" /* ~/.config/nvim */ -}}
    {{ $vim_flag := .vim_flag -}}
    {{ template "vim/vimrc" dict "rtp" $rtp "os" .chezmoi.os "vim_flag" $vim_flag -}}
    ```
    It passes variables `rtp`, `os` and `vim_flag` to a common [`vimrc`](https://github.com/g6ai/dotfiles/blob/main/.chezmoitemplates/vim/vimrc) template in [`.chezmoitemplates/vim`](https://github.com/g6ai/dotfiles/tree/main/.chezmoitemplates/vim). This [`vimrc`](https://github.com/g6ai/dotfiles/blob/main/.chezmoitemplates/vim/vimrc) template contains both the actual config details and the logic operations which check the variables it receives on deployment, so it can generate different config per *Vim* variants (*Vim* or *Neovim*), OS (*Linux* or *macOS*) and other user-defined variables.

    Such snippets are extensively used in these dotfiles to manage config files of different environments in one place ([`.chezmoitemplates`](https://github.com/g6ai/dotfiles/tree/main/.chezmoitemplates)), keeping the resource-demanding logical operations at the **deployment step** rather than the **runtime**.

### Bash
* [`shrc.sh`](https://github.com/g6ai/dotfiles/blob/main/.chezmoitemplates/shrc.sh) template configures terminal color for *Linux* and *macOS* respectively. It also configures highlighting of *less* pager. It is then sourced by [`bashrc`](https://github.com/g6ai/dotfiles/blob/main/.chezmoitemplates/bashrc) template.
* [`run_append_motd`](https://github.com/g6ai/dotfiles/blob/main/run_append_motd) is a Bash script to personalise motd, which is run by *chezmoi*.

### Zsh
* [`dot_zshrc.tmpl`](https://github.com/g6ai/dotfiles/blob/main/dot_zshrc.tmpl) template contains common settings from Bash, while utilising [*Zim*](https://zimfw.sh/) for fancy features.

### Vim/Neovim
* The configs are located in the [`.chezmoitemplates/vim`](https://github.com/g6ai/dotfiles/tree/main/.chezmoitemplates/vim) directory. They are then deployed to *Vim* and *Neovim*'s runtime path.
    * *Vim*'s [`vimrc.tmpl`](https://github.com/g6ai/dotfiles/blob/main/dot_vim/vimrc.tmpl) template and *Neovim*'s [`init.vim.tmpl`](https://github.com/g6ai/dotfiles/blob/main/private_dot_config/nvim/init.vim.tmpl) template use the versatile configs in [`vimrc`](https://github.com/g6ai/dotfiles/blob/main/.chezmoitemplates/vim/vimrc) template, which works for *Linux*, *macOS* and *Windows*! You can set if your system is good enough to enable plugins on *chezmoi* deployment.
    * Most of the `vimrc`'s functionalities are divided and located in [`core`](https://github.com/g6ai/dotfiles/tree/main/.chezmoitemplates/vim/core) directory.
* Neovim-specific config:
    * Adopts the mighty [*coc.nvim*](https://github.com/neoclide/coc.nvim). Its config is `coc-settings.json`.
    * Some experimetal features in *Neovim* 0.5+ are also embraced:
        * [*nvim-treesitter*](https://github.com/nvim-treesitter/nvim-treesitter), provides beautiful code highlighting and more.
        * [*telescope.nvim*](https://github.com/nvim-telescope/telescope.nvim), next generation fuzzy finder.

### Doom Emacs

* Configs for [*org-journal*](https://github.com/bastibe/org-journal) and [*Org-roam*](https://github.com/org-roam/org-roam), to cooperate with [*beorg*](https://beorgapp.com/manual/).

### tmux
* [`dot_tmux.conf`](https://github.com/g6ai/dotfiles/blob/main/dot_tmux.conf) sources [*tmuxline.vim*](https://github.com/edkolev/tmuxline.vim) configuration if exists. The configuration defines vi key bindings. Access to system clipboard is supported:
  * For *macOS*, *pbcopy* is used. *pbcopy* is installed on *macOS* by default.
  * For *Linux*, *xclip* is used. *xclip* needs to be installed. Within an *SSH* session, primary and/or clipboard content on the remote server can be sent to local machine by *X11* forwarding.
* Helper scripts [`executable_update_display_tmuxline.sh`](https://github.com/g6ai/dotfiles/blob/main/private_dot_config/tmux/executable_update_display_tmuxline.sh) and [`executable_update_tmuxline.sh`](https://github.com/g6ai/dotfiles/blob/main/private_dot_config/tmux/executable_update_tmuxline.sh) update environment variable `$DISPLAY` and tmuxline for various scenarios.

### Git

Global [`dot_gitignore_global.tmpl`](https://github.com/g6ai/dotfiles/blob/main/dot_gitignore_global.tmpl) per OS template. [GitHub’s collection of `.gitignore` file templates](https://github.com/github/gitignore) are used.

### Terminal emulators
From my experience, there's no perfect terminal emulator. I have tried *Terminal.app*, *iTerm2*, *Alacritty*, *kitty* and *WezTerm*. Currently I'm using *WezTerm*.
* [`wezterm`](https://github.com/g6ai/dotfiles/tree/main/private_dot_config/wezterm) folder includes the *WezTerm* configuration file `wezterm.lua`.
* [`kitty`](https://github.com/g6ai/dotfiles/tree/main/private_dot_config/kitty) folder includes the *kitty* configuration file `kitty.conf` for different OS.
* [`alacritty`](https://github.com/g6ai/dotfiles/tree/main/private_dot_config/alacritty) folder includes the *Alacritty* configuration file `alacritty.yml` for different OS.

### Other config
* [`dot_jupyter`](https://github.com/g6ai/dotfiles/tree/main/dot_jupyter) folder includes config files for *JupyterLab* configs. See [config file and command line options of Jupyter Server](https://jupyter-server.readthedocs.io/en/latest/other/full-config.html) for details.
    * [`jupytext.toml`](https://github.com/g6ai/dotfiles/blob/main/private_dot_config/jupytext.toml) is the config file for [*Jupytext*](https://jupytext.readthedocs.io/en/latest/).
* [`dot_aria2`](https://github.com/g6ai/dotfiles/tree/main/dot_aria2) folder includes config file for *aria2*. See [options section of aria2 documentation](https://aria2.github.io/manual/en/html/aria2c.html#options) for more options.
* [`mpv`](https://github.com/g6ai/dotfiles/tree/main/private_dot_config/mpv) folder includes config files for *mpv*. See [mpv documentation](https://mpv.io/manual/master/) for more options.
* *macOS* package manager:
    * [`darwin-configuration.nix`](https://github.com/g6ai/dotfiles/blob/main/dot_nixpkgs/darwin-configuration.nix) contains config of [*nix-darwin*](https://github.com/LnL7/nix-darwin).
    * [`Brewfile`](https://github.com/g6ai/dotfiles/blob/main/private_dot_config/Brewfile) contains config of the [*Homebrew Bundle*](https://github.com/Homebrew/homebrew-bundle) bundler.
