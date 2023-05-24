# NixOS

## Initial setup
´´´sudo nixos-rebuild switch --flake .´´´
´´´nix run .#homeConfigurations.bomal.activationPackage´´´
Then home-manager is available

## Usage

´´´sudo nixos-rebuild switch --flake .´´´
´´´home-manager switch --flake .´´´

