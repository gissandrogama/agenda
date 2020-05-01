defmodule Agenda.Repo.Migrations.CreateUsersEventos do
  use Ecto.Migration

  def change do
    create table(:users_eventos) do
      add :confirmacao, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :nothing)
      add :evento_id, references(:eventos, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:users_eventos, [:user_id, :evento_id])

  end
end
