defmodule Examen.Factory do

  use ExMachina.Ecto, repo: Examen.Repo
  alias Examen.HelperBiblioteca.Biblioteca
  alias Examen.HelperAutores.Autores
  alias Examen.HelperLibros.Libros

  def biblioteca_factory do
    %Biblioteca{ nombre: "Miguel Deservante Saavedra", ubicacion: "Medellin, Antioquia" }
    %Biblioteca{ nombre: "Pedro Vicente Abadia", ubicacion: "Guacari, Valle" }
    %Biblioteca{ nombre: "Trinity College Old Library", ubicacion: "Dublin, Alemania" }
  end

  def autores_factory do
    %Autores{ autor: "Gabriel Garcia Marquez" }
    %Autores{ autor: "Jorge Luis Borges" }
    %Autores{ autor: "Stephen King" }
    %Autores{ autor: "Julio Verne" }
  end

  def libros_factory do
    %Libros{
      autor: build(:autores),
      biblioteca: build(:biblioteca),
      titulo: "Cien años de soledad",
    }
    %Libros{
      autor: build(:autores),
      biblioteca: build(:biblioteca),
      titulo: "El traidor",
    }
    %Libros{
      autor: build(:autores),
      biblioteca: build(:biblioteca),
      titulo: "La invocacion",
    }
  end

end
