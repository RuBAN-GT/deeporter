defmodule Deeclient.ConnectServiceTest do
  use ExUnit.Case

  alias Deeclient.{Data.AccessInfo, ConnectFakeAdapter, ConnectService}

  describe "ConnectService.build_auth_url/1" do
    test "getting a authentication url" do
      auth_url = ConnectService.build_auth_url(ConnectFakeAdapter)

      assert is_binary(auth_url)
      assert String.length(auth_url) > 1
      assert [_, query] = String.split(auth_url, "?")
      assert %{
        "app_id" => _,
        "perms" => _,
        "redirect_uri" => _
      } = URI.decode_query(query)
    end
  end

  describe "ConnectService.get_access_token/1" do
    test "getting existed user token with correct code" do
      assert {:ok, %AccessInfo{
        access_token: access_token,
        expires: ttl
      }} = ConnectService.get_access_token(ConnectFakeAdapter.correct_token, ConnectFakeAdapter)

      assert is_binary(access_token)
      assert is_number(ttl)
    end

    test "getting error from auth service with wrong code" do
      assert {:error, nil} = ConnectService.get_access_token("Something wrong", ConnectFakeAdapter)
    end
  end
end
