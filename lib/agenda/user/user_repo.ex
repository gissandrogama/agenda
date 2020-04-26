defmodule Agenda.UserRepo do
  @moduledoc """
  repositorio de usuários
  """

  alias Agenda.{Repo, User}

  def get_user!(id) do
    Repo.get!(User, id)
  end
end
