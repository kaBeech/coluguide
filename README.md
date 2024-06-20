# GuideMe

GuideMe is a knowledge enhancement tool I originally built using [Tauri](https://tauri.app/)
and am now rebuilding as a web application in [Elixir](https://elixir-lang.org/) with 
[Phoenix](https://phoenixframework.org/) and [LiveView](https://github.com/phoenixframework/phoenix_live_view)

Currently the functionality is specific to how we're using it at work, but I figure I'll 
make the code available in case it's useful for someone out there. Eventually I plan to make 
a demo site and actual documentation but for now I'm focused on building out the functionality 
we need and our specific implementation (i.e. our data, custom pages, deployment, etc.) 

May require: 
  * Linux(https://linux.org/) (such as [Ubuntu](https://ubuntu.com/) [WSL2 for Windows](https://learn.microsoft.com/en-us/windows/wsl/install)) or [MacOS](https://www.apple.com/macos/)
  * [Postgres](https://postgresql.org/)
  * [Git](https://git-scm.com/)
  * [Curl](https://curl.se/)

To run :
  
  * [Install Nix](https://nixos.org/download/)
  * [Enable Flakes](https://nixos.wiki/wiki/Flakes)
  * [Initialize a Postgres database](https://www.postgresql.org/docs/current/tutorial-start.html)
  * [Clone this repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository)
  * From the top level directory, run `nix develop`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Then you can visit [`localhost:4000`](http://localhost:4000) from your browser!
