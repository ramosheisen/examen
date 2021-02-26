defmodule BibliotecaTest do
  use ExUnit.Case
  use Examen.DataCase
  alias Examen.HelperBiblioteca
  alias Examen.HelperBiblioteca.Biblioteca

  describe "biblioteca/block 1" do

    @argumentos_validos_create %{ nombre: "Biblioteca principal", ubicacion: "Guacari, Valle del cauca" }
    @argumentos_invalidos %{ nombre: nil, ubicacion: nil }
    @argumentos_validos_update %{ nombre: "Jose Celestino Mutis", ubicacion: "Cali, Valle del cauca" }

    def biblioteca(arg \\ %{}) do
      {:ok, biblioteca} = arg
        |> Enum.into(@argumentos_validos_create) |> HelperBiblioteca.create_biblioteca()
      biblioteca
    end

    test "list_biblioteca/1 Devulve todas las bibliotecas" do
      biblioteca = biblioteca()
      assert HelperBiblioteca.list_biblioteca() == [biblioteca]
    end

    test "create_biblioteca/2 Crea una biblioteca con datos validos" do
      assert {:ok, %Biblioteca{} = biblioteca} = HelperBiblioteca.create_biblioteca(@argumentos_validos_create)
      assert biblioteca.nombre == "Biblioteca principal"
      assert biblioteca.ubicacion == "Guacari, Valle del cauca"
    end

    test "create_biblioteca/2 Crea una biblioteca con datos invalidos devolviendo error" do
      assert {:error, %Ecto.Changeset{}} = HelperBiblioteca.create_biblioteca(@argumentos_invalidos)
    end

    test "update_biblioteca/3 Actualiza las bibliotecas con datos validos" do
      biblioteca = biblioteca()
      assert {:ok, %Biblioteca{} = biblioteca} = HelperBiblioteca.update_biblioteca(biblioteca, @argumentos_validos_update)
      assert biblioteca.nombre == "Jose Celestino Mutis"
      assert biblioteca.ubicacion == "Cali, Valle del cauca"
    end

    test "update_biblioteca/3 Actualiza las bibliotecas con datos invalidos devolviendo error" do
      biblioteca = biblioteca()
      assert {:error, %Ecto.Changeset{}} = HelperBiblioteca.update_biblioteca(biblioteca, @argumentos_invalidos)
      assert biblioteca == HelperBiblioteca.get_biblioteca!(biblioteca.id)
    end

    test "delete_biblioteca/4 Elimina las bibliotecas" do
      biblioteca = biblioteca()
      assert {:ok, %Biblioteca{}} = HelperBiblioteca.delete_biblioteca(biblioteca)
      assert_raise Ecto.NoResultsError, fn -> HelperBiblioteca.get_biblioteca!(biblioteca.id) end
    end

  end

  describe "biblioteca/block 2" do

    setup do
      biblioteca = insert(:biblioteca)
      { :ok, biblioteca: biblioteca }
    end

    test "list_biblioteca/2 Devulve todas las bibliotecas", %{ biblioteca: biblioteca } do
      assert HelperBiblioteca.list_biblioteca() == [biblioteca]
    end

    test "list_biblioteca/2 Devulve una biblioteca con id", %{ biblioteca: biblioteca } do
      assert HelperBiblioteca.get_biblioteca!(biblioteca.id) == biblioteca
    end

    test "update_biblioteca/3 Actualiza las bibliotecas", %{ biblioteca: biblioteca } do
      assert {:ok, %Biblioteca{} = biblioteca} = HelperBiblioteca.update_biblioteca(
        biblioteca, %{ nombre: "Jose Celestino Mutis", ubicacion: "Cali, Valle del cauca" })
      assert biblioteca.nombre == "Jose Celestino Mutis"
      assert biblioteca.ubicacion == "Cali, Valle del cauca"
    end

    test "update_biblioteca/3 Actualiza las bibliotecas con id", %{ biblioteca: biblioteca } do
      assert {:ok, %Biblioteca{} = biblioteca} = HelperBiblioteca.update_biblioteca(
        biblioteca, %{ nombre: "Jose Mutis", ubicacion: "Cali" })
      assert biblioteca == HelperBiblioteca.get_biblioteca!(biblioteca.id)
    end

    test "delete_biblioteca/4 Elimina las bibliotecas con id", %{ biblioteca: biblioteca } do
      assert {:ok, %Biblioteca{}} = HelperBiblioteca.delete_biblioteca(biblioteca)
      assert_raise Ecto.NoResultsError, fn -> HelperBiblioteca.get_biblioteca!(biblioteca.id) end
    end

    test "change_biblioteca/5 ", %{ biblioteca: biblioteca } do
      assert %Ecto.Changeset{} = HelperBiblioteca.change_biblioteca(biblioteca)
    end
  end

  describe "biblioteca/block 3" do

    test "create_biblioteca/1 Crea una biblioteca devolviendo error" do
      assert {:error, %Ecto.Changeset{}} = HelperBiblioteca.create_biblioteca(%{ nombre: nil, ubicacion: nil })
    end

    test "update_biblioteca/2 Actualiza una biblioteca devolviendo error" do
      assert {:error, %Ecto.Changeset{ errors: errors } = biblioteca} = HelperBiblioteca.update_biblioteca(
        %Biblioteca{}, %{ nombre: nil, ubicacion: nil })
      assert length(errors) > 0
      #assert_raise Ecto.NoResultsError, fn -> length(errors) > 0 end
    end

  end

end
