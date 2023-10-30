{ pkgs, lib, config, ... }: {
    programs.starship = {
        enable = true;
        enableZshIntegration = true;
        settings = {
            add_newline = false;
            format = lib.concatStrings [
                "$sudo"
                # "$nix_shell"
                "$directory"
                "$git_branch"
                "$\{custom.git_status_dirty\}"
                "$git_status"
                "$git_metrics"
                "$git_state"
                "$custom"
                "$character"
            ];
            sudo = {
                disabled = false;
                format = "[\\[](#${config.colorScheme.colors.base02})[$symbol]($style)[\\]](#${config.colorScheme.colors.base02}) ";
                style = "bold dimmed red";
                symbol = "Σ";
            };
            # nix_shell = {
            #     disabled = false;
            #     format = "[$symbol$state]($style)";
            # };
            directory = {
                disabled = false;
                style = "bold blue";
                repo_root_style = "bold #${config.colorScheme.colors.base07}";
                truncation_length = 2;
                home_symbol = "~";
            };
            git_branch = {
                disabled = false;
                format = "[$branch]($style)";
                style = "#${config.colorScheme.colors.base07}";
                truncation_length = 20;
            };
            custom.git_status_dirty = {
                when = "test -n \"$(git status --porcelain)\"";
                symbol = "*";
                style = "#${config.colorScheme.colors.base07}";
                format = "[$symbol]($style)";
                shell = ["bash" "--norc" "--noprofile"];
            };
            git_status = {
                # https://github.com/starship/starship/issues/4927
                # https://github.com/starship/starship/discussions/1252#discussioncomment-692829
                disabled = false;
                format = "[ ($ahead_behind )](dimmed yellow)";
                ahead = "⇡$\{count\}";
                behind = "⇣$\{count\}";
                diverged = "⇡$\{ahead_count\}⇣$\{behind_count\}";
                up_to_date = "";
            };
            git_metrics = {
                disabled = false;
                format = "([\\[](#${config.colorScheme.colors.base02})([+$added](dimmed green))([-$deleted](dimmed red))[\\]](#${config.colorScheme.colors.base02}) )";
            };
            git_state = {
                disabled = false;
            };
            character = {
                success_symbol = "[](green)";
                error_symbol = "[](red)";
            };
        };
    };
}
