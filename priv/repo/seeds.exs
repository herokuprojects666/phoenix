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

Kochava.Accounts.Account 
|> Kochava.Repo.all 
|> Enum.each(
	fn x -> IO.puts "name is #{x.name} and id is #{x.id}"
end)

File.stream!(Path.absname("assets/static/accounts.csv")) 
|> CSV.decode
|> Enum.each(fn item -> 
	data = elem(item, 1)
	Kochava.Repo.insert!(%Kochava.Accounts.Account{id: String.to_integer(Enum.at(data, 0)), name: Enum.at(data, 1)})
end)