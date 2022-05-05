defmodule GhLogin.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      GhLogin.Repo,
      # Start the Telemetry supervisor
      GhLoginWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: GhLogin.PubSub},
      # Start the Endpoint (http/https)
      GhLoginWeb.Endpoint,
      # Start a worker by calling: GhLogin.Worker.start_link(arg)
      # {GhLogin.Worker, arg},
      GhLogin.MemStore
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GhLogin.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GhLoginWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
