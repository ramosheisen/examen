defmodule Examen.HelperBiblioteca do
  @moduledoc """
  The HelperBiblioteca context.
  """

  import Ecto.Query, warn: false
  alias Examen.Repo

  alias Examen.HelperBiblioteca.Biblioteca

  @doc """
  Returns the list of biblioteca.

  ## Examples

      iex> list_biblioteca()
      [%Biblioteca{}, ...]

  """
  def list_biblioteca do
    Repo.all(Biblioteca)
  end

  @doc """
  Gets a single biblioteca.

  Raises `Ecto.NoResultsError` if the Biblioteca does not exist.

  ## Examples

      iex> get_biblioteca!(123)
      %Biblioteca{}

      iex> get_biblioteca!(456)
      ** (Ecto.NoResultsError)

  """
  def get_biblioteca!(id), do: Repo.get!(Biblioteca, id)

  @doc """
  Creates a biblioteca.

  ## Examples

      iex> create_biblioteca(%{field: value})
      {:ok, %Biblioteca{}}

      iex> create_biblioteca(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_biblioteca(attrs \\ %{}) do
    %Biblioteca{}
    |> Biblioteca.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a biblioteca.

  ## Examples

      iex> update_biblioteca(biblioteca, %{field: new_value})
      {:ok, %Biblioteca{}}

      iex> update_biblioteca(biblioteca, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_biblioteca(%Biblioteca{} = biblioteca, attrs) do
    biblioteca
    |> Biblioteca.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a biblioteca.

  ## Examples

      iex> delete_biblioteca(biblioteca)
      {:ok, %Biblioteca{}}

      iex> delete_biblioteca(biblioteca)
      {:error, %Ecto.Changeset{}}

  """
  def delete_biblioteca(%Biblioteca{} = biblioteca) do
    Repo.delete(biblioteca)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking biblioteca changes.

  ## Examples

      iex> change_biblioteca(biblioteca)
      %Ecto.Changeset{data: %Biblioteca{}}

  """
  def change_biblioteca(%Biblioteca{} = biblioteca, attrs \\ %{}) do
    Biblioteca.changeset(biblioteca, attrs)
  end
end
