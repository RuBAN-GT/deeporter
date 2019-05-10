defmodule DeepiApi.PageController do
  use DeepiApi, :controller

  def index(conn, _params) do
    json(conn, %{data: "Hello"})
  end
end
