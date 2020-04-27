defmodule Agenda.Factory do
  @moduledoc """
  Função para adcionar usuarios nos teste
  """
  # with Ecto
  use ExMachina.Ecto, repo: Agenda.Repo

  def user_factory do
    %Agenda.User{
      name: "Gissandro Gama",
      email: "gissandro@gmail.com",
      password_hash: Bcrypt.hash_pwd_salt("123456")
    }
  end

  def evento_factory do
    %Agenda.Evento{
      name: "Palestra 2020",
      data: ~D[2020-04-30],
      hora: ~T[16:00:00.394510],
      local: "Hangar",
      created_by_id: build(:user)
    }
  end
end
