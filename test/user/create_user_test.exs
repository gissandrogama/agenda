defmodule Agenda.CreateUserTest do
  use Agenda.DataCase, async: true

  alias Agenda.{CreateUser, User}

  describe "run/1" do
    test "returns a struct when the params are valid" do
      params = %{name: "Foo", email: "foo@gmail.com", password: "123123"}
      assert {:ok, %User{} = admin} = CreateUser.run(params)
      assert admin.name == "Foo"
      assert admin.email == "foo@gmail.com"
      refute admin.password_hash == "123123"
    end

    test "returns error when name is missing" do
      params = %{name: "", email: "foo@gmail.com", password: "123123"}
      assert {:error, %Ecto.Changeset{} = changeset} = CreateUser.run(params)
      %{name: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns error when email is missing" do
      params = %{name: "foo", email: "", password: "123123"}
      assert {:error, %Ecto.Changeset{} = changeset} = CreateUser.run(params)
      %{email: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns errot when password is missing" do
      params = %{name: "foo", email: "foo@gmail.com", password: ""}
      assert {:error, %Ecto.Changeset{} = changeset} = CreateUser.run(params)
      %{password: ["can't be blank"]} = errors_on(changeset)
    end
  end
end
