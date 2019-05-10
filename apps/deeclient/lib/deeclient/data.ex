defmodule Deeclient.Data do
  @moduledoc false

  @doc """
  Convert top-level map keys from strings to atoms

  ## Example

    iex> Deeclient.Data(%{"example" => 42})
    %{:example => 42}
  """
  @spec atomize_keys(map) :: map
  def atomize_keys(input) do
    for {key, val} <- input, into: %{}, do: { String.to_atom(key), val }
  end
end
