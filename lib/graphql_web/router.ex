defmodule GraphqlWeb.Router do
  use GraphqlWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])

  end

  scope "/api" do
    pipe_through(:api)

    forward("/graphql", Absinthe.Plug, schema: GraphqlWeb.Schema)

    if Mix.env() == :dev do
      forward("/graphiql", Absinthe.Plug.GraphiQL, schema: GraphqlWeb.Schema)
    end
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through([:fetch_session, :protect_from_forgery])
      live_dashboard("/dashboard", metrics: GraphqlWeb.Telemetry)
    end
  end
end
