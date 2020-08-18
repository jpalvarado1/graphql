defmodule Graphql.Accounts.Session do
  alias Graphql.Accounts.User
  alias Graphql.Repo

  def authenticate(args) do
    user = Repo.get_by(User, username: (args.username))
    case check_password(user, args) do
      true -> {:ok, user}
      _ -> {:error, "Incorrect login credentials"}
    end
  end

  defp check_password(user, args) do
    case user do
      nil -> Argon2.no_user_verify()
      _ -> Argon2.check_pass(args.password, user.password_hash)
    end
  end
end
