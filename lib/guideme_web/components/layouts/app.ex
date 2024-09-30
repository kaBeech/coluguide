defmodule GuideMeWeb.Layouts.App do
  use GuideMeWeb, :live_view
  import GuideMeWeb.{UserMenu, Search}

  def toggle_greeting do
    JS.toggle(to: "#greeting")
  end
end
