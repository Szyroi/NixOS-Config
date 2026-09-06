{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    qemu_kvm
    cpio
    gzip
  ];
}
