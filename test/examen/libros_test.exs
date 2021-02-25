defmodule LibrosTest do
  use ExUnit.Case
  alias Examen.HelperLibros
  alias Examen.HelperLibros.Libros

  describe "libros" do

    @argumentos_validos_create %{ autor: 1, biblioteca: 42, titulo: "El amor en los tiempos del colera" }
    @argumentos_invalidos %{ autor: nil, biblioteca: nil, titulo: nil }
    @argumentos_validos_update %{ autor: 2, biblioteca: 43, titulo: "Cronica de una muerte anunciada" }

    def libros(arg \\ %{}) do
      {:ok, libros} = arg
        |> Enum.into(@argumentos_validos_create) |> HelperLibros.create_libros()
      libros
    end

    test "list_libros/1 Devuelve todos los libros" do
      libros = libros()
      assert HelperLibros.list_libros() == [libros]
    end

    test "create_libros/2 Crea un libro con datos validos" do
      assert {:ok, %Libros{} = libros} = HelperLibros.create_libros(@argumentos_validos_create)
      assert libros.autor == 1
      assert libros.biblioteca == 42
      assert libros.titulo == "El amor en los tiempos del colera"
    end

    test "create_libros/2 Crea un libro con datos invalidos devolviendo error" do
      assert {:error, %Ecto.Changeset{}} = HelperLibros.create_libros(@argumentos_invalidos)
    end

    test "update_libros/3 Actualiza los libros con datos validos" do
      libros = libros()
      assert {:ok, %Libros{} = libros} = HelperLibros.update_libros(libros, @argumentos_validos_update)
      assert libros.autor == 2
      assert libros.biblioteca == 43
      assert libros.titulo == "Cronica de una muerte anunciada"
    end

    test "update_libros/3 Actualiza los libros con datos invalidos devolviendo error" do
      libros = libros()
      assert {:error, %Ecto.Changeset{}} = HelperLibros.update_libros(libros, @argumentos_invalidos)
      assert libros == HelperLibros.get_libros!(libros.id)
    end

    test "delete_libros/4 Elimina los libros" do
      libros = libros()
      assert {:ok, %Libros{}} = HelperLibros.delete_libros(libros)
      assert_raise Ecto.NoResultsError, fn -> HelperLibros.get_libros!(libros.id) end
    end

  end

end
