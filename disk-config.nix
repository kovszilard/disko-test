{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        # device = "/dev/vdb";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "5G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [
                  "defaults"
                ];
              };
            };
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted";
                extraOpenArgs = [ ];
                passwordFile = "/tmp/secret.key";
                # additionalKeyFiles = [ "/tmp/additionalSecret.key" ];
                content = {
                  type = "lvm_pv";
                  vg = "enc-pv";
                };
              };
            };
          };
        };
      };
    };
    lvm_vg = {
      enc-pv = {
        type = "lvm_vg";
        lvs = {
          swap = {
            size = "8G";
            content = {
              type = "swap";
              discardPolicy = "both";
              resumeDevice = true; # resume from hiberation from this device
            };
          };
          root = {
            size = "100%FREE";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
              mountOptions = [
                "defaults"
              ];
            };
          };
        };
      };
    };
  };
}
