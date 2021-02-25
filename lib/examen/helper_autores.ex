defmodule Examen.HelperAutores do
  @moduledoc """
  The HelperAutores context.
  """

  import Ecto.Query, warn: false
  alias Examen.Repo

  alias Examen.HelperAutores.Autores

  @doc """
  Returns the list of autores.

  ## Examples

      iex> list_autores()
      [%Autores{}, ...]

  """
  def list_autores do
    Repo.all(Autores)
  end

  @doc """
  Gets a single autores.

  Raises `Ecto.NoResultsError` if the Autores does not exist.

  ## Examples

      iex> get_autores!(123)
      %Autores{}

      iex> get_autores!(456)
      ** (Ecto.NoResultsError)

  """
  def get_autores!(id), do: Repo.get!(Autores, id)

  @doc """
  Creates a autores.

  ## Examples

      iex> create_autores(%{field: value})
      {:ok, %Autores{}}

      iex> create_autores(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_autores(attrs \\ %{}) do
    %Autores{}
    |> Autores.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a autores.

  ## Examples

      iex> update_autores(autores, %{field: new_value})
      {:ok, %Autores{}}

      iex> update_autores(autores, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_autores(%Autores{} = autores, attrs) do
    autores
    |> Autores.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a autores.

  ## Examples

      iex> delete_autores(autores)
      {:ok, %Autores{}}

      iex> delete_autores(autores)
      {:error, %Ecto.Changeset{}}

  """
  def delete_autores(%Autores{} = autores) do
    Repo.delete(autores)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking autores changes.

  ## Examples

      iex> change_autores(autores)
      %Ecto.Changeset{data: %Autores{}}

  """
  def change_autores(%Autores{} = autores, attrs \\ %{}) do
    Autores.changeset(autores, attrs)
  end
end
