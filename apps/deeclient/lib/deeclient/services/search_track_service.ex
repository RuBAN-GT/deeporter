defmodule Deeclient.SearchTrackService do
  @moduledoc """
  Service for working with Deezer search service by tracks
  """

  alias Deeclient.ApiAdapter

  @doc """
  Search tracks by string with target information
  """
  @spec search(String.t) :: Deeclient.Data.Collection.t
  @spec search(String.t, map) :: Deeclient.Data.Collection.t
  @spec search(String.t, map, ApiAdapter) :: Deeclient.Data.Collection.t
  def search(input, params \\ %{}, adapter \\ ApiAdapter) do
    params = Map.merge(params, %{q: input})
    adapter.get!("/search/track", [], params: params) |> handle_response
  end

  defp handle_response(%HTTPoison.Response{status_code: 200, body: body}) do
    body |> Jason.decode! |> Deeclient.Data.Collection.from_api_collection
  end
end
