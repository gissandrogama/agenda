defmodule Agenda.UserEvento do
  @moduledoc """
  schema para relacinar tabelas eventos e usuários
  """
  use Ecto.Schema

  alias Agenda.{Evento, User}

  schema "users_eventos" do
    field :confirmacao, :boolean, default: false
    belongs_to :user, User
    belongs_to :evento, Evento

    timestamps()
  end
end
