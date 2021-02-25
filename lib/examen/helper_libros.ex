defmodule Examen.HelperLibros do
  @moduledoc """
  The HelperLibros context.
  """

  import Ecto.Query, warn: false
  alias Examen.Repo

  alias Examen.HelperLibros.Libros
  alias Examen.HelperBiblioteca.Biblioteca
  alias Examen.HelperAutores.Autores

  @doc """
  Returns the list of libros.

  ## Examples

      iex> list_libros()
      [%Libros{}, ...]

  """
  def list_libros do
    Repo.all(Libros)
  end

  def list_libros_by_join() do
    from(l in Libros,
      join: b in Biblioteca,
      join: a in Autores,
      on: b.id == l.id,
      on: a.id == l.id,
      select: { b.nombre, b.ubicacion, a.autor, l.titulo })
    |> Repo.all
  end

  @doc """
  Gets a single libros.

  Raises `Ecto.NoResultsError` if the Libros does not exist.

  ## Examples

      iex> get_libros!(123)
      %Libros{}

      iex> get_libros!(456)
      ** (Ecto.NoResultsError)

  """
  def get_libros!(id), do: Repo.get!(Libros, id)

  @doc """
  Creates a libros.

  ## Examples

      iex> create_libros(%{field: value})
      {:ok, %Libros{}}

      iex> create_libros(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_libros(attrs \\ %{}) do
    %Libros{}
    |> Libros.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a libros.

  ## Examples

      iex> update_libros(libros, %{field: new_value})
      {:ok, %Libros{}}

      iex> update_libros(libros, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_libros(%Libros{} = libros, attrs) do
    libros
    |> Libros.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a libros.

  ## Examples

      iex> delete_libros(libros)
      {:ok, %Libros{}}

      iex> delete_libros(libros)
      {:error, %Ecto.Changeset{}}

  """
  def delete_libros(%Libros{} = libros) do
    Repo.delete(libros)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking libros changes.

  ## Examples

      iex> change_libros(libros)
      %Ecto.Changeset{data: %Libros{}}

  """
  def change_libros(%Libros{} = libros, attrs \\ %{}) do
    Libros.changeset(libros, attrs)
  end
end
