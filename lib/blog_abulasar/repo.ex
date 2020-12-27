defmodule BlogAbulasar.Repo do
  use Ecto.Repo,
    otp_app: :blog_abulasar,
    adapter: Ecto.Adapters.Postgres
end
