{ pkgs, ... }:
let 
  spotifywmDesktopItem = pkgs.makeDesktopItem {
    name = "spotifywm";
    desktopName = "Spotify";
    exec = "spotifywm";
    terminal = false; 
  };
in
{
  
  nixpkgs.overlays = [ (self: super: {
    discord = (super.discord.override {
      nss = super.nss_latest;
    });
  })];

  users.users.hannah = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "openrazer" "plugdev" "dialout" "syncthing" ];
    packages = with pkgs; [
      discord
      dropbox
      firefox
      gh
      kitty
      lm_sensors
      obsidian
      python310Packages.pygments
      signal-desktop
      spotifywm
      spotifywmDesktopItem
      thunderbird
      ungoogled-chromium
      vscode.fhs
      wally-cli
      zotero
      inotify-tools
      gnumake
      deno
    ];
  };
}
