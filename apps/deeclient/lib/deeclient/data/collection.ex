defmodule Deeclient.Data.Collection do
  @moduledoc """
  Module for structuring collections from Deezer that have similar structure
  """

  defstruct [:data, :next, :total]

  @type t :: %Deeclient.Data.Collection{
               data: list(map),
               next: String.t | nil,
               total: non_neg_integer
             }

  @doc """
  Convert API response to internal %Collection structure
  """
  @spec from_api_collection(list(map)) :: Deeclient.Data.Collection.t
  def from_api_collection(response) do
    atomized_response = Deeclient.Data.atomize_keys response
    struct Deeclient.Data.Collection, atomized_response
  end
end
