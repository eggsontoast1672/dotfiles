# dotfiles
My dotfiles for various programs.

I understand that my dotfiles aren't necessarily that complicated, but I've
added some explinations targeted at newbies for the sake of clarity. I know
what it's like to be new to something, and I also understand how much it can
hurt when you're really interested in topic and the entire community just
flames you for not having a lot of knowledge. 

Just remember to read through this document thouroughly if you need help, and
make sure to download all the required dependencies if your terminal is yelling
at you for not being able to find a certain command.

Happy customizing!


## .zshrc

### Overview
If you're using zsh at all, you probably know to put your .zshrc in your home
directory. If you're super new to linux and you just want to replicate my
setup, there's some action you need to take before this will work.

1. Make sure to install zsh. The command may vary based on what package manager
   you're using, but on ubuntu you would do `sudo apt install zsh`.

2. After installing zsh, you may or may not notice that it doesn't run as your
   shell automatically. Chances are bash is your default shell. You can check
   by running `echo $0` in a terminal and it should tell you what shell you
   have. If it's not zsh, you can run the command `chsh -l` to list your
   options. If `/bin/zsh` shows up, you can run `chsh -s /bin/zsh` to use zsh
   as your default shell.

3. To verify that the change was successful, you may have to restart your
   machine. If you check your shell and it says /bin/zsh, you're good to go.

### Dependencies:
- zsh
- neofetch


## init.vim

### Overview
Bear in mind that I am using neovim here and not regular vim. Make sure you put
this file in the `~/.config/nvim/` directory.

In order for this init.vim to work, make sure you install vim-plug. Refer to
the [github repo](https://github.com/junegunn/vim-plug) for detailed install
instructions. 

### Dependencies
- neovim 0.5.0
- vim-plug
