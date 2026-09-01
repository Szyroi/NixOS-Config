{...}: {
  boot.kernel.sysctl = {
    "kernel.sysrq" = 1;
    "net.ipv4.tcp_syncookies" = true;
    "vm.swappiness" = 60;
    "vm.vfs_cache_pressure" = 50;
    "vm.dirty_background_ratio" = 5;
    "vm.dirty_ratio" = 20;
  };
}
