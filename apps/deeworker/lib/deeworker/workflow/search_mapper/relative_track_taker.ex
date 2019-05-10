defmodule Deeworker.RelativeTrackTaker do

  alias Deeclient.Data.Collection

  @spec call(Collection.t) :: map
  def call(response) do
    response.data |> Enum.take(0)
  end
end
