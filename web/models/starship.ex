defmodule StarWars.Starship do
  use StarWars.Web, :model

  schema "starships" do
    field :name, :string
    field :model, :string
    field :manufacturer, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :model, :manufacturer])
    |> validate_required([:name, :model, :manufacturer])
  end
end
