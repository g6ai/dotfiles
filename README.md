# Dotfiles
My dotfiles. Some of my considerations are explained in [Wiki](https://github.com/g6ai/dotfiles/wiki).

![dark mode](https://github.com/g6ai/dotfiles/wiki/screenshots/dark.png)

More screenshots [here](https://github.com/g6ai/dotfiles/wiki/Screenshots).

## Features

### Deploy with ease

[Dotbot](https://github.com/anishathalye/dotbot) is used to bootstrap dotfiles.

* Deploy by `git clone https://github.com/g6ai/dotfiles && cd dotfiles && ./install`.
* See [install.conf.yaml](https://github.com/g6ai/dotfiles/blob/master/install.conf.yaml) for my Dotbot configuration.

### Bash
* `.bashrc` configures terminal color for *Linux* and *macOS* respectively. It also configures highlighting of `less` pager.
* `motd` folder has a Bash script to personalise motd, which is run by Dotbot.

### Vim
* `.vimrc` works for *Linux*, *macOS* and *Windows*! It checks if system is good enough to enable plugins.
  * *macOS* and *Windows* are good, as they usually have large memory for desktop environment.
  * For *Linux*, it only enables plugins if computer has memory larger than 3600 MB.
  * For clipboard enabled Vim installation, within an SSH session, primary and/or clipboard content on the remote server can be sent to local machine by X11 forwarding.
  * `pyenv` is supported.

### tmux
* `.tmux.conf` sources [tmuxline.vim](https://github.com/edkolev/tmuxline.vim) configuration if exists. The configuration defines vi key bindings. Access to system clipboard is supported:
  * For *macOS*, `pbcopy` is used. `pbcopy` is installed on *macOS* by default.
  * For *Linux*, `xclip` is used. `xclip` needs to be installed. Within an SSH session, primary and/or clipboard content on the remote server can be sent to local machine by X11 forwarding.
* `.update_display.sh` updates environment variable `$DISPLAY` when tmux sessions are re-attached. This is especially useful when attaching tmux session over SSH X session, as Vim clipboard refers to `$DISPLAY` when forwarding clipboard content through X11.

### Git

Global `.gitignore` files per OS. [GitHub’s collection of `.gitignore` file templates](https://github.com/github/gitignore) are used.

### Other config
These configuration files may have versions for different OS, and is deployed per OS thanks to Dotbot's `if` parameter in `link` command.
* `aria2` folder includes config file for aria2. See [options section of aria2 documentation](https://aria2.github.io/manual/en/html/aria2c.html#options) for more options.
* `mpv` folder includes config files for mpv. See [mpv documentation](https://mpv.io/manual/master/) for more options.
