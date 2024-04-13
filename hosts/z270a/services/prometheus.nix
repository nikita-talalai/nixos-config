{
  services.prometheus = {
    enable = true;
    port = 9001;
    globalConfig = {
      scrape_interval = "10s";
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
    ];
  };
}
