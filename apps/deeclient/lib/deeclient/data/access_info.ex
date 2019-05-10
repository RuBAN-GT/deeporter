defmodule Deeclient.Data.AccessInfo do
  @moduledoc """
  Wrapping responses from deezer access service
  """

  defstruct [:access_token, :expires]

  @type t :: %Deeclient.Data.AccessInfo{
               access_token: String.t,
               expires: Integer.t
             }

  @typedoc """
  Wrong code value from deezer
  """
  @type wrong_code :: <<_::80>>

  @spec from_api_response(wrong_code) :: nil
  def from_api_response("wrong code"), do: nil

  @doc """
  Generate %AccessInfo from a token like `access_token=xxx&expires=0`
  """
  @spec from_api_response(String.t) :: t
  def from_api_response(input) do
    decoded = URI.decode_query(input)

    %Deeclient.Data.AccessInfo{
      access_token: decoded["access_token"],
      expires: calc_expires(decoded["expires"])
    }
  end

  defp calc_expires(input) when is_binary(input) do
    String.to_integer input
  end
  defp calc_expires(_), do: 0
end
