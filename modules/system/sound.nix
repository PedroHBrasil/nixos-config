
{ config, lib, pkgs, ... }: {
  # Enable sound with pipewire.
  sound.enable = true;
  # hardware.pulseaudio.enable = true;
  # hardware.pulseaudio.support32Bit = true;
  # hardware.pulseaudio.package = pkgs.pulseaudioFull;
  # hardware.pulseaudio.configFile = pkgs.writeText "default.pa" ''
  #   load-module module-bluetooth-policy
  #   load-module module-bluetooth-discover
  #   load-module module-switch-on-connect
  #   ## module fails to load with 
  #   ##   module-bluez5-device.c: Failed to get device path from module arguments
  #   ##   module.c: Failed to load module "module-bluez5-device" (argument: ""): initialization failed.
  #   # load-module module-bluez5-device
  #   # load-module module-bluez5-discover
  # '';
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

  #   # use the example session manager (no others are packaged yet so this is enabled by default,
  #   # no need to redefine it in your config for now)
  #   #media-session.enable = true;
  #   wireplumber.extraConfig = {
  #     "monitor.bluez.properties" = {
  #       "bluez5.enable-sbc-xq" = true;
  #       "bluez5.enable-msbc" = true;
  #       "bluez5.enable-hw-volume" = true;
  #       "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
  #     };
  #   };
  };
}

