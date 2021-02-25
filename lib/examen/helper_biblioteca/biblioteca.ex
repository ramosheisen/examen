defmodule Examen.HelperBiblioteca.Biblioteca do
  use Ecto.Schema
  import Ecto.Changeset

  schema "biblioteca" do
    field :nombre, :string
    field :ubicacion, :string

    timestamps()
  end

  @doc false
  def changeset(biblioteca, attrs) do
    biblioteca
    |> cast(attrs, [:nombre, :ubicacion])
    |> validate_required([:nombre, :ubicacion])
  end
end
