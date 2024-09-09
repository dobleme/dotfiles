{pkgs, ...}: {
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        dotDir = ".config/zsh";
        autocd = true;
        shellAliases = {
            z = "source $HOME/.zshrc";
            s = "sudo";
            v = "vi";
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
