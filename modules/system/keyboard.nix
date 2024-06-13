
{ ... }: {

  # Configure keymap in X11
  services.xserver.xkb = {
    # layout = "us,us";
    # variant = "alt-intl,";
    # model = "pc104";
    # options = "grp:win_space_toggle,caps:escape_shifted_capslock";

    layout = "us";
    variant = "alt-intl";
    model = "pc104";
  };

  # Configure console keymap
  # console.keyMap = "us";

}

