defmodule Examen.Repo.Migrations.CreateLibros do
  use Ecto.Migration

  def change do
    create table(:autores) do
      add :autor, :string

      timestamps()
    end

    create table(:libros) do
      add :titulo, :string
      add :autor_id, references(:autores)
      add :biblioteca_id, references(:biblioteca)

      timestamps()
    end

    create(index(:autores, [:id]))
    create(index(:biblioteca, [:id]))

  end
end
