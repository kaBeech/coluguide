defmodule GuidemeWeb.ChapterLive.Index do
  use GuidemeWeb, :live_view
  use Phoenix.LiveView

  import NavBar

  alias Guideme.{Guides}

  def mount(_params, _session, socket) do
    {:ok, assign(socket, guides: Guides.list_guides())}
  end
end
