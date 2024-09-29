defmodule GuideMeWeb.ChapterLive.Select do
  use GuideMeWeb, :live_view

  import NavBar

  alias GuideMe.{Guides}

  def mount(_params, _session, socket) do
    {:ok, assign(socket, guides: Guides.list_chapter_titles_for_selection())}
  end
end
