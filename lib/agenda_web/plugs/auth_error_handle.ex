defmodule ClaimWeb.AuthErrorHandler do
  @moduledoc """
  O manipulador de erros é um módulo que implementa uma auth_errorfunção.
  """
  import Plug.Conn

  @behaviour Guardian.Plug.ErrorHandler

  @impl Guardian.Plug.ErrorHandler
  def auth_error(conn, {type, _reason}, _opts) do
    body = Phoenix.json_library().encode!(%{message: to_string(type)})

    conn
    |> put_resp_content_type("application/jason")
    |> send_resp(401, body)
  end
end
