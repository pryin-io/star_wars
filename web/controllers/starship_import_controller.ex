defmodule StarWars.StarshipImportController do
  use StarWars.Web, :controller
  require StarWars.Endpoint
  alias StarWars.Starship

  def new(conn, _params) do
    render conn, "new.html"
  end

  def import_starships(conn, %{"starship_ids" => starship_ids}) do
    parent_pid = self()
    starships = for starship_id <- String.split(starship_ids, ",") do
      Task.async(fn ->
        PryIn.join_trace(parent_pid, self())
        data = StarWars.Endpoint.instrument :pryin, %{key: "get_starship"}, fn ->
          HTTPoison.get!("http://swapi.co/api/starships/#{starship_id}/").body
          |> Poison.decode!
        end

        %Starship{}
        |> Starship.changeset(data)
        |> Repo.insert!()
      end)
    end
    |> Enum.map(&Task.await/1)

    render(conn, "import_starships.html", %{starships: starships})
  end
end
