# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Kochava.Repo.insert!(%Kochava.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

csv = File.stream!(Path.absname("assets/static/accounts.csv")) |> CSV.decode

Enum.each csv, fn x -> 
	values = List.foldl(elem(x,1), "", fn(x, values) ->
		if (String.length(values)) do
			"#{values},#{x}"
		else 
			"#{values}#{x}"
		end
	end)
	IO.puts values
end

# IO.puts Path.absname("assets/static/")