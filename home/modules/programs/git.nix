{config, ...}: {
  sops.secrets = {
    git_name = {key = "git.name";};
    git_email = {key = "git.email";};
  };

  sops.templates."git-identity" = {
    content = ''
      [user]
        name = ${config.sops.placeholder.git_name}
        email = ${config.sops.placeholder.git_email}
    '';
  };

  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      user.name = "";
      user.email = "";
    };
    includes = [
      {path = config.sops.templates."git-identity".path;}
    ];
  };
}
