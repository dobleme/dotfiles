# .dotfiles
My Nix / Home manager files.

## Setup

Create nix file configuration

### First generation

```bash
# Install nix
sh <(curl -L https://nixos.org/nix/install) --daemon

# Build and activate
nix build https://github.com/dobleme/archive/master.tar.gz && ./result/activate
```

Setup zsh shell manually with

# TODO
- [x] git
- [ ] neovim
- [ ] tmux
- [ ] zsh
- [x] starship
