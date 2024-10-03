defmodule ColuguideWeb.PageController do
  use ColuguideWeb, :controller

  import ColuguideWeb.Seed
  import Coluguide.Guides

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.

    if list_templates() == [] do
      # If there are no templates, seed the database
      seed()
    end

    render(conn, :home, layout: false)
  end
end
