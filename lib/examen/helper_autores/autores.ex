defmodule Examen.HelperAutores.Autores do
  use Ecto.Schema
  import Ecto.Changeset

  schema "autores" do
    field :autor, :string

    timestamps()
  end

  @doc false
  def changeset(autores, attrs) do
    autores
    |> cast(attrs, [:autor])
    |> validate_required([:autor])
  end
end
