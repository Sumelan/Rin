{ self, config, lib, pkgs, ... }:
{
  services.nextcloud = {
    enable = true;
    hostName = "sakurairo.theworkpc.com";
  ## Need to manually increment with every major upgrade.
    package = pkgs.nextcloud29;
  # Let NixOS install and configure the database automatically.
    database.createLocally = true;
  # Let NixOS install and configure Redis caching automatically.
    configureRedis = true;
  # Increase the maximum file upload size to avoid problems uploading vidoes.
    maxUploadSize = "16G";
    https = true;

    autoUpdateApps.enable = true;
    extraAppsEnable = true;
    extraApps = with config.services.nextcloud.package.packages.apps; {
      # List of apps we want to install and are already packaged in
      # https://github.com/NixOS/nixpkgs/blob/master/pkgs/servers/nextcloud/packages/nextcloud-apps.json
      inherit calendar contacts mail notes;
    };

    settings = {
      overwriteprotocol = "https";
      defaultPhoneRegion = "JP";
      enabledPreviewProviders = [
        "OC\\Preview\\BMP"
        "OC\\Preview\\GIF"
        "OC\\Preview\\JPEG"
        "OC\\Preview\\Krita"
        "OC\\Preview\\MarkDown"
        "OC\\Preview\\MP3"
        "OC\\Preview\\OpenDocument"
        "OC\\Preview\\PNG"
        "OC\\Preview\\TXT"
        "OC\\Preview\\XBitmap"
        "OC\\Preview\\HEIC"
      ];
    };

    config = {
      dbtype = "pgsql";
      adminuser = "bathys";
      adminpassFile = "/var/nextcloud-admin-pass";
    };
  };

  services.nginx.virtualHosts = {
    ${config.services.nextcloud.hostName} = {
      forceSSL = true;
      enableACME = true;
    };
  };

  security.acme = {
    acceptTerms = true;
    certs.${config.services.nextcloud.hostName} = {
      email = "nishimura7802@gmail.com";
    };
  };
}
