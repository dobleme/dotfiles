# .dotfiles
This is only my dotfiles. Nothing more.

These are done alongside with [this ansible playbook](https://github.com/dobleme/home.local)
that comission my local machines.

## Setup

### First generation

```bash
# Install nix
sh <(curl -L https://nixos.org/nix/install) --daemon

# Build and activate
nix build https://github.com/dobleme/archive/master.tar.gz && ./result/activate
```

## Resources
A list of tools and useful resouces I used for this dotfiles.

- https://github.com/rothgar/mastering-zsh
- https://github.com/unixorn/zsh-quickstart-kit
- https://github.com/unixorn/fzf-zsh-plugin
- https://github.com/unixorn/awesome-zsh-plugins
- https://github.com/junegunn/fzf/wiki/examples
- https://starship.rs
- https://sw.kovidgoyal.net/kitty
