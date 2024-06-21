{ pkgs, config, ... }:
let
  theme = config.stylix.base16Scheme;
in
{
	programs.kitty = {
      		enable = true;
      		package = pkgs.kitty;
      		settings = {
        		scrollback_lines = 2000;
        		wheel_scroll_min_lines = 1;
        		window_padding_width = 4;
        		confirm_os_window_close = 0;
      		};
      		extraConfig = ''
        		foreground #${theme.base05}
        		background #${theme.base00}
        		color0  #${theme.base03}
        		color1  #${theme.base08}
        		color2  #${theme.base0B}
        		color3  #${theme.base09}
        		color4  #${theme.base0D}
        		color5  #${theme.base0E}
        		color6  #${theme.base0C}
        		color7  #${theme.base06}
        		color8  #${theme.base04}
        		color9  #${theme.base08}
        		color10 #${theme.base0B}
        		color11 #${theme.base0A}
        		color12 #${theme.base0C}
        		color13 #${theme.base0E}
        		color14 #${theme.base0C}
        		color15 #${theme.base07}
        		color16 #${theme.base00}
        		color17 #${theme.base0F}
        		color18 #${theme.base0B}
        		color19 #${theme.base09}
        		color20 #${theme.base0D}
        		color21 #${theme.base0E}
        		color22 #${theme.base0C}
        		color23 #${theme.base06}
        		cursor  #${theme.base07}
        		cursor_text_color #${theme.base00}
        		selection_foreground #${theme.base01}
        		selection_background #${theme.base0D}
        		url_color #${theme.base0C}
        		active_border_color #${theme.base04}
        		inactive_border_color #${theme.base00}
        		bell_border_color #${theme.base03}
        		tab_bar_style fade
        		tab_fade 1
        		active_tab_foreground   #${theme.base04}
        		active_tab_background   #${theme.base00}
        		active_tab_font_style   bold
        		inactive_tab_foreground #${theme.base07}
        		inactive_tab_background #${theme.base08}
        		inactive_tab_font_style bold
        		tab_bar_background #${theme.base00}
     			 '';
   		 };
}
