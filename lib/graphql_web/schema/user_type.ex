defmodule GraphqlWeb.Schema.Types.UserType do
    use Absinthe.Schema.Notation

    object :user_type do
      field :id, :id
      field :name, :string
      field :username, :string
      field :email, :string
      field :role, :string
    end

    input_object :user_input_type do
        field :name, non_null(:string)
        field :username, non_null(:string)
        field :email, non_null(:string)
        field :password, non_null(:string)
        field :password_confirmation, non_null(:string)
    end
  end
