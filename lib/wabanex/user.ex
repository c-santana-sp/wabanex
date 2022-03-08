defmodule Wabanex.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @fields [:email, :password, :name]

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    # verify if given fields are all filled
    |> validate_required(@fields)
    # verify if given field has length greater than 6
    |> validate_length(:password, min: 6)
    |> validate_length(:name, min: 2)
    # verify if given field fulfill the format(in this case, a regex)
    |> validate_format(:email, ~r/@/)
    # verify if given field already exists in database
    |> unique_constraint([:email])
  end
end