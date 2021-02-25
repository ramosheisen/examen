defmodule Examen.HelperLibros.Libros do
  use Ecto.Schema
  import Ecto.Changeset
  alias Examen.HelperBiblioteca.Biblioteca
  alias Examen.HelperAutores.Autores

  schema "libros" do
    field :titulo, :string
    belongs_to :biblioteca, Biblioteca
    belongs_to :autor, Autores

    timestamps()
  end

  @doc false
  def changeset(libros, attrs) do
    libros
    |> cast(attrs, [:titulo, :autor, :biblioteca])
    |> assoc_constraint(:autor)
    |> assoc_constraint(:biblioteca)
    |> validate_required([:titulo, :autor, :biblioteca])
  end
end
