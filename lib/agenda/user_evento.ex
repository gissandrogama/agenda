defmodule Agenda.UserEvento do
  use Ecto.Schema

  alias Agenda.{Evento, User}

  schema "users_eventos" do
    field :confirmacao, :boolean, default: false
    belongs_to :user_id, User
    belongs_to :evento_id, Evento

    timestamps()
  end
end
