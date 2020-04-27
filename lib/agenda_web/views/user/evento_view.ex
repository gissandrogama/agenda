defmodule AgendaWeb.User.EventoView do
  use AgendaWeb, :view

  def render("evento.json", %{evento: evento}) do
    %{
      status: "ok",
      data: %{
        id: evento.id,
        name: evento.name,
        data: evento.data,
        hora: evento.hora,
        local: evento.local
      }
    }
  end
end
