defmodule ExamenWeb.BibliotecaControllerTest do
  use ExamenWeb.ConnCase

  alias Examen.HelperBiblioteca

  @create_attrs %{nombre: "some nombre", ubicacion: "some ubicacion"}
  @update_attrs %{nombre: "some updated nombre", ubicacion: "some updated ubicacion"}
  @invalid_attrs %{nombre: nil, ubicacion: nil}

  def fixture(:biblioteca) do
    {:ok, biblioteca} = HelperBiblioteca.create_biblioteca(@create_attrs)
    biblioteca
  end

  describe "index" do
    test "lists all biblioteca", %{conn: conn} do
      conn = get(conn, Routes.biblioteca_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Biblioteca"
    end
  end

  describe "new biblioteca" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.biblioteca_path(conn, :new))
      assert html_response(conn, 200) =~ "New Biblioteca"
    end
  end

  describe "create biblioteca" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.biblioteca_path(conn, :create), biblioteca: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.biblioteca_path(conn, :show, id)

      conn = get(conn, Routes.biblioteca_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Biblioteca"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.biblioteca_path(conn, :create), biblioteca: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Biblioteca"
    end
  end

  describe "edit biblioteca" do
    setup [:create_biblioteca]

    test "renders form for editing chosen biblioteca", %{conn: conn, biblioteca: biblioteca} do
      conn = get(conn, Routes.biblioteca_path(conn, :edit, biblioteca))
      assert html_response(conn, 200) =~ "Edit Biblioteca"
    end
  end

  describe "update biblioteca" do
    setup [:create_biblioteca]

    test "redirects when data is valid", %{conn: conn, biblioteca: biblioteca} do
      conn = put(conn, Routes.biblioteca_path(conn, :update, biblioteca), biblioteca: @update_attrs)
      assert redirected_to(conn) == Routes.biblioteca_path(conn, :show, biblioteca)

      conn = get(conn, Routes.biblioteca_path(conn, :show, biblioteca))
      assert html_response(conn, 200) =~ "some updated nombre"
    end

    test "renders errors when data is invalid", %{conn: conn, biblioteca: biblioteca} do
      conn = put(conn, Routes.biblioteca_path(conn, :update, biblioteca), biblioteca: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Biblioteca"
    end
  end

  describe "delete biblioteca" do
    setup [:create_biblioteca]

    test "deletes chosen biblioteca", %{conn: conn, biblioteca: biblioteca} do
      conn = delete(conn, Routes.biblioteca_path(conn, :delete, biblioteca))
      assert redirected_to(conn) == Routes.biblioteca_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.biblioteca_path(conn, :show, biblioteca))
      end
    end
  end

  defp create_biblioteca(_) do
    biblioteca = fixture(:biblioteca)
    %{biblioteca: biblioteca}
  end
end
