defmodule GhLogin.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema
  use PowAssent.Ecto.Schema

  schema "users" do
    field :picture, :string

    pow_user_fields()

    timestamps()
  end

  def user_identity_changeset(user_or_changeset, user_identity, attrs, user_id_attrs) do
    user_or_changeset
    |> Ecto.Changeset.cast(attrs, [:picture])
    |> pow_assent_user_identity_changeset(user_identity, attrs, user_id_attrs)
  end
end
