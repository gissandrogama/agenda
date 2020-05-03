defmodule Agenda.EventoRepo do
  @moduledoc """
  repositorio de eventos
  """

  alias Agenda.{Evento, Repo}

  def get_evento!(id) do
    Repo.get(Evento, id)
  end
end
