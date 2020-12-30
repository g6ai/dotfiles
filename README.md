# Dotfiles
My dotfiles. [Dotbot](https://github.com/anishathalye/dotbot) is used to bootstrap dotfiles. See [install.conf.yaml](https://github.com/g6ai/dotfiles/blob/master/install.conf.yaml) for my Dotbot configuration.

## Features
### Bash
* `.bashrc` configures terminal color for *Linux* and *macOS* respectively. It also configures highlighting of `less` pager.
* `motd` folder has a bash script to personalise motd, which is run by Dotbot.

### Vim
* `.vimrc` works for *Linux*, *macOS* and *Windows*! It checks if system is good enough to enable plugins.
  * *macOS* and *Windows* are good, as they usually have large memory for desktop environment.
  * For *Linux*, it only enables plugins if computer has memory larger than 3600 MB.
  * For clipboard enabled Vim installation, within an SSH session, primary and/or clipboard content on the remote server can be sent to local machine by X11 forwarding.

### tmux
* `.tmux.conf` sources [tmuxline.vim](https://github.com/edkolev/tmuxline.vim) configuration if exists. The configuration defines vi key bindings. Access to system clipboard is supported:
  * For *macOS*, `pbcopy` is used. `pbcopy` is installed on *macOS* by default.
  * For *Linux*, `xclip` is used. `xclip` needs to be installed. Within an SSH session, primary and/or clipboard content on the remote server can be sent to local machine by X11 forwarding.
* `.update_display.sh` updates environment variable `$DISPLAY` when tmux sessions are re-attached. This is especially useful when attaching tmux session over SSH X session, as Vim clipboard refers to `$DISPLAY` when forwarding clipboard content through X11.

### Other config
These configuration files may have versions for different OS, and is deployed per OS thanks to Dotbot's `if` parameter in `link` command.
* `aria2` folder includes config file for aria2. See [options section of aria2 documentation](https://aria2.github.io/manual/en/html/aria2c.html#options) for more options.
* `mpv` folder includes config files for mpv. It is tuned for my macOS machine, but also works for other OS. See [mpv documentation](https://mpv.io/manual/master/) for more options.

## Deploy on Windows
* To run Dotbot on Windows, open a git bash shell with admin privilege. See [Fix links not successfully setup in Git Bash with Git for Windows](https://github.com/anishathalye/dotbot/wiki/Troubleshooting#fix-links-not-successfully-setup-in-git-bash-with-git-for-windows) for more steps.
* gVim runs okay on Windows. For command line Vim, use cmd or powershell; git bash does not work, as it does not support `has()`.
