let
  user = import ./env.nix;
in
{
  programs.git = {
    enable = true;
    userName = "Ibrahim Dursun";
    userEmail = "ibrahim@dursun.cc";
    #delta.enable = true;
    difftastic.enable = true;
    iniContent = {
      commit.gpgSign = true;
      gpg = {
        format = "ssh";
        ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      };
      pull.rebase = true;
      pull.ff = "only";
      init.defaultBranch = "main";
      user = {
          name = user.git.personal.name;
          email = user.git.personal.email;
          signingkey = user.git.personal.signingkey;
      };
    };

    lfs.enable = true;

    aliases = {
      gg = "log --graph --abbrev-commit --decorate --date=relative --oneline --all";
    };

    extraConfig = {
      remote."origin".prune = true;
      credential.helper = "/usr/local/share/gcm-core/git-credential-manager";
      credential = {
        "https://dev.azure.com" = { useHttpPath = true; };
        "https://gh.stackoverflow.com" = { gitHubAuthModes = "oauth"; provider = "github"; };
      };
      merge.tool = "code";
      mergetool."code".cmd = "code --wait --merge $REMOTE $LOCAL $BASE $MERGED";
      rebase.autosquash = true;
    };

    includes = [
      {
        condition = "gitdir:~/repositories/";
        contents = {
          user = {
            name = user.git.personal.name;
            email = user.git.personal.email;
            signingkey = user.git.personal.signingkey;
          };
        };
      }
      {
        condition = "gitdir:~/workspace/";
        contents = {
          user = {
            name = user.git.work.name;
            email = user.git.work.email;
            signingkey = user.git.work.signingkey;
          };
        };
      }
    ];
  };
}
