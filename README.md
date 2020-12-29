# dotfiles
My dotfiles. [Dotbot](https://github.com/anishathalye/dotbot) is used to bootstrap dotfiles.

## Features
* `.bashrc` configures terminal color for *Linux* and *macOS* respectively.
* `.vimrc` works for *Linux*, *macOS* and *Windows*! It checks if system is good enough to enable plugins.
  * *macOS* and *Windows* are good, as they usually have large memory for desktop environment.
  * For *Linux*, it only enables plugins if computer has memory larger than 3600 MB.
  * For clipboard enabled Vim installation, within an SSH session, primary and/or clipboard content on the remote server can be sent to local machine by X11 forwarding.
* `.tmux.conf` sources [tmuxline.vim](https://github.com/edkolev/tmuxline.vim) configuration if exists. The configuration defines vi key bindings. Access to system clipboard is supported:
  * For *macOS*, `pbcopy` is used. `pbcopy` is installed on *macOS* by default.
  * For *Linux*, `xclip` is used. `xclip` needs to be installed. Within an SSH session, primary and/or clipboard content on the remote server can be sent to local machine by X11 forwarding.
* On re-attaching tmux sessions, updating environment variable $DISPLAY is considered in `.update_display.sh`. This is especially useful when attaching tmux session over SSH X session, as Vim clipboard refers to $DISPLAY variable when forwarding clipboard content through X11.
* `aria2` includes config file for aria2.

## Deploy on Windows
* To run Dotbot on Windows, open a git bash shell with admin privilege. See [Fix links not successfully setup in Git Bash with Git for Windows](https://github.com/anishathalye/dotbot/wiki/Troubleshooting#fix-links-not-successfully-setup-in-git-bash-with-git-for-windows) for more steps.
* gVim runs okay on Windows. For command line Vim, use cmd or powershell; git bash does not work, as it does not support `has()`.
