defmodule Coluguide.Repo do
  use Ecto.Repo,
    otp_app: :coluguide,
    adapter: Ecto.Adapters.Postgres
end
