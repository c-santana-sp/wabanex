defmodule WabanexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  # import_types WabanexWeb.Schema.Types.Custom.UUID4

  @desc "Logic user representation"
  object :user do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
    # doesnt have password because we dont want to return it
  end

  # input_object is used just format the entrance of data in a specific type
  input_object :create_user_input do
    field :name, non_null(:string), description: "Users name"
    field :email, non_null(:string), description: "Users email"
    field :password, non_null(:string), description: "Users password"
  end
end
