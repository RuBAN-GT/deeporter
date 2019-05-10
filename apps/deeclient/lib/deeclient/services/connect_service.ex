defmodule Deeclient.ConnectService do
  @moduledoc """
  The module for working with Deezer Oauth services
  """

  @type auth_url_response :: String.t
  @type access_token_response :: {:error, nil} | {:ok, Data.AccessInfo.t}

  alias Deeclient.{Data.AccessInfo, ConnectAdapter, Config}

  @doc """
  Generate url for user authentication (need to be redirected)
  """
  @spec build_auth_url() :: auth_url_response
  @spec build_auth_url(ConnectAdapter) :: auth_url_response
  def build_auth_url(adapter \\ ConnectAdapter) do
    "/auth.php?" <> get_auth_params() |> adapter.process_request_url
  end

  @doc """
  Get user tokens by redirect code
  """
  @spec get_access_token(String.t) :: access_token_response
  @spec get_access_token(String.t, ConnectAdapter) :: access_token_response
  def get_access_token(code, adapter \\ ConnectAdapter) do
    adapter.get!("/access_token.php", [], params: %{
      app_id: Config.app_id,
      code: code,
      secret: Config.secret
    }) |> handle_access_response
  end

  defp get_auth_params do
    URI.encode_query %{
      app_id: Config.app_id,
      perms: Config.permissions,
      redirect_uri: Config.redirect_url
    }
  end

  # @TODO Handle responses with another statuses
  defp handle_access_response(%HTTPoison.Response{status_code: 200, body: body}) do
    case AccessInfo.from_api_response(body) do
      nil -> {:error, nil}
      info -> {:ok, info}
    end
  end
end
