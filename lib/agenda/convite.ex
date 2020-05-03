defmodule Agenda.Convite do
  @moduledoc """
  funções para convidar usuários para um evento
  """
  import Ecto.Changeset

  alias Agenda.{Repo, UserEvento}

  def run(params) do
    %UserEvento{}
    |> cast(params, [:user_id, :evento_id, :confirmacao])
    |> validate_required([:user_id, :evento_id])
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:evento_id)
    |> Repo.insert()
  end
  
end
