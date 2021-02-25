defmodule Examen.HelperBiblioteca.Biblioteca do
  use Ecto.Schema
  import Ecto.Changeset
  alias  Examen.HelperLibros.Libros

  schema "biblioteca" do
    field :nombre, :string
    field :ubicacion, :string
    has_many :libros, Libros

    timestamps()
  end

  @doc false
  def changeset(biblioteca, attrs) do
    biblioteca
    |> cast(attrs, [:nombre, :ubicacion])
    |> validate_required([:nombre, :ubicacion])
  end
end
