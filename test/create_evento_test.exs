defmodule Agenda.CreateEventoTest do
  use Agenda.DataCase, async: true

  alias Agenda.{CreateEvento, Evento}

  import Agenda.Factory

  describe "run/1" do
    test "returns a struct when the params are valid" do
      user = insert(:user)

      params = %{
        name: "Palestra 2020",
        data: ~D[2020-04-30],
        hora: ~T[16:00:00Z],
        local: "Hangar",
        created_by_id: user.id
      }

      assert {:ok, %Evento{} = evento} = CreateEvento.run(params)
      assert evento.name == "Palestra 2020"
      assert evento.data == ~D[2020-04-30]
      assert evento.hora == ~T[16:00:00Z]
      assert evento.local == "Hangar"
      assert evento.created_by_id == user.id
    end

    # test "returns error when name is missing" do
    #   admin = insert(:admin)

    #   params = %{
    #     name: "",
    #     cover: "url",
    #     notice: "url",
    #     starts_at: ~U[2020-04-24 08:00:00Z],
    #     ends_at: ~U[2020-04-30 20:59:59Z],
    #     created_by_id: admin.id
    #   }

    #   assert {:error, %Ecto.Changeset{} = changeset} = CreateElection.run(params)
    #   %{name: ["can't be blank"]} = errors_on(changeset)
    # end

    # test "returns error when starts_at is missing" do
    #   admin = insert(:admin)

    #   params = %{
    #     name: "Foo",
    #     cover: "url",
    #     notice: "url",
    #     starts_at: nil,
    #     ends_at: ~U[2020-04-30 20:59:59Z],
    #     created_by_id: admin.id
    #   }

    #   assert {:error, %Ecto.Changeset{} = changeset} = CreateElection.run(params)
    #   %{starts_at: ["can't be blank"]} = errors_on(changeset)
    # end

    # test "returns errot when ends_at is missing" do
    #   admin = insert(:admin)

    #   params = %{
    #     name: "Foo",
    #     cover: "url",
    #     notice: "url",
    #     starts_at: ~U[2020-04-24 08:00:00Z],
    #     ends_at: nil,
    #     created_by_id: admin.id
    #   }

    #   assert {:error, %Ecto.Changeset{} = changeset} = CreateElection.run(params)
    #   %{ends_at: ["can't be blank"]} = errors_on(changeset)
    # end

    # test "returns errot when created_by_id is invalid" do
    #   params = %{
    #     name: "Foo",
    #     cover: "url",
    #     notice: "url",
    #     starts_at: ~U[2020-04-24 08:00:00Z],
    #     ends_at: ~U[2020-04-30 20:59:59Z],
    #     created_by_id: 99
    #   }

    #   assert {:error, %Ecto.Changeset{} = changeset} = CreateElection.run(params)
    #   %{created_by_id: ["does not exist"]} = errors_on(changeset)
    # end

    # test "returns error when ends_at > starts_at" do
    #   admin = insert(:admin)

    #   params = %{
    #     name: "Foo",
    #     cover: "url",
    #     notice: "url",
    #     starts_at: ~U[2020-04-30 20:59:59Z],
    #     ends_at: ~U[2020-04-24 08:00:00Z],
    #     created_by_id: admin.id
    #   }

    #   assert {:error, %Ecto.Changeset{} = changeset} = CreateElection.run(params)
    #   %{starts_at: ["should be before ends_at"]} = errors_on(changeset)
    # end
  end
end
