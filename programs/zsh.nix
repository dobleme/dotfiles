{pkgs, ...}: {
    programs.zsh = {
        enable = true;
        autocd = true;
        shellAliases = {
            z = "source $HOME/.zshrc";
            s = "sudo";
            v = "vim";
            g = "git";
            d = "docker";
            "." = "cd ~";
            ".." = "cd ..";
            "..." = "cd ../..";
            "-- -" = "cd -";
            ls = "ls --color";
            l = "ls -lha";
            ll = "ls -lh";
        };
    };
}
