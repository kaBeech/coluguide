# GuideMe

GuideMe is a knowledge enhancement tool I originally built using
[Tauri](https://tauri.app/) and am now rebuilding as a web application in
[Elixir](https://elixir-lang.org/) with
[Phoenix](https://phoenixframework.org/) and
[LiveView](https://github.com/phoenixframework/phoenix_live_view)

Currently the functionality is specific to how we're using it at work, but I
figure I'll make the code available in case it's interesting/useful for someone
out there.

There is a small, self-documenting demo site available
[here](https://guideme-demo.gigalixirapp.com/). Please use a desktop for now to
access it - we don't use mobile at work and I have a very limited time budget.
Mobile support is planned for the future.

Hosting it yourself may require access to/knowledge of: 

  * [Linux](https://linux.org/) (such as [Ubuntu](https://ubuntu.com/) or
    [WSL2 for Windows](https://learn.microsoft.com/en-us/windows/wsl/install))
    or [MacOS](https://www.apple.com/macos/)
  * [Postgres](https://postgresql.org/)
  * [Git](https://git-scm.com/)
  * [Curl](https://curl.se/)

To run :
  
  * [Install Nix](https://nixos.org/download/):
    `sh <(curl -L https://nixos.org/nix/install) --daemon`
  * [Enable Flakes](https://nixos.wiki/wiki/Flakes):
    `mkdir -p ~/.config/nix && echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf`
  * [Ensure Postgres is running](https://www.postgresql.org/docs/current/tutorial-start.html)
    (the method for this will depend on your operating system/setup)
  * [Clone this repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository):
    `git clone https://github.com/kaBeech/guideme.git`
  * Enter the newly cloned directory with `cd guideme`
  * Enter the GuideMe development shell with `nix develop`
  * Initialize GuideMe with `guideme-init`
  * Start the GuideMe endpoint with `mix phx.server` or inside IEx with
    `iex -S mix phx.server`

Then you can visit [`localhost:4000`](http://localhost:4000) from your browser!
You may wish to customize authentication and Postgres configuration
