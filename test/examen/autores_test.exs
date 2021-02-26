defmodule AutoresTest do
  use ExUnit.Case
  use Examen.DataCase
  alias Examen.HelperAutores
  alias Examen.HelperAutores.Autores

  describe "autores/block 1" do

    @argumentos_validos_create %{ autor: "Heisen Ramos" }
    @argumentos_invalidos %{ autor: nil }
    @argumentos_validos_update %{ autor: "Andres Perafan" }

    def autores(arg \\ %{}) do
      {:ok, autores} = arg
      |> Enum.into(@argumentos_validos_create) |> HelperAutores.create_autores()
      autores
    end

    test "list_autores/1 Devuelve todos los autores" do
      autores = autores()
      assert HelperAutores.list_autores() == [autores]
    end

    test "create_autores/2 Crea un autor con datos validos" do
      assert {:ok, %Autores{} = autores} = HelperAutores.create_autores(@argumentos_validos_create)
      assert autores.autor == "Heisen Ramos"
    end

    test "create_autores/2 Crea un autor con datos invalidos devolviendo error" do
      assert {:error, %Ecto.Changeset{}} = HelperAutores.create_autores(@argumentos_invalidos)
    end

    test "update_autores/3 Actualiza los autores con validos" do
      autores = autores()
      assert {:ok, %Autores{} = autores} = HelperAutores.update_autores(autores, @argumentos_validos_update)
      assert autores.autor == "Andres Perafan"
    end

    test "update_autores/3 Actualiza los autores con datos invalidos devolviendo error" do
      autores = autores()
      assert {:error, %Ecto.Changeset{}} = HelperAutores.update_autores(autores, @argumentos_invalidos)
      assert autores == HelperAutores.get_autores!(autores.id)
    end

    test "delete_autores/4 Elimina los autores" do
      autores = autores()
      assert {:ok, %Autores{}} = HelperAutores.delete_autores(autores)
      assert_raise Ecto.NoResultsError, fn -> HelperAutores.get_autores!(autores.id) end
    end

  end

  describe "autores/block 2" do

    setup do
      autores = insert(:autores)
      { :ok, autores: autores }
    end

    test "list_autores/2 Devulve todos los autores", %{ autores: autores } do
      assert HelperAutores.list_autores() == [autores]
    end

    test "list_autores/2 Devulve un autor con id", %{ autores: autores } do
      assert HelperAutores.get_autores!(autores.id) == autores
    end

    test "update_autores/3 Actualiza los autores", %{ autores: autores } do
      assert {:ok, %Autores{} = autores} = HelperAutores.update_autores(
        autores, %{ autor: "Andres Perafan" })
      assert autores.autor == "Andres Perafan"
    end

    test "update_autores/3 Actualiza los autores con id", %{ autores: autores } do
      assert {:ok, %Autores{} = autores} = HelperAutores.update_autores(
        autores, %{ autor: "Gerardo Nuñez" })
      assert autores == HelperAutores.get_autores!(autores.id)
    end

    test "delete_autores/4 Elimina los autores con id", %{ autores: autores } do
      assert {:ok, %Autores{}} = HelperAutores.delete_autores(autores)
      assert_raise Ecto.NoResultsError, fn -> HelperAutores.get_autores!(autores.id) end
    end

    test "change_autores/5 ", %{ autores: autores } do
      assert %Ecto.Changeset{} = HelperAutores.change_autores(autores)
    end

  end

end
