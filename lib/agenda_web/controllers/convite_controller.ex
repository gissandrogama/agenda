defmodule AgendaWeb.ConviteController do
  use AgendaWeb, :controller

  alias Agenda.{Convite, EventoRepo, UserRepo}

  def create(conn, %{"user_id" => email, "evento_id" => id}) do
    user = UserRepo.get_user_email(email)
    [head | _tail] = user
    evento = EventoRepo.get_evento!(String.to_integer(id))
    params = %{"user_id" => email, "evento_id" => id}
    params =
      params
      |> Map.put("evento_id", evento.id)
      |> Map.put("user_id", head)

    case Convite.run(params) do
      {:ok, convite} ->
        conn
        |> put_status(201)
        |> render("convite.json", %{convite: convite})

      {:error, _} ->
        conn
        |> put_status(500)
        |> json(%{status: "usuário ou evento não encontrado"})
    end
  end
end
