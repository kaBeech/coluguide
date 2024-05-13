defmodule Guideme.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GuidemeWeb.Telemetry,
      Guideme.Repo,
      {DNSCluster, query: Application.get_env(:guideme, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Guideme.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Guideme.Finch},
      # Start a worker by calling: Guideme.Worker.start_link(arg)
      # {Guideme.Worker, arg},
      # Start to serve requests, typically the last entry
      GuidemeWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Guideme.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GuidemeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
