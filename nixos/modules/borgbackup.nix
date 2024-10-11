{
  services.borgbackup.jobs."borgbase" = {
    paths = [
      "/var/lib/nextcloud"
    ];
    exclude = [
    ];
    repo = "u36h67h7@u36h67h7.repo.borgbase.com:repo";
    encryption = {
      mode = "repokey-blake2";
      passCommand = "cat /root/borgbackup/passphrase";
    };
    environment.BORG_RSH = "ssh -i /root/borgbackup/ssh_key";
    compression = "auto,lzma";
    startAt = "daily";
  };
}
