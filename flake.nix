{
  description = "Rust OS Kernel Development Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    let
      system = "x86_64-linux";
      target = "x86_64-elf";
      pkgs = import nixpkgs { inherit system; };

    in
    {
      devShells.${system}.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          pkg-config
        ];
        buildInputs = with pkgs; [
          gcc
          meson
          clang-tools
          cmake
          pkg-config
          libcxx
        ];

        shellHook = ''
          export CROSS_COMPILE=${target}-
          export CC=${target}-gcc
          zsh -c 'nvim'
        '';
      };
    };
}
