{pkgs, ...}: {
  systemd.services.kmonad = {
    wantedBy = ["multi-user.target"];
    after = ["network.target"];
    description = "Start kmonad";
    serviceConfig = {
      Type = "simple";
      User = "root";
      ExecStart = "${pkgs.haskellPackages.kmonad}/bin/kmonad /home/nikita/.config/kmonad/config.kbd";
    };
  };
}
