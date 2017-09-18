defmodule Kochava.Kochava_Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset
  alias Kochava.Kochava_Accounts.Account


  schema "accounts" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Account{} = account, attrs) do
    account
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
