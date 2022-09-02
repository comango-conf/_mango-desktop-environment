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
      dropbox
      firefox
      gh
      kitty
      thunderbird
      vscode.fhs
      discord
      signal-desktop
      wally-cli
      spotify
    ];
  };
}
