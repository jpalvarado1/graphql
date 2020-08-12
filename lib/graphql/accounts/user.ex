defmodule Graphql.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:email, :string)
    field(:name, :string)
    field(:password_hash, :string)
    field(:role, :string)
    field(:username, :string)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username, :email, :password_hash, :role])
    |> validate_required([:name, :username, :email, :password_hash, :role])
  end
end
