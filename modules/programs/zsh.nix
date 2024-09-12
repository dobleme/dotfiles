{pkgs, ...}: {
    programs.zsh = {
        enable = true;
        autocd = true;
        dotDir = ".config/zsh";
        shellAliases = {
            z = "source ~/config/zsh/.zshrc";
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
        enableCompletion = true;
        syntaxHighlighting.enable = true;
        autosuggestion.enable = true;
    };
}
