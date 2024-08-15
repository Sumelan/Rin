{ self, config, lib, pkgs, ... }:
{
  services.audiobookshelf = {
    enable = false;
    port = 8234;
    openFirewall = true;
  };

  services.nginx.virtualHosts = {
    "audiobookshelf.sakurairo.ddnsfree.com" = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://localhost:8234/";
        proxyWebsockets = true;
      };
    };
  };

  security.acme = {
    acceptTerms = true;
    certs."audiobookshelf.sakurairo.ddnsfree.com" = {
      email = "bathys@proton.me";
    };
  };
}
