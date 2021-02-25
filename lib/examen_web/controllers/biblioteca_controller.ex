defmodule ExamenWeb.BibliotecaController do
  use ExamenWeb, :controller

  alias Examen.HelperBiblioteca
  alias Examen.HelperBiblioteca.Biblioteca

  def index(conn, _params) do
    biblioteca = HelperBiblioteca.list_biblioteca()
    render(conn, "index.html", biblioteca: biblioteca)
  end

  def new(conn, _params) do
    changeset = HelperBiblioteca.change_biblioteca(%Biblioteca{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"biblioteca" => biblioteca_params}) do
    case HelperBiblioteca.create_biblioteca(biblioteca_params) do
      {:ok, biblioteca} ->
        conn
        |> put_flash(:info, "Biblioteca created successfully.")
        |> redirect(to: Routes.biblioteca_path(conn, :show, biblioteca))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    biblioteca = HelperBiblioteca.get_biblioteca!(id)
    render(conn, "show.html", biblioteca: biblioteca)
  end

  def edit(conn, %{"id" => id}) do
    biblioteca = HelperBiblioteca.get_biblioteca!(id)
    changeset = HelperBiblioteca.change_biblioteca(biblioteca)
    render(conn, "edit.html", biblioteca: biblioteca, changeset: changeset)
  end

  def update(conn, %{"id" => id, "biblioteca" => biblioteca_params}) do
    biblioteca = HelperBiblioteca.get_biblioteca!(id)

    case HelperBiblioteca.update_biblioteca(biblioteca, biblioteca_params) do
      {:ok, biblioteca} ->
        conn
        |> put_flash(:info, "Biblioteca updated successfully.")
        |> redirect(to: Routes.biblioteca_path(conn, :show, biblioteca))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", biblioteca: biblioteca, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    biblioteca = HelperBiblioteca.get_biblioteca!(id)
    {:ok, _biblioteca} = HelperBiblioteca.delete_biblioteca(biblioteca)

    conn
    |> put_flash(:info, "Biblioteca deleted successfully.")
    |> redirect(to: Routes.biblioteca_path(conn, :index))
  end
end
