defmodule Agenda.Evento do
  @moduledoc """
  Schema para o eventos
  """
  use Ecto.Schema

  alias Agenda.User

  schema "eventos" do
    field :data, :date
    field :hora, :time
    field :local, :string
    field :name, :string
    belongs_to :created_by, User
    timestamps()
  end
end
