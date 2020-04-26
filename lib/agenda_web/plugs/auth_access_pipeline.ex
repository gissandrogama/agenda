defmodule ClaimWeb.AuthAccessPipeline do
  @moduledoc """
  Um pipeline é uma maneira de coletar os vários plugues para um esquema de autenticação específico.
  """
  use Guardian.Plug.Pipeline, otp_app: :agenda

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
