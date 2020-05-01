defmodule Agenda.User do
  @moduledoc """
  Schema do usuário
  """
  use Ecto.Schema

  alias Agenda.Evento

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    many_to_many :eventos, Evento, join_through: "users_eventos"

    timestamps()
  end
end
