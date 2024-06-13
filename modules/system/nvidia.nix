
{ config, lib, pkgs, ... }: {

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];
  # services.xserver.videoDrivers = ["noveau"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
      sync.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  # environment.sessionVariables.ELECTRON_OZONE_PLATFORM_HINT = "auto";
}

