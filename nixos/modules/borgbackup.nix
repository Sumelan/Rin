{
  services.borgbackup.jobs."borgbase-daily" = {
    paths = [
      "/var/lib/nextcloud/data/sumelan/files/Documents"
      "/var/lib/nextcloud/data/sumelan/files/Music"
      "/var/lib/nextcloud/data/sumelan/files/Notes"
      "/var/lib/nextcloud/data/sumelan/files/Pictures"
      "/var/lib/nextcloud/data/sumelan/files/Videos"
      "/var/lib/nextcloud/data/sumelan/files/VRChat"
    ];
    exclude = [
    ];
    repo = "pyur7fry@pyur7fry.repo.borgbase.com:repo";
    encryption = {
      mode = "repokey-blake2";
      passCommand = "cat /root/borgbackup/passphrase";
    };
    environment.BORG_RSH = "ssh -i /root/borgbackup/ssh_key";
    compression = "auto,lzma";
    startAt = "daily";
  };

  services.borgbackup.jobs."borgbase-weekly" = {
    paths = [
      "/var/lib/nextcloud/data/sumelan/files/Resource"
    ];
    exclude = [
    ];
    repo = "f92yij06@f92yij06.repo.borgbase.com:repo";
    encryption = {
      mode = "repokey-blake2";
      passCommand = "cat /root/borgbackup/passphrase";
    };
    environment.BORG_RSH = "ssh -i /root/borgbackup/ssh_key";
    compression = "auto,lzma";
    startAt = "weekly";
  };

  services.borgbackup.jobs."borgbase-montyly" = {
    paths = [
      "/var/lib/nextcloud/data/sumelan/files/Archive"
    ];
    exclude = [
    ];
    repo = "rdp4gk60@rdp4gk60.repo.borgbase.com:repo";
    encryption = {
      mode = "repokey-blake2";
      passCommand = "cat /root/borgbackup/passphrase";
    };
    environment.BORG_RSH = "ssh -i /root/borgbackup/ssh_key";
    compression = "auto,lzma";
    startAt = "monthly";
  };
}
