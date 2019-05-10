defmodule Deeworker.SearchMapper do
  @max_sleep 500

  alias Deeclient.SearchTrackService
  alias Deeworker.RelativeTrackTaker

  @spec call(list(any)) :: any
  def call(collection) do
    Enum.map(collection, &(handle_item/1))
  end

  defp handle_item(input) do
    random_sleep()
    SearchTrackService.search(input) |> RelativeTrackTaker.call
  end

  defp random_sleep do
    Enum.random(0..@max_sleep) |> Process.sleep
  end
end
