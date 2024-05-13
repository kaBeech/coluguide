defmodule Guideme.Repo do
  use Ecto.Repo,
    otp_app: :guideme,
    adapter: Ecto.Adapters.Postgres
end
