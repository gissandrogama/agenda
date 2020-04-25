defmodule Agenda.Factory do
  @moduledoc """
  Função para adcionar usuarios nos teste
  """
  # with Ecto
  use ExMachina.Ecto, repo: Claim.Repo

  def user_factory do
    %Agenda.User{
      name: "Gissandro Gama",
      email: "gissandro@gmail.com",
      password_hash: Bcrypt.hash_pwd_salt("123456")
    }
  end
end
