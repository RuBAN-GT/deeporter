defmodule Deeclient.Config do
  @moduledoc """
  Wrapper over Application environment
  """

  def app_id do
    Application.get_env(:deeclient, :app_id)
  end

  def permissions do
    Application.get_env(:deeclient, :permissions)
      |> Enum.join(",")
  end

  def redirect_url do
    Application.get_env(:deeclient, :redirect_url)
  end

  def secret do
    Application.get_env(:deeclient, :secret)
  end
end
