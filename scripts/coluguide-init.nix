{ pkgs }:

pkgs.writeShellScriptBin "coluguide-init" ''
  echo "Getting dependencies..."
  mix deps.get
  echo "Compiling dependencies..."
  mix deps.compile
  echo "Setting up database..."
  mix ecto.setup
  cat ./scripts/coluguide-init.txt
''
