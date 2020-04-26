defmodule Agenda.SignInUser do
  @moduledoc """
  Fazendo login como usuário
  """

  alias Agenda.{Repo, User}

  def run(email, password) do
    case Repo.get_by(User, email: email) do
      %User{} = user -> verify_password(user, password)
      nil -> {:error, :email_or_password_invalid}
    end
  end

  defp verify_password(user, password) do
    if Bcrypt.verify_pass(password, user.password_hash) do
      {:ok, user}
    else
      {:error, :email_or_password_invalid}
    end
  end
end
