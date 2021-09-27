# dotfiles
My dotfiles for various programs.

## .zshrc

### Overview
If you're using zsh at all, you probably know to put your .zshrc in your home directory. If you're super new to linux and you just want to replicate my setup, there's some action you need to take before this will work.

1. Make sure to install zsh. The command may vary based on what package manager you're using, but on ubuntu you would do <br>
`sudo apt install zsh`.

2. After installing zsh, you may or may not notice that it doesn't run as your shell automatically. Make sure to configure that in your terminal emulator's settings. For example, if you're using Xfce Terminal, you can pull up a GUI containing the settings. Under general, click the box that says 'Run a custom command instead of my shell' and then enter '/bin/zsh' in the box. Bear in mind that this process may vary depending on your terminal emulator.

3. If you've gotten this far without error, you've successfully installed zsh and made it your default shell.

### Dependencies:
- neofetch
