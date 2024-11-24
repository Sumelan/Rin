{
  services.borgbackup.jobs."borgbase" = {
    paths = [
      "/var/lib/nextcloud"
    ];
    exclude = [
    ];
    repo = "tn864p7j@tn864p7j.repo.borgbase.com:repo";
    encryption = {
      mode = "repokey-blake2";
      passCommand = "cat /root/borgbackup/passphrase";
    };
    environment.BORG_RSH = "ssh -i /root/borgbackup/ssh_key";
    compression = "auto,lzma";
    startAt = "daily";
  };
}
