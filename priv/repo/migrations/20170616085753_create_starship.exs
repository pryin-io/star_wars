defmodule StarWars.Repo.Migrations.CreateStarship do
  use Ecto.Migration

  def change do
    create table(:starships) do
      add :name, :string
      add :model, :string
      add :manufacturer, :string

      timestamps()
    end

  end
end
