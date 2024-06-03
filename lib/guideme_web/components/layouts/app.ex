defmodule GuidemeWeb.Layouts.App do
  use GuidemeWeb, :live_view

  def toggle_greeting do
    JS.toggle(to: "#greeting")
  end
end
