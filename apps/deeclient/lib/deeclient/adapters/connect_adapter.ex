defmodule Deeclient.ConnectAdapter do
  @moduledoc """
  Adapter for working with rest api of Deezer oauth
  """

  use HTTPoison.Base

  @endpoint "https://connect.deezer.com/oauth"

  def process_request_url(url) do
    @endpoint <> url
  end
end
