{ pkgs, ... }:

{
  programs.foot.enable = true;
  programs.foot.settings = {
    main = { 
    	term = "foot";
	font = "FiraCode Nerd Font:size=12";
	dpi-aware = "yes";  
	pad = "0x0";
    };  

    mouse = {
        hide-when-typing = "yes";
    };
    colors = {
        alpha = "0.90";
	background = "000000";
    };
  };
}

