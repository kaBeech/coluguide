defmodule GuideMeWeb.UserMenu do
  use GuideMeWeb, :html
  use Phoenix.Component

  def render_user_menu(assigns) do
    ~H"""
    <span class="link pointer textRight textMuchBigger" phx-click={JS.toggle(to: "#userMenu")}>
      
    </span>
    <div id="userMenu" class="hidden">
      <nav class="fixed widthMax flex column alignEnd moveLeft gapPoint5 paddingTopPoint5">
        <%= if @current_user do %>
          <.link href={~p"/session"} method="delete">Sign out</.link>
          <.link navigate={~p"/chapters/select"}>
            Chapters
          </.link>
          <.link navigate={~p"/reviews/mine"}>
            My Reviews
          </.link>
          <%= if (@current_user.role in ["admin"])
          do %>
            <.link navigate={~p"/reviewed_guides"}>
              Assign Reviews
            </.link>
          <% end %>
          <%= if (@current_user.role in ["editor", "admin"])
          do %>
            <.link navigate={~p"/crud"}>
              CRUD
            </.link>
          <% end %>
          <.link navigate={~p"/guide/1"}>
            Help
          </.link>
        <% else %>
          <.link navigate={~p"/registration/new"}>
            Register
          </.link>
          <.link navigate={~p"/session/new"}>Sign In</.link>
        <% end %>
        <a href="/">Home</a>
      </nav>
    </div>
    """
  end
end
