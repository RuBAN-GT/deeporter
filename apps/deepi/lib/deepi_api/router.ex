defmodule DeepiApi.Router do
  use DeepiApi, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DeepiApi do
    pipe_through :api

    get "/", PageController, :index
    get "/sign_in", AuthController, :sign_in
    get "/callback", AuthController, :callback
  end
end
