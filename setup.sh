ln -s ./dotfiles/Brewfile ~/Brewfile
ln -s ./dotfiles/.vimrc ~/.vimrc
ln -s ./dotfiles/.vim ~/.vim
ln -s ./dotfiles/.zsh ~/.zsh
ln -s ./dotfiles/.zprofile ~/.zprofile
ln -s ./dotfiles/.zalias ~/.zalias
ln -s ./dotfiles/.zshrc ~/.zshrc
ln -s ./dotfiles/.gitconfig ~/.gitconfig
ln -s ./dotfiles/.gemrc ~/.gemrc
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
