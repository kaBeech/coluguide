# Coluguide

Coluguide is a simple, declarative knowledge enhancement tool built to help
ease cognitive load for myself and our team at a nation-wide long-term care
pharmacy.

It's built to quickly find resources for accomplishing tasks and display the
information in the simplest terms possible. If the simple declarative
instructions are not enough, a link to a more specific guide is provided.

There is a small, self-documenting demo site available
[here](https://coluguide-demo.gigalixirapp.com/). Please use a desktop for now to
access it - we don't use mobile at work and I have a very limited time budget
for this project. Mobile support is planned for the future.

Currently the functionality is specific to how we're using it at work, but I
figure I'll make the code available in case it's interesting/useful for someone
out there.

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
    `git clone https://github.com/kaBeech/coluguide.git`
  * Enter the newly cloned directory with `cd coluguide`
  * Enter the Coluguide development shell with `nix develop`
  * Initialize Coluguide with `coluguide-init`
  * Start the Coluguide endpoint with `mix phx.server` or inside IEx with
    `iex -S mix phx.server`

Then you can visit [`localhost:4000`](http://localhost:4000) from your browser!
You may wish to customize authentication and Postgres configuration
