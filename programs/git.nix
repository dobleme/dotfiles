{pkgs, ...}: {
    programs.git = {
        enable = true;
        userName = "Lluc Martorell";
        userEmail = "7830854+dobleme@users.noreply.github.com";
        aliases = {
            pls = "push --force-with-lease";
            ap = "add -p";
            ae = "add -e";
            st = "status -s";
            br = "branch -vv";
            co = "checkout";
            wt = "worktree";
            cm = "commit --verbose";
            cmm = "commit -m";
            cmend = "commit --verbose --amend";
            cmendo = "commit --amend --no-edit";
            r = "rebase";
            ri = "rebase --interactive";
            cpk = "cherry-pick";
            gr = "grep";
            wip = "commit -m '[wip]'";
            wipa = "!git add -A && git commit -m '[wip]'";
            unwip = "!git --no-pager log -n 1 | grep '\\[wip\\]' && git reset @^1";
            reseto = "!git fetch && git reset --hard FETCH_HEAD";
        };
        extraConfig = {
            user = { signingKey = "CBEE33EBABE95308"; };
            core = { editor = "vi"; };
            init = { defaultBranch = "main"; };
            pull = { rebase = true; };
            push = { autoSetupRemote = true; };
            pager = { branch = false; };
            commit = { gpgSign = true; };
        };
        ignores = [
            ".wt"
        ];
        includes = [
            {
                path = "~/dev/work";
                condition = ".config/git/work";
            }
        ];
    };
}