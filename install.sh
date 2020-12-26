# install ohmyzsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# load zsh configuration
rm -f ~/.zshrc
ln zshrc ~/.zshrc

# install cows for cowsay
git clone https://github.com/bkendzior/cowfiles.git $HOME/.cowsay

# install powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# load zshrc
source $HOME/.zshrc


# load tmux configuration
rm -f ~/.tmux.conf
ln tmux.conf ~/.tmux.conf


# load bash configuration
rm -f ~/.bashrc ~/.bash_profile
ln bashrc ~/.bashrc
ln bash_profile ~/.bash_profile


# load gdb configuration
rm -f ~/.gdbinit
ln gdbinit ~/.gdbinit


# load vim configuration
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

rm -f ~/.vimrc
ln vimrc ~/.vimrc
vim +PluginInstall +qall
touch ~/.vim/colors/monokai.vim

