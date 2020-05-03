defmodule Agenda.UserRepo do
  @moduledoc """
  repositorio de usuários
  """

  import Ecto.Query

  alias Agenda.{Repo, User}

  def get_user!(id) do
    Repo.get!(User, id)
  end

  def get_user_email(email) do
    query = from u in User, where: ^email == u.email, select: u.id
    Repo.all(query)
  end
end
