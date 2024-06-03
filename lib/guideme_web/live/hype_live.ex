defmodule GuidemeWeb.HypeLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, hype: 10, guide: nil)}
  end

  def render(assigns) do
    ~H"""
    <h1>Hype</h1>
    <div>
      <div style="width: 100%" class="meter">
        <span style={"display: block; width: #{@hype}%; background-color: #00ddbb; color: #000000"}>
          <%= @hype %>%
        </span>
      </div>
    </div>
    <div>
      <button phx-click="increase_hype">Increase hype</button>
      <button phx-click="decrease_hype">Decrease hype</button>
    </div>
    """
  end

  def handle_event("increase_hype", _value, socket) do
    {:noreply, assign(socket, hype: socket.assigns.hype + 10)}
  end

  def handle_event("decrease_hype", _value, socket) do
    {:noreply, assign(socket, hype: socket.assigns.hype - 10)}
  end
end
