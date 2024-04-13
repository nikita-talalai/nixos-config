{
  services.prometheus = {
    enable = true;
    port = 9001;
    globalConfig = {
      scrape_interval = "10s";
    };
    exporters = {
      node = {
        enable = true;
        port = 9002;
      };
    };
    scrapeConfigs = [
      {
        job_name = "xmonad";
        static_configs = [
          {
            targets = [
              "localhost:9532"
            ];
          }
        ];
      }
      {
        job_name = "z270a";
        static_configs = [
          {
            targets = [ "127.0.0.1:9002" ];
          }
        ];
      }
    ];
  };
}
