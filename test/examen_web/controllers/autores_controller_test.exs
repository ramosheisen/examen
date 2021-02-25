defmodule ExamenWeb.AutoresControllerTest do
  use ExamenWeb.ConnCase

  alias Examen.HelperAutores

  @create_attrs %{autor: "some autor"}
  @update_attrs %{autor: "some updated autor"}
  @invalid_attrs %{autor: nil}

  def fixture(:autores) do
    {:ok, autores} = HelperAutores.create_autores(@create_attrs)
    autores
  end

  describe "index" do
    test "lists all autores", %{conn: conn} do
      conn = get(conn, Routes.autores_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Autores"
    end
  end

  describe "new autores" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.autores_path(conn, :new))
      assert html_response(conn, 200) =~ "New Autores"
    end
  end

  describe "create autores" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.autores_path(conn, :create), autores: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.autores_path(conn, :show, id)

      conn = get(conn, Routes.autores_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Autores"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.autores_path(conn, :create), autores: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Autores"
    end
  end

  describe "edit autores" do
    setup [:create_autores]

    test "renders form for editing chosen autores", %{conn: conn, autores: autores} do
      conn = get(conn, Routes.autores_path(conn, :edit, autores))
      assert html_response(conn, 200) =~ "Edit Autores"
    end
  end

  describe "update autores" do
    setup [:create_autores]

    test "redirects when data is valid", %{conn: conn, autores: autores} do
      conn = put(conn, Routes.autores_path(conn, :update, autores), autores: @update_attrs)
      assert redirected_to(conn) == Routes.autores_path(conn, :show, autores)

      conn = get(conn, Routes.autores_path(conn, :show, autores))
      assert html_response(conn, 200) =~ "some updated autor"
    end

    test "renders errors when data is invalid", %{conn: conn, autores: autores} do
      conn = put(conn, Routes.autores_path(conn, :update, autores), autores: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Autores"
    end
  end

  describe "delete autores" do
    setup [:create_autores]

    test "deletes chosen autores", %{conn: conn, autores: autores} do
      conn = delete(conn, Routes.autores_path(conn, :delete, autores))
      assert redirected_to(conn) == Routes.autores_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.autores_path(conn, :show, autores))
      end
    end
  end

  defp create_autores(_) do
    autores = fixture(:autores)
    %{autores: autores}
  end
end
