{
services = {
	  gvfs.enable = true;
	  tumbler.enable = true;	
	  udev.enable = true;
	  envfs.enable = true;
	  dbus.enable = true;
	  fwupd.enable = true;
	  upower.enable = true;
### Laptop
    	thermald.enable = true;
    	tlp.enable = true;
  	logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    	HandlePowerKey=suspend
  	'';
  };
}
