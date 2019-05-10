defimpl Jason.Encoder, for: Deeclient.Data.AccessInfo do
  def encode(struct, opts) do
    Map.take(struct, [:access_token, :expires])
      |> Jason.Encode.map(opts)
  end
end
