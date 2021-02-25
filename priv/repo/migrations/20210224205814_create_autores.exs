defmodule Examen.Repo.Migrations.CreateAutores do
  use Ecto.Migration

  def change do
    create table(:autores) do
      add :autor, :string

      timestamps()
    end

  end
end
