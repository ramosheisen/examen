defmodule ExamenWeb.AutoresController do
  use ExamenWeb, :controller

  alias Examen.HelperAutores
  alias Examen.HelperAutores.Autores

  def index(conn, _params) do
    autores = HelperAutores.list_autores()
    render(conn, "index.html", autores: autores)
  end

  def new(conn, _params) do
    changeset = HelperAutores.change_autores(%Autores{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"autores" => autores_params}) do
    case HelperAutores.create_autores(autores_params) do
      {:ok, autores} ->
        conn
        |> put_flash(:info, "Autores created successfully.")
        |> redirect(to: Routes.autores_path(conn, :show, autores))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    autores = HelperAutores.get_autores!(id)
    render(conn, "show.html", autores: autores)
  end

  def edit(conn, %{"id" => id}) do
    autores = HelperAutores.get_autores!(id)
    changeset = HelperAutores.change_autores(autores)
    render(conn, "edit.html", autores: autores, changeset: changeset)
  end

  def update(conn, %{"id" => id, "autores" => autores_params}) do
    autores = HelperAutores.get_autores!(id)

    case HelperAutores.update_autores(autores, autores_params) do
      {:ok, autores} ->
        conn
        |> put_flash(:info, "Autores updated successfully.")
        |> redirect(to: Routes.autores_path(conn, :show, autores))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", autores: autores, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    autores = HelperAutores.get_autores!(id)
    {:ok, _autores} = HelperAutores.delete_autores(autores)

    conn
    |> put_flash(:info, "Autores deleted successfully.")
    |> redirect(to: Routes.autores_path(conn, :index))
  end
end
