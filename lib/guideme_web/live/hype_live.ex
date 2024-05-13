defmodule GuidemeWeb.HypeLive do
  use GuidemeWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, hype: 50)}
  end

  def render(assigns) do
    ~H"""
      <h1>Hype</h1>
      <div >
        <div style="width: 100%" class="meter">
          <span style={"display: block; width: #{@hype}%; background-color: #00ddbb;"}><%= @hype %>%</span>
        </div>
      </div>
      <div >
        <button phx-click="increase_brightness">Increase hype</button>
        <button phx-click="decrease_brightness">Decrease hype</button>
      </div>
    """
  end
 
  def handle_event("increase_brightness", _value, socket) do
    {:noreply, assign(socket, hype: socket.assigns.hype + 10)}
  end

  def handle_event("decrease_brightness", _value, socket) do
    {:noreply, assign(socket, hype: socket.assigns.hype - 10)}
  end

end
