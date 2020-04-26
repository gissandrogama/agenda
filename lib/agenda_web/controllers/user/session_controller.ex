defmodule AgendaWeb.User.SessionController do
  use AgendaWeb, :controller

  alias Agenda.SignInUser
  alias AgendaWeb.Guardian

  def create(conn, %{"email" => email, "password" => password}) do
    case SignInUser.run(email, password) do
      {:ok, user} ->
        {:ok, token, _} = Guardian.encode_and_sign(user)
        render(conn, "session.json", %{user: user, token: token})
      {:error, _} ->
        conn
        |> put_status(401)
        |> json(%{status: "unauthenticated"})
    end
  end
end
