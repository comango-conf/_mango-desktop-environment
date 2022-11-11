{ pkgs, ... }:

{
  
  nixpkgs.overlays = [ (self: super: {
    discord = (super.discord.override {
      nss = super.nss_latest;
    });
  })];

  users.users.hannah = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "openrazer" "plugdev" "dialout" ];
    packages = with pkgs; [
      discord
      dropbox
      firefox
      gh
      kitty
      python310Packages.pygments
      signal-desktop
      spotify
      texlive.combined.scheme-full
      thunderbird
      ungoogled-chromium
      vscode.fhs
      wally-cli
      zotero
      inotify-tools
      gnumake
    ];
  };
}
