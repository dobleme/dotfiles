{pkgs, lib, ...}: {
    programs.starship = {
        enable = true;
        enableZshIntegration = true;
        settings = {
            add_newline = false;
            format = lib.concatStrings [
                "$sudo"
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
                format = "[$symbol ]($style)";
                style = "bold bright-purple";
                symbol = "Σ";
            };
            directory = {
                disabled = false;
                style = "bold bright-cyan";
                truncation_length = 2;
                truncation_symbol = "./";
                home_symbol = "~";
                repo_root_style = "bold blue";
            };
            git_branch = {
                disabled = false;
                format = "[$branch]($style)";
                style = "bright-white";
                truncation_length = 20;
            };
            custom.git_status_dirty = {
                when = "test -n \"$(git status --porcelain)\"";
                symbol = "*";
                style = "white";
                format = "[$symbol]($style)";
                shell = ["bash" "--norc" "--noprofile"];
            };
            git_status = {
                # https://github.com/starship/starship/issues/4927
                # https://github.com/starship/starship/discussions/1252#discussioncomment-692829
                disabled = false;
                format = "[ ($ahead_behind )](yellow)";
                ahead = "⇡$\{count\}";
                behind = "⇣$\{count\}";
                diverged = "⇡$\{ahead_count\}⇣$\{behind_count\}";
                up_to_date = "";
            };
            git_metrics = {
                disabled = false;
                format = "([\\[](bright-black)([+$added](dimmed green))([-$deleted](dimmed red))[\\]](bright-black) )";
            };
            git_state = {
                disabled = false;
            };
            character = {
                success_symbol = "[](bright-green)";
                error_symbol = "[](bright-red)";
            };
        };
    };
}
