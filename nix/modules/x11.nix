{ pkgs, ... }:

{
 
  services.xserver = {
    enable = true;

    deviceSection = ''Option "TearFree" "true"''; # For amdgpu.

    displayManager = {
       gdm.enable = true;
       sddm.enable = false;
       lightdm.enable = false;
       defaultSession = "hyprland";
    };
    desktopManager = {
      plasma5.enable = false;
      gnome.enable = false; 
    };

    windowManager = {
      awesome.enable = true;
    };

    layout = "us";
    xkbModel = "pc104";
    xkbVariant = "";
    xkbOptions = "compose:ralt";
  };
  
}
