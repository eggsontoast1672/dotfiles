# dotfiles
My dotfiles for various programs.

I understand that my dotfiles aren't necessarily that complicated, but I've added some explinations targeted at newbies for the sake of clarity. I know what it's like to be new to something, and I also understand how much it can hurt when you're really interested in topic and the entire community just flames you for not having a lot of knowledge. 

Just remember to read through this document thouroughly if you need help, and make sure to download all the required dependencies if your terminal is yelling at you for not being able to find a certain command.

Happy customizing!

## .zshrc

### Overview
If you're using zsh at all, you probably know to put your .zshrc in your home directory. If you're super new to linux and you just want to replicate my setup, there's some action you need to take before this will work.

1. Make sure to install zsh. The command may vary based on what package manager you're using, but on ubuntu you would do <br>
`sudo apt install zsh`.

2. After installing zsh, you may or may not notice that it doesn't run as your shell automatically. Make sure to configure that in your terminal emulator's settings. For example, if you're using Xfce Terminal, you can pull up a GUI containing the settings. Under general, click the box that says 'Run a custom command instead of my shell' and then enter '/bin/zsh' in the box. Bear in mind that this process may vary depending on your terminal emulator.

3. If you've gotten this far without error, you've successfully installed zsh and made it your default shell.

### Dependencies:
- zsh
- neofetch

## init.vim

### Overview
Bear in mind that I am using neovim here and not regular vim. Make sure you put this file in the `~/.config/nvim/` directory. Also, another notable thing to mention is that I am using neovim version 0.5.0 here, so if you just did `sudo apt install neovim` on ubuntu, that's not going to cut it. Make sure you're using a version later than or equal to version 0.5.0 by running `nvim --version`.

In order for this init.vim to work, make sure you install vim-plug. Refer to the [github repo](https://github.com/junegunn/vim-plug) for detailed install instructions. If building from source is scary to you, I understand, but if you're planning on sticking with GNU/linux, you may as well learn now.

### Dependencies
- neovim 0.5.0
- vim-plug
