{ pkgs, ... }:

{
 
  services.xserver = {
    enable = true;

    displayManager = {
       sddm.enable = false;
       lightdm.enable = true;
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
