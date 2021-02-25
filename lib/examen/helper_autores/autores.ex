defmodule Examen.HelperAutores.Autores do
  use Ecto.Schema
  import Ecto.Changeset
  #alias  Examen.HelperLibros.Libros

  schema "autores" do
    field :autor, :string
    #has_many :autor, Libros

    timestamps()
  end

  @doc false
  def changeset(autores, attrs) do
    autores
    |> cast(attrs, [:autor])
    |> validate_required([:autor])
  end
end
