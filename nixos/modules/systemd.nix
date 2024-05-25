{
  systemd.services = {
	  NetworkManager-wait-online.enable = false;
	  firewalld.enable = true;
	  power-profiles-daemon = {
		  enable = true;
		  wantedBy = [ "multi-user.target" ];
  		};
  }; 

# Masking sleep, hibernate, suspend.. etc
  systemd = {
    targets = {
      sleep = {
	enable = false;
	unitConfig.DefaultDependencies = "no";
      };
      suspend = {
	enable = false;
	unitConfig.DefaultDependencies = "no";
      };
      hibernate = {
	enable = false;
      unitConfig.DefaultDependencies = "no";
      };
     "hybrid-sleep" = {
	enable = false;
	unitConfig.DefaultDependencies = "no";
      };
    };
  };
}
