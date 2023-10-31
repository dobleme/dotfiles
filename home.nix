{ pkgs, lib, config, nix-colors, ... }: let
    nixGL = pkg: pkgs.runCommand "${pkg.name}-nixgl-wrapper" {} ''
	    mkdir $out
	    ln -s ${pkg}/* $out
	    rm $out/bin
        mkdir $out/bin
        for bin in ${pkg}/bin/*; do
            wrapped_bin=$out/bin/$(basename $bin)
            echo "exec ${lib.getExe pkgs.nixgl.nixGLIntel} $bin \$@" > $wrapped_bin
            chmod +x $wrapped_bin
        done
    '';
in {
    xdg.enable = true;
    targets.genericLinux.enable = true;
    fonts.fontconfig.enable = true;

    imports = [
        nix-colors.homeManagerModules.default
        ./programs/git.nix
        ./programs/nvim/nvim.nix
        ./programs/zsh.nix
        ./programs/starship.nix
    ];

    # colorScheme = nix-colors.colorSchemes.lime;
    # colorScheme = nix-colors.colorSchemes.pico;
    # colorScheme = nix-colors.colorSchemes.pandora;
    # colorScheme = nix-colors.colorSchemes.pop;
    colorScheme = nix-colors.colorSchemes.purpledream;

    home.packages = [
        pkgs.ripgrep
        pkgs.btop
        pkgs.iftop
        pkgs.tig
        (pkgs.nerdfonts.override { fonts = [ "CascadiaCode" ]; })

        # GUI
        pkgs.nixgl.nixGLIntel
        # (nixGL pkgs.spotify)
        # (nixGL pkgs.vivaldi)

        # Scripts
        # (pkgs.buildEnv {
        #     name = "my-scripts";
        #     paths = [ ./bin ];
        #     pathsToLink = [ "/bin" ];
        # })
    ];

    programs.bat = {
        enable = true;
        config = { theme = "base16"; };
    };

    programs.fzf = {
        enable = true;
        enableZshIntegration = true;
        tmux = {
            enableShellIntegration = true;
            shellIntegrationOptions = [
                "-p 65%,45%"
            ];
        };
        colors = with config.colorScheme.colors; {
            bg = "#${base00}"; "bg+" = "#${base01}";
            fg = "#${base04}"; "fg+" = "#${base06}";
            hl = "#${base0D}"; "hl+" = "#${base0D}";
            spinner = "#${base0C}";
            header = "#${base0D}";
            info = "#${base0A}";
            pointer = "#${base0C}";
            marker = "#${base0C}";
            prompt = "#${base0A}";
        };
    };

    programs.alacritty = {
        enable = true;
        package = nixGL pkgs.alacritty;
        settings = {
            env = { TERM = "xterm-256color"; };
            window = {
                padding = { x = 8; y = 8; };
                decorations = "None";
                opacity = 0.95;
                startup_mode = "Maximized";
                dynamic_title = true;
                decorations_theme_variant = "None";
            };
            scrolling = {
                history = 10000;
                multiplier = 3;
            };
            font = {
                size = 11.0;
                normal = {
                    family = "CaskaydiaCove Nerd Font Mono";
                    style = "Regular";
                };
                bold = {
                    family = "CaskaydiaCove Nerd Font Mono";
                    style = "Bold";
                };
                italic = {
                    family = "CaskaydiaCove Nerd Font Mono";
                    style = "Italic";
                };
                bold_italic = {
                    family = "CaskaydiaCove Nerd Font Mono";
                    style = "Bold Italic";
                };
            };
            selection = {
                #semantic_escape_chars = ",│`|:\"' ()[]{}<>\t";
                save_to_clipboard = false;
            };
            cursor = {
                style = {
                    shape = "Block";
                    blinking = "On";
                };
                vi_mode_style = "Block";
                blink_interval = 750;
                blink_timeout = 5;
                unfocused_hollow = true;
            };
            live_config_reload = true;
            working_directory = "None";
            draw_bold_text_with_bright_colors = false;
            colors = {
                primary = {
                    background = "0x${config.colorScheme.colors.base00}";
                    foreground = "0x${config.colorScheme.colors.base05}";
                };
                cursor = {
                    text = "0x${config.colorScheme.colors.base00}";
                    cursor = "0x${config.colorScheme.colors.base05}";
                };
                normal = {
                    black = "0x${config.colorScheme.colors.base00}";
                    red = "0x${config.colorScheme.colors.base08}";
                    green = "0x${config.colorScheme.colors.base0B}";
                    yellow = "0x${config.colorScheme.colors.base0A}";
                    blue = "0x${config.colorScheme.colors.base0D}";
                    magenta = "0x${config.colorScheme.colors.base0E}";
                    cyan = "0x${config.colorScheme.colors.base0C}";
                    white = "0x${config.colorScheme.colors.base05}";
                };
                bright = {
                    black = "0x${config.colorScheme.colors.base03}";
                    red = "0x${config.colorScheme.colors.base08}";
                    green = "0x${config.colorScheme.colors.base0B}";
                    yellow = "0x${config.colorScheme.colors.base0A}";
                    blue = "0x${config.colorScheme.colors.base0D}";
                    magenta = "0x${config.colorScheme.colors.base0E}";
                    cyan = "0x${config.colorScheme.colors.base0C}";
                    white = "0x${config.colorScheme.colors.base07}";
                };
                indexed_colors = [
                    { index = 16; color = "0x${config.colorScheme.colors.base09}"; }
                    { index = 17; color = "0x${config.colorScheme.colors.base0F}"; }
                    { index = 18; color = "0x${config.colorScheme.colors.base01}"; }
                    { index = 19; color = "0x${config.colorScheme.colors.base02}"; }
                    { index = 20; color = "0x${config.colorScheme.colors.base04}"; }
                    { index = 21; color = "0x${config.colorScheme.colors.base06}"; }
                ];
            };
        };
    };

    programs.tmux.enable = true;

    xdg.configFile = {
        "tmux/tmux.conf".source = ./programs/tmux.conf;
    };

    programs.home-manager.enable = true;
}
