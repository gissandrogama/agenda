defmodule Agenda.User do
  @moduledoc """
  Schema do usuário
  """
  use Ecto.Schema
  
  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end
end
