{ pkgs, ... }:


{  
  environment.systemPackages = with pkgs; [
    ((vim_configurable.override {  }).customize{
      name = "vim";
      # Install plugins for example for syntax highlighting of nix files
      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [ vim-nix vim-lastplace indentLine sleuth ];
        opt = [];
      };
      vimrcConfig.customRC = ''
        " your custom vimrc
        set nocompatible
        set backspace=indent,eol,start

	set number
        set relativenumber

        set autoindent
        set expandtab
        set shiftwidth=2
        set softtabstop=2
        set smarttab

        " dynamic cursor
        let &t_SI = "\<Esc>[6 q"
        let &t_SR = "\<Esc>[4 q"
        let &t_EI = "\<Esc>[2 q"

        " Turn on syntax highlighting by default
        syntax on
        " ...
      '';
    })
  ];

}
