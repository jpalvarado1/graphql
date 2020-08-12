defmodule Graphql.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:email, :string, unique: true)
    field(:name, :string)
    field(:password_hash, :string)
    field(:password, :string, virtual: true)
    field(:password_confirmation, :string, virtual: true)
    field(:role, :string, default: "user")
    field(:username, :string, unique: true)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username, :email, :password, :password_confirmation, :role])
    |> validate_required([:name, :username, :email, :password, :password_confirmation, :role])
    |> validate_format(:email, ~r/@/)
    |> update_change(:email, &String.downcase(&1))
    |> validate_length(:username, min: 6, max: 20)
    |> validate_length(:password, min: 6, max: 16)
    |> validate_confirmation(:password)
    |> unique_contraint(:username)
    |> unique_contraint(:email)
    |> hash_password
  end

  defp hash_password(changeset) do
    changeset    
  end
end
