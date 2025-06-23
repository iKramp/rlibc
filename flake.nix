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
          ninja
          llvmPackages.clang
          llvmPackages.llvm
          llvmPackages.compiler-rt
        ];

        shellHook = ''
          exec zsh -c 'nvim'
        '';
      };
    };
}
