defmodule LibrosTest do
  use ExUnit.Case
  use Examen.DataCase
  alias Examen.HelperLibros
  alias Examen.HelperLibros.Libros

  describe "libros/block 1" do

    setup do
      biblioteca = insert(:biblioteca)
      autores = insert(:autores)
      libros = insert(:libros)
      { :ok, libros: libros }
    end

    test "list_libros/2 Devulve todos los libros", %{ libros: libros } do
      [ %Libros{} = libros ] = HelperLibros.list_libros()
      assert HelperLibros.list_libros() == [libros]
    end

    test "list_libros/2 Devulve un libro con id", %{ libros: libros } do
      [ %Libros{} = libros ] = HelperLibros.list_libros()
      assert HelperLibros.get_libros!(libros.id) == libros
    end

    test "list_libros/2 Devulve libros con join", %{ libros: libros } do
      [ %Libros{} = libros ] = HelperLibros.list_libros_by_join(libros.id)
      assert HelperLibros.list_libros_by_join(libros.id) == [libros]
    end

  end

end
