defmodule Examen.Repo.Migrations.CreateLibros do
  use Ecto.Migration

  def change do
    create table(:libros) do
      add :titulo, :string
      add :autor, references(:autores)
      add :biblioteca, references(:biblioteca)

      timestamps()
    end

    create(index(:autores, [:id]))
    create(index(:biblioteca, [:id]))

  end
end
