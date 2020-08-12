# dotfiles
My dotfiles. [Dotbot](https://github.com/anishathalye/dotbot) is used to bootstrap dotfiles.

## Features
* `.bashrc` configures terminal color for *Linux* and *macOS* respectively.
* `.vimrc` works for *Linux*, *macOS* and *Windows*! It checks if system is good enough to enable plugins.
  * *macOS* and *Windows* are good, as they usually have large memory for desktop environment.
  * For *Linux*, only enables plugins if computer has larger than 3600 MB memory.
* `.tmux.conf` sources [tmuxline.vim](https://github.com/edkolev/tmuxline.vim) configuration if exists.

## Deploy on Windows
To run Dotbot on Windows, open a git bash shell with admin privilege. See [Fix links not successfully setup in Git Bash with Git for Windows](https://github.com/anishathalye/dotbot/wiki/Troubleshooting#fix-links-not-successfully-setup-in-git-bash-with-git-for-windows) for more steps.
