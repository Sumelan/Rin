{
  services = {
	gvfs.enable = true;
	tumbler.enable = true;	
	udev.enable = true;
	envfs.enable = true;
	dbus.enable = true;
	fwupd.enable = true;
	upower.enable = true;
# Display Manager
    	displayManager.sddm = {
        	enable = true;
        	autoNumlock = true;
        	wayland.enable = true;
        	theme = "sugar-dark";
      	};
    	xserver = {
      		enable = true;
      		desktopManager.cinnamon.enable = false;
        	xkb = {
          		layout = "us";
          		variant = "";
       		};
     	};

### Laptop
    	thermald.enable = true;
    	tlp.enable = true;
  	logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    	HandlePowerKey=ignore
  	'';
  };
}
