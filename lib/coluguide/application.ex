defmodule Coluguide.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ColuguideWeb.Telemetry,
      Coluguide.Repo,
      {DNSCluster, query: Application.get_env(:coluguide, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Coluguide.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Coluguide.Finch},
      # Start a worker by calling: Coluguide.Worker.start_link(arg)
      # {Coluguide.Worker, arg},
      # Start to serve requests, typically the last entry
      ColuguideWeb.Endpoint,
      {Cachex, name: :data_cache}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Coluguide.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ColuguideWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
