# dotfiles

Instructions taken from Medium post: https://fwuensche.medium.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b

# Getting started

create a .dotfiles folder, which we'll use to track your dotfiles
```
git init --bare $HOME/.dotfiles
```
create an alias dotfilesso you don't need to type it all over again
```
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
set git status to hide untracked files
```
dotfiles config --local status.showUntrackedFiles no
```
add the alias to .bashrc (or .zshrc) so you can use it later
```
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
```

# Setup environment in a new computer
Make sure to have git installed, then:

clone your github repository
```
git clone --bare https://github.com/USERNAME/dotfiles.git $HOME/.dotfiles
```
define the alias in the current shell scope
```
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
checkout the actual content from the git repository to your $HOME
```
dotfiles checkout
```

# Usage
Now you can use regular git commands such as:
```
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles add .bashrc
dotfiles commit -m "Add bashrc"
dotfiles push
```
