{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wezterm
  ];

  xdg.configFile."wezterm/wezterm.lua".text = ''
    local wezterm = require 'wezterm'

    local my_framer = wezterm.color.get_builtin_schemes()['Framer (base16)']
    
    return {
      config.enable_wayland = true
      font_size = 12,
      window_background_opacity = 0.30,
      hide_tab_bar_if_only_one_tab = true,

      color_schemes = {
        ['My Framer'] = my_framer,
      },

      color_scheme = 'My Framer',
    }
  '';
}
