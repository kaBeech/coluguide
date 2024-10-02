{
  description = "A flake for starting a Coluguide development shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    coluguide-init = import ./scripts/coluguide-init.nix { inherit pkgs; };
  in
  {
    devShells.${system}.default = 
      pkgs.mkShell 
        {
          buildInputs = with pkgs; [
            elixir
            erlang
            inotify-tools
            coluguide-init
          ];

          shellHook = ''
            cat ./scripts/dev-shell.txt
          '';
        };
  };
}
