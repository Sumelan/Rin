{
  networking.networkmanager.enable = true;
  services.openssh = {
    enable = true;
### TODO: Add your SSH public key(s) here, if you plan on using SSH to connect.
   # authorizedKeys.keys = [ ];
    settings = {
      PermitRootLogin = "no";
### Change to false if you want to SSH using public key(s). (recommended)
      PasswordAuthentication = true;
    };
  };

# Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 ];
  networking.firewall.allowedUDPPorts = [ ];
# Or disable the firewall altogether.
  #networking.nftables.enable = true;
}
