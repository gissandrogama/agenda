defmodule AgendaWeb.UserController do
  use AgendaWeb, :controller

  alias Agenda.CreateUser

  def create(conn, params) do

    case CreateUser.run(params) do
      {:ok, user} ->
        conn
        |> put_status(201)
        |> render("user.json", %{user: user})
      {:error, _} ->
        conn
        |> put_status(422)
        |> json(%{status: "user not create"})
      end
  end
end
