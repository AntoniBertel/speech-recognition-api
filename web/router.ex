defmodule Web.Router do
  use Web.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Web do
    pipe_through :api # Use the default browser stack
    post "/file", FileController, :index
    post "/call", CallController, :new
    get "/calls", CallController, :get
  end
  # Other scopes may use custom stacks.
  # scope "/api", Web do
  #   pipe_through :api
  # end
end
