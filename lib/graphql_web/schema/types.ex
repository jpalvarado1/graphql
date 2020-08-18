defmodule GraphqlWeb.Schema.Types do
    use Absinthe.Schema.Notation

    alias GraphqlWeb.Schema.Types

    import_types Types.UserType
    import_types Types.SessionType
end
