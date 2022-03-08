defmodule Wabanex.Users.Create do
  # alias Wabanex.User
  # alias Wabanex.Repo
  # or
  alias Wabanex.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
