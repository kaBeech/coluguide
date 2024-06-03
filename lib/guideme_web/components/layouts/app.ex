defmodule GuidemeWeb.Layouts.App do
  alias Phoenix.LiveView.JS

  def toggle_greeting do
    JS.toggle(to: "#greeting")
  end
end
