{...}: {
  programs.ssh = {
    enable = true;
    matchBlocks = {
      xiaomei = {
        hostname = "xiaomei.cat-wahoo.ts.net";
        user = "raftario";
      };
    };
  };
}
