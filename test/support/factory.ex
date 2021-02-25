defmodule Examen.Factory do

  use ExMachina.Ecto, repo: Examen.Repo
  alias Examen.HelperBiblioteca.Biblioteca
  alias Examen.HelperAutores.Autores
  alias Examen.HelperLibros.Libros

  def biblioteca_factory do
    %Biblioteca{
      nombre: "Miguel Deservante Saavedra",
      ubicacion: "Medellin, Antioquia",
    }
  end

  def autores_factory do
    %Autores{
      autor: "Gabriel Garcia Marquez"
    }
  end

  def libros_factory do
    %Libros{
      autor: build(:autores),
      biblioteca: build(:biblioteca),
      titulo: "Cien años de soledad",
    }
  end

end
