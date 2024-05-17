{ pkgs, ... }:

{
 
  services.xserver = {
    enable = true;

    deviceSection = ''Option "TearFree" "true"''; # For amdgpu.

    xkb = {
      layout = "us";
      model = "pc104";
      variant = "";
      options = "compose:ralt";
    };
  };
  
}
