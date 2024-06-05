# GuideMe

GuideMe is a knowledge enhancement tool I originally built using [Tauri](https://tauri.app/)
and am now rebuilding as a web application in [Elixir](https://elixir-lang.org/) with 
[Phoenix](https://phoenixframework.org/) and [LiveView](https://github.com/phoenixframework/phoenix_live_view)

Currently the functionality is specific to how we're using it at work, but I figure I'll 
make the code available in case it's useful for someone out there. Eventually I plan to make 
a demo site and actual documentation but for now I'm focused on building out the functionality 
we need and our specific implementation (i.e. our data, custom pages, deployment, etc.) 

To start the Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Then you can visit [`localhost:4000`](http://localhost:4000) from your browser.
