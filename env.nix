let
  user = builtins.getEnv "USER";
  home = builtins.getEnv "HOME";
in 
{
  username = user;
  homeDirectory = home;
  git = {
    personal = {
      name = "Ibrahim Dursun";
      email = "ibrahim@dursun.cc";
      signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBc0shyBJNxba3uD0zZHG0aLIUR0CIx/Tef5dmHcefsE stack-mac";
    };
    work = {
      name = "Ibrahim Dursun";
      email = "idursun@stackoverflow.com";
      signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBc0shyBJNxba3uD0zZHG0aLIUR0CIx/Tef5dmHcefsE stack-mac";
    };
  };
}
