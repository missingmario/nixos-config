{ ... }:
let
  keyboardLayout = "us";
in
{
  # Video
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = keyboardLayout;
  };
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Audio
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
  };
}
