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
            git_status = {
                disabled = false;
                format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](white) ($ahead_behind )](yellow)";
                conflicted = " \b";
                untracked = " \b";
                modified = " \b";
                staged = " \b";
                renamed = " \b";
                deleted = " \b";
                ahead =	"⇡$\{count\}";
                behind = "⇣$\{count\}";
                diverged = "⇡$\{ahead_count\}⇣$\{behind_count\}";
                up_to_date = "";
            };
            git_metrics = {
                disabled = false;
                format = "([\[](bright-black)([+$added](dimmed green))([-$deleted](dimmed red))[\]](bright-black) )";
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
