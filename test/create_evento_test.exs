defmodule Agenda.CreateEventoTest do
  use Agenda.DataCase, async: true

  alias Agenda.{CreateEvento, Evento}

  import Agenda.Factory

  describe "run/1" do
    test "returns a struct when the params are valid" do
      user = insert(:user)

      params = %{
        name: "Palestra 2020",
        data: ~D[2020-05-30],
        hora: ~T[16:00:00],
        local: "Hangar",
        created_by_id: user.id
      }

      assert {:ok, %Evento{} = evento} = CreateEvento.run(params)
      assert evento.name == "Palestra 2020"
      assert evento.data == ~D[2020-05-30]
      assert evento.hora == ~T[16:00:00]
      assert evento.local == "Hangar"
      assert evento.created_by_id == user.id
    end

    test "returns error when name is missing" do
      user = insert(:user)

      params = %{
        name: "",
        data: ~D[2020-05-30],
        hora: ~T[16:00:00],
        local: "Hangar",
        created_by_id: user.id
      }

      assert {:error, %Ecto.Changeset{} = changeset} = CreateEvento.run(params)
      %{name: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns error when data is missing" do
      user = insert(:user)

      params = %{
        name: "Palestra 2020",
        data: nil,
        hora: ~T[16:00:00],
        local: "Hangar",
        created_by_id: user.id
      }

      assert {:error, %Ecto.Changeset{} = changeset} = CreateEvento.run(params)
      %{data: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns errot when hora is missing" do
      user = insert(:user)

      params = %{
        name: "Palestra 2020",
        data: ~D[2020-05-30],
        hora: nil,
        local: "Hangar",
        created_by_id: user.id
      }

      assert {:error, %Ecto.Changeset{} = changeset} = CreateEvento.run(params)
      %{hora: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns error when local is missing" do
      user = insert(:user)

      params = %{
        name: "Palestra 2020",
        data: ~D[2020-05-30],
        hora: ~T[16:00:00],
        local: "",
        created_by_id: user.id
      }

      assert {:error, %Ecto.Changeset{} = changeset} = CreateEvento.run(params)
      %{local: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns errot when created_by_id is invalid" do
      params = %{
        name: "Palestra 2020",
        data: ~D[2020-05-30],
        hora: ~T[16:00:00],
        local: "Hangar",
        created_by_id: 55
      }

      assert {:error, %Ecto.Changeset{} = changeset} = CreateEvento.run(params)
      %{created_by_id: ["does not exist"]} = errors_on(changeset)
    end

    test "returns error when data < that the current day" do
      user = insert(:user)

      params = %{
        name: "Palestra 2020",
        data: ~D[2020-04-26],
        hora: ~T[16:00:00],
        local: "Hangar",
        created_by_id: user.id
      }

      assert {:error, %Ecto.Changeset{} = changeset} = CreateEvento.run(params)
      %{data: ["should be before today"]} = errors_on(changeset)
    end
  end
end
