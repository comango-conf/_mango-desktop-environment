{ pkgs, ... }:

{
 
  services.xserver = {
    enable = true;

    deviceSection = ''Option "TearFree" "true"''; # For amdgpu.

    displayManager = {
       sddm.enable = true;
       lightdm.enable = false;
       defaultSession = "none+awesome";
    };
    desktopManager = {
      plasma5.enable = false;
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
