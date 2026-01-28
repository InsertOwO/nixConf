{...}: # Most minimal boot.

{
  boot.loader = {
    systemd-boot.enable = true;
    timeout = 0;
  };
}
