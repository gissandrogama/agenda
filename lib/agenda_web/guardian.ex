defmodule AgendaWeb.Guardian do
  @moduledoc """
  Esse modulo usa o JWT para autenticação
  """
  use Guardian, otp_app: :agenda

  def subject_for_token(resource, _claims) do
    sub = to_string(resource.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = Agenda.UserRepo.get_user!(id)
    {:ok, resource}
  end
end
