defmodule Deeclient.ApiAdapter do
  @moduledoc """
  Adapter for working with coomon rest api of Deezer
  """

  use HTTPoison.Base

  @endpoint "https://api.deezer.com"

  def process_request_url(url) do
    @endpoint <> url
  end
end
