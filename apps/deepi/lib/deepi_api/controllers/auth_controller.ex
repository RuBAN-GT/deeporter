defmodule DeepiApi.AuthController do
  use DeepiApi, :controller

  alias Deeclient.ConnectService

  def sign_in(conn, _params) do
    conn |> redirect(external: ConnectService.build_auth_url) |> halt()
  end

  # @TODO Add a handling wrong requests
  def callback(conn, %{"code" => code}) do
    {_, info} = ConnectService.get_access_token(code)
    json(conn, %{data: info})
  end
end
