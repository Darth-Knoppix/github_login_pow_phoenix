defmodule GhLogin.Repo do
  use Ecto.Repo,
    otp_app: :gh_login,
    adapter: Ecto.Adapters.Postgres
end
