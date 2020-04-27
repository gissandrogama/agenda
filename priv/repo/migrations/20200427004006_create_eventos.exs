defmodule Agenda.Repo.Migrations.CreateEventos do
  use Ecto.Migration

  def change do
    create table(:eventos) do
      add :name, :string, null: false
      add :data, :date, null: false
      add :hora, :time, null: false
      add :local, :string, null: false
      add :created_by_id, references(:users, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:eventos, [:created_by_id])
  end
end
