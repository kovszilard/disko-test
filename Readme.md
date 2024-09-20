# Install

Create `/tmp/secret.key` file with disk passphrase.
```
sudo nix --extra-experimental-features 'nix-command flakes' run github:nix-community/disko#disko-install -- --flake github:kovszilard/disko-test#disko-laptop --mode format --write-efi-boot-entries --disk main /dev/sda
```
