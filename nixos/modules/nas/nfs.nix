{ config, pkgs, ... }:

{
  # Enable NFS server
  services.nfs.server = {
    enable = true;
    exports = ''
      /storage_mirror/nfs  *(rw,sync,no_subtree_check,no_root_squash)
    '';
  };
  services.rpcbind.enable = true;
}
