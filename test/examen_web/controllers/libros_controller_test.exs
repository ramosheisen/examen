defmodule ExamenWeb.LibrosControllerTest do
  use ExamenWeb.ConnCase

  alias Examen.HelperLibros

  @create_attrs %{autor: "some autor", biblioteca: 42, titulo: "some titulo"}
  @update_attrs %{autor: "some updated autor", biblioteca: 43, titulo: "some updated titulo"}
  @invalid_attrs %{autor: nil, biblioteca: nil, titulo: nil}

  def fixture(:libros) do
    {:ok, libros} = HelperLibros.create_libros(@create_attrs)
    libros
  end

  describe "index" do
    test "lists all libros", %{conn: conn} do
      conn = get(conn, Routes.libros_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Libros"
    end
  end

  describe "new libros" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.libros_path(conn, :new))
      assert html_response(conn, 200) =~ "New Libros"
    end
  end

  describe "create libros" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.libros_path(conn, :create), libros: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.libros_path(conn, :show, id)

      conn = get(conn, Routes.libros_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Libros"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.libros_path(conn, :create), libros: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Libros"
    end
  end

  describe "edit libros" do
    setup [:create_libros]

    test "renders form for editing chosen libros", %{conn: conn, libros: libros} do
      conn = get(conn, Routes.libros_path(conn, :edit, libros))
      assert html_response(conn, 200) =~ "Edit Libros"
    end
  end

  describe "update libros" do
    setup [:create_libros]

    test "redirects when data is valid", %{conn: conn, libros: libros} do
      conn = put(conn, Routes.libros_path(conn, :update, libros), libros: @update_attrs)
      assert redirected_to(conn) == Routes.libros_path(conn, :show, libros)

      conn = get(conn, Routes.libros_path(conn, :show, libros))
      assert html_response(conn, 200) =~ "some updated autor"
    end

    test "renders errors when data is invalid", %{conn: conn, libros: libros} do
      conn = put(conn, Routes.libros_path(conn, :update, libros), libros: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Libros"
    end
  end

  describe "delete libros" do
    setup [:create_libros]

    test "deletes chosen libros", %{conn: conn, libros: libros} do
      conn = delete(conn, Routes.libros_path(conn, :delete, libros))
      assert redirected_to(conn) == Routes.libros_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.libros_path(conn, :show, libros))
      end
    end
  end

  defp create_libros(_) do
    libros = fixture(:libros)
    %{libros: libros}
  end
end
