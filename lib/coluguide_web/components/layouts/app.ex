defmodule ColuguideWeb.Layouts.App do
  use ColuguideWeb, :live_view
  import ColuguideWeb.{UserMenu, Search}

  def toggle_greeting do
    JS.toggle(to: "#greeting")
  end
end
