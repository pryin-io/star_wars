defmodule StarWars.StarshipTest do
  use StarWars.ModelCase

  alias StarWars.Starship

  @valid_attrs %{manufacturer: "some content", model: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Starship.changeset(%Starship{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Starship.changeset(%Starship{}, @invalid_attrs)
    refute changeset.valid?
  end
end
