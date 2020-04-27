defmodule Agenda.CreateEvento do
  @moduledoc """
  Creating an elevtion
  """

  import Ecto.Changeset

  alias Agenda.{Repo, Evento}

  def run(params) do
    %Evento{}
    |> cast(params, [:name, :data, :hora, :local, :created_by_id])
    |> validate_required([:name, :data, :hora, :local, :created_by_id])
    |> validate_dates_overlap()
    |> foreign_key_constraint(:created_by_id)
    |> Repo.insert()
  end

  defp validate_dates_overlap(%Ecto.Changeset{valid?: true} = changeset) do
    %{data: data} = changeset.changes
    today = Calendar.Date.today!("America/Sao_Paulo")

    case Date.compare(data, today) do
      :lt -> add_error(changeset, :data, "should be before today")
      _ -> changeset
    end
  end

  defp validate_dates_overlap(%Ecto.Changeset{} = changeset), do: changeset
end
