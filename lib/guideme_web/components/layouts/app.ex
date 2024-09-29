defmodule GuideMeWeb.Layouts.App do
  use GuideMeWeb, :live_view

  def toggle_greeting do
    JS.toggle(to: "#greeting")
  end
end
