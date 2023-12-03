# dot_files
nvim, tmux and initrc file

install neovim and lua using on linux 
```
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

sudo apt-get install lua5.3
```
or
```
brew install neovim
```
Install Packer from  https://github.com/wbthomason/packer.nvim

copy .zshrc with care, only alias are useful mainly
```
mv dot_files/.zshrc ~/
mkdir .config
cp -r dot_files/nvim ~/.config
```
