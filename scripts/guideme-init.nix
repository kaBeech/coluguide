{ pkgs }:

pkgs.writeShellScriptBin "guideme-init" ''
  echo "Hello, world!"
  mix deps.get
  mix deps.compile
  mix ecto.setup
''
