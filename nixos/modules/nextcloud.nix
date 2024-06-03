{ self, config, lib, pkgs, ... }:
{
  services.nextcloud = {
    enable = false;
    hostName = "sakurapc.freeddns.org";
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
      inherit calendar contacts mail notes onlyoffice tasks;
    };

    settings = let
      prot = "https"; # or http
      host = "127.0.0.1";
      dir = "/nextcloud";
    in {
      overwriteprotocol = prot;
      overwritehost = host;
      overwritewebroot = dir;
      overwrite.cli.url = "${prot}://${host}${dir}/";
      htaccess.RewriteBase = dir;
      defaultPhoneRegion = "JP";
    };
    config = {
      dbtype = "pgsql";
      adminuser = "bathys";
      adminpassFile = "/var/nextcloud-admin-pass";
    };
    extraOptions.enabledPreviewProviders = [
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

  services.nginx.virtualHosts = {
    ${config.services.nextcloud.hostName} = {
      forceSSL = true;
      enableACME = true;
      listen = [
      { 
       addr = "127.0.0.1";
       port = 8080; # NOT an exposed port
      }
      ];
    };
  };

  services.nginx.virtualHosts."localhost" = {
    "^~ /.well-known" = {
            priority = 9000;
            extraConfig = ''
              absolute_redirect off;
              location ~ ^/\\.well-known/(?:carddav|caldav)$ {
                return 301 /nextcloud/remote.php/dav;
              }
              location ~ ^/\\.well-known/host-meta(?:\\.json)?$ {
                return 301 /nextcloud/public.php?service=host-meta-json;
              }
              location ~ ^/\\.well-known/(?!acme-challenge|pki-validation) {
                return 301 /nextcloud/index.php$request_uri;
              }
              try_files $uri $uri/ =404;
            '';
    };
    "/nextcloud/" = {
            priority = 9999;
            extraConfig = ''
              proxy_set_header X-Real-IP $remote_addr;
              proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
              proxy_set_header X-NginX-Proxy true;
              proxy_set_header X-Forwarded-Proto http;
              proxy_pass http://127.0.0.1:8080/; # tailing / is important!
              proxy_set_header Host $host;
              proxy_cache_bypass $http_upgrade;
              proxy_redirect off;
            '';
    };
  };

  security.acme = {
    acceptTerms = true;
    certs.${config.services.nextcloud.hostName} = {
      email = "nishimura7802@gmail.com";
    };
  };
}
