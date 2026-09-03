{...}: {
  programs.vim = {
    enable = true;

    defaultEditor = true;

    settings = {
      number = true;
      relativenumber = true;
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
    };

    extraConfig = ''
      syntax on
      set cursorline
      set ignorecase
      set smartcase
      set mouse=a

      " Suche hervorheben
      set hlsearch
      set incsearch
    '';
  };
}
