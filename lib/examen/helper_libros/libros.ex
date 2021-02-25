defmodule Examen.HelperLibros.Libros do
  use Ecto.Schema
  import Ecto.Changeset
  alias Examen.HelperBiblioteca.Biblioteca
  alias Examen.HelperAutores.Autores

  schema "libros" do
    field :autor, :string
    field :biblioteca, :integer
    field :titulo, :string

    belongs_to :biblioteca_id, Biblioteca
    belongs_to :autores, Autores

    timestamps()
  end

  @doc false
  def changeset(libros, attrs) do
    libros
    |> cast(attrs, [:titulo, :autor, :biblioteca])
    |> validate_required([:titulo, :autor, :biblioteca])
  end
end
