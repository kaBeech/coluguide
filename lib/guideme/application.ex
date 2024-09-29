defmodule GuideMe.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GuideMeWeb.Telemetry,
      GuideMe.Repo,
      {DNSCluster, query: Application.get_env(:guideme, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: GuideMe.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: GuideMe.Finch},
      # Start a worker by calling: GuideMe.Worker.start_link(arg)
      # {GuideMe.Worker, arg},
      # Start to serve requests, typically the last entry
      GuideMeWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GuideMe.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GuideMeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
