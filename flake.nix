{
  description = "A flake for starting a GuideMe development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    guideme-init = import ./scripts/guideme-init.nix { inherit pkgs; };
  in
  {
    devShells.${system}.default = 
      pkgs.mkShell 
        {
          buildInputs = with pkgs; [
            elixir
            erlang
            inotify-tools
            guideme-init
          ];

          shellHook = ''
            cat << EOF
            Welcome to the GuideMe Development Environment!
            
            If you haven't yet done so, run `guideme-init` initalize GuideMe

            After that, you can start the GuideMe server with `mix phx.server`
            or inside IEx with `iex -S mix phx.server`

            Have fun!
            EOF
          '';
        };
  };
}
