{
  services.borgbackup.jobs."borgbase" = {
    paths = [
      "/var/lib"
      "/srv"
      "/home"
    ];
    exclude = [
      # Cache.
      "/home/sumelan/.cache"

      # very large paths
      "/var/lib/docker"
      "/var/lib/systemd"
      "/var/lib/libvirt"

      # NOT much frequently changed.
      "/var/lib/audiobookshelf"
    
      # temporary files created by cargo and `go build`
      "**/target"
      "/home/*/go/bin"
      "/home/*/go/pkg"
    ];
    repo = "ef79t855@ef79t855.repo.borgbase.com:repo";
    encryption = {
      mode = "repokey-blake2";
      passCommand = "cat /root/borgbackup/passphrase";
    };
    environment.BORG_RSH = "ssh -i /root/borgbackup/ssh_key";
    compression = "auto,lzma";
    startAt = "daily";
  };
}
