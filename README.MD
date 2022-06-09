### After checkout

For MacOs
```bash
cd ~
rm ~/.zshrc && ln -s ~/configs/.zshrc ~/.zshrc
ln -s ~/configs/.gitconfig ~/.gitconfig
ln -s ~/configs/.gitignore ~/.gitignore
rm ~/.config/kitty/kitty.conf && ln -s ~/configs/kitty.conf ~/.config/kitty/kitty.conf
```

For linux
```bash
cd ~
rm ~/.zshrc && ln -s ~/configs/.zshrc ~/.zshrc
ln -s ~/configs/.gitconfig_linux ~/.gitconfig
ln -s ~/configs/.gitignore ~/.gitignore
rm ~/.config/kitty/kitty.conf && ln -s ~/configs/kitty.conf ~/.config/kitty/kitty.conf
```
