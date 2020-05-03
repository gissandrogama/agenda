defmodule AgendaWeb.User.EventoController do
  use AgendaWeb, :controller

  alias Agenda.CreateEvento
  alias AgendaWeb.Guardian.Plug

  def create(conn, params) do
    # plug do guardian
    user = Plug.current_resource(conn)
    params = Map.put(params, "created_by_id", user.id)

    case CreateEvento.run(params) do
      {:ok, evento} ->
        conn
        |> put_status(201)
        |> render("evento.json", %{evento: evento})

      {:error, _} ->
        conn
        |> put_status(422)
        |> json(%{status: "unprocessable entity"})
    end
  end
end
