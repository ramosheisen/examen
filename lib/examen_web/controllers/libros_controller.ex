defmodule ExamenWeb.LibrosController do
  use ExamenWeb, :controller

  alias Examen.HelperLibros
  alias Examen.HelperLibros.Libros

  def index(conn, _params) do
    libros = HelperLibros.list_libros()
    render(conn, "index.html", libros: libros)
  end

  def new(conn, _params) do
    changeset = HelperLibros.change_libros(%Libros{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"libros" => libros_params}) do
    case HelperLibros.create_libros(libros_params) do
      {:ok, libros} ->
        conn
        |> put_flash(:info, "Libros created successfully.")
        |> redirect(to: Routes.libros_path(conn, :show, libros))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    libros = HelperLibros.get_libros!(id)
    render(conn, "show.html", libros: libros)
  end

  def edit(conn, %{"id" => id}) do
    libros = HelperLibros.get_libros!(id)
    changeset = HelperLibros.change_libros(libros)
    render(conn, "edit.html", libros: libros, changeset: changeset)
  end

  def update(conn, %{"id" => id, "libros" => libros_params}) do
    libros = HelperLibros.get_libros!(id)

    case HelperLibros.update_libros(libros, libros_params) do
      {:ok, libros} ->
        conn
        |> put_flash(:info, "Libros updated successfully.")
        |> redirect(to: Routes.libros_path(conn, :show, libros))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", libros: libros, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    libros = HelperLibros.get_libros!(id)
    {:ok, _libros} = HelperLibros.delete_libros(libros)

    conn
    |> put_flash(:info, "Libros deleted successfully.")
    |> redirect(to: Routes.libros_path(conn, :index))
  end
end
