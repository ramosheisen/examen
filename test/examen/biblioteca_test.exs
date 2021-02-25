defmodule BibliotecaTest do
  use ExUnit.Case
  alias Examen.HelperBiblioteca
  alias Examen.HelperBiblioteca.Biblioteca

  describe "biblioteca" do

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

end
