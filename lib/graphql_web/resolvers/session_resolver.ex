defmodule GraphqlWeb.Resolvers.SessionResolver do
  alias Graphql.{Accounts, Guardian}

  def login_user(_, %{input: input}, _) do
    IO.inspect(input)
    with {:ok, user} <- Accounts.Session.authenticate(input),
         {:ok, jwt_token, _} <- Guardian.encode_and_sign(user) do
      {:ok, %{token: jwt_token, user: user}}
    end
  end
end
