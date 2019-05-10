defmodule Deeclient.ConnectFakeAdapter do
  @correct_token "CORRECT_TOKEN"
  @endpoint "http://localhost:3000"

  def correct_token do
    @correct_token
  end

  def get!("/access_token.php", _, params: %{code: @correct_token}) do
    %HTTPoison.Response{status_code: 200, body: "access_token=ACCESS_TOKEN&expires=3600"}
  end

  def get!("/access_token.php", _, _) do
    %HTTPoison.Response{status_code: 200, body: "wrong code"}
  end

  def process_request_url(path) do
    @endpoint <> path
  end
end
